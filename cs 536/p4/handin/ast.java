import java.io.*;
import java.util.*;

/* Ben West */

// **********************************************************************
// The ASTnode class defines the nodes of the abstract-syntax tree that
// represents a Little program.
//
// Internal nodes of the tree contain pointers to children, organized
// either in a list (for nodes that may have a variable number of children)
// or as a fixed set of fields.
//
// The nodes for literals and ids contain line and character number
// information; for string literals and identifiers, they also contain a
// string; for integer literals, they also contain an integer value.
//
// Here are all the different kinds of AST nodes and what kinds of children
// they have.  All of these kinds of AST nodes are subclasses of "ASTnode".
// Indentation indicates further subclassing:
//
//     Subclass            Kids
//     --------            ----
//     ProgramNode         DeclListNode
//     DeclListNode        list of DeclNode
//     DeclNode:
//       VarDeclNode       TypeNode, IdNode
//       FnDeclNode        TypeNode, IdNode, FormalsListNode, FnBodyNode
//       FormalDeclNode    TypeNode, IdNode
//     FormalsListNode     list of FormalDeclNode
//     FnBodyNode          DeclListNode, StmtListNode
//     StmtListNode        list of StmtNode
//     ExpListNode         list of ExpNode
//
//     TypeNode:
//       IntNode           -- none --
//       DblNode           -- none --
//       VoidNode          -- none --
//
//     StmtNode:
//       AssignStmtNode      AssignNode
//       PreIncStmtNode      IdNode
//       PreDecStmtNode      IdNode
//       PostIncStmtNode     IdNode
//       PostDecStmtNode     IdNode
//       ReadIntStmtNode     IdNode
//       ReadDblStmtNode     IdNode
//       WriteIntStmtNode    ExpNode
//       WriteDblStmtNode    ExpNode
//       WriteStrStmtNode    ExpNode
//       IfStmtNode          ExpNode, DeclListNode, StmtListNode
//       IfElseStmtNode      ExpNode, DeclListNode, StmtListNode,
//                                    DeclListNode, StmtListNode
//       WhileStmtNode       ExpNode, DeclListNode, StmtListNode
//       CallStmtNode        CallExpNode
//       ReturnStmtNode      ExpNode
//
//     ExpNode:
//       IntLitNode          -- none --
//       DblLitNode          -- none --
//       StringLitNode       -- none --
//       IdNode              -- none --
//       CallExpNode         IdNode, ExpListNode
//       UnaryExpNode        ExpNode
//         UnaryMinusNode
//         NotNode
//       BinaryExpNode       ExpNode, ExpNode
//         AssignNode
//         PlusNode     
//         MinusNode
//         TimesNode
//         DivideNode
//         PlusPlusNode
//         MinusMinusNode
//         AndNode
//         OrNode
//         EqualsNode
//         NotEqualsNode
//         LessNode
//         GreaterNode
//         LessEqNode
//         GreaterEqNode
//
// Here are the different kinds of AST nodes again, organized according to
// whether they are leaves, internal nodes with lists of kids, or internal
// nodes with a fixed number of kids:
//
// (1) Leaf nodes:
//        IntNode,   DblNode,  VoidNode,  IntLitNode,  DblLitNode, StringLitNode,
//        IdNode
//
// (2) Internal nodes with (possibly empty) lists of children:
//        DeclListNode, FormalsListNode, StmtListNode, ExpListNode
//
// (3) Internal nodes with fixed numbers of kids:
//       ProgramNode,      VarDeclNode,     FnDeclNode,       FormalDeclNode,
//       FnBodyNode,       TypeNode,        AssignStmtNode,
//       PreIncStmtNode,   PreDecStmtNode,  PostIncStmtNode,  PostDecStmtNode,
//       ReadIntStmtNode,  ReadDblStmtNode, WriteIntStmtNode, WriteDblStmtNode
//       WriteStrStmtNode  IfStmtNode,      IfElseStmtNode,   WhileStmtNode,
//       CallStmtNode,     ReturnStmtNode,  CallExpNode,
//       UnaryExpNode,     BinaryExpNode,   UnaryMinusNode, NotNode,
//       AssignNode,       PlusNode,        MinusNode,      TimesNode,
//       DivideNode,       PlusPlusNode,    MinusMinusNode, AndNode,
//       OrNode,           EqualsNode,      NotEqualsNode,  LessNode,        
//       GreaterNode,      LessEqNode,      GreaterEqNode
//
// **********************************************************************

