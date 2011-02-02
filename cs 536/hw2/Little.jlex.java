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
		/* 22 */ YY_NOT_ACCEPT,
		/* 23 */ YY_NO_ANCHOR,
		/* 24 */ YY_NO_ANCHOR,
		/* 25 */ YY_NO_ANCHOR,
		/* 26 */ YY_NO_ANCHOR,
		/* 27 */ YY_NOT_ACCEPT,
		/* 28 */ YY_NO_ANCHOR,
		/* 29 */ YY_NOT_ACCEPT,
		/* 30 */ YY_NO_ANCHOR,
		/* 31 */ YY_NOT_ACCEPT,
		/* 32 */ YY_NO_ANCHOR,
		/* 33 */ YY_NOT_ACCEPT,
		/* 34 */ YY_NO_ANCHOR,
		/* 35 */ YY_NOT_ACCEPT,
		/* 36 */ YY_NO_ANCHOR,
		/* 37 */ YY_NOT_ACCEPT,
		/* 38 */ YY_NO_ANCHOR,
		/* 39 */ YY_NOT_ACCEPT,
		/* 40 */ YY_NO_ANCHOR,
		/* 41 */ YY_NOT_ACCEPT,
		/* 42 */ YY_NO_ANCHOR,
		/* 43 */ YY_NOT_ACCEPT,
		/* 44 */ YY_NOT_ACCEPT,
		/* 45 */ YY_NO_ANCHOR,
		/* 46 */ YY_NO_ANCHOR,
		/* 47 */ YY_NO_ANCHOR,
		/* 48 */ YY_NO_ANCHOR,
		/* 49 */ YY_NO_ANCHOR,
		/* 50 */ YY_NO_ANCHOR,
		/* 51 */ YY_NO_ANCHOR,
		/* 52 */ YY_NO_ANCHOR,
		/* 53 */ YY_NO_ANCHOR,
		/* 54 */ YY_NO_ANCHOR,
		/* 55 */ YY_NO_ANCHOR,
		/* 56 */ YY_NO_ANCHOR,
		/* 57 */ YY_NO_ANCHOR,
		/* 58 */ YY_NO_ANCHOR,
		/* 59 */ YY_NO_ANCHOR,
		/* 60 */ YY_NO_ANCHOR,
		/* 61 */ YY_NO_ANCHOR,
		/* 62 */ YY_NO_ANCHOR,
		/* 63 */ YY_NO_ANCHOR,
		/* 64 */ YY_NO_ANCHOR,
		/* 65 */ YY_NO_ANCHOR,
		/* 66 */ YY_NO_ANCHOR
	};
	private int yy_cmap[] = unpackFromString(1,130,
"29:9,26,23,29:2,20,29:18,26,29,19,29:4,22,29:3,27,29:2,25,29,24:10,29:7,28:" +
"26,29,21,29:2,28,29,17,8,16,6,10,11,28,14,1,28:2,9,28,2,5,18,28,15,12,3,7,4" +
",13,28:3,29:5,0:2")[0];

	private int yy_rmap[] = unpackFromString(1,67,
"0,1,2,3,1,4,5,1,6,1,7,6,8,6:2,1,9,6:5,3,6,1,9,10,11,12,8,13,9,14,10,15,16,1" +
"7,7,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41" +
",42,43,44,45,46")[0];

	private int yy_nxt[][] = unpackFromString(47,30,
"1,2,23:2,52,23,64,23:3,53,23,59,60,23,65,23:2,66,3,-1,24:2,4,5,24,6,7,23,24" +
",-1:31,23,28,23:8,8,23:7,-1:5,23,-1:3,23,-1:2,22:18,9,22,27,22,10,22:6,-1:2" +
"4,5,29,-1:30,6,-1:4,23:18,-1:5,23,-1:3,23,-1:2,37:18,-1,37,39,37,10,37:6,-1" +
":24,12,-1:6,31:18,15,31:3,16,31:6,-1,33:18,9,33,41,33,-1,33:6,-1,31,22:2,31" +
":15,33,31,35,22,25,31:6,-1,23:2,11,23:15,-1:5,23,-1:3,23,-1:2,23:5,13,23:12" +
",-1:5,23,-1:3,23,-1:2,23:9,14,23:8,-1:5,23,-1:3,23,-1:2,23:10,17,23:7,-1:5," +
"23,-1:3,23,-1:2,43,22:2,43:15,9,43,27,22,25,43:6,-1,23:9,18,23:8,-1:5,23,-1" +
":3,23,-1:2,23:9,19,23:8,-1:5,23,-1:3,23,-1:2,31,37:2,31:15,-1,31,39,37,25,3" +
"1:6,-1,23,20,23:16,-1:5,23,-1:3,23,-1:3,33:2,-1:15,33,-1,33:2,-1:8,23:10,21" +
",23:7,-1:5,23,-1:3,23,-1:2,43:18,9,43,44,43,16,43:6,-1,31,43:2,31:15,26,31," +
"43:2,16,31:6,-1,30,23:17,-1:5,23,-1:3,23,-1:2,23:11,32,23:6,-1:5,23,-1:3,23" +
",-1:2,23,34,23:16,-1:5,23,-1:3,23,-1:2,23:8,36,23:9,-1:5,23,-1:3,23,-1:2,23" +
":8,38,23:9,-1:5,23,-1:3,23,-1:2,23:14,40,23:3,-1:5,23,-1:3,23,-1:2,23:2,42," +
"23:15,-1:5,23,-1:3,23,-1:2,23:4,45,23:13,-1:5,23,-1:3,23,-1:2,23:8,46,23:9," +
"-1:5,23,-1:3,23,-1:2,23:16,47,23,-1:5,23,-1:3,23,-1:2,48,23:17,-1:5,23,-1:3" +
",23,-1:2,23:7,49,23:10,-1:5,23,-1:3,23,-1:2,23:6,50,23:11,-1:5,23,-1:3,23,-" +
"1:2,23,51,23:16,-1:5,23,-1:3,23,-1:2,23:15,54,23:2,-1:5,23,-1:3,23,-1:2,23:" +
"13,55,23:4,-1:5,23,-1:3,23,-1:2,23:6,56,23:11,-1:5,23,-1:3,23,-1:2,23:2,57," +
"23:15,-1:5,23,-1:3,23,-1:2,58,23:17,-1:5,23,-1:3,23,-1:2,23:4,61,23:13,-1:5" +
",23,-1:3,23,-1:2,23:9,62,23:8,-1:5,23,-1:3,23,-1:2,23:14,63,23:3,-1:5,23,-1" +
":3,23,-1");

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
						{Errors.fatal(yyline+1, CharNum.num,
			 "ignoring illegal character: " + yytext());
	    CharNum.num++;
	   }
					case -4:
						break;
					case 4:
						{CharNum.num = 1;}
					case -5:
						break;
					case 5:
						{// NOTE: the following computation of the integer value does NOT
	    //       check for overflow.  This must be changed.
	    int val = (new Integer(yytext())).intValue();
	    Symbol S = new Symbol(sym.INTLITERAL,
			          new IntLitTokenVal(yyline+1, CharNum.num, val)
				 );
	    CharNum.num += yytext().length();
	    return S;
	   }
					case -6:
						break;
					case 6:
						{CharNum.num += yytext().length();}
					case -7:
						break;
					case 7:
						{Symbol S = new Symbol(sym.PLUS, new TokenVal(yyline+1, CharNum.num));
	    CharNum.num++;
	    return S;
	   }
					case -8:
						break;
					case 8:
						{
			Symbol S = new Symbol(sym.IF, new TokenVal(yyline+1, CharNum.num));
			CharNum.num += yytext().length();
			return S;
		}
					case -9:
						break;
					case 9:
						{	
							String str = yytext();
							Symbol s = new Symbol(sym.STRINGLITERAL, new StrLitTokenVal(yyline+1, CharNum.num, str));
							CharNum.num += yytext().length();
							return s;
							}
					case -10:
						break;
					case 10:
						{Errors.fatal(yyline+1, CharNum.num,
			 "ignoring unterminated string literal");
	    CharNum.num += yytext().length();
			return new Symbol(-1, new ErrToken(yyline+1, CharNum.num, "ignoring unterminated string literal"));
			}
					case -11:
						break;
					case 11:
						{
			Symbol S = new Symbol(sym.INT, new TokenVal(yyline+1, CharNum.num));
			CharNum.num += yytext().length();
			return S;
		}
					case -12:
						break;
					case 12:
						{
							double val = (new Double(yytext())).doubleValue();
							Symbol S = new Symbol(sym.DBLLITERAL,
											  new DblLitTokenVal(yyline+1, CharNum.num, val)
								 );
							CharNum.num += yytext().length();
							return S;
					 }
					case -13:
						break;
					case 13:
						{
			Symbol S = new Symbol(sym.VOID, new TokenVal(yyline+1, CharNum.num));
			CharNum.num += yytext().length();
			return S;
		}
					case -14:
						break;
					case 14:
						{
			Symbol S = new Symbol(sym.ELSE, new TokenVal(yyline+1, CharNum.num));
			CharNum.num += yytext().length();
			return S;
		}
					case -15:
						break;
					case 15:
						{ Errors.fatal(yyline+1, CharNum.num,
							"ignoring string literal with bad escaped character");
							CharNum.num += yytext().length();
							return new Symbol(-1, new ErrToken(yyline+1, CharNum.num, "ignoring string literal with bad escaped character"));
						}
					case -16:
						break;
					case 16:
						{	Errors.fatal(yyline+1, CharNum.num,
							"ignoring unterminated string literal with bad escaped character");
							CharNum.num += yytext().length();
							return new Symbol(-1, new ErrToken(yyline+1, CharNum.num, "ignoring unterminated string literal with bad escaped character"));
						}
					case -17:
						break;
					case 17:
						{
			Symbol S = new Symbol(sym.SCANF, new TokenVal(yyline+1, CharNum.num));
			CharNum.num += yytext().length();
			return S;
		}
					case -18:
						break;
					case 18:
						{
			Symbol S = new Symbol(sym.WHILE, new TokenVal(yyline+1, CharNum.num));
			CharNum.num += yytext().length();
			return S;
		}
					case -19:
						break;
					case 19:
						{
			Symbol S = new Symbol(sym.DBL, new TokenVal(yyline+1, CharNum.num));
			CharNum.num += yytext().length();
			return S;
		}
					case -20:
						break;
					case 20:
						{
			Symbol S = new Symbol(sym.RETURN, new TokenVal(yyline+1, CharNum.num));
			CharNum.num += yytext().length();
			return S;
		}
					case -21:
						break;
					case 21:
						{
			Symbol S = new Symbol(sym.PRINTF, new TokenVal(yyline+1, CharNum.num));
			CharNum.num += yytext().length();
			return S;
		}
					case -22:
						break;
					case 23:
						{
			Symbol S = new Symbol(sym.ID, new IdTokenVal(yyline+1, CharNum.num, yytext()));
			CharNum.num += yytext().length();
			return S;
			}
					case -23:
						break;
					case 24:
						{Errors.fatal(yyline+1, CharNum.num,
			 "ignoring illegal character: " + yytext());
	    CharNum.num++;
	   }
					case -24:
						break;
					case 25:
						{Errors.fatal(yyline+1, CharNum.num,
			 "ignoring unterminated string literal");
	    CharNum.num += yytext().length();
			return new Symbol(-1, new ErrToken(yyline+1, CharNum.num, "ignoring unterminated string literal"));
			}
					case -25:
						break;
					case 26:
						{ Errors.fatal(yyline+1, CharNum.num,
							"ignoring string literal with bad escaped character");
							CharNum.num += yytext().length();
							return new Symbol(-1, new ErrToken(yyline+1, CharNum.num, "ignoring string literal with bad escaped character"));
						}
					case -26:
						break;
					case 28:
						{
			Symbol S = new Symbol(sym.ID, new IdTokenVal(yyline+1, CharNum.num, yytext()));
			CharNum.num += yytext().length();
			return S;
			}
					case -27:
						break;
					case 30:
						{
			Symbol S = new Symbol(sym.ID, new IdTokenVal(yyline+1, CharNum.num, yytext()));
			CharNum.num += yytext().length();
			return S;
			}
					case -28:
						break;
					case 32:
						{
			Symbol S = new Symbol(sym.ID, new IdTokenVal(yyline+1, CharNum.num, yytext()));
			CharNum.num += yytext().length();
			return S;
			}
					case -29:
						break;
					case 34:
						{
			Symbol S = new Symbol(sym.ID, new IdTokenVal(yyline+1, CharNum.num, yytext()));
			CharNum.num += yytext().length();
			return S;
			}
					case -30:
						break;
					case 36:
						{
			Symbol S = new Symbol(sym.ID, new IdTokenVal(yyline+1, CharNum.num, yytext()));
			CharNum.num += yytext().length();
			return S;
			}
					case -31:
						break;
					case 38:
						{
			Symbol S = new Symbol(sym.ID, new IdTokenVal(yyline+1, CharNum.num, yytext()));
			CharNum.num += yytext().length();
			return S;
			}
					case -32:
						break;
					case 40:
						{
			Symbol S = new Symbol(sym.ID, new IdTokenVal(yyline+1, CharNum.num, yytext()));
			CharNum.num += yytext().length();
			return S;
			}
					case -33:
						break;
					case 42:
						{
			Symbol S = new Symbol(sym.ID, new IdTokenVal(yyline+1, CharNum.num, yytext()));
			CharNum.num += yytext().length();
			return S;
			}
					case -34:
						break;
					case 45:
						{
			Symbol S = new Symbol(sym.ID, new IdTokenVal(yyline+1, CharNum.num, yytext()));
			CharNum.num += yytext().length();
			return S;
			}
					case -35:
						break;
					case 46:
						{
			Symbol S = new Symbol(sym.ID, new IdTokenVal(yyline+1, CharNum.num, yytext()));
			CharNum.num += yytext().length();
			return S;
			}
					case -36:
						break;
					case 47:
						{
			Symbol S = new Symbol(sym.ID, new IdTokenVal(yyline+1, CharNum.num, yytext()));
			CharNum.num += yytext().length();
			return S;
			}
					case -37:
						break;
					case 48:
						{
			Symbol S = new Symbol(sym.ID, new IdTokenVal(yyline+1, CharNum.num, yytext()));
			CharNum.num += yytext().length();
			return S;
			}
					case -38:
						break;
					case 49:
						{
			Symbol S = new Symbol(sym.ID, new IdTokenVal(yyline+1, CharNum.num, yytext()));
			CharNum.num += yytext().length();
			return S;
			}
					case -39:
						break;
					case 50:
						{
			Symbol S = new Symbol(sym.ID, new IdTokenVal(yyline+1, CharNum.num, yytext()));
			CharNum.num += yytext().length();
			return S;
			}
					case -40:
						break;
					case 51:
						{
			Symbol S = new Symbol(sym.ID, new IdTokenVal(yyline+1, CharNum.num, yytext()));
			CharNum.num += yytext().length();
			return S;
			}
					case -41:
						break;
					case 52:
						{
			Symbol S = new Symbol(sym.ID, new IdTokenVal(yyline+1, CharNum.num, yytext()));
			CharNum.num += yytext().length();
			return S;
			}
					case -42:
						break;
					case 53:
						{
			Symbol S = new Symbol(sym.ID, new IdTokenVal(yyline+1, CharNum.num, yytext()));
			CharNum.num += yytext().length();
			return S;
			}
					case -43:
						break;
					case 54:
						{
			Symbol S = new Symbol(sym.ID, new IdTokenVal(yyline+1, CharNum.num, yytext()));
			CharNum.num += yytext().length();
			return S;
			}
					case -44:
						break;
					case 55:
						{
			Symbol S = new Symbol(sym.ID, new IdTokenVal(yyline+1, CharNum.num, yytext()));
			CharNum.num += yytext().length();
			return S;
			}
					case -45:
						break;
					case 56:
						{
			Symbol S = new Symbol(sym.ID, new IdTokenVal(yyline+1, CharNum.num, yytext()));
			CharNum.num += yytext().length();
			return S;
			}
					case -46:
						break;
					case 57:
						{
			Symbol S = new Symbol(sym.ID, new IdTokenVal(yyline+1, CharNum.num, yytext()));
			CharNum.num += yytext().length();
			return S;
			}
					case -47:
						break;
					case 58:
						{
			Symbol S = new Symbol(sym.ID, new IdTokenVal(yyline+1, CharNum.num, yytext()));
			CharNum.num += yytext().length();
			return S;
			}
					case -48:
						break;
					case 59:
						{
			Symbol S = new Symbol(sym.ID, new IdTokenVal(yyline+1, CharNum.num, yytext()));
			CharNum.num += yytext().length();
			return S;
			}
					case -49:
						break;
					case 60:
						{
			Symbol S = new Symbol(sym.ID, new IdTokenVal(yyline+1, CharNum.num, yytext()));
			CharNum.num += yytext().length();
			return S;
			}
					case -50:
						break;
					case 61:
						{
			Symbol S = new Symbol(sym.ID, new IdTokenVal(yyline+1, CharNum.num, yytext()));
			CharNum.num += yytext().length();
			return S;
			}
					case -51:
						break;
					case 62:
						{
			Symbol S = new Symbol(sym.ID, new IdTokenVal(yyline+1, CharNum.num, yytext()));
			CharNum.num += yytext().length();
			return S;
			}
					case -52:
						break;
					case 63:
						{
			Symbol S = new Symbol(sym.ID, new IdTokenVal(yyline+1, CharNum.num, yytext()));
			CharNum.num += yytext().length();
			return S;
			}
					case -53:
						break;
					case 64:
						{
			Symbol S = new Symbol(sym.ID, new IdTokenVal(yyline+1, CharNum.num, yytext()));
			CharNum.num += yytext().length();
			return S;
			}
					case -54:
						break;
					case 65:
						{
			Symbol S = new Symbol(sym.ID, new IdTokenVal(yyline+1, CharNum.num, yytext()));
			CharNum.num += yytext().length();
			return S;
			}
					case -55:
						break;
					case 66:
						{
			Symbol S = new Symbol(sym.ID, new IdTokenVal(yyline+1, CharNum.num, yytext()));
			CharNum.num += yytext().length();
			return S;
			}
					case -56:
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
