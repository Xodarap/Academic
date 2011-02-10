import java_cup.runtime.*; // defines the Symbol class
// The generated scanner will return a Symbol for each token that it finds.
// A Symbol contains an Object field named value; that field will be of type
// TokenVal, defined below.
//
// A TokenVal object contains the line number on which the token occurs as
// well as the number of the character on that line that starts the token.
// Some tokens (literals and IDs) also include the value of the token.
class TokenVal {
 // fields
    int linenum;
    int charnum;
 // constructor
    TokenVal(int l, int c) {
        linenum = l;
	charnum = c;
    }
}
class IntLitTokenVal extends TokenVal {
 // new field: the value of the integer literal
    int intVal;
 // constructor
    IntLitTokenVal(int l, int c, int val) {
        super(l,c);
	intVal = val;
    }
}
class DblLitTokenVal extends TokenVal {
 // new field: the value of the double literal
    double dblVal;
 // constructor
    DblLitTokenVal(int l, int c, double val) {
        super(l,c);
	dblVal = val;
    }
}
class IdTokenVal extends TokenVal {
 // new field: the value of the identifier
    String idVal;
 // constructor
    IdTokenVal(int l, int c, String val) {
        super(l,c);
	idVal = val;
    }
}
class StrLitTokenVal extends TokenVal {
 // new field: the value of the string literal
    String strVal;
 // constructor
    StrLitTokenVal(int l, int c, String val) {
        super(l,c);
	strVal = val;
    }
}
// An error token is returned for each parse error
// It's used solely for automated testing
class ErrToken extends TokenVal { 
	String msg;
	ErrToken(int l, int c, String mes){
		super(l, c);
		msg = mes;
	}
}
// The following class is used to keep track of the character number at which
// the current token starts on its line.
class CharNum {
  static int num=1;
}
// 
// 


class Yylex implements java_cup.runtime.Scanner {
	private final int YY_BUFFER_SIZE = 512;
	private final int YY_F = -1;
	private final int YY_NO_STATE = -1;
	private final int YY_NOT_ACCEPT = 0;
	private final int YY_START = 1;
	private final int YY_END = 2;
	private final int YY_NO_ANCHOR = 4;
	private final int YY_BOL = 128;
	private final int YY_EOF = 129;
	private java.io.BufferedReader yy_reader;
	private int yy_buffer_index;
	private int yy_buffer_read;
	private int yy_buffer_start;
	private int yy_buffer_end;
	private char yy_buffer[];
	private int yyline;
	private boolean yy_at_bol;
	private int yy_lexical_state;

	Yylex (java.io.Reader reader) {
		this ();
		if (null == reader) {
			throw (new Error("Error: Bad input stream initializer."));
		}
		yy_reader = new java.io.BufferedReader(reader);
	}

	Yylex (java.io.InputStream instream) {
		this ();
		if (null == instream) {
			throw (new Error("Error: Bad input stream initializer."));
		}
		yy_reader = new java.io.BufferedReader(new java.io.InputStreamReader(instream));
	}

	private Yylex () {
		yy_buffer = new char[YY_BUFFER_SIZE];
		yy_buffer_read = 0;
		yy_buffer_index = 0;
		yy_buffer_start = 0;
		yy_buffer_end = 0;
		yyline = 0;
		yy_at_bol = true;
		yy_lexical_state = YYINITIAL;
	}