// **********************************************************************
// ASTnode class (base class for all other kinds of nodes)
// **********************************************************************
abstract class ASTnode { 
    // every subclass must provide an unparse operation
    abstract public void unparse(PrintWriter p, int indent);

    // this method can be used by the unparse methods to do indenting
    protected void doIndent(PrintWriter p, int indent) {
	for (int k=0; k<indent; k++) p.print(" ");
    }
}

interface SymTabNode {
    // Inheriting this indicates that this node needs a symbol table.
    // Depending on the node type, it will either provide this table
    // to its children verbatim, or push a new table onto the stack.
    // Leaf nodes will just add symbols to whatever table's on the top of the stack
    abstract public void provideSymTab(SymTab table);
}

// **********************************************************************
// ProgramNode,  DeclListNode, FormalsListNode, FnBodyNode,
// StmtListNode, ExpListNode
// **********************************************************************
class ProgramNode extends ASTnode implements SymTabNode {
    public ProgramNode(DeclListNode L) {
	myDeclList = L;
    }

    public void unparse(PrintWriter p, int indent) {
	myDeclList.unparse(p, indent);
    }

    public void provideSymTab(SymTab table) {
    	myDeclList.provideSymTab(table);
    }

    // 1 kid
    private DeclListNode myDeclList;
}

class DeclListNode extends ASTnode implements SymTabNode {
    public DeclListNode(List<DeclNode> L) {
	myDecls = L;
    }

    // ** unparse **
    public void unparse(PrintWriter p, int indent) {
	try {
	    for (DeclNode oneDecl : myDecls) {
		oneDecl.unparse(p, indent);
	    }
	} catch (NoSuchElementException ex) {
	    System.err.println("unexpected NoSuchElementException in DeclListNode.unparse");
	    System.exit(-1);
	}
    }
    public void provideSymTab(SymTab table) {
	// handle variable declarations first, because the
	// stuff inside functions can depend on the global
	// function declarations. Then we add the function declarations
	// to the sym tab. Finally, we recurse and add the conents of
	// the functions into the table
		for (DeclNode oneDecl : myDecls) {
		    if (oneDecl instanceof VarDeclNode){
			oneDecl.provideSymTab(table);
		    }
		}
		for (DeclNode oneDecl : myDecls) {
		    if (oneDecl instanceof FnDeclNode){
			FnDeclNode fnDec = (FnDeclNode) oneDecl;
			fnDec.putFnInTable(table);
		    }
		}
		for (DeclNode oneDecl : myDecls) {
		    if (oneDecl instanceof FnDeclNode){
			oneDecl.provideSymTab(table);
		    }
		}
    }

    // list of kids (DeclNodes)
    private List<DeclNode> myDecls;
}

// FormalsList is the parameters to a function
class FormalsListNode extends ASTnode  implements SymTabNode {
    public FormalsListNode(List<FormalDeclNode> L) {
	myFormals = L;
    }

    // ** unparse **
    public void unparse(PrintWriter p, int indent) {
		Iterator<FormalDeclNode> it = myFormals.iterator();
		while(it.hasNext()){
		    FormalDeclNode n = it.next();
		    n.unparse(p, indent);
		    if(it.hasNext()){
			p.print(", ");
		    }
		}
    }

    public void provideSymTab(SymTab table) {
		for (FormalDeclNode oneDecl : myFormals) {
		    oneDecl.provideSymTab(table);
		}
    }

    public List<TypeNode> getTypes(){
	List<TypeNode> types = new ArrayList<TypeNode>();
	for (FormalDeclNode node : myFormals){
	    types.add(node.getType());
	}
	return types;
    }

    // list of kids (FormalDeclNodes)
    private List<FormalDeclNode> myFormals;
}

class FnBodyNode extends ASTnode implements SymTabNode {
    public FnBodyNode(DeclListNode declList, StmtListNode stmtList) {
	myDeclList = declList;
	myStmtList = stmtList;
    }

    // ** unparse **
    public void unparse(PrintWriter p, int indent) {
	myDeclList.unparse(p, indent);
	myStmtList.unparse(p, indent);
    }

    public void provideSymTab(SymTab table) {
	myDeclList.provideSymTab(table);
	myStmtList.provideSymTab(table);
    }

    // 2 kids
    private DeclListNode myDeclList;
    private StmtListNode myStmtList;
}

class StmtListNode extends ASTnode implements SymTabNode {
    public StmtListNode(List<StmtNode> L) {
	myStmts = L;
    }

