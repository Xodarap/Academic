// This program can be used to test the Little scanner.
//
// To test all tokens, the lexemes are written to inTokens.out.
// It should be the same as inTokens EXCEPT that inTokens has
// comments, and the good int literal with leading zeros will differ.
//
// The rest of the expected output is in P2.ExpectedOutput



import java.util.*;
import java.io.*;
import java_cup.runtime.*;  // defines Symbol

class P2 {
    public static void main(String[] args) throws IOException // may be thrown by yylex
    {
	// test all tokens
	// test all scanner errors (bad int literals, bad string literals, bad chars,
	//                          unterminated comments)
	// test line and column numbers 
	//
	// NOTE: We must set CharNum.num back to 1 between tests
	testAllTokens();
	CharNum.num = 1;
	testDblLiterals();
	CharNum.num = 1;
	testBadIntLiterals();
	CharNum.num = 1;
	testBadStrLiterals();
	CharNum.num = 1;
	testBadChars();
	CharNum.num = 1;
	testUntermComment();
	CharNum.num = 1;
	testComments();
	CharNum.num = 1;
	testLineAndColNums();
    }

    // **********************************************************************
    // testLineAndColNums
    //
    // open and read from inTestNums, which should contain tokens that start
    // on different lines and at different columns (including after single-line
    // and multi-line comments)
    //
    // the expected line and column numbers are hard-coded into the file
    // expectedNums; errors msgs are given (to stderr) only when the
    // returned numbers don't match the expected ones
    //
    // since the input file has some bad string literals, error msgs are
    // also given for those
    // **********************************************************************
    private static void testLineAndColNums() throws IOException {
	// say what output is expected
	System.err.println("\nTEST LINE AND CHAR NUMS");
	System.err.println("BAD ESCAPED CHAR ON LINES 17, 18, 19, 19, 19");

	// open input files
	FileReader inFile = null;
	java.util.Scanner numsFile = null;
	try {
	    inFile = new FileReader("inTestNums");
	    numsFile = new java.util.Scanner (new File("expectedNums"));
	} catch (FileNotFoundException ex) {
	    System.err.println("File inTestNums or expectedNums not found.");
	    System.exit(-1);
	}

	// create and call the scanner
	Yylex scanner = new Yylex(inFile);
	Symbol token = scanner.next_token();
	while (token.sym != sym.EOF) {
	    int linenum = numsFile.nextInt();
	    int charnum =  numsFile.nextInt();
	    if (linenum != ((TokenVal)token.value).linenum) {
		System.err.println("Testing Line Nums; expected " +
				   linenum + " but got " +
				   ((TokenVal)token.value).linenum);
		System.exit(-1);
	    }
	    if (charnum != ((TokenVal)token.value).charnum) {
		System.err.println("Testing Char Nums; expected " +
				   charnum + " but got " +
				   ((TokenVal)token.value).charnum +
				   " on line " + linenum);
	    }
	    token = scanner.next_token();
	}
    }



    // **********************************************************************
    // testUntermComment
    //
    // open and read from inUntermComment, which should contain an unterminated comment;
    // this should cause an error msg to be written to stderr
    // **********************************************************************
    private static void testUntermComment() throws IOException {
	// say what output is expected
	System.err.println("\nTEST UNTERMINATED COMMENTS: " +
			   "UNTERM COMMENT ON LINE 4");

	// open input file
	FileReader inFile = null;
	try {
	    inFile = new FileReader("inUntermComment");
	} catch (FileNotFoundException ex) {
	    System.err.println("File inUntermComment not found.");
	    System.exit(-1);
	}

	// create and call the scanner
	Yylex scanner = new Yylex(inFile);
	Symbol token = scanner.next_token();
	if (token.sym != sym.EOF) {
	    System.err.println("ERROR TESTING UNTERMINATED COMMENT: not at EOF");
	    System.err.println("sym: " + token.sym);
	}
    }


    // **********************************************************************
    // testComments
    //
    // open and read from inComments, which should not cause ANY output
    // **********************************************************************
    private static void testComments() throws IOException {
	// say what output is expected
	System.err.println("\nTESTING COMMENTS -- NO OUTPUT EXPECTED");

	// open input file
	FileReader inFile = null;
	try {
	    inFile = new FileReader("inComments");
	} catch (FileNotFoundException ex) {
	    System.err.println("File inUntermComment not found.");
	    System.exit(-1);
	}

	// create and call the scanner
	Yylex scanner = new Yylex(inFile);
	Symbol token = scanner.next_token();
	if (token.sym != sym.EOF) {
	    System.err.println("ERROR TESTING COMMENTS: not at EOF");
	    System.err.println("sym: " + token.sym);
	}
    }