	private boolean yy_eof_done = false;
	private final int YYINITIAL = 0;
	private final int yy_state_dtrans[] = {
		0
	};
	private void yybegin (int state) {
		yy_lexical_state = state;
	}
	private int yy_advance ()
		throws java.io.IOException {
		int next_read;
		int i;
		int j;

		if (yy_buffer_index < yy_buffer_read) {
			return yy_buffer[yy_buffer_index++];
		}

		if (0 != yy_buffer_start) {
			i = yy_buffer_start;
			j = 0;
			while (i < yy_buffer_read) {
				yy_buffer[j] = yy_buffer[i];
				++i;
				++j;
			}
			yy_buffer_end = yy_buffer_end - yy_buffer_start;
			yy_buffer_start = 0;
			yy_buffer_read = j;
			yy_buffer_index = j;
			next_read = yy_reader.read(yy_buffer,
					yy_buffer_read,
					yy_buffer.length - yy_buffer_read);
			if (-1 == next_read) {
				return YY_EOF;
			}
			yy_buffer_read = yy_buffer_read + next_read;
		}

		while (yy_buffer_index >= yy_buffer_read) {
			if (yy_buffer_index >= yy_buffer.length) {
				yy_buffer = yy_double(yy_buffer);
			}
			next_read = yy_reader.read(yy_buffer,
					yy_buffer_read,
					yy_buffer.length - yy_buffer_read);
			if (-1 == next_read) {
				return YY_EOF;
			}
			yy_buffer_read = yy_buffer_read + next_read;
		}
		return yy_buffer[yy_buffer_index++];
	}
	private void yy_move_end () {
		if (yy_buffer_end > yy_buffer_start &&
		    '\n' == yy_buffer[yy_buffer_end-1])
			yy_buffer_end--;
		if (yy_buffer_end > yy_buffer_start &&
		    '\r' == yy_buffer[yy_buffer_end-1])
			yy_buffer_end--;
	}
	private boolean yy_last_was_cr=false;
	private void yy_mark_start () {
		int i;
		for (i = yy_buffer_start; i < yy_buffer_index; ++i) {
			if ('\n' == yy_buffer[i] && !yy_last_was_cr) {
				++yyline;
			}
			if ('\r' == yy_buffer[i]) {
				++yyline;
				yy_last_was_cr=true;
			} else yy_last_was_cr=false;
		}
		yy_buffer_start = yy_buffer_index;
	}
	private void yy_mark_end () {
		yy_buffer_end = yy_buffer_index;
	}
	private void yy_to_mark () {
		yy_buffer_index = yy_buffer_end;
		yy_at_bol = (yy_buffer_end > yy_buffer_start) &&
		            ('\r' == yy_buffer[yy_buffer_end-1] ||
		             '\n' == yy_buffer[yy_buffer_end-1] ||
		             2028/*LS*/ == yy_buffer[yy_buffer_end-1] ||
		             2029/*PS*/ == yy_buffer[yy_buffer_end-1]);
	}
	private java.lang.String yytext () {
		return (new java.lang.String(yy_buffer,
			yy_buffer_start,
			yy_buffer_end - yy_buffer_start));
	}
	private int yylength () {
		return yy_buffer_end - yy_buffer_start;
	}
	private char[] yy_double (char buf[]) {
		int i;
		char newbuf[];
		newbuf = new char[2*buf.length];
		for (i = 0; i < buf.length; ++i) {
			newbuf[i] = buf[i];
		}
		return newbuf;
	}
	private final int YY_E_INTERNAL = 0;
	private final int YY_E_MATCH = 1;
	private java.lang.String yy_error_string[] = {
		"Error: Internal error.\n",
		"Error: Unmatched input.\n"
	};
	private void yy_error (int code,boolean fatal) {
		java.lang.System.out.print(yy_error_string[code]);
		java.lang.System.out.flush();
		if (fatal) {
			throw new Error("Fatal Error.\n");
		}
	}
	private int[][] unpackFromString(int size1, int size2, String st) {
		int colonIndex = -1;
		String lengthString;
		int sequenceLength = 0;
		int sequenceInteger = 0;

		int commaIndex;
		String workString;

		int res[][] = new int[size1][size2];
		for (int i= 0; i < size1; i++) {
			for (int j= 0; j < size2; j++) {
				if (sequenceLength != 0) {
					res[i][j] = sequenceInteger;
					sequenceLength--;
					continue;
				}
				commaIndex = st.indexOf(',');
				workString = (commaIndex==-1) ? st :
					st.substring(0, commaIndex);
				st = st.substring(commaIndex+1);
				colonIndex = workString.indexOf(':');
				if (colonIndex == -1) {
					res[i][j]=Integer.parseInt(workString);
					continue;
				}
				lengthString =
					workString.substring(colonIndex+1);
				sequenceLength=Integer.parseInt(lengthString);
				workString=workString.substring(0,colonIndex);
				sequenceInteger=Integer.parseInt(workString);
				res[i][j] = sequenceInteger;
				sequenceLength--;
			}
		}
		return res;
	}
	private int yy_acpt[] = {
		/* 0 */ YY_NOT_ACCEPT,
		/* 1 */ YY_NO_ANCHOR,
		/* 2 */ YY_NO_ANCHOR,
		/* 3 */ YY_NO_ANCHOR,
		/* 4 */ YY_NO_ANCHOR,
		/* 5 */ YY_NO_ANCHOR,
		/* 6 */ YY_NO_ANCHOR,
		/* 7 */ YY_NO_ANCHOR,
		/* 8 */ YY_NO_ANCHOR,
		/* 9 */ YY_NO_ANCHOR,
		/* 10 */ YY_NO_ANCHOR,
		/* 11 */ YY_NO_ANCHOR,
		/* 12 */ YY_NO_ANCHOR,
		/* 13 */ YY_NO_ANCHOR,
		/* 14 */ YY_NO_ANCHOR,
		/* 15 */ YY_NO_ANCHOR,
		/* 16 */ YY_NO_ANCHOR,
		/* 17 */ YY_NO_ANCHOR,
		/* 18 */ YY_NO_ANCHOR,
		/* 19 */ YY_NO_ANCHOR,
		/* 20 */ YY_NO_ANCHOR,
		/* 21 */ YY_NO_ANCHOR,
		/* 22 */ YY_NO_ANCHOR,
		/* 23 */ YY_NO_ANCHOR,
		/* 24 */ YY_END,
		/* 25 */ YY_NO_ANCHOR,
		/* 26 */ YY_NO_ANCHOR,
		/* 27 */ YY_NO_ANCHOR,
		/* 28 */ YY_NO_ANCHOR,
		/* 29 */ YY_NO_ANCHOR,
		/* 30 */ YY_NO_ANCHOR,
		/* 31 */ YY_NO_ANCHOR,
		/* 32 */ YY_NO_ANCHOR,
		/* 33 */ YY_NO_ANCHOR,
		/* 34 */ YY_NO_ANCHOR,
		/* 35 */ YY_NO_ANCHOR,
		/* 36 */ YY_NO_ANCHOR,
		/* 37 */ YY_NO_ANCHOR,
		/* 38 */ YY_NO_ANCHOR,
		/* 39 */ YY_NO_ANCHOR,
		/* 40 */ YY_NO_ANCHOR,
		/* 41 */ YY_END,
		/* 42 */ YY_NO_ANCHOR,
		/* 43 */ YY_NO_ANCHOR,
		/* 44 */ YY_NO_ANCHOR,
		/* 45 */ YY_NO_ANCHOR,
		/* 46 */ YY_NO_ANCHOR,
		/* 47 */ YY_NO_ANCHOR,
		/* 48 */ YY_NOT_ACCEPT,
		/* 49 */ YY_NO_ANCHOR,
		/* 50 */ YY_NO_ANCHOR,
		/* 51 */ YY_END,
		/* 52 */ YY_END,
		/* 53 */ YY_NOT_ACCEPT,
		/* 54 */ YY_NO_ANCHOR,
		/* 55 */ YY_NO_ANCHOR,
		/* 56 */ YY_NOT_ACCEPT,
		/* 57 */ YY_NO_ANCHOR,
		/* 58 */ YY_NO_ANCHOR,
		/* 59 */ YY_NOT_ACCEPT,
		/* 60 */ YY_NO_ANCHOR,
		/* 61 */ YY_NOT_ACCEPT,
		/* 62 */ YY_NO_ANCHOR,
		/* 63 */ YY_NOT_ACCEPT,
		/* 64 */ YY_NO_ANCHOR,
		/* 65 */ YY_NOT_ACCEPT,
		/* 66 */ YY_NO_ANCHOR,
		/* 67 */ YY_NO_ANCHOR,
		/* 68 */ YY_NO_ANCHOR,
		/* 69 */ YY_NOT_ACCEPT,
		/* 70 */ YY_NO_ANCHOR,
		/* 71 */ YY_NO_ANCHOR,
		/* 72 */ YY_NO_ANCHOR,
		/* 73 */ YY_NO_ANCHOR,
		/* 74 */ YY_NO_ANCHOR,
		/* 75 */ YY_NO_ANCHOR,
		/* 76 */ YY_NO_ANCHOR,
		/* 77 */ YY_NO_ANCHOR,
		/* 78 */ YY_NO_ANCHOR,
		/* 79 */ YY_NO_ANCHOR,
		/* 80 */ YY_NO_ANCHOR,
		/* 81 */ YY_NO_ANCHOR,
		/* 82 */ YY_NO_ANCHOR,
		/* 83 */ YY_NO_ANCHOR,
		/* 84 */ YY_NO_ANCHOR,
		/* 85 */ YY_NO_ANCHOR,
		/* 86 */ YY_NO_ANCHOR,
		/* 87 */ YY_NO_ANCHOR,
		/* 88 */ YY_NO_ANCHOR,
		/* 89 */ YY_NO_ANCHOR,
		/* 90 */ YY_NO_ANCHOR,
		/* 91 */ YY_NO_ANCHOR
	};
	private int yy_cmap[] = unpackFromString(1,130,
"24:9,31,21,24:2,27,24:18,31,42,22,24:2,23,43,26,36,37,20,32,38,41,30,19,29:" +
"10,24,40,45,39,46,24:2,33:26,24,25,24:2,33,24,17,8,16,6,10,11,33,14,1,33:2," +
"9,33,2,5,18,33,15,12,3,7,4,13,33:3,34,44,35,24:2,0,28")[0];