    // ** unparse **
    public void unparse(PrintWriter p, int indent) {
	Iterator<StmtNode> it = myStmts.iterator();
	while(it.hasNext()){
	    it.next().unparse(p, indent);
	}
    }

    public void provideSymTab(SymTab table) {
	for(StmtNode stmt : myStmts){
	    stmt.provideSymTab(table);
	}
    }


    // list of kids (StmtNodes)
    private List<StmtNode> myStmts;
}

class ExpListNode extends ASTnode implements SymTabNode {
    public ExpListNode(List<ExpNode> L) {
	myExps = L;
    }

    // ** unparse **
    public void unparse(PrintWriter p, int indent) {
	doIndent(p, indent);
	Iterator<ExpNode> it = myExps.iterator();
	while(it.hasNext()){
	    it.next().unparse(p, 0);
	    if(it.hasNext()){
		p.print(", ");
	    }
	}

    }

    public void provideSymTab(SymTab table){
	for(ExpNode node : myExps){
	    node.provideSymTab(table);
	}
    }

    // list of kids (ExpNodes)
    private List<ExpNode> myExps;
}

// **********************************************************************
// DeclNode and its subclasses
// **********************************************************************
abstract class DeclNode extends ASTnode implements SymTabNode {
}

class VarDeclNode extends DeclNode {
    public VarDeclNode(TypeNode type, IdNode id) {
    	myType = type;
		myId = id;
		id.setSym(new Sym(type.getTypeName()));
    }

    // ** unparse **
    public void unparse(PrintWriter p, int indent) {
	doIndent(p, indent);
	myType.unparse(p, 0);
	p.print(" ");
	myId.unparseNoType(p, 0);
	p.println(";");
    }
    
    public void provideSymTab(SymTab table) {
		if(myId.getSym().getType().equals("void")) {
			Errors.fatal(myId.getLine(), myId.getCharNum(), "Non-function declared void");
		}

		try {
			table.insert(myId.getName(), myId.getSym());
		} catch (DuplicateException e) {
			Errors.fatal(myId.getLine(), myId.getCharNum(), "Multiply declared identifier");
		} catch (EmptySymTabException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    }

    // 2 kids
    private TypeNode myType;
    private IdNode myId;
}

class FnDeclNode extends DeclNode {
    public FnDeclNode(TypeNode type,
		      IdNode id,
		      FormalsListNode formalList,
		      FnBodyNode body) {
	myType = type;
	myId = id;
	myFormalsList = formalList;
	myBody = body;
    }

    // ** unparse **
    public void unparse(PrintWriter p, int indent) {
		doIndent(p, indent);
		myType.unparse(p, 0);
		p.print(" ");
		myId.unparseNoType(p, 0);
		p.print("(");
		myFormalsList.unparse(p, 0);
		p.print(") {");
		p.println();
		myBody.unparse(p, indent+1);
		p.println("}");
    }
    
    public void putFnInTable(SymTab table){
	String params = "";
	Boolean first = true;
	for(TypeNode tn : myFormalsList.getTypes()){
	    if(!first) { params += ", ";}
	    else { first = false; }
	    params += tn.getTypeName();
	}
	params += " -> " + myType.getTypeName();
	mySym = new Sym(params);
	try {
	    table.insert(myId.getName(), mySym);
	} catch (DuplicateException e){
	    Errors.errors = true;
	    Errors.fatal(myId.getLine(), myId.getCharNum(), "Multiply declared identifier");
	} catch (EmptySymTabException e){
	    System.out.println(e.toString());
	}
	myId.setSym(mySym);
    }

    public void provideSymTab(SymTab table) {
    	table.addMap();
	myFormalsList.provideSymTab(table);
	myBody.provideSymTab(table);

	try { table.removeMap(); }
	catch (Exception e) { System.out.println(e.toString()); }

    }
    
    // 4 kids
    private TypeNode myType;
    private IdNode myId;
    private FormalsListNode myFormalsList;
    private FnBodyNode myBody;
    private Sym mySym;
}

class FormalDeclNode extends DeclNode {
    public FormalDeclNode(TypeNode type, IdNode id) {
	myType = type;
	myId = id;
	id.setSym(new Sym(type.getTypeName()));
    }

    // ** unparse **
    public void unparse(PrintWriter p, int indent) {
		doIndent(p, indent);
		myType.unparse(p, 0);
		p.print(" ");
		myId.unparseNoType(p, 0);
    }
    
