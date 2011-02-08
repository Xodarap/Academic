// This program is to be used to test the Little scanner.
// This version is set up to test all tokens, but more code is
// needed to test other aspects of the scanner (e.g., input that
// causes errors, character numbers, values associated with tokens).

import java.util.*;
import java.io.*;
import java_cup.runtime.*;  // defines Symbol

class P2 {
    public static void main(String[] args) throws IOException // may be thrown by yylex
    {
	// test all tokens
	testAllTokens();
	CharNum.num = 1;
	TestSpecialChars();
	TestComments();
       	TestDouble();	
	TestString();
	TestReserved();
	TestIDs();
	TestInt();
    }

    /**
       Like an assertion, but it doesn't terminate the application
       if the assertion fails
    */
    private static void Assert(Boolean Predicate, String Message) {
	if(!Predicate){
	    System.out.println(Message);
	}
    }

    private static void AssertEqual(Object one, Object two, String Message){
	if (!one.equals(two)){
	    System.out.println("Not equal: " + one.toString() + ", " + two.toString() + "; " + Message);
	}
    }

    private static void AssertNotEqual(Object one, Object two, String Message){
	if(one.equals(two)){
	    System.out.println("Equal: " + one.toString() + ", " + two.toString() + "; " + Message);
	}
    }

    // Tests comments
    private static void TestComments() throws IOException {
	CharNum.num = 1;
	StringReader sr = new StringReader("var /* comment */ var");
	Yylex scanner = new Yylex(sr);
	Symbol token = scanner.next_token();
	AssertEqual(token.sym, sym.ID, "id");
	token = scanner.next_token();

	AssertEqual(token.sym, sym.ID, "id2");
	AssertEqual(((TokenVal) token.value).charnum, 19, "comment cnum");
	//System.out.println(((IdTokenVal) token.value).idVal);

	sr = new StringReader("/* unterminated");
	scanner = new Yylex(sr);
	token = scanner.next_token();
    }

    // Tests the non-alphanumeric characters
    private static void TestSpecialChars() throws IOException {
	String[] chars = new String[] {"{",  "}",  "(",  ")",  ",",  "=",  ";",  "+",  "-",  "*",  "/",  "++",  "--",  "!",  "&&",  "||",  "==",  "!=",  "<",  ">",  "<=",  ">=",  "&"};
	String text = "";
	int[] symType = new int[] {sym.LCURLY, sym.RCURLY, sym.LPAREN, sym.RPAREN, sym.COMMA, sym.ASSIGN, sym.SEMICOLON, sym.PLUS, sym.MINUS, sym.STAR, sym.DIVIDE, sym.PLUSPLUS, sym.MINUSMINUS, sym.NOT, sym.AND, sym.OR, sym.EQUALS, sym.NOTEQUALS, sym.LESS, sym. GREATER, sym.LESSEQ, sym.GREATEREQ, sym.AMPERSAND};
	for(int i=0; i<chars.length; i++){
	    text += chars[i] + " ";
	}

	StringReader sr = new StringReader(text);
	Yylex scanner = new Yylex(sr);
	CharNum.num = 1;
	int pos = 1;
	for(int i=0; i<chars.length; i++){
	    Symbol token = scanner.next_token();
	    AssertEqual(token.sym, symType[i], "Incorrect: " + chars[i]);
	    TokenVal tv = (TokenVal) token.value;
	    AssertEqual(tv.charnum, pos, "special char didn't count correctly");
	    pos += chars[i].length() + 1;
	}
    }

    // Tests the ID values
    private static void TestIDs() throws IOException {
	CharNum.num = 1;
	String[] varNames = new String[] {"myVariable", "_yo_dawg_i_herd_u_liek_underscores", "so__iPutSomeUnderscoresInUr______"};
	StringReader sr = new StringReader("myVariable _yo_dawg_i_herd_u_liek_underscores so__iPutSomeUnderscoresInUr______");
	Yylex scanner = new Yylex(sr);
	int position = 1;
	for(int i=0; i<3; i++){
	    Symbol token = scanner.next_token();
	    assert token.sym == sym.ID;
	    assert ((IdTokenVal)token.value).idVal.equals(varNames[i]);

	    // Check line/char num
	    int cnum =  ((TokenVal)token.value).charnum;
	    assert cnum == position : "cnum: " + cnum + " pnum: " + position;
	    assert ((TokenVal)token.value).linenum == 1;
	    position += varNames[i].length() + 1;	// add one for a space
	}
	CharNum.num = 1;
   	sr = new StringReader("1VAR 23B");
   	scanner = new Yylex(sr);
   	for(int i=0; i<2; i++){
   	    Symbol token = scanner.next_token();
   	    AssertNotEqual(token.sym, sym.ID, "STARTS WITH NUM");
  	}
    }
    // Tests the reserved words
    private static void TestReserved() throws IOException {
	HashMap typeMap = new HashMap();
	String[] typeNames = new String[] {"int",  "void",  "double",  "if",  "else",  "while",  "return",  "scanf",  "printf"};
	typeMap.put("int", sym.INT);
	typeMap.put("void", sym.VOID);
	typeMap.put("double", sym.DBL);
	typeMap.put("if", sym.IF);
	typeMap.put("else", sym.ELSE);
	typeMap.put("while", sym.WHILE);
	typeMap.put("return", sym.RETURN);
	typeMap.put("scanf", sym.SCANF);
	typeMap.put("printf", sym.PRINTF);

	StringReader sr = new StringReader("int void double if else while return scanf printf");
	Yylex scanner = new Yylex(sr);
	for(int i=0; i< typeNames.length; i++){
	    Symbol token = scanner.next_token();
	    String typeName = typeNames[i];
	    assert token.sym == typeMap.get(typeName);
	}
    }