	private int yy_rmap[] = unpackFromString(1,92,
"0,1,2,3,1:2,4,5,6,7,1:5,8,1,9,10,11,12,13,14,15,1:2,16,1:8,14:3,1:5,14:5,17" +
",14,1,17,18,19,20,16,21,22,23,24,25,26,27,18,28,29,30,31,32,33,34,35,36,37," +
"38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55")[0];

	private int yy_nxt[][] = unpackFromString(56,47,
"1,2,49:2,77,49,89,49:3,78,49,84,85,49,90,49:2,91,3,4,5,6,50:4,-1,1,7,55,8,9" +
",49,10,11,12,13,14,15,16,17,18,19,58,20,21,-1:48,49,54,49:8,22,49:7,-1:10,4" +
"9,-1:3,49,-1:33,23,-1:27,48:20,24,25,69,48,53,48,51,24,48:18,-1:29,7,26,-1:" +
"47,8,-1:47,27,-1:53,28,-1:48,29,-1:44,30,-1:50,31,-1:42,33,-1:46,34,-1:8,49" +
":18,-1:10,49,-1:3,49,-1:14,23:19,56,23:7,-1,23:18,-1:29,26,-1:18,48:20,24,2" +
"5,48:2,53,48,51,24,48:18,-1,63:20,41,42,63:2,65,63,52,41,63:18,-1,63,48:2,6" +
"3:18,48,63:2,48:2,63,-1,63:18,-1,49:2,35,49:15,-1:10,49,-1:3,49,-1:14,23:18" +
",38,23:8,-1,23:18,-1,49:5,36,49:12,-1:10,49,-1:3,49,-1:57,32,-1:3,48:20,24," +
"39,48:2,53,48,51,24,48:18,-1,49:9,37,49:8,-1:10,49,-1:3,49,-1:14,48:20,24,4" +
"0,48:2,53,48,51,24,48:18,-1,49:10,43,49:7,-1:10,49,-1:3,49,-1:14,49:9,44,49" +
":8,-1:10,49,-1:3,49,-1:15,63:2,-1:18,63,-1:2,63:2,-1:21,49:9,45,49:8,-1:10," +
"49,-1:3,49,-1:14,49,46,49:16,-1:10,49,-1:3,49,-1:14,49:10,47,49:7,-1:10,49," +
"-1:3,49,-1:14,48:5,59,48:4,61,48:9,24,25,48:2,53,48,51,24,48:18,-1,57,49:17" +
",-1:10,49,-1:3,49,-1:14,49:11,60,49:6,-1:10,49,-1:3,49,-1:14,49,62,49:16,-1" +
":10,49,-1:3,49,-1:14,49:8,64,49:9,-1:10,49,-1:3,49,-1:14,49:8,66,49:9,-1:10" +
",49,-1:3,49,-1:14,49:14,67,49:3,-1:10,49,-1:3,49,-1:14,49:2,68,49:15,-1:10," +
"49,-1:3,49,-1:14,49:4,70,49:13,-1:10,49,-1:3,49,-1:14,49:8,71,49:9,-1:10,49" +
",-1:3,49,-1:14,49:16,72,49,-1:10,49,-1:3,49,-1:14,73,49:17,-1:10,49,-1:3,49" +
",-1:14,49:7,74,49:10,-1:10,49,-1:3,49,-1:14,49:6,75,49:11,-1:10,49,-1:3,49," +
"-1:14,49,76,49:16,-1:10,49,-1:3,49,-1:14,49:15,79,49:2,-1:10,49,-1:3,49,-1:" +
"14,49:13,80,49:4,-1:10,49,-1:3,49,-1:14,49:6,81,49:11,-1:10,49,-1:3,49,-1:1" +
"4,49:2,82,49:15,-1:10,49,-1:3,49,-1:14,83,49:17,-1:10,49,-1:3,49,-1:14,49:4" +
",86,49:13,-1:10,49,-1:3,49,-1:14,49:9,87,49:8,-1:10,49,-1:3,49,-1:14,49:14," +
"88,49:3,-1:10,49,-1:3,49,-1:13");