    public void provideSymTab(SymTab table) {
	if(myId.getSym().getType().equals("void")) {
	    Errors.fatal(myId.getLine(), myId.getCharNum(), "Non-function declared void");
	}

	try {
	    table.insert(myId.getName(), myId.getSym());
	} catch (DuplicateException e) {
	    Errors.fatal(myId.getLine(), myId.getCharNum(), "Multiply declared identifier");
	} catch (EmptySymTabException e) {
	    // TODO Auto-generated catch block
	    e.printStackTrace();
	}
    }

    public TypeNode getType(){
	return myType;
    }

    // 2 kids
    private TypeNode myType;
    private IdNode myId;
}

// **********************************************************************
// TypeNode and its Subclasses
// **********************************************************************
abstract class TypeNode extends ASTnode {
	abstract public String getTypeName();
}

class IntNode extends TypeNode {
    public IntNode() {
    }

    // ** unparse **
    public void unparse(PrintWriter p, int indent) {
	p.print("int");
    }
	public String getTypeName(){
		return "int";
	}
}

class DblNode extends TypeNode {
    public DblNode() {
    }

    // ** unparse **
    public void unparse(PrintWriter p, int indent) {
	p.print("double");
    }
	public String getTypeName(){
		return "double";
	}
}

class VoidNode extends TypeNode {
    public VoidNode() {
    }

    // ** unparse **
    public void unparse(PrintWriter p, int indent) {
    	p.print("void");
    }
    
	public String getTypeName(){
		return "void";
	}
}


// **********************************************************************
// StmtNode and its subclasses
// **********************************************************************

abstract class StmtNode extends ASTnode implements SymTabNode {
}

class AssignStmtNode extends StmtNode {
    public AssignStmtNode(AssignNode e) {
	myExp = e;
    }

    public void unparse(PrintWriter p, int indent) {
	myExp.unparseNoParens(p, indent);
	p.println(";");
    }

    public void provideSymTab(SymTab table){
	        myExp.provideSymTab(table);
    }

    // 1 kid
    private AssignNode myExp;
}

class PreIncStmtNode extends StmtNode {
    public PreIncStmtNode(IdNode id) {
	myId = id;
    }

    public void unparse(PrintWriter p, int indent) {
	doIndent(p, indent);
	p.print("++");
	myId.unparse(p, 0);
	p.println(";");
    }

    public void provideSymTab(SymTab table){
	myId.provideSymTab(table);
    }

    // 1 kid
    private IdNode myId;
}

class PreDecStmtNode extends StmtNode {
    public PreDecStmtNode(IdNode id) {
	myId = id;
    }

    public void unparse(PrintWriter p, int indent) {
	doIndent(p, indent);
	p.print("--");
	myId.unparse(p, 0);
	p.println(";");
    }

    public void provideSymTab(SymTab table){
	myId.provideSymTab(table);
    }

    // 1 kid
    private IdNode myId;
}

class PostIncStmtNode extends StmtNode {
    public PostIncStmtNode(IdNode id) {
	myId = id;
    }

    public void unparse(PrintWriter p, int indent) {
	doIndent(p, indent);
	myId.unparse(p, 0);
	p.print("++");
	p.println(";");
    }

    public void provideSymTab(SymTab table){
	myId.provideSymTab(table);
    }

    // 1 kid
    private IdNode myId;
}

class PostDecStmtNode extends StmtNode {
    public PostDecStmtNode(IdNode id) {
	myId = id;
    }

    public void unparse(PrintWriter p, int indent) {
	doIndent(p, indent);
	myId.unparse(p, 0);
	p.print("--");
	p.println(";");
    }

    public void provideSymTab(SymTab table){
	myId.provideSymTab(table);
    }

    // 1 kid
    private IdNode myId;
}

class ReadIntStmtNode extends StmtNode {
    public ReadIntStmtNode(IdNode id) {
	myId = id;
    }

    public void unparse(PrintWriter p, int indent) {
	doIndent(p, indent);
	p.print("scanf(\"%d\", &");
	myId.unparse(p, 0);
	p.print(")");
	p.println(";");
    }

    public void provideSymTab(SymTab table){
	myId.provideSymTab(table);
    }

    // 1 kid
    private IdNode myId;
}

class ReadDblStmtNode extends StmtNode {
    public ReadDblStmtNode(IdNode id) {
	myId = id;
    }

    public void unparse(PrintWriter p, int indent) {
	doIndent(p, indent);
	p.print("scanf(\"%f\", &");
	myId.unparse(p, 0);
	p.print(")");
	p.println(";");
    }

    public void provideSymTab(SymTab table){
	myId.provideSymTab(table);
    }

