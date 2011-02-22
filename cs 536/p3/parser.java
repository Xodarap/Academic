
//----------------------------------------------------
// The following code was generated by CUP v0.10j
// Mon Feb 21 23:55:19 CST 2011
//----------------------------------------------------

import java_cup.runtime.*;
import java.util.*;

/** CUP v0.10j generated parser.
  * @version Mon Feb 21 23:55:19 CST 2011
  */
public class parser extends java_cup.runtime.lr_parser {

  /** Default constructor. */
  public parser() {super();}

  /** Constructor which sets the default scanner. */
  public parser(java_cup.runtime.Scanner s) {super(s);}

  /** Production table. */
  protected static final short _production_table[][] = 
    unpackFromStrings(new String[] {
    "\000\046\000\002\002\004\000\002\003\003\000\002\004" +
    "\004\000\002\004\002\000\002\005\003\000\002\005\003" +
    "\000\002\013\012\000\002\014\004\000\002\011\005\000" +
    "\002\011\003\000\002\011\002\000\002\012\004\000\002" +
    "\006\005\000\002\007\003\000\002\007\003\000\002\007" +
    "\003\000\002\010\003\000\002\017\003\000\002\020\003" +
    "\000\002\021\003\000\002\015\004\000\002\015\002\000" +
    "\002\016\004\000\002\016\005\000\002\016\005\000\002" +
    "\016\005\000\002\016\005\000\002\023\003\000\002\023" +
    "\003\000\002\023\003\000\002\023\003\000\002\024\005" +
    "\000\002\022\003\000\002\022\003\000\002\022\004\000" +
    "\002\022\004\000\002\022\004\000\002\022\004" });

  /** Access to production table. */
  public short[][] production_table() {return _production_table;}

  /** Parse-action table. */
  protected static final short[][] _action_table = 
    unpackFromStrings(new String[] {
    "\000\073\000\012\002\ufffe\004\ufffe\005\ufffe\006\ufffe\001" +
    "\002\000\012\002\000\004\015\005\014\006\010\001\002" +
    "\000\004\002\006\001\002\000\004\002\001\001\002\000" +
    "\022\002\uffff\004\uffff\005\uffff\006\uffff\017\uffff\024\uffff" +
    "\036\uffff\037\uffff\001\002\000\004\017\ufff3\001\002\000" +
    "\004\017\016\001\002\000\022\002\ufffd\004\ufffd\005\ufffd" +
    "\006\ufffd\017\ufffd\024\ufffd\036\ufffd\037\ufffd\001\002\000" +
    "\022\002\ufffc\004\ufffc\005\ufffc\006\ufffc\017\ufffc\024\ufffc" +
    "\036\ufffc\037\ufffc\001\002\000\004\017\ufff2\001\002\000" +
    "\004\017\ufff4\001\002\000\020\025\ufff1\026\ufff1\027\ufff1" +
    "\030\ufff1\031\ufff1\036\ufff1\037\ufff1\001\002\000\006\025" +
    "\021\031\020\001\002\000\022\002\ufff5\004\ufff5\005\ufff5" +
    "\006\ufff5\017\ufff5\024\ufff5\036\ufff5\037\ufff5\001\002\000" +
    "\014\004\015\005\014\006\010\026\ufff7\027\ufff7\001\002" +
    "\000\004\017\016\001\002\000\006\026\026\027\025\001" +
    "\002\000\006\026\ufff8\027\ufff8\001\002\000\010\004\015" +
    "\005\014\006\010\001\002\000\004\023\027\001\002\000" +
    "\020\004\ufffe\005\ufffe\006\ufffe\017\ufffe\024\ufffe\036\ufffe" +
    "\037\ufffe\001\002\000\020\004\015\005\014\006\010\017" +
    "\uffec\024\uffec\036\uffec\037\uffec\001\002\000\004\024\032" +
    "\001\002\000\022\002\ufffb\004\ufffb\005\ufffb\006\ufffb\017" +
    "\ufffb\024\ufffb\036\ufffb\037\ufffb\001\002\000\012\017\016" +
    "\024\ufffa\036\036\037\034\001\002\000\004\017\016\001" +
    "\002\000\012\017\uffed\024\uffed\036\uffed\037\uffed\001\002" +
    "\000\004\017\016\001\002\000\004\031\067\001\002\000" +
    "\010\030\043\036\042\037\041\001\002\000\004\031\066" +
    "\001\002\000\004\031\065\001\002\000\016\017\016\020" +
    "\056\021\045\022\054\033\044\040\055\001\002\000\012" +
    "\017\016\020\056\021\045\022\054\001\002\000\010\031" +
    "\uffef\036\uffef\037\uffef\001\002\000\012\030\043\031\uffe6" +
    "\036\uffe6\037\uffe6\001\002\000\010\031\uffe0\036\uffe0\037" +
    "\uffe0\001\002\000\010\031\uffe2\036\062\037\061\001\002" +
    "\000\010\031\uffe5\036\uffe5\037\uffe5\001\002\000\010\031" +
    "\uffe3\036\uffe3\037\uffe3\001\002\000\010\031\uffe1\036\uffe1" +
    "\037\uffe1\001\002\000\010\031\uffee\036\uffee\037\uffee\001" +
    "\002\000\016\017\016\020\056\021\045\022\054\033\044" +
    "\040\055\001\002\000\010\031\ufff0\036\ufff0\037\ufff0\001" +
    "\002\000\010\031\uffe4\036\uffe4\037\uffe4\001\002\000\010" +
    "\031\uffdd\036\uffdd\037\uffdd\001\002\000\010\031\uffde\036" +
    "\uffde\037\uffde\001\002\000\010\031\uffdf\036\uffdf\037\uffdf" +
    "\001\002\000\010\031\uffe6\036\uffe6\037\uffe6\001\002\000" +
    "\010\031\uffdc\036\uffdc\037\uffdc\001\002\000\012\017\uffe8" +
    "\024\uffe8\036\uffe8\037\uffe8\001\002\000\012\017\uffe7\024" +
    "\uffe7\036\uffe7\037\uffe7\001\002\000\012\017\uffeb\024\uffeb" +
    "\036\uffeb\037\uffeb\001\002\000\004\031\071\001\002\000" +
    "\012\017\uffea\024\uffea\036\uffea\037\uffea\001\002\000\004" +
    "\031\073\001\002\000\012\017\uffe9\024\uffe9\036\uffe9\037" +
    "\uffe9\001\002\000\006\026\ufff9\027\ufff9\001\002\000\006" +
    "\026\ufff6\027\ufff6\001\002" });