    // Test the various forms of strings
    private static void TestString() throws IOException {
	StringReader sr = new StringReader("\"This is a test\" \"test \\\" quote\"");
	Yylex scanner = new Yylex(sr);
	Symbol token = scanner.next_token();
	assert token.sym == sym.STRINGLITERAL;
	assert ((StrLitTokenVal)token.value).strVal.equals("\"This is a test\"");

	token = scanner.next_token();
	assert token.sym == sym.STRINGLITERAL;
	assert ((StrLitTokenVal)token.value).strVal.equals("\"test \\\" quote\"");

     	CharNum.num = 1;
	sr = new StringReader("\"blah \\t\\'\\\\ \\n ok\" \"again\"");
	scanner = new Yylex(sr);
     	token = scanner.next_token();
     	AssertEqual(token.sym, sym.STRINGLITERAL, "string didn't escape");
     	AssertEqual(((StrLitTokenVal)token.value).strVal, "\"blah \\t\\'\\\\ \\n ok\"", "string escape equal");
     	AssertEqual(((TokenVal)token.value).charnum, 1, "escaped");

 	token = scanner.next_token(); 
 	AssertEqual(token.sym, sym.STRINGLITERAL, "second didn't work");
	AssertEqual(((StrLitTokenVal)token.value).strVal, "\"again\"", "second string not equal");
     	AssertEqual(((TokenVal)token.value).charnum, 20, "str position2");


	// some stuff that shouldn't work
	sr = new StringReader("\"stuff\n \"blah\" \"\\b\" \"blah2\" \"\\b\n");
	String[] errors = new String[] {"ignoring unterminated string literal", "",
					"ignoring string literal with bad escaped character", "",
					"ignoring unterminated string literal with bad escaped character"};
	scanner = new Yylex(sr);
	token = scanner.next_token();
	int cnt = 0;
	while(token.sym != sym.EOF){
	    if(!errors[cnt].equals("")) { 
		// assert token.sym == -1; 
		// assert ((ErrToken)token.value).msg.equals(errors[cnt]);
	    }
	    token = scanner.next_token();
	    cnt++;
	}

     	CharNum.num = 1;

      	// test the format stuff
      	sr = new StringReader("\"%d\" \"%f\"");
     	scanner = new Yylex(sr);
     	token = scanner.next_token();
     	AssertEqual(token.sym, sym.INT_FORMAT, "int fmt");
     	TokenVal tv = (TokenVal) token.value;
     	AssertEqual(tv.charnum, 1, "dbl cnum");
     	AssertEqual(tv.linenum, 1, "dbl line");

     	token = scanner.next_token();
     	AssertEqual(token.sym, sym.DBL_FORMAT, "dbl fmt");
     	tv = (TokenVal) token.value;
     	AssertEqual(tv.charnum, 6, "dbl cnum");
     	AssertEqual(tv.linenum, 1, "dbl line");

     	// try every legitimate string character
     	for(int i=64; i < 80; i++){
	    String a = new Character((char)i).toString();
	    String b = new Character((char)(i+32)).toString();
	    sr = new StringReader("\"" + a.toString() + b.toString() + "\"");
	    scanner = new Yylex(sr);
	    token = scanner.next_token();
	    tv = (TokenVal) token.value;
	    
	    AssertEqual(token.sym, sym.STRINGLITERAL, "char isn't str lit: " + a.toString() + b.toString());
	}
    }


    private static void TestInt() throws IOException
    {
	CharNum.num = 1;
	StringReader sr = new StringReader("123 435 111 999999999999999999999999999999999999999999999");
	Yylex scanner = new Yylex(sr);
	Symbol token = scanner.next_token();
	int pos = 1;
	while (token.sym != sym.EOF) {
	    AssertEqual(token.sym, sym.INTLITERAL, "Token not int lit");
	    AssertEqual(((TokenVal)token.value).charnum, pos, "int position");
	    token = scanner.next_token();
	    pos += 4;
	}
    }