    // 1 kid
    private IdNode myId;
}

class WriteIntStmtNode extends StmtNode {
    public WriteIntStmtNode(ExpNode exp) {
	myExp = exp;
    }

    // ** unparse **
    public void unparse(PrintWriter p, int indent) {
	doIndent(p, indent);
	p.print("printf(\"%d\", ");
	myExp.unparse(p, 0);
	p.print(")");
	p.println(";");
    }

    public void provideSymTab(SymTab table){
	myExp.provideSymTab(table);
    }

    // 1 kid
    private ExpNode myExp;
}

class WriteDblStmtNode extends StmtNode {
    public WriteDblStmtNode(ExpNode exp) {
	myExp = exp;
    }

    // ** unparse **
    public void unparse(PrintWriter p, int indent) {
	doIndent(p, indent);
	p.print("printf(\"%f\", ");
	myExp.unparse(p, 0);
	p.print(")");
	p.println(";");
    }

    public void provideSymTab(SymTab table){
	myExp.provideSymTab(table);
    }

    // 1 kid
    private ExpNode myExp;
}

class WriteStrStmtNode extends StmtNode {
    public WriteStrStmtNode(ExpNode exp) {
	myExp = exp;
    }

    // ** unparse **
    public void unparse(PrintWriter p, int indent) {
	doIndent(p, indent);
	p.print("printf(");
	myExp.unparse(p, 0);
	p.print(")");
	p.println(";");
    }

    public void provideSymTab(SymTab table){
	myExp.provideSymTab(table);
    }

    // 1 kid
    private ExpNode myExp;
}

class IfStmtNode extends StmtNode {
    public IfStmtNode(ExpNode exp, DeclListNode dlist, StmtListNode slist) {
	myDeclList = dlist;
	myExp = exp;
	myStmtList = slist;
    }

    // ** unparse **
    public void unparse(PrintWriter p, int indent) {
 	doIndent(p, indent);
	p.print("if( ");
	myExp.unparse(p, 0);
	p.println(") {");
	myDeclList.unparse(p, indent + 1);
	myStmtList.unparse(p, indent + 1);
	doIndent(p, indent);
	p.println("}");
    }

    public void provideSymTab(SymTab table){
	table.addMap();
	myExp.provideSymTab(table);
	myDeclList.provideSymTab(table);
	myStmtList.provideSymTab(table);
	try { table.removeMap(); }
	catch (EmptySymTabException e){
	    System.err.println(e.toString());
	}
    }
    // 3 kids
    private ExpNode myExp;
    private DeclListNode myDeclList;
    private StmtListNode myStmtList;
}

class IfElseStmtNode extends StmtNode {
    public IfElseStmtNode(ExpNode exp, DeclListNode dlist1,
			  StmtListNode slist1, DeclListNode dlist2,
			  StmtListNode slist2) {
	myExp = exp;
	myThenDeclList = dlist1;
	myThenStmtList = slist1;
	myElseDeclList = dlist2;
	myElseStmtList = slist2;
    }

    // ** unparse **
    public void unparse(PrintWriter p, int indent) {
 	doIndent(p, indent);
	p.print("if( ");
	myExp.unparse(p, 0);
	p.println(") {");
	myThenDeclList.unparse(p, indent + 1);
	myThenStmtList.unparse(p, indent + 1);
	doIndent(p, indent);
	p.println("}");
	doIndent(p, indent);
	p.println("else {");
	myElseDeclList.unparse(p, indent + 1);
	myElseStmtList.unparse(p, indent + 1);
	doIndent(p, indent);
	p.println("}");
    }

    public void provideSymTab(SymTab table){
	table.addMap();
	myExp.provideSymTab(table);
	myThenDeclList.provideSymTab(table);
	myThenStmtList.provideSymTab(table);
	try { table.removeMap(); }
	catch (EmptySymTabException e){
	    System.err.println(e.toString());
	}

	table.addMap();
	myElseDeclList.provideSymTab(table);
	myElseStmtList.provideSymTab(table);
	try { table.removeMap(); }
	catch (EmptySymTabException e){
	    System.err.println(e.toString());
	}
    }

    // 5 kids
    private ExpNode myExp;
    private DeclListNode myThenDeclList;
    private StmtListNode myThenStmtList;
    private StmtListNode myElseStmtList;
    private DeclListNode myElseDeclList;
}

class WhileStmtNode extends StmtNode {
    public WhileStmtNode(ExpNode exp, DeclListNode dlist, StmtListNode slist) {
	myExp = exp;
	myDeclList = dlist;
	myStmtList = slist;
    }
    // ** unparse **
    public void unparse(PrintWriter p, int indent) {
 	doIndent(p, indent);
	p.print("while( ");
	myExp.unparse(p, 0);
	p.println(") {");
	myDeclList.unparse(p, indent + 1);
	myStmtList.unparse(p, indent + 1);
	doIndent(p, indent);
	p.println("}");
    }