    // **********************************************************************
    // testDblLiterals
    //
    // open and read from inDblLiterals, which should contain an unterminated comment;
    // this should cause an error msg to be written to stderr
    // **********************************************************************
    private static void testDblLiterals() throws IOException {
	// open input file twice, once for scanning and once for reading
	FileReader inFile = null;
	java.util.Scanner sc = null;

	try {
	    inFile = new FileReader("inDblLiterals");
	    sc = new java.util.Scanner( new File("inDblLiterals"));
	} catch (FileNotFoundException ex) {
	    System.err.println("File inDblLiterals not found.");
	    System.exit(-1);
	}

	// create and call the scanner
	Yylex scanner = new Yylex(inFile);
	Symbol token = scanner.next_token();
	while (token.sym != sym.EOF) {
	    if (token.sym != sym.DBLLITERAL) {
		System.err.println("ERROR TESTING DBL LITERALS: bad token: " +
				   token.sym);
	    }
	    double d = sc.nextDouble();
	    if (d != ((DblLitTokenVal)token.value).dblVal) {
		System.err.println("ERROR TESTING DBL LITERALS: bad value: " +
				   ((DblLitTokenVal)token.value).dblVal +
				   " expecting " + d);
	    }
	    token = scanner.next_token();
	}
    }




    // **********************************************************************
    // testBadChars
    //
    // open and read from inBadChars, which should contain bad characters;
    // this should cause error msgs to be written to stderr
    // **********************************************************************
    private static void testBadChars() throws IOException {
	// say what output is expected
	System.err.println("\nTEST BAD CHARS: BAD CHARS ON LINES 1-5");

	// open input file
	FileReader inFile = null;
	try {
	    inFile = new FileReader("inBadChars");
	} catch (FileNotFoundException ex) {
	    System.err.println("File inBadChars not found.");
	    System.exit(-1);
	}

	// create and call the scanner
	Yylex scanner = new Yylex(inFile);
	Symbol token = scanner.next_token();
	if (token.sym != sym.EOF) {
	    System.err.println("ERROR TESTING BAD CHARS: not at EOF");
	}
    }



    // **********************************************************************
    // testBadIntLiterals
    //
    // open and read from inBadIntLiterals, which should contain bad int literals
    // (ones that are too big); this should cause error msgs to be written to
    // stderr
    // **********************************************************************
    private static void testBadIntLiterals() throws IOException {
	// say what output is expected
	System.err.println("TEST BAD INTS: BAD INTS ON LINES 2 AND 3");

	// open input file
	FileReader inFile = null;
	try {
	    inFile = new FileReader("inBadIntLiterals");
	} catch (FileNotFoundException ex) {
	    System.err.println("File inBadIntLiterals not found.");
	    System.exit(-1);
	}

	// create and call the scanner
	Yylex scanner = new Yylex(inFile);
	Symbol token = scanner.next_token();
	while (token.sym != sym.EOF) {
	    if (token.sym != sym.INTLITERAL) {
		System.err.println("ERROR TESTING BAD INT LITERALS: bad token: " +
				   token.sym);
	    }
	    token = scanner.next_token();
	}
    }


    // **********************************************************************
    // open and read from inBadStrLiterals, which should contain the following:
    //   - string literals with bad escaped chars
    //   - unterminated string literals (open-quote with no close-quote on same line)
    //   - unterminated string literals with bad escaped char
    // **********************************************************************
    private static void testBadStrLiterals() throws IOException {
	// say what output is expected
	System.err.println("\nTEST BAD STRING LITERALS: BAD ESCAPED CHARS ON LINES 2-5; UNTERM ON LINES 6-11, BOTH ON LINES 12-14");

	// open input file
	FileReader inFile = null;
	try {
	    inFile = new FileReader("inBadStrLiterals");
	} catch (FileNotFoundException ex) {
	    System.err.println("File inBadStrLiterals not found.");
	    System.exit(-1);
	}

	// create and call the scanner
	Yylex scanner = new Yylex(inFile);
	Symbol token = scanner.next_token();
	while (token.sym != sym.EOF) {
	    if (token.sym != sym.STRINGLITERAL) {
		System.err.println("ERROR TESTING BAD STRING LITERALS: bad token: " +
				   token.sym);
	    }
	    token = scanner.next_token();
	}
    }

    // **********************************************************************
    // testAllTokens
    //
    // open and read from inTokens
    // for each token read, write the corresponding string to inTokens.out
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

	System.err.println("TESTING ALL TOKENS: COMPARE inTokens and inTokens.out\n");

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