	public java_cup.runtime.Symbol next_token ()
		throws java.io.IOException {
		int yy_lookahead;
		int yy_anchor = YY_NO_ANCHOR;
		int yy_state = yy_state_dtrans[yy_lexical_state];
		int yy_next_state = YY_NO_STATE;
		int yy_last_accept_state = YY_NO_STATE;
		boolean yy_initial = true;
		int yy_this_accept;

		yy_mark_start();
		yy_this_accept = yy_acpt[yy_state];
		if (YY_NOT_ACCEPT != yy_this_accept) {
			yy_last_accept_state = yy_state;
			yy_mark_end();
		}
		while (true) {
			if (yy_initial && yy_at_bol) yy_lookahead = YY_BOL;
			else yy_lookahead = yy_advance();
			yy_next_state = YY_F;
			yy_next_state = yy_nxt[yy_rmap[yy_state]][yy_cmap[yy_lookahead]];
			if (YY_EOF == yy_lookahead && true == yy_initial) {

return new Symbol(sym.EOF);
			}
			if (YY_F != yy_next_state) {
				yy_state = yy_next_state;
				yy_initial = false;
				yy_this_accept = yy_acpt[yy_state];
				if (YY_NOT_ACCEPT != yy_this_accept) {
					yy_last_accept_state = yy_state;
					yy_mark_end();
				}
			}
			else {
				if (YY_NO_STATE == yy_last_accept_state) {
					throw (new Error("Lexical Error: Unmatched Input."));
				}
				else {
					yy_anchor = yy_acpt[yy_last_accept_state];
					if (0 != (YY_END & yy_anchor)) {
						yy_move_end();
					}
					yy_to_mark();
					switch (yy_last_accept_state) {
					case 1:
						
					case -2:
						break;
					case 2:
						{
			Symbol S = new Symbol(sym.ID, new IdTokenVal(yyline+1, CharNum.num, yytext()));
			CharNum.num += yytext().length();
			return S;
			}
					case -3:
						break;
					case 3:
						{ 
		Symbol s = new Symbol(sym.DIVIDE , new TokenVal(yyline+1, CharNum.num));
		CharNum.num += 1;
		 return s;
	}
					case -4:
						break;
					case 4:
						{ 
		Symbol s = new Symbol(sym.STAR , new TokenVal(yyline+1, CharNum.num));
		CharNum.num += 1;
		 return s;
	}
					case -5:
						break;
					case 5:
						{CharNum.num = 1;}
					case -6:
						break;
					case 6:
						{Errors.fatal(yyline+1, CharNum.num,
			 "ignoring illegal character: " + yytext());
	    CharNum.num++;
	   }
					case -7:
						break;
					case 7:
						{
	   try {
	    int val = (new Integer(yytext())).intValue();
	    Symbol S = new Symbol(sym.INTLITERAL,
			          new IntLitTokenVal(yyline+1, CharNum.num, val)
				 );
	    CharNum.num += yytext().length();
	    return S;
	    } catch  (NumberFormatException e){
	    Errors.warn(yyline+1, CharNum.num, "integer literal too large; using max value");
	    Symbol S = new Symbol(sym.INTLITERAL,
			          new IntLitTokenVal(yyline+1, CharNum.num, Integer.MAX_VALUE)
				 );
	    CharNum.num += yytext().length();
	    return S;
	    }
	   }
					case -8:
						break;
					case 8:
						{CharNum.num += yytext().length();}
					case -9:
						break;
					case 9:
						{Symbol S = new Symbol(sym.PLUS, new TokenVal(yyline+1, CharNum.num));
	    CharNum.num++;
	    return S;
	   }
					case -10:
						break;
					case 10:
						{ 
		Symbol s = new Symbol(sym.LCURLY , new TokenVal(yyline+1, CharNum.num));
		CharNum.num += 1;
		 return s;
	}
					case -11:
						break;
					case 11:
						{ 
		Symbol s = new Symbol(sym.RCURLY , new TokenVal(yyline+1, CharNum.num));
		CharNum.num += 1;
		 return s;
	}
					case -12:
						break;
					case 12:
						{ 
		Symbol s = new Symbol(sym.LPAREN , new TokenVal(yyline+1, CharNum.num));
		CharNum.num += 1;
		 return s;
	}
					case -13:
						break;
					case 13:
						{ 
		Symbol s = new Symbol(sym.RPAREN , new TokenVal(yyline+1, CharNum.num));
		CharNum.num += 1;
		 return s;
	}
					case -14:
						break;
					case 14:
						{ 
		Symbol s = new Symbol(sym.COMMA , new TokenVal(yyline+1, CharNum.num));
		CharNum.num += 1;
		 return s;
	}
					case -15:
						break;
					case 15:
						{ 
		Symbol s = new Symbol(sym.ASSIGN , new TokenVal(yyline+1, CharNum.num));
		CharNum.num += 1;
		 return s;
	}
					case -16:
						break;
					case 16:
						{ 
		Symbol s = new Symbol(sym.SEMICOLON , new TokenVal(yyline+1, CharNum.num));
		CharNum.num += 1;
		 return s;
	}
					case -17:
						break;
					case 17:
						{ 
		Symbol s = new Symbol(sym.MINUS , new TokenVal(yyline+1, CharNum.num));
		CharNum.num += 1;
		 return s;
	}
					case -18:
						break;
					case 18:
						{ 
		Symbol s = new Symbol(sym.NOT , new TokenVal(yyline+1, CharNum.num));
		CharNum.num += 1;
		 return s;
	}
					case -19:
						break;
					case 19:
						{ 
		Symbol s = new Symbol(sym.AMPERSAND , new TokenVal(yyline+1, CharNum.num));
		CharNum.num += 1;
		 return s;
	}
					case -20:
						break;
					case 20:
						{ 
		Symbol s = new Symbol(sym.LESS , new TokenVal(yyline+1, CharNum.num));
		CharNum.num += 1;
		 return s;
	}
					case -21:
						break;
					case 21:
						{ 
		Symbol s = new Symbol(sym.GREATER , new TokenVal(yyline+1, CharNum.num));
		CharNum.num += 1;
		 return s;
	}
					case -22:
						break;
					case 22:
						{
			Symbol S = new Symbol(sym.IF, new TokenVal(yyline+1, CharNum.num));
			CharNum.num += yytext().length();
			return S;
		}
					case -23:
						break;
					case 23:
						{
		  Errors.fatal(yyline+1, CharNum.num, "unterminated comment");
		  CharNum.num += yytext().length();
		  }
					case -24:
						break;
					case 24:
						{Errors.fatal(yyline+1, CharNum.num,
			 "ignoring unterminated string literal");
	    CharNum.num += yytext().length();
			}
					case -25:
						break;
					case 25:
						{	
							String str = yytext();
							Symbol s = new Symbol(sym.STRINGLITERAL, new StrLitTokenVal(yyline+1, CharNum.num, str));
							CharNum.num += yytext().length();
							return s;
							}
					case -26:
						break;
					case 26:
						{
							double val = (new Double(yytext())).doubleValue();
							Symbol S = new Symbol(sym.DBLLITERAL,
											  new DblLitTokenVal(yyline+1, CharNum.num, val)
								 );
							CharNum.num += yytext().length();
							return S;
					 }
					case -27:
						break;
					case 27:
						{ 
		Symbol s = new Symbol(sym.PLUSPLUS , new TokenVal(yyline+1, CharNum.num));
		CharNum.num += 2;
		 return s;
	}
					case -28:
						break;
					case 28:
						{ 
		Symbol s = new Symbol(sym.EQUALS , new TokenVal(yyline+1, CharNum.num));
		CharNum.num += 2;
		 return s;
	}
					case -29:
						break;
					case 29:
						{ 
		Symbol s = new Symbol(sym.MINUSMINUS , new TokenVal(yyline+1, CharNum.num));
		CharNum.num += 2;
		 return s;
	}
					case -30:
						break;
					case 30:
						{ 
		Symbol s = new Symbol(sym.NOTEQUALS , new TokenVal(yyline+1, CharNum.num));
		CharNum.num += 2;
		 return s;
	}
					case -31:
						break;
					case 31:
						{ 
		Symbol s = new Symbol(sym.AND , new TokenVal(yyline+1, CharNum.num));
		CharNum.num += 2;
		 return s;
	}
					case -32:
						break;
					case 32:
						{ 
		Symbol s = new Symbol(sym.OR , new TokenVal(yyline+1, CharNum.num));
		CharNum.num += 2;
		 return s;
	}
					case -33:
						break;
					case 33:
						{ 
		Symbol s = new Symbol(sym.LESSEQ , new TokenVal(yyline+1, CharNum.num));
		CharNum.num += 2;
		 return s;
	}
					case -34:
						break;
					case 34:
						{ 
		Symbol s = new Symbol(sym.GREATEREQ , new TokenVal(yyline+1, CharNum.num));
		CharNum.num += 2;
		 return s;
	}
					case -35:
						break;
					case 35:
						{
			Symbol S = new Symbol(sym.INT, new TokenVal(yyline+1, CharNum.num));
			CharNum.num += yytext().length();
			return S;
		}
					case -36:
						break;
					case 36:
						{
			Symbol S = new Symbol(sym.VOID, new TokenVal(yyline+1, CharNum.num));
			CharNum.num += yytext().length();
			return S;
		}
					case -37:
						break;
					case 37:
						{
			Symbol S = new Symbol(sym.ELSE, new TokenVal(yyline+1, CharNum.num));
			CharNum.num += yytext().length();
			return S;
		}
					case -38:
						break;
					case 38:
						{ 
		  CharNum.num += yytext().length();
		  }
					case -39:
						break;
					case 39:
						{
							Symbol S = new Symbol(sym.INT_FORMAT, new TokenVal(yyline+1, CharNum.num));
							CharNum.num += yytext().length();
							return S;
						}
					case -40:
						break;
					case 40:
						{
							Symbol S = new Symbol(sym.DBL_FORMAT, new TokenVal(yyline+1, CharNum.num));
							CharNum.num += yytext().length();
							return S;
						}
					case -41:
						break;
					case 41:
						{	Errors.fatal(yyline+1, CharNum.num,
							"ignoring unterminated string literal with bad escaped character");
							CharNum.num += yytext().length();
						}
					case -42:
						break;
					case 42:
						{ Errors.fatal(yyline+1, CharNum.num,
							"ignoring string literal with bad escaped character");
							CharNum.num += yytext().length();
						}
					case -43:
						break;
					case 43:
						{
			Symbol S = new Symbol(sym.SCANF, new TokenVal(yyline+1, CharNum.num));
			CharNum.num += yytext().length();
			return S;
		}
					case -44:
						break;
					case 44:
						{
			Symbol S = new Symbol(sym.WHILE, new TokenVal(yyline+1, CharNum.num));
			CharNum.num += yytext().length();
			return S;
		}
					case -45:
						break;
					case 45:
						{
			Symbol S = new Symbol(sym.DBL, new TokenVal(yyline+1, CharNum.num));
			CharNum.num += yytext().length();
			return S;
		}
					case -46:
						break;
					case 46:
						{
			Symbol S = new Symbol(sym.RETURN, new TokenVal(yyline+1, CharNum.num));
			CharNum.num += yytext().length();
			return S;
		}
					case -47:
						break;
					case 47:
						{
			Symbol S = new Symbol(sym.PRINTF, new TokenVal(yyline+1, CharNum.num));
			CharNum.num += yytext().length();
			return S;
		}
					case -48:
						break;
					case 49:
						{
			Symbol S = new Symbol(sym.ID, new IdTokenVal(yyline+1, CharNum.num, yytext()));
			CharNum.num += yytext().length();
			return S;
			}
					case -49:
						break;
					case 50:
						{Errors.fatal(yyline+1, CharNum.num,
			 "ignoring illegal character: " + yytext());
	    CharNum.num++;
	   }
					case -50:
						break;
					case 51:
						{Errors.fatal(yyline+1, CharNum.num,
			 "ignoring unterminated string literal");
	    CharNum.num += yytext().length();
			}
					case -51:
						break;
					case 52:
						{	Errors.fatal(yyline+1, CharNum.num,
							"ignoring unterminated string literal with bad escaped character");
							CharNum.num += yytext().length();
						}
					case -52:
						break;
					case 54:
						{
			Symbol S = new Symbol(sym.ID, new IdTokenVal(yyline+1, CharNum.num, yytext()));
			CharNum.num += yytext().length();
			return S;
			}
					case -53:
						break;
					case 55:
						{Errors.fatal(yyline+1, CharNum.num,
			 "ignoring illegal character: " + yytext());
	    CharNum.num++;
	   }
					case -54:
						break;
					case 57:
						{
			Symbol S = new Symbol(sym.ID, new IdTokenVal(yyline+1, CharNum.num, yytext()));
			CharNum.num += yytext().length();
			return S;
			}
					case -55:
						break;
					case 58:
						{Errors.fatal(yyline+1, CharNum.num,
			 "ignoring illegal character: " + yytext());
	    CharNum.num++;
	   }
					case -56:
						break;
					case 60:
						{
			Symbol S = new Symbol(sym.ID, new IdTokenVal(yyline+1, CharNum.num, yytext()));
			CharNum.num += yytext().length();
			return S;
			}
					case -57:
						break;
					case 62:
						{
			Symbol S = new Symbol(sym.ID, new IdTokenVal(yyline+1, CharNum.num, yytext()));
			CharNum.num += yytext().length();
			return S;
			}
					case -58:
						break;
					case 64:
						{
			Symbol S = new Symbol(sym.ID, new IdTokenVal(yyline+1, CharNum.num, yytext()));
			CharNum.num += yytext().length();
			return S;
			}
					case -59:
						break;
					case 66:
						{
			Symbol S = new Symbol(sym.ID, new IdTokenVal(yyline+1, CharNum.num, yytext()));
			CharNum.num += yytext().length();
			return S;
			}
					case -60:
						break;
					case 67:
						{
			Symbol S = new Symbol(sym.ID, new IdTokenVal(yyline+1, CharNum.num, yytext()));
			CharNum.num += yytext().length();
			return S;
			}
					case -61:
						break;
					case 68:
						{
			Symbol S = new Symbol(sym.ID, new IdTokenVal(yyline+1, CharNum.num, yytext()));
			CharNum.num += yytext().length();
			return S;
			}
					case -62:
						break;
					case 70:
						{
			Symbol S = new Symbol(sym.ID, new IdTokenVal(yyline+1, CharNum.num, yytext()));
			CharNum.num += yytext().length();
			return S;
			}
					case -63:
						break;
					case 71:
						{
			Symbol S = new Symbol(sym.ID, new IdTokenVal(yyline+1, CharNum.num, yytext()));
			CharNum.num += yytext().length();
			return S;
			}
					case -64:
						break;
					case 72:
						{
			Symbol S = new Symbol(sym.ID, new IdTokenVal(yyline+1, CharNum.num, yytext()));
			CharNum.num += yytext().length();
			return S;
			}
					case -65:
						break;
					case 73:
						{
			Symbol S = new Symbol(sym.ID, new IdTokenVal(yyline+1, CharNum.num, yytext()));
			CharNum.num += yytext().length();
			return S;
			}
					case -66:
						break;
					case 74:
						{
			Symbol S = new Symbol(sym.ID, new IdTokenVal(yyline+1, CharNum.num, yytext()));
			CharNum.num += yytext().length();
			return S;
			}
					case -67:
						break;
					case 75:
						{
			Symbol S = new Symbol(sym.ID, new IdTokenVal(yyline+1, CharNum.num, yytext()));
			CharNum.num += yytext().length();
			return S;
			}
					case -68:
						break;
					case 76:
						{
			Symbol S = new Symbol(sym.ID, new IdTokenVal(yyline+1, CharNum.num, yytext()));
			CharNum.num += yytext().length();
			return S;
			}
					case -69:
						break;
					case 77:
						{
			Symbol S = new Symbol(sym.ID, new IdTokenVal(yyline+1, CharNum.num, yytext()));
			CharNum.num += yytext().length();
			return S;
			}
					case -70:
						break;
					case 78:
						{
			Symbol S = new Symbol(sym.ID, new IdTokenVal(yyline+1, CharNum.num, yytext()));
			CharNum.num += yytext().length();
			return S;
			}
					case -71:
						break;
					case 79:
						{
			Symbol S = new Symbol(sym.ID, new IdTokenVal(yyline+1, CharNum.num, yytext()));
			CharNum.num += yytext().length();
			return S;
			}
					case -72:
						break;
					case 80:
						{
			Symbol S = new Symbol(sym.ID, new IdTokenVal(yyline+1, CharNum.num, yytext()));
			CharNum.num += yytext().length();
			return S;
			}
					case -73:
						break;
					case 81:
						{
			Symbol S = new Symbol(sym.ID, new IdTokenVal(yyline+1, CharNum.num, yytext()));
			CharNum.num += yytext().length();
			return S;
			}
					case -74:
						break;
					case 82:
						{
			Symbol S = new Symbol(sym.ID, new IdTokenVal(yyline+1, CharNum.num, yytext()));
			CharNum.num += yytext().length();
			return S;
			}
					case -75:
						break;
					case 83:
						{
			Symbol S = new Symbol(sym.ID, new IdTokenVal(yyline+1, CharNum.num, yytext()));
			CharNum.num += yytext().length();
			return S;
			}
					case -76:
						break;
					case 84:
						{
			Symbol S = new Symbol(sym.ID, new IdTokenVal(yyline+1, CharNum.num, yytext()));
			CharNum.num += yytext().length();
			return S;
			}
					case -77:
						break;
					case 85:
						{
			Symbol S = new Symbol(sym.ID, new IdTokenVal(yyline+1, CharNum.num, yytext()));
			CharNum.num += yytext().length();
			return S;
			}
					case -78:
						break;
					case 86:
						{
			Symbol S = new Symbol(sym.ID, new IdTokenVal(yyline+1, CharNum.num, yytext()));
			CharNum.num += yytext().length();
			return S;
			}
					case -79:
						break;
					case 87:
						{
			Symbol S = new Symbol(sym.ID, new IdTokenVal(yyline+1, CharNum.num, yytext()));
			CharNum.num += yytext().length();
			return S;
			}
					case -80:
						break;
					case 88:
						{
			Symbol S = new Symbol(sym.ID, new IdTokenVal(yyline+1, CharNum.num, yytext()));
			CharNum.num += yytext().length();
			return S;
			}
					case -81:
						break;
					case 89:
						{
			Symbol S = new Symbol(sym.ID, new IdTokenVal(yyline+1, CharNum.num, yytext()));
			CharNum.num += yytext().length();
			return S;
			}
					case -82:
						break;
					case 90:
						{
			Symbol S = new Symbol(sym.ID, new IdTokenVal(yyline+1, CharNum.num, yytext()));
			CharNum.num += yytext().length();
			return S;
			}
					case -83:
						break;
					case 91:
						{
			Symbol S = new Symbol(sym.ID, new IdTokenVal(yyline+1, CharNum.num, yytext()));
			CharNum.num += yytext().length();
			return S;
			}
					case -84:
						break;
					default:
						yy_error(YY_E_INTERNAL,false);
					case -1:
					}
					yy_initial = true;
					yy_state = yy_state_dtrans[yy_lexical_state];
					yy_next_state = YY_NO_STATE;
					yy_last_accept_state = YY_NO_STATE;
					yy_mark_start();
					yy_this_accept = yy_acpt[yy_state];
					if (YY_NOT_ACCEPT != yy_this_accept) {
						yy_last_accept_state = yy_state;
						yy_mark_end();
					}
				}
			}
		}
	}
}