    public void provideSymTab(SymTab table){
	table.addMap();
	myExp.provideSymTab(table);
	myDeclList.provideSymTab(table);
	myStmtList.provideSymTab(table);
	try { table.removeMap(); }
	catch (EmptySymTabException e){
	    System.err.println(e.toString());
	}
    }
    // 3 kids
    private ExpNode myExp;
    private DeclListNode myDeclList;
    private StmtListNode myStmtList;
}

class CallStmtNode extends StmtNode {
    public CallStmtNode(CallExpNode call) {
	myCall = call;
    }

    // ** unparse **
    public void unparse(PrintWriter p, int indent) {
	doIndent(p, indent);
	myCall.unparse(p, 0);
	p.println(";");
    }

    public void provideSymTab(SymTab table){
	myCall.provideSymTab(table);
    }

    // 1 kid
    private CallExpNode myCall;
}

class ReturnStmtNode extends StmtNode {
    public ReturnStmtNode(ExpNode exp) {
	myExp = exp;
    }

    // ** unparse **
    public void unparse(PrintWriter p, int indent) {
	doIndent(p, indent);
	p.print("return ");
	if(myExp != null) { myExp.unparse(p, 0); }
	p.println(";");
    }

    public void provideSymTab(SymTab table){
	// returns can be null
	if(myExp != null) { myExp.provideSymTab(table);}
    }
    

    // 1 kid
    private ExpNode myExp;
}

// **********************************************************************
// ExpNode and its subclasses
// **********************************************************************

abstract class ExpNode extends ASTnode implements SymTabNode {
    public void provideSymTab(SymTab table){
	// In a lot of cases, we don't need to do anything here
    }
}

class IntLitNode extends ExpNode {
    public IntLitNode(int lineNum, int charNum, int intVal) {
	myLineNum = lineNum;
	myCharNum = charNum;
	myIntVal = intVal;
    }

    // ** unparse **
    public void unparse(PrintWriter p, int indent) {
	p.print(Integer.toString(myIntVal));
    }

    private int myLineNum;
    private int myCharNum;
    private int myIntVal;
}

class DblLitNode extends ExpNode {
    public DblLitNode(int lineNum, int charNum, double dblVal) {
	myLineNum = lineNum;
	myCharNum = charNum;
	myDblVal = dblVal;
    }

    // ** unparse **
    public void unparse(PrintWriter p, int indent) {
	p.print(Double.toString(myDblVal));
    }

    private int myLineNum;
    private int myCharNum;
    private double myDblVal;
}

class StringLitNode extends ExpNode {
    public StringLitNode(int lineNum, int charNum, String strVal) {
	myLineNum = lineNum;
	myCharNum = charNum;
	myStrVal = strVal;
    }

    // ** unparse **
    public void unparse(PrintWriter p, int indent) {
	p.print(myStrVal);
    }

    private int myLineNum;
    private int myCharNum;
    private String myStrVal;
}

class IdNode extends ExpNode {
    public IdNode(int lineNum, int charNum, String strVal) {
	myLineNum = lineNum;
	myCharNum = charNum;
	myStrVal = strVal;
	//mySymVal = 
    }

    // ** unparse **
    public void unparse(PrintWriter p, int indent) {
	doIndent(p, indent);
	p.print(myStrVal);
	if(mySymVal == null){
	    Errors.fatal(myLineNum, myCharNum, "Undeclared identifier");
	} else {
	    p.print("(" + mySymVal.getType() + ")");
	}
    }
    
    public void unparseNoType(PrintWriter p, int indent){
	doIndent(p, indent);
	p.print(myStrVal);
    }

    public String getName(){
    	return myStrVal;
    }
    
    public Sym getSym(){
    	return mySymVal;
    }
    
    public void setSym(Sym val){
    	mySymVal = val;
    }
    
    public int getLine(){
    	return myLineNum;
    }
    
    public int getCharNum(){
    	return myCharNum;
    }

    public void provideSymTab(SymTab table){
	if(mySymVal == null){
	    mySymVal = table.globalLookup(myStrVal);
	    if(mySymVal == null){
		Errors.fatal(myLineNum, myCharNum, "Undeclared identifier");
	    }
	}
    }