    // Tests the doubles
    private static void TestDouble()
	throws IOException
    {
	CharNum.num = 1;
	// Try some ones that work
	StringReader sr = new StringReader("4.234 2.240 000.0 34.10 .3444 3222. ");
	Yylex scanner = new Yylex(sr);
	Symbol token = scanner.next_token();
	int pos = 1;
	while (token.sym != sym.EOF) {
	    AssertEqual(token.sym, sym.DBLLITERAL, "Token not dbl lit");
	    AssertEqual(((TokenVal)token.value).charnum, pos, "dbl char pos");
	    pos += 6;
	    token = scanner.next_token();
	}

	// Now some ones which aren't doubles
	sr = new StringReader("asdf . ");
	scanner = new Yylex(sr);
	token = scanner.next_token();
	while (token.sym != sym.EOF) {
	    Assert(token.sym != sym.DBLLITERAL, "Token shouldn't be dbl");
	    token = scanner.next_token();
	}

	// String str = "";
	// for(int i=0; i<9999; i++){
	//     str += Integer.toString(i);
	// }
	// sr = new StringReader(str);
	// scanner = new Yylex(sr);
	// token = scanner.next_token();
    }

    // **********************************************************************
    // testAllTokens
    //
    // open and read from file inTokens
    //
    // for each token read, write the corresponding string to inTokens.out
    //
    // if the input file contains all tokens, one per line, we can verify
    // correctness of the scanner by comparing the input and output files
    // **********************************************************************
    private static void testAllTokens() throws IOException {
	// open input and output files
	FileReader inFile = null;
	PrintWriter outFile = null;
	try {
	    inFile = new FileReader("inTokens");
	    outFile = new PrintWriter(new FileWriter("inTokens.out"));
	} catch (FileNotFoundException ex) {
	    System.err.println("File inTokens not found.");
	    System.exit(-1);
	} catch (IOException ex) {
	    System.err.println("inTokens.out cannot be opened.");
	    System.exit(-1);
	}

	// create and call the scanner
	Yylex scanner = new Yylex(inFile);
	Symbol token = scanner.next_token();
	while (token.sym != sym.EOF) {
	    switch (token.sym) {
	    case sym.INT:
		outFile.println("int");
		break;
	    case sym.DBL:
		outFile.println("double");
		break;
	    case sym.VOID:
		outFile.println("void");
		break;
	    case sym.IF:
		outFile.println("if");
		break;
	    case sym.ELSE:
		outFile.println("else");
		break;
	    case sym.WHILE:
		outFile.println("while");
		break;
	    case sym.RETURN:
		outFile.println("return");
		break;
	    case sym.SCANF:
		outFile.println("scanf");
		break;
	    case sym.PRINTF:
		outFile.println("printf");
		break;
	    case sym.ID:
		outFile.println(((IdTokenVal)token.value).idVal);
		break;
	    case sym.INTLITERAL:
		outFile.println(((IntLitTokenVal)token.value).intVal);
		break;
	    case sym.DBLLITERAL:
		outFile.println(((DblLitTokenVal)token.value).dblVal);
		break;
	    case sym.STRINGLITERAL:
		outFile.println(((StrLitTokenVal)token.value).strVal);
		break;
	    case sym.LCURLY:
		outFile.println("{");
		break;
	    case sym.RCURLY:
		outFile.println("}");
		break;
	    case sym.LPAREN:
		outFile.println("(");
		break;
	    case sym.RPAREN:
		outFile.println(")");
		break;
	    case sym.COMMA:
		outFile.println(",");
		break;
	    case sym.ASSIGN:
		outFile.println("=");
		break;
	    case sym.SEMICOLON:
		outFile.println(";");
		break;
	    case sym.PLUS:
		outFile.println("+");
		break;
	    case sym.MINUS:
		outFile.println("-");
		break;
	    case sym.STAR:
		outFile.println("*");
		break;
	    case sym.DIVIDE:
		outFile.println("/");
		break;
	    case sym.PLUSPLUS:
		outFile.println("++");
		break;
	    case sym.MINUSMINUS:
		outFile.println("--");
		break;
	    case sym.NOT:
		outFile.println("!");
		break;
	    case sym.AND:
		outFile.println("&&");
		break;
	    case sym.OR:
		outFile.println("||");
		break;
	    case sym.EQUALS:
		outFile.println("==");
		break;
	    case sym.NOTEQUALS:
		outFile.println("!=");
		break;
	    case sym.LESS:
		outFile.println("<");
		break;
	    case sym.GREATER:
		outFile.println(">");
		break;
	    case sym.LESSEQ:
		outFile.println("<=");
		break;
	    case sym.GREATEREQ:
		outFile.println(">=");
		break;
	    case sym.AMPERSAND:
		outFile.println("&");
		break;
	    case sym.INT_FORMAT:
		outFile.println("\"%d\"");
		break;
	    case sym.DBL_FORMAT:
		outFile.println("\"%f\"");
		break;
	    }

	    token = scanner.next_token();
	}
	outFile.close();
    }
}