  /** Access to parse-action table. */
  public short[][] action_table() {return _action_table;}

  /** <code>reduce_goto</code> table. */
  protected static final short[][] _reduce_table = 
    unpackFromStrings(new String[] {
    "\000\073\000\006\003\004\004\003\001\001\000\012\005" +
    "\006\006\011\007\010\013\012\001\001\000\002\001\001" +
    "\000\002\001\001\000\002\001\001\000\002\001\001\000" +
    "\004\010\016\001\001\000\002\001\001\000\002\001\001" +
    "\000\002\001\001\000\002\001\001\000\002\001\001\000" +
    "\002\001\001\000\002\001\001\000\010\007\021\011\022" +
    "\012\023\001\001\000\004\010\074\001\001\000\002\001" +
    "\001\000\002\001\001\000\006\007\021\012\073\001\001" +
    "\000\002\001\001\000\006\004\027\014\030\001\001\000" +
    "\014\005\006\006\011\007\010\013\012\015\032\001\001" +
    "\000\002\001\001\000\002\001\001\000\010\010\037\016" +
    "\034\024\036\001\001\000\004\010\071\001\001\000\002" +
    "\001\001\000\004\010\067\001\001\000\002\001\001\000" +
    "\002\001\001\000\002\001\001\000\002\001\001\000\020" +
    "\010\045\017\050\020\056\021\051\022\047\023\046\024" +
    "\052\001\001\000\014\010\062\017\050\020\056\021\051" +
    "\023\063\001\001\000\002\001\001\000\002\001\001\000" +
    "\002\001\001\000\002\001\001\000\002\001\001\000\002" +
    "\001\001\000\002\001\001\000\002\001\001\000\020\010" +
    "\045\017\050\020\056\021\051\022\057\023\046\024\052" +
    "\001\001\000\002\001\001\000\002\001\001\000\002\001" +
    "\001\000\002\001\001\000\002\001\001\000\002\001\001" +
    "\000\002\001\001\000\002\001\001\000\002\001\001\000" +
    "\002\001\001\000\002\001\001\000\002\001\001\000\002" +
    "\001\001\000\002\001\001\000\002\001\001\000\002\001" +
    "\001" });

  /** Access to <code>reduce_goto</code> table. */
  public short[][] reduce_table() {return _reduce_table;}

  /** Instance of action encapsulation class. */
  protected CUP$parser$actions action_obj;

  /** Action encapsulation object initializer. */
  protected void init_actions()
    {
      action_obj = new CUP$parser$actions(this);
    }

  /** Invoke a user supplied parse action. */
  public java_cup.runtime.Symbol do_action(
    int                        act_num,
    java_cup.runtime.lr_parser parser,
    java.util.Stack            stack,
    int                        top)
    throws java.lang.Exception
  {
    /* call code in generated class */
    return action_obj.CUP$parser$do_action(act_num, parser, stack, top);
  }

  /** Indicates start state. */
  public int start_state() {return 0;}
  /** Indicates start production. */
  public int start_production() {return 0;}

  /** <code>EOF</code> Symbol index. */
  public int EOF_sym() {return 0;}

  /** <code>error</code> Symbol index. */
  public int error_sym() {return 1;}




public void syntax_error(Symbol currToken) {
    if (currToken.value == null) {
       Errors.fatal(0,0, "Syntax error at end of file");
    }
    else {
       Errors.fatal(((TokenVal)currToken.value).linenum,
	            ((TokenVal)currToken.value).charnum,
		    "Syntax error");
    }
    System.exit(-1);
}


}

/** Cup generated class to encapsulate user supplied action code.*/
class CUP$parser$actions {
  private final parser parser;

  /** Constructor */
  CUP$parser$actions(parser parser) {
    this.parser = parser;
  }