    // fields
    private int myLineNum;
    private int myCharNum;
    private String myStrVal;
    private Sym mySymVal;
}

class CallExpNode extends ExpNode {
    public CallExpNode(IdNode name, ExpListNode elist) {
	myId = name;
	myExpList = elist;
    }

    // ** unparse **
    public void unparse(PrintWriter p, int indent) {
	doIndent(p, indent);
	myId.unparse(p, 0);
	p.print("(");
	myExpList.unparse(p, 0);
	p.print(")");
    }

    public void provideSymTab(SymTab table){
	myId.provideSymTab(table);
	myExpList.provideSymTab(table);
    }

    // 2 kids
    private IdNode myId;
    private ExpListNode myExpList;
}

abstract class UnaryExpNode extends ExpNode {
    public UnaryExpNode(ExpNode exp) {
	myExp = exp;
    }

    public void provideSymTab(SymTab table){
	myExp.provideSymTab(table);
    }

    // one kid
    protected ExpNode myExp;
}

abstract class BinaryExpNode extends ExpNode {
    public BinaryExpNode(ExpNode exp1, ExpNode exp2) {
	myExp1 = exp1;
	myExp2 = exp2;
    }

    public void provideSymTab(SymTab table){
	myExp1.provideSymTab(table);
	myExp2.provideSymTab(table);
    }

    // two kids
    protected ExpNode myExp1;
    protected ExpNode myExp2;
}

// **********************************************************************
// Subclasses of UnaryExpNode
// **********************************************************************

class PlusPlusNode extends UnaryExpNode {
    public PlusPlusNode(ExpNode exp) {
	super(exp);
    }

    // ** unparse **
    public void unparse(PrintWriter p, int indent) {
	doIndent(p, indent);
	p.print("(");
	myExp.unparse(p, 0);
	p.print("++)");
    }
}

class MinusMinusNode extends UnaryExpNode {
    public MinusMinusNode(ExpNode exp) {
	super(exp);
    }

    // ** unparse **
    public void unparse(PrintWriter p, int indent) {
	doIndent(p, indent);
	p.print("(");
	myExp.unparse(p, 0);
	p.print("--)");
    }
}

class UnaryMinusNode extends UnaryExpNode {
    public UnaryMinusNode(ExpNode exp) {
	super(exp);
    }

    // ** unparse **
    public void unparse(PrintWriter p, int indent) {
	doIndent(p, indent);
	p.print("(-");
	myExp.unparse(p, 0);
	p.print(")");
    }
}

class NotNode extends UnaryExpNode {
    public NotNode(ExpNode exp) {
	super(exp);
    }

    // ** unparse **
    public void unparse(PrintWriter p, int indent) {
	doIndent(p, indent);
	p.print("(!");
	myExp.unparse(p, 0);
	p.print(")");
    }
}

// **********************************************************************
// Subclasses of BinaryExpNode
// **********************************************************************

class AssignNode extends ExpNode {
    public AssignNode(ExpNode lhs, ExpNode exp) {
	myLhs = lhs;
	myExp = exp;
    }

    // ** unparse **
    //
    // Two versions: One called from the unparse method of
    // AssignStmtNode -- do NOT enclose this assignment in parens;
    // The other called whenever this assignment really is an
    // expression, not a stmt, so DO enclose this assignment in
    // parens.
    
    public void unparse(PrintWriter p, int indent) {
	p.print("(");
	myLhs.unparse(p, 0);
	p.print(" = ");
	myExp.unparse(p, 0);
	p.print(")");
    }

    public void unparseNoParens(PrintWriter p, int indent) {
	doIndent(p, indent);
	myLhs.unparse(p, 0);
	p.print(" = ");
	myExp.unparse(p, 0);		
    }
    public void provideSymTab(SymTab table){
	myLhs.provideSymTab(table);
	myExp.provideSymTab(table);
    }
    // 2 kids
    private ExpNode myLhs;
    private ExpNode myExp;
}

class PlusNode extends BinaryExpNode {
    public PlusNode(ExpNode exp1, ExpNode exp2) {
	super(exp1, exp2);
    }

    // ** unparse **
    public void unparse(PrintWriter p, int indent) {
	doIndent(p, indent);
	p.print("(");
	myExp1.unparse(p, 0);
	p.print(" + ");
	myExp2.unparse(p, 0);
	p.print(")");
    }
}

class MinusNode extends BinaryExpNode {
    public MinusNode(ExpNode exp1, ExpNode exp2) {
	super(exp1, exp2);
    }