  /** Method with the actual generated action code. */
  public final java_cup.runtime.Symbol CUP$parser$do_action(
    int                        CUP$parser$act_num,
    java_cup.runtime.lr_parser CUP$parser$parser,
    java.util.Stack            CUP$parser$stack,
    int                        CUP$parser$top)
    throws java.lang.Exception
    {
      /* Symbol object for return from actions */
      java_cup.runtime.Symbol CUP$parser$result;

      /* select the action based on the action number */
      switch (CUP$parser$act_num)
        {
          /*. . . . . . . . . . . . . . . . . . . .*/
          case 37: // exp ::= MINUS term 
            {
              ExpNode RESULT = null;
		int tleft = ((java_cup.runtime.Symbol)CUP$parser$stack.elementAt(CUP$parser$top-0)).left;
		int tright = ((java_cup.runtime.Symbol)CUP$parser$stack.elementAt(CUP$parser$top-0)).right;
		ExpNode t = (ExpNode)((java_cup.runtime.Symbol) CUP$parser$stack.elementAt(CUP$parser$top-0)).value;
		 RESULT = new UnaryMinusNode(t);
	       
              CUP$parser$result = new java_cup.runtime.Symbol(16/*exp*/, ((java_cup.runtime.Symbol)CUP$parser$stack.elementAt(CUP$parser$top-1)).left, ((java_cup.runtime.Symbol)CUP$parser$stack.elementAt(CUP$parser$top-0)).right, RESULT);
            }
          return CUP$parser$result;

          /*. . . . . . . . . . . . . . . . . . . .*/
          case 36: // exp ::= NOT exp 
            {
              ExpNode RESULT = null;
		int eleft = ((java_cup.runtime.Symbol)CUP$parser$stack.elementAt(CUP$parser$top-0)).left;
		int eright = ((java_cup.runtime.Symbol)CUP$parser$stack.elementAt(CUP$parser$top-0)).right;
		ExpNode e = (ExpNode)((java_cup.runtime.Symbol) CUP$parser$stack.elementAt(CUP$parser$top-0)).value;
		 RESULT = new NotNode(e);
	       
              CUP$parser$result = new java_cup.runtime.Symbol(16/*exp*/, ((java_cup.runtime.Symbol)CUP$parser$stack.elementAt(CUP$parser$top-1)).left, ((java_cup.runtime.Symbol)CUP$parser$stack.elementAt(CUP$parser$top-0)).right, RESULT);
            }
          return CUP$parser$result;

          /*. . . . . . . . . . . . . . . . . . . .*/
          case 35: // exp ::= exp MINUSMINUS 
            {
              ExpNode RESULT = null;
		int eleft = ((java_cup.runtime.Symbol)CUP$parser$stack.elementAt(CUP$parser$top-1)).left;
		int eright = ((java_cup.runtime.Symbol)CUP$parser$stack.elementAt(CUP$parser$top-1)).right;
		ExpNode e = (ExpNode)((java_cup.runtime.Symbol) CUP$parser$stack.elementAt(CUP$parser$top-1)).value;
		 RESULT = new MinusMinusNode(e);
	       
              CUP$parser$result = new java_cup.runtime.Symbol(16/*exp*/, ((java_cup.runtime.Symbol)CUP$parser$stack.elementAt(CUP$parser$top-1)).left, ((java_cup.runtime.Symbol)CUP$parser$stack.elementAt(CUP$parser$top-0)).right, RESULT);
            }
          return CUP$parser$result;

          /*. . . . . . . . . . . . . . . . . . . .*/
          case 34: // exp ::= exp PLUSPLUS 
            {
              ExpNode RESULT = null;
		int eleft = ((java_cup.runtime.Symbol)CUP$parser$stack.elementAt(CUP$parser$top-1)).left;
		int eright = ((java_cup.runtime.Symbol)CUP$parser$stack.elementAt(CUP$parser$top-1)).right;
		ExpNode e = (ExpNode)((java_cup.runtime.Symbol) CUP$parser$stack.elementAt(CUP$parser$top-1)).value;
		 RESULT = new PlusPlusNode(e);
	       
              CUP$parser$result = new java_cup.runtime.Symbol(16/*exp*/, ((java_cup.runtime.Symbol)CUP$parser$stack.elementAt(CUP$parser$top-1)).left, ((java_cup.runtime.Symbol)CUP$parser$stack.elementAt(CUP$parser$top-0)).right, RESULT);
            }
          return CUP$parser$result;

          /*. . . . . . . . . . . . . . . . . . . .*/
          case 33: // exp ::= term 
            {
              ExpNode RESULT = null;
		int tleft = ((java_cup.runtime.Symbol)CUP$parser$stack.elementAt(CUP$parser$top-0)).left;
		int tright = ((java_cup.runtime.Symbol)CUP$parser$stack.elementAt(CUP$parser$top-0)).right;
		ExpNode t = (ExpNode)((java_cup.runtime.Symbol) CUP$parser$stack.elementAt(CUP$parser$top-0)).value;
		 RESULT = t;
	       
              CUP$parser$result = new java_cup.runtime.Symbol(16/*exp*/, ((java_cup.runtime.Symbol)CUP$parser$stack.elementAt(CUP$parser$top-0)).left, ((java_cup.runtime.Symbol)CUP$parser$stack.elementAt(CUP$parser$top-0)).right, RESULT);
            }
          return CUP$parser$result;

          /*. . . . . . . . . . . . . . . . . . . .*/
          case 32: // exp ::= assign_exp 
            {
              ExpNode RESULT = null;
		int aeleft = ((java_cup.runtime.Symbol)CUP$parser$stack.elementAt(CUP$parser$top-0)).left;
		int aeright = ((java_cup.runtime.Symbol)CUP$parser$stack.elementAt(CUP$parser$top-0)).right;
		AssignNode ae = (AssignNode)((java_cup.runtime.Symbol) CUP$parser$stack.elementAt(CUP$parser$top-0)).value;
		 RESULT = ae;
	       
              CUP$parser$result = new java_cup.runtime.Symbol(16/*exp*/, ((java_cup.runtime.Symbol)CUP$parser$stack.elementAt(CUP$parser$top-0)).left, ((java_cup.runtime.Symbol)CUP$parser$stack.elementAt(CUP$parser$top-0)).right, RESULT);
            }
          return CUP$parser$result;

          /*. . . . . . . . . . . . . . . . . . . .*/
          case 31: // assign_exp ::= id ASSIGN exp 
            {
              AssignNode RESULT = null;
		int ileft = ((java_cup.runtime.Symbol)CUP$parser$stack.elementAt(CUP$parser$top-2)).left;
		int iright = ((java_cup.runtime.Symbol)CUP$parser$stack.elementAt(CUP$parser$top-2)).right;
		IdNode i = (IdNode)((java_cup.runtime.Symbol) CUP$parser$stack.elementAt(CUP$parser$top-2)).value;
		int eleft = ((java_cup.runtime.Symbol)CUP$parser$stack.elementAt(CUP$parser$top-0)).left;
		int eright = ((java_cup.runtime.Symbol)CUP$parser$stack.elementAt(CUP$parser$top-0)).right;
		ExpNode e = (ExpNode)((java_cup.runtime.Symbol) CUP$parser$stack.elementAt(CUP$parser$top-0)).value;
		 RESULT = new AssignNode(i, e);
	       
              CUP$parser$result = new java_cup.runtime.Symbol(18/*assign_exp*/, ((java_cup.runtime.Symbol)CUP$parser$stack.elementAt(CUP$parser$top-2)).left, ((java_cup.runtime.Symbol)CUP$parser$stack.elementAt(CUP$parser$top-0)).right, RESULT);
            }
          return CUP$parser$result;

          /*. . . . . . . . . . . . . . . . . . . .*/
          case 30: // term ::= strLit 
            {
              ExpNode RESULT = null;
		int slleft = ((java_cup.runtime.Symbol)CUP$parser$stack.elementAt(CUP$parser$top-0)).left;
		int slright = ((java_cup.runtime.Symbol)CUP$parser$stack.elementAt(CUP$parser$top-0)).right;
		StringLitNode sl = (StringLitNode)((java_cup.runtime.Symbol) CUP$parser$stack.elementAt(CUP$parser$top-0)).value;
		 RESULT = sl;
		
              CUP$parser$result = new java_cup.runtime.Symbol(17/*term*/, ((java_cup.runtime.Symbol)CUP$parser$stack.elementAt(CUP$parser$top-0)).left, ((java_cup.runtime.Symbol)CUP$parser$stack.elementAt(CUP$parser$top-0)).right, RESULT);
            }
          return CUP$parser$result;

          /*. . . . . . . . . . . . . . . . . . . .*/
          case 29: // term ::= dblLit 
            {
              ExpNode RESULT = null;
		int dlleft = ((java_cup.runtime.Symbol)CUP$parser$stack.elementAt(CUP$parser$top-0)).left;
		int dlright = ((java_cup.runtime.Symbol)CUP$parser$stack.elementAt(CUP$parser$top-0)).right;
		DblLitNode dl = (DblLitNode)((java_cup.runtime.Symbol) CUP$parser$stack.elementAt(CUP$parser$top-0)).value;
		 RESULT = dl;
		
              CUP$parser$result = new java_cup.runtime.Symbol(17/*term*/, ((java_cup.runtime.Symbol)CUP$parser$stack.elementAt(CUP$parser$top-0)).left, ((java_cup.runtime.Symbol)CUP$parser$stack.elementAt(CUP$parser$top-0)).right, RESULT);
            }
          return CUP$parser$result;

          /*. . . . . . . . . . . . . . . . . . . .*/
          case 28: // term ::= intLit 
            {
              ExpNode RESULT = null;
		int illeft = ((java_cup.runtime.Symbol)CUP$parser$stack.elementAt(CUP$parser$top-0)).left;
		int ilright = ((java_cup.runtime.Symbol)CUP$parser$stack.elementAt(CUP$parser$top-0)).right;
		IntLitNode il = (IntLitNode)((java_cup.runtime.Symbol) CUP$parser$stack.elementAt(CUP$parser$top-0)).value;
		 RESULT = il;
		
              CUP$parser$result = new java_cup.runtime.Symbol(17/*term*/, ((java_cup.runtime.Symbol)CUP$parser$stack.elementAt(CUP$parser$top-0)).left, ((java_cup.runtime.Symbol)CUP$parser$stack.elementAt(CUP$parser$top-0)).right, RESULT);
            }
          return CUP$parser$result;

          /*. . . . . . . . . . . . . . . . . . . .*/
          case 27: // term ::= id 
            {
              ExpNode RESULT = null;
		int ileft = ((java_cup.runtime.Symbol)CUP$parser$stack.elementAt(CUP$parser$top-0)).left;
		int iright = ((java_cup.runtime.Symbol)CUP$parser$stack.elementAt(CUP$parser$top-0)).right;
		IdNode i = (IdNode)((java_cup.runtime.Symbol) CUP$parser$stack.elementAt(CUP$parser$top-0)).value;
		 RESULT = i;
		
              CUP$parser$result = new java_cup.runtime.Symbol(17/*term*/, ((java_cup.runtime.Symbol)CUP$parser$stack.elementAt(CUP$parser$top-0)).left, ((java_cup.runtime.Symbol)CUP$parser$stack.elementAt(CUP$parser$top-0)).right, RESULT);
            }
          return CUP$parser$result;

          /*. . . . . . . . . . . . . . . . . . . .*/
          case 26: // stmt ::= id MINUSMINUS SEMICOLON 
            {
              StmtNode RESULT = null;
		int ileft = ((java_cup.runtime.Symbol)CUP$parser$stack.elementAt(CUP$parser$top-2)).left;
		int iright = ((java_cup.runtime.Symbol)CUP$parser$stack.elementAt(CUP$parser$top-2)).right;
		IdNode i = (IdNode)((java_cup.runtime.Symbol) CUP$parser$stack.elementAt(CUP$parser$top-2)).value;
		 RESULT = new PostDecStmtNode(i);
		
              CUP$parser$result = new java_cup.runtime.Symbol(12/*stmt*/, ((java_cup.runtime.Symbol)CUP$parser$stack.elementAt(CUP$parser$top-2)).left, ((java_cup.runtime.Symbol)CUP$parser$stack.elementAt(CUP$parser$top-0)).right, RESULT);
            }
          return CUP$parser$result;

          /*. . . . . . . . . . . . . . . . . . . .*/
          case 25: // stmt ::= id PLUSPLUS SEMICOLON 
            {
              StmtNode RESULT = null;
		int ileft = ((java_cup.runtime.Symbol)CUP$parser$stack.elementAt(CUP$parser$top-2)).left;
		int iright = ((java_cup.runtime.Symbol)CUP$parser$stack.elementAt(CUP$parser$top-2)).right;
		IdNode i = (IdNode)((java_cup.runtime.Symbol) CUP$parser$stack.elementAt(CUP$parser$top-2)).value;
		 RESULT = new PostIncStmtNode(i);
		
              CUP$parser$result = new java_cup.runtime.Symbol(12/*stmt*/, ((java_cup.runtime.Symbol)CUP$parser$stack.elementAt(CUP$parser$top-2)).left, ((java_cup.runtime.Symbol)CUP$parser$stack.elementAt(CUP$parser$top-0)).right, RESULT);
            }
          return CUP$parser$result;

          /*. . . . . . . . . . . . . . . . . . . .*/
          case 24: // stmt ::= MINUSMINUS id SEMICOLON 
            {
              StmtNode RESULT = null;
		int ileft = ((java_cup.runtime.Symbol)CUP$parser$stack.elementAt(CUP$parser$top-1)).left;
		int iright = ((java_cup.runtime.Symbol)CUP$parser$stack.elementAt(CUP$parser$top-1)).right;
		IdNode i = (IdNode)((java_cup.runtime.Symbol) CUP$parser$stack.elementAt(CUP$parser$top-1)).value;
		 RESULT = new PreDecStmtNode(i);
		
              CUP$parser$result = new java_cup.runtime.Symbol(12/*stmt*/, ((java_cup.runtime.Symbol)CUP$parser$stack.elementAt(CUP$parser$top-2)).left, ((java_cup.runtime.Symbol)CUP$parser$stack.elementAt(CUP$parser$top-0)).right, RESULT);
            }
          return CUP$parser$result;

          /*. . . . . . . . . . . . . . . . . . . .*/
          case 23: // stmt ::= PLUSPLUS id SEMICOLON 
            {
              StmtNode RESULT = null;
		int ileft = ((java_cup.runtime.Symbol)CUP$parser$stack.elementAt(CUP$parser$top-1)).left;
		int iright = ((java_cup.runtime.Symbol)CUP$parser$stack.elementAt(CUP$parser$top-1)).right;
		IdNode i = (IdNode)((java_cup.runtime.Symbol) CUP$parser$stack.elementAt(CUP$parser$top-1)).value;
		 RESULT = new PreIncStmtNode(i);
		
              CUP$parser$result = new java_cup.runtime.Symbol(12/*stmt*/, ((java_cup.runtime.Symbol)CUP$parser$stack.elementAt(CUP$parser$top-2)).left, ((java_cup.runtime.Symbol)CUP$parser$stack.elementAt(CUP$parser$top-0)).right, RESULT);
            }
          return CUP$parser$result;

          /*. . . . . . . . . . . . . . . . . . . .*/
          case 22: // stmt ::= assign_exp SEMICOLON 
            {
              StmtNode RESULT = null;
		int aeleft = ((java_cup.runtime.Symbol)CUP$parser$stack.elementAt(CUP$parser$top-1)).left;
		int aeright = ((java_cup.runtime.Symbol)CUP$parser$stack.elementAt(CUP$parser$top-1)).right;
		AssignNode ae = (AssignNode)((java_cup.runtime.Symbol) CUP$parser$stack.elementAt(CUP$parser$top-1)).value;
		 RESULT = new AssignStmtNode(ae); 
		
              CUP$parser$result = new java_cup.runtime.Symbol(12/*stmt*/, ((java_cup.runtime.Symbol)CUP$parser$stack.elementAt(CUP$parser$top-1)).left, ((java_cup.runtime.Symbol)CUP$parser$stack.elementAt(CUP$parser$top-0)).right, RESULT);
            }
          return CUP$parser$result;

          /*. . . . . . . . . . . . . . . . . . . .*/
          case 21: // stmtList ::= 
            {
              LinkedList RESULT = null;
		 RESULT = new LinkedList<StmtNode>();
		
              CUP$parser$result = new java_cup.runtime.Symbol(11/*stmtList*/, ((java_cup.runtime.Symbol)CUP$parser$stack.elementAt(CUP$parser$top-0)).right, ((java_cup.runtime.Symbol)CUP$parser$stack.elementAt(CUP$parser$top-0)).right, RESULT);
            }
          return CUP$parser$result;

          /*. . . . . . . . . . . . . . . . . . . .*/
          case 20: // stmtList ::= stmtList stmt 
            {
              LinkedList RESULT = null;
		int slleft = ((java_cup.runtime.Symbol)CUP$parser$stack.elementAt(CUP$parser$top-1)).left;
		int slright = ((java_cup.runtime.Symbol)CUP$parser$stack.elementAt(CUP$parser$top-1)).right;
		LinkedList sl = (LinkedList)((java_cup.runtime.Symbol) CUP$parser$stack.elementAt(CUP$parser$top-1)).value;
		int sleft = ((java_cup.runtime.Symbol)CUP$parser$stack.elementAt(CUP$parser$top-0)).left;
		int sright = ((java_cup.runtime.Symbol)CUP$parser$stack.elementAt(CUP$parser$top-0)).right;
		StmtNode s = (StmtNode)((java_cup.runtime.Symbol) CUP$parser$stack.elementAt(CUP$parser$top-0)).value;
		 sl.addLast(s);
		   RESULT = sl;
		
              CUP$parser$result = new java_cup.runtime.Symbol(11/*stmtList*/, ((java_cup.runtime.Symbol)CUP$parser$stack.elementAt(CUP$parser$top-1)).left, ((java_cup.runtime.Symbol)CUP$parser$stack.elementAt(CUP$parser$top-0)).right, RESULT);
            }
          return CUP$parser$result;

          /*. . . . . . . . . . . . . . . . . . . .*/
          case 19: // strLit ::= STRINGLITERAL 
            {
              StringLitNode RESULT = null;
		int sleft = ((java_cup.runtime.Symbol)CUP$parser$stack.elementAt(CUP$parser$top-0)).left;
		int sright = ((java_cup.runtime.Symbol)CUP$parser$stack.elementAt(CUP$parser$top-0)).right;
		StrLitTokenVal s = (StrLitTokenVal)((java_cup.runtime.Symbol) CUP$parser$stack.elementAt(CUP$parser$top-0)).value;
		 RESULT = new StringLitNode(s.linenum, s.charnum, s.strVal);
		
              CUP$parser$result = new java_cup.runtime.Symbol(15/*strLit*/, ((java_cup.runtime.Symbol)CUP$parser$stack.elementAt(CUP$parser$top-0)).left, ((java_cup.runtime.Symbol)CUP$parser$stack.elementAt(CUP$parser$top-0)).right, RESULT);
            }
          return CUP$parser$result;

          /*. . . . . . . . . . . . . . . . . . . .*/
          case 18: // dblLit ::= DBLLITERAL 
            {
              DblLitNode RESULT = null;
		int dleft = ((java_cup.runtime.Symbol)CUP$parser$stack.elementAt(CUP$parser$top-0)).left;
		int dright = ((java_cup.runtime.Symbol)CUP$parser$stack.elementAt(CUP$parser$top-0)).right;
		DblLitTokenVal d = (DblLitTokenVal)((java_cup.runtime.Symbol) CUP$parser$stack.elementAt(CUP$parser$top-0)).value;
		 RESULT = new DblLitNode(d.linenum, d.charnum, d.dblVal);
		
              CUP$parser$result = new java_cup.runtime.Symbol(14/*dblLit*/, ((java_cup.runtime.Symbol)CUP$parser$stack.elementAt(CUP$parser$top-0)).left, ((java_cup.runtime.Symbol)CUP$parser$stack.elementAt(CUP$parser$top-0)).right, RESULT);
            }
          return CUP$parser$result;

          /*. . . . . . . . . . . . . . . . . . . .*/
          case 17: // intLit ::= INTLITERAL 
            {
              IntLitNode RESULT = null;
		int ileft = ((java_cup.runtime.Symbol)CUP$parser$stack.elementAt(CUP$parser$top-0)).left;
		int iright = ((java_cup.runtime.Symbol)CUP$parser$stack.elementAt(CUP$parser$top-0)).right;
		IntLitTokenVal i = (IntLitTokenVal)((java_cup.runtime.Symbol) CUP$parser$stack.elementAt(CUP$parser$top-0)).value;
		 RESULT = new IntLitNode(i.linenum, i.charnum, i.intVal);
		
              CUP$parser$result = new java_cup.runtime.Symbol(13/*intLit*/, ((java_cup.runtime.Symbol)CUP$parser$stack.elementAt(CUP$parser$top-0)).left, ((java_cup.runtime.Symbol)CUP$parser$stack.elementAt(CUP$parser$top-0)).right, RESULT);
            }
          return CUP$parser$result;

          /*. . . . . . . . . . . . . . . . . . . .*/
          case 16: // id ::= ID 
            {
              IdNode RESULT = null;
		int ileft = ((java_cup.runtime.Symbol)CUP$parser$stack.elementAt(CUP$parser$top-0)).left;
		int iright = ((java_cup.runtime.Symbol)CUP$parser$stack.elementAt(CUP$parser$top-0)).right;
		IdTokenVal i = (IdTokenVal)((java_cup.runtime.Symbol) CUP$parser$stack.elementAt(CUP$parser$top-0)).value;
		 RESULT = new IdNode(i.linenum, i.charnum, i.idVal);
		
              CUP$parser$result = new java_cup.runtime.Symbol(6/*id*/, ((java_cup.runtime.Symbol)CUP$parser$stack.elementAt(CUP$parser$top-0)).left, ((java_cup.runtime.Symbol)CUP$parser$stack.elementAt(CUP$parser$top-0)).right, RESULT);
            }
          return CUP$parser$result;

          /*. . . . . . . . . . . . . . . . . . . .*/
          case 15: // type ::= VOID 
            {
              TypeNode RESULT = null;
		 RESULT = new VoidNode();
		
              CUP$parser$result = new java_cup.runtime.Symbol(5/*type*/, ((java_cup.runtime.Symbol)CUP$parser$stack.elementAt(CUP$parser$top-0)).left, ((java_cup.runtime.Symbol)CUP$parser$stack.elementAt(CUP$parser$top-0)).right, RESULT);
            }
          return CUP$parser$result;

          /*. . . . . . . . . . . . . . . . . . . .*/
          case 14: // type ::= DBL 
            {
              TypeNode RESULT = null;
		 RESULT = new DblNode();
		
              CUP$parser$result = new java_cup.runtime.Symbol(5/*type*/, ((java_cup.runtime.Symbol)CUP$parser$stack.elementAt(CUP$parser$top-0)).left, ((java_cup.runtime.Symbol)CUP$parser$stack.elementAt(CUP$parser$top-0)).right, RESULT);
            }
          return CUP$parser$result;

          /*. . . . . . . . . . . . . . . . . . . .*/
          case 13: // type ::= INT 
            {
              TypeNode RESULT = null;
		 RESULT = new IntNode();
		
              CUP$parser$result = new java_cup.runtime.Symbol(5/*type*/, ((java_cup.runtime.Symbol)CUP$parser$stack.elementAt(CUP$parser$top-0)).left, ((java_cup.runtime.Symbol)CUP$parser$stack.elementAt(CUP$parser$top-0)).right, RESULT);
            }
          return CUP$parser$result;

          /*. . . . . . . . . . . . . . . . . . . .*/
          case 12: // varDecl ::= type id SEMICOLON 
            {
              VarDeclNode RESULT = null;
		int tleft = ((java_cup.runtime.Symbol)CUP$parser$stack.elementAt(CUP$parser$top-2)).left;
		int tright = ((java_cup.runtime.Symbol)CUP$parser$stack.elementAt(CUP$parser$top-2)).right;
		TypeNode t = (TypeNode)((java_cup.runtime.Symbol) CUP$parser$stack.elementAt(CUP$parser$top-2)).value;
		int ileft = ((java_cup.runtime.Symbol)CUP$parser$stack.elementAt(CUP$parser$top-1)).left;
		int iright = ((java_cup.runtime.Symbol)CUP$parser$stack.elementAt(CUP$parser$top-1)).right;
		IdNode i = (IdNode)((java_cup.runtime.Symbol) CUP$parser$stack.elementAt(CUP$parser$top-1)).value;
		 RESULT = new VarDeclNode(t, i);
		
              CUP$parser$result = new java_cup.runtime.Symbol(4/*varDecl*/, ((java_cup.runtime.Symbol)CUP$parser$stack.elementAt(CUP$parser$top-2)).left, ((java_cup.runtime.Symbol)CUP$parser$stack.elementAt(CUP$parser$top-0)).right, RESULT);
            }
          return CUP$parser$result;

          /*. . . . . . . . . . . . . . . . . . . .*/
          case 11: // formalDecl ::= type id 
            {
              FormalDeclNode RESULT = null;
		int tleft = ((java_cup.runtime.Symbol)CUP$parser$stack.elementAt(CUP$parser$top-1)).left;
		int tright = ((java_cup.runtime.Symbol)CUP$parser$stack.elementAt(CUP$parser$top-1)).right;
		TypeNode t = (TypeNode)((java_cup.runtime.Symbol) CUP$parser$stack.elementAt(CUP$parser$top-1)).value;
		int ileft = ((java_cup.runtime.Symbol)CUP$parser$stack.elementAt(CUP$parser$top-0)).left;
		int iright = ((java_cup.runtime.Symbol)CUP$parser$stack.elementAt(CUP$parser$top-0)).right;
		IdNode i = (IdNode)((java_cup.runtime.Symbol) CUP$parser$stack.elementAt(CUP$parser$top-0)).value;
		 RESULT = new FormalDeclNode(t, i);
		
              CUP$parser$result = new java_cup.runtime.Symbol(8/*formalDecl*/, ((java_cup.runtime.Symbol)CUP$parser$stack.elementAt(CUP$parser$top-1)).left, ((java_cup.runtime.Symbol)CUP$parser$stack.elementAt(CUP$parser$top-0)).right, RESULT);
            }
          return CUP$parser$result;

          /*. . . . . . . . . . . . . . . . . . . .*/
          case 10: // formalsList ::= 
            {
              LinkedList RESULT = null;
		 RESULT = new LinkedList<FormalDeclNode>();
		
              CUP$parser$result = new java_cup.runtime.Symbol(7/*formalsList*/, ((java_cup.runtime.Symbol)CUP$parser$stack.elementAt(CUP$parser$top-0)).right, ((java_cup.runtime.Symbol)CUP$parser$stack.elementAt(CUP$parser$top-0)).right, RESULT);
            }
          return CUP$parser$result;

          /*. . . . . . . . . . . . . . . . . . . .*/
          case 9: // formalsList ::= formalDecl 
            {
              LinkedList RESULT = null;
		int dleft = ((java_cup.runtime.Symbol)CUP$parser$stack.elementAt(CUP$parser$top-0)).left;
		int dright = ((java_cup.runtime.Symbol)CUP$parser$stack.elementAt(CUP$parser$top-0)).right;
		FormalDeclNode d = (FormalDeclNode)((java_cup.runtime.Symbol) CUP$parser$stack.elementAt(CUP$parser$top-0)).value;
		 RESULT = new LinkedList<FormalDeclNode>();
		   RESULT.add(d);
		
              CUP$parser$result = new java_cup.runtime.Symbol(7/*formalsList*/, ((java_cup.runtime.Symbol)CUP$parser$stack.elementAt(CUP$parser$top-0)).left, ((java_cup.runtime.Symbol)CUP$parser$stack.elementAt(CUP$parser$top-0)).right, RESULT);
            }
          return CUP$parser$result;

          /*. . . . . . . . . . . . . . . . . . . .*/
          case 8: // formalsList ::= formalsList COMMA formalDecl 
            {
              LinkedList RESULT = null;
		int flleft = ((java_cup.runtime.Symbol)CUP$parser$stack.elementAt(CUP$parser$top-2)).left;
		int flright = ((java_cup.runtime.Symbol)CUP$parser$stack.elementAt(CUP$parser$top-2)).right;
		LinkedList fl = (LinkedList)((java_cup.runtime.Symbol) CUP$parser$stack.elementAt(CUP$parser$top-2)).value;
		int dleft = ((java_cup.runtime.Symbol)CUP$parser$stack.elementAt(CUP$parser$top-0)).left;
		int dright = ((java_cup.runtime.Symbol)CUP$parser$stack.elementAt(CUP$parser$top-0)).right;
		FormalDeclNode d = (FormalDeclNode)((java_cup.runtime.Symbol) CUP$parser$stack.elementAt(CUP$parser$top-0)).value;
		 fl.addLast(d);
		   RESULT = fl;
		
              CUP$parser$result = new java_cup.runtime.Symbol(7/*formalsList*/, ((java_cup.runtime.Symbol)CUP$parser$stack.elementAt(CUP$parser$top-2)).left, ((java_cup.runtime.Symbol)CUP$parser$stack.elementAt(CUP$parser$top-0)).right, RESULT);
            }
          return CUP$parser$result;

          /*. . . . . . . . . . . . . . . . . . . .*/
          case 7: // fnBody ::= declList stmtList 
            {
              FnBodyNode RESULT = null;
		int dlleft = ((java_cup.runtime.Symbol)CUP$parser$stack.elementAt(CUP$parser$top-1)).left;
		int dlright = ((java_cup.runtime.Symbol)CUP$parser$stack.elementAt(CUP$parser$top-1)).right;
		LinkedList dl = (LinkedList)((java_cup.runtime.Symbol) CUP$parser$stack.elementAt(CUP$parser$top-1)).value;
		int slleft = ((java_cup.runtime.Symbol)CUP$parser$stack.elementAt(CUP$parser$top-0)).left;
		int slright = ((java_cup.runtime.Symbol)CUP$parser$stack.elementAt(CUP$parser$top-0)).right;
		LinkedList sl = (LinkedList)((java_cup.runtime.Symbol) CUP$parser$stack.elementAt(CUP$parser$top-0)).value;
		 RESULT = new FnBodyNode(new DeclListNode(dl), new StmtListNode(sl));
		
              CUP$parser$result = new java_cup.runtime.Symbol(10/*fnBody*/, ((java_cup.runtime.Symbol)CUP$parser$stack.elementAt(CUP$parser$top-1)).left, ((java_cup.runtime.Symbol)CUP$parser$stack.elementAt(CUP$parser$top-0)).right, RESULT);
            }
          return CUP$parser$result;

          /*. . . . . . . . . . . . . . . . . . . .*/
          case 6: // fnDecl ::= type id LPAREN formalsList RPAREN LCURLY fnBody RCURLY 
            {
              FnDeclNode RESULT = null;
		int tleft = ((java_cup.runtime.Symbol)CUP$parser$stack.elementAt(CUP$parser$top-7)).left;
		int tright = ((java_cup.runtime.Symbol)CUP$parser$stack.elementAt(CUP$parser$top-7)).right;
		TypeNode t = (TypeNode)((java_cup.runtime.Symbol) CUP$parser$stack.elementAt(CUP$parser$top-7)).value;
		int ileft = ((java_cup.runtime.Symbol)CUP$parser$stack.elementAt(CUP$parser$top-6)).left;
		int iright = ((java_cup.runtime.Symbol)CUP$parser$stack.elementAt(CUP$parser$top-6)).right;
		IdNode i = (IdNode)((java_cup.runtime.Symbol) CUP$parser$stack.elementAt(CUP$parser$top-6)).value;
		int flleft = ((java_cup.runtime.Symbol)CUP$parser$stack.elementAt(CUP$parser$top-4)).left;
		int flright = ((java_cup.runtime.Symbol)CUP$parser$stack.elementAt(CUP$parser$top-4)).right;
		LinkedList fl = (LinkedList)((java_cup.runtime.Symbol) CUP$parser$stack.elementAt(CUP$parser$top-4)).value;
		int fbleft = ((java_cup.runtime.Symbol)CUP$parser$stack.elementAt(CUP$parser$top-1)).left;
		int fbright = ((java_cup.runtime.Symbol)CUP$parser$stack.elementAt(CUP$parser$top-1)).right;
		FnBodyNode fb = (FnBodyNode)((java_cup.runtime.Symbol) CUP$parser$stack.elementAt(CUP$parser$top-1)).value;
		 RESULT = new FnDeclNode(t, i, new FormalsListNode(fl), fb);
		
              CUP$parser$result = new java_cup.runtime.Symbol(9/*fnDecl*/, ((java_cup.runtime.Symbol)CUP$parser$stack.elementAt(CUP$parser$top-7)).left, ((java_cup.runtime.Symbol)CUP$parser$stack.elementAt(CUP$parser$top-0)).right, RESULT);
            }
          return CUP$parser$result;

          /*. . . . . . . . . . . . . . . . . . . .*/
          case 5: // decl ::= fnDecl 
            {
              DeclNode RESULT = null;
		int vleft = ((java_cup.runtime.Symbol)CUP$parser$stack.elementAt(CUP$parser$top-0)).left;
		int vright = ((java_cup.runtime.Symbol)CUP$parser$stack.elementAt(CUP$parser$top-0)).right;
		FnDeclNode v = (FnDeclNode)((java_cup.runtime.Symbol) CUP$parser$stack.elementAt(CUP$parser$top-0)).value;
		 RESULT = v;
		
              CUP$parser$result = new java_cup.runtime.Symbol(3/*decl*/, ((java_cup.runtime.Symbol)CUP$parser$stack.elementAt(CUP$parser$top-0)).left, ((java_cup.runtime.Symbol)CUP$parser$stack.elementAt(CUP$parser$top-0)).right, RESULT);
            }
          return CUP$parser$result;

          /*. . . . . . . . . . . . . . . . . . . .*/
          case 4: // decl ::= varDecl 
            {
              DeclNode RESULT = null;
		int vleft = ((java_cup.runtime.Symbol)CUP$parser$stack.elementAt(CUP$parser$top-0)).left;
		int vright = ((java_cup.runtime.Symbol)CUP$parser$stack.elementAt(CUP$parser$top-0)).right;
		VarDeclNode v = (VarDeclNode)((java_cup.runtime.Symbol) CUP$parser$stack.elementAt(CUP$parser$top-0)).value;
		 RESULT = v;
		
              CUP$parser$result = new java_cup.runtime.Symbol(3/*decl*/, ((java_cup.runtime.Symbol)CUP$parser$stack.elementAt(CUP$parser$top-0)).left, ((java_cup.runtime.Symbol)CUP$parser$stack.elementAt(CUP$parser$top-0)).right, RESULT);
            }
          return CUP$parser$result;

          /*. . . . . . . . . . . . . . . . . . . .*/
          case 3: // declList ::= 
            {
              LinkedList RESULT = null;
		 RESULT = new LinkedList<DeclNode>();
		
              CUP$parser$result = new java_cup.runtime.Symbol(2/*declList*/, ((java_cup.runtime.Symbol)CUP$parser$stack.elementAt(CUP$parser$top-0)).right, ((java_cup.runtime.Symbol)CUP$parser$stack.elementAt(CUP$parser$top-0)).right, RESULT);
            }
          return CUP$parser$result;

          /*. . . . . . . . . . . . . . . . . . . .*/
          case 2: // declList ::= declList decl 
            {
              LinkedList RESULT = null;
		int dlleft = ((java_cup.runtime.Symbol)CUP$parser$stack.elementAt(CUP$parser$top-1)).left;
		int dlright = ((java_cup.runtime.Symbol)CUP$parser$stack.elementAt(CUP$parser$top-1)).right;
		LinkedList dl = (LinkedList)((java_cup.runtime.Symbol) CUP$parser$stack.elementAt(CUP$parser$top-1)).value;
		int dleft = ((java_cup.runtime.Symbol)CUP$parser$stack.elementAt(CUP$parser$top-0)).left;
		int dright = ((java_cup.runtime.Symbol)CUP$parser$stack.elementAt(CUP$parser$top-0)).right;
		DeclNode d = (DeclNode)((java_cup.runtime.Symbol) CUP$parser$stack.elementAt(CUP$parser$top-0)).value;
		 dl.addLast(d);
		   RESULT = dl;
		
              CUP$parser$result = new java_cup.runtime.Symbol(2/*declList*/, ((java_cup.runtime.Symbol)CUP$parser$stack.elementAt(CUP$parser$top-1)).left, ((java_cup.runtime.Symbol)CUP$parser$stack.elementAt(CUP$parser$top-0)).right, RESULT);
            }
          return CUP$parser$result;

          /*. . . . . . . . . . . . . . . . . . . .*/
          case 1: // program ::= declList 
            {
              ProgramNode RESULT = null;
		int dleft = ((java_cup.runtime.Symbol)CUP$parser$stack.elementAt(CUP$parser$top-0)).left;
		int dright = ((java_cup.runtime.Symbol)CUP$parser$stack.elementAt(CUP$parser$top-0)).right;
		LinkedList d = (LinkedList)((java_cup.runtime.Symbol) CUP$parser$stack.elementAt(CUP$parser$top-0)).value;
		 RESULT = new ProgramNode(new DeclListNode(d));
		
              CUP$parser$result = new java_cup.runtime.Symbol(1/*program*/, ((java_cup.runtime.Symbol)CUP$parser$stack.elementAt(CUP$parser$top-0)).left, ((java_cup.runtime.Symbol)CUP$parser$stack.elementAt(CUP$parser$top-0)).right, RESULT);
            }
          return CUP$parser$result;

          /*. . . . . . . . . . . . . . . . . . . .*/
          case 0: // $START ::= program EOF 
            {
              Object RESULT = null;
		int start_valleft = ((java_cup.runtime.Symbol)CUP$parser$stack.elementAt(CUP$parser$top-1)).left;
		int start_valright = ((java_cup.runtime.Symbol)CUP$parser$stack.elementAt(CUP$parser$top-1)).right;
		ProgramNode start_val = (ProgramNode)((java_cup.runtime.Symbol) CUP$parser$stack.elementAt(CUP$parser$top-1)).value;
		RESULT = start_val;
              CUP$parser$result = new java_cup.runtime.Symbol(0/*$START*/, ((java_cup.runtime.Symbol)CUP$parser$stack.elementAt(CUP$parser$top-1)).left, ((java_cup.runtime.Symbol)CUP$parser$stack.elementAt(CUP$parser$top-0)).right, RESULT);
            }
          /* ACCEPT */
          CUP$parser$parser.done_parsing();
          return CUP$parser$result;

          /* . . . . . .*/
          default:
            throw new Exception(
               "Invalid action number found in internal parse table");

        }
    }
}