    // ** unparse **
    public void unparse(PrintWriter p, int indent) {
	doIndent(p, indent);
	p.print("(");
	myExp1.unparse(p, 0);
	p.print(" - ");
	myExp2.unparse(p, 0);
	p.print(")");
    }
}

class TimesNode extends BinaryExpNode {
    public TimesNode(ExpNode exp1, ExpNode exp2) {
	super(exp1, exp2);
    }

    // ** unparse **
    public void unparse(PrintWriter p, int indent) {
	doIndent(p, indent);
	p.print("(");
	myExp1.unparse(p, 0);
	p.print(" * ");
	myExp2.unparse(p, 0);
	p.print(")");
    }
}

class DivideNode extends BinaryExpNode {
    public DivideNode(ExpNode exp1, ExpNode exp2) {
	super(exp1, exp2);
    }

    // ** unparse **
    public void unparse(PrintWriter p, int indent) {
	doIndent(p, indent);
	p.print("(");
	myExp1.unparse(p, 0);
	p.print(" / ");
	myExp2.unparse(p, 0);
	p.print(")");
    }
}

class AndNode extends BinaryExpNode {
    public AndNode(ExpNode exp1, ExpNode exp2) {
	super(exp1, exp2);
    }

    // ** unparse **
    public void unparse(PrintWriter p, int indent) {
	doIndent(p, indent);
	p.print("(");
	myExp1.unparse(p, 0);
	p.print(" && ");
	myExp2.unparse(p, 0);
	p.print(")");
    }
}

class OrNode extends BinaryExpNode {
    public OrNode(ExpNode exp1, ExpNode exp2) {
	super(exp1, exp2);
    }

    // ** unparse **
    public void unparse(PrintWriter p, int indent) {
	doIndent(p, indent);
	p.print("(");
	myExp1.unparse(p, 0);
	p.print(" || ");
	myExp2.unparse(p, 0);
	p.print(")");
    }
}

class EqualsNode extends BinaryExpNode {
    public EqualsNode(ExpNode exp1, ExpNode exp2) {
	super(exp1, exp2);
    }

    // ** unparse **
    public void unparse(PrintWriter p, int indent) {
	doIndent(p, indent);
	p.print("(");
	myExp1.unparse(p, 0);
	p.print(" == ");
	myExp2.unparse(p, 0);
	p.print(")");
    }
}

class NotEqualsNode extends BinaryExpNode {
    public NotEqualsNode(ExpNode exp1, ExpNode exp2) {
	super(exp1, exp2);
    }

    // ** unparse **
    public void unparse(PrintWriter p, int indent) {
	doIndent(p, indent);
	p.print("(");
	myExp1.unparse(p, 0);
	p.print(" != ");
	myExp2.unparse(p, 0);
	p.print(")");
    }
}

class LessNode extends BinaryExpNode {
    public LessNode(ExpNode exp1, ExpNode exp2) {
	super(exp1, exp2);
    }

    // ** unparse **
    public void unparse(PrintWriter p, int indent) {
	doIndent(p, indent);
	p.print("(");
	myExp1.unparse(p, 0);
	p.print(" < ");
	myExp2.unparse(p, 0);
	p.print(")");
    }
}

class GreaterNode extends BinaryExpNode {
    public GreaterNode(ExpNode exp1, ExpNode exp2) {
	super(exp1, exp2);
    }

    // ** unparse **
    public void unparse(PrintWriter p, int indent) {
	doIndent(p, indent);
	p.print("(");
	myExp1.unparse(p, 0);
	p.print(" > ");
	myExp2.unparse(p, 0);
	p.print(")");
    }
}

class LessEqNode extends BinaryExpNode {
    public LessEqNode(ExpNode exp1, ExpNode exp2) {
	super(exp1, exp2);
    }

    // ** unparse **
    public void unparse(PrintWriter p, int indent) {
	doIndent(p, indent);
	p.print("(");
	myExp1.unparse(p, 0);
	p.print(" <= ");
	myExp2.unparse(p, 0);
	p.print(")");
    }
}

class GreaterEqNode extends BinaryExpNode {
    public GreaterEqNode(ExpNode exp1, ExpNode exp2) {
	super(exp1, exp2);
    }

    // ** unparse **
    public void unparse(PrintWriter p, int indent) {
	doIndent(p, indent);
	p.print("(");
	myExp1.unparse(p, 0);
	p.print(" >= ");
	myExp2.unparse(p, 0);
	p.print(")");
    }
}

