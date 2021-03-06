import java.io.*;
import java.util.*;

// Ben West
// Project 5

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
//       VarDeclNode       TypeNode, IdNode, int
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
//         PlusPlusNode
//         MinusMinusNode
//       BinaryExpNode       ExpNode, ExpNode
//         AssignNode
//         PlusNode     
//         MinusNode
//         TimesNode
//         DivideNode
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
    protected static final boolean DEBUG = false;

    // every subclass must provide an unparse operation
    abstract public void unparse(PrintWriter p, int indent);

    abstract public void checkTypes(String returnType);

    // this method can be used by the unparse methods to do indenting
    protected void doIndent(PrintWriter p, int indent) {
	for (int k=0; k<indent; k++) p.print(" ");
    }
}

// **********************************************************************
// ProgramNode,  DeclListNode, FormalsListNode, FnBodyNode,
// StmtListNode, ExpListNode
// **********************************************************************
class ProgramNode extends ASTnode {
    public ProgramNode(DeclListNode L) {
	myDeclList = L;
    }

    /** processNames
     *
     * create an empty symbol table for the outermost scope, then
     * process all of the globals and functions in the program
     **/
    public void processNames() {
	SymTab S = new SymTab();
	myDeclList.processNames(S);
    }

    public void unparse(PrintWriter p, int indent) {
	myDeclList.unparse(p, indent);
    }
    
    public void checkTypes(String returnType){
	myDeclList.checkTypes(returnType);
    }

    // 1 kid
    private DeclListNode myDeclList;
}

class DeclListNode extends ASTnode {
    public DeclListNode(List<DeclNode> L) {
	myDecls = L;
    }

    /** processNames
     *
     * given: a symbol table S
     * do:    process all of the decls in the list
     **/
    public void processNames(SymTab S) {
	Iterator it = myDecls.iterator();
	try {
	    while (it.hasNext()) {
		((DeclNode)it.next()).processNames(S);
	    }
	} catch (NoSuchElementException ex) {
	    System.err.println("unexpected NoSuchElementException in DeclListNode.processNames");
	    System.exit(-1);
	}
	
    }

    // ** unparse **
    public void unparse(PrintWriter p, int indent) {
	Iterator it = myDecls.iterator();
	try {
	    while (it.hasNext()) {
		((DeclNode)it.next()).unparse(p, indent);
	    }
	} catch (NoSuchElementException ex) {
	    System.err.println("unexpected NoSuchElementException in DeclListNode.unparse");
	    System.exit(-1);
	}
    }
    
    public void checkTypes(String returnType){
	for(DeclNode node : myDecls){
	    node.checkTypes(returnType);
	}
    }

    // list of kids (DeclNodes)
    private List<DeclNode> myDecls;
}

class FormalsListNode extends ASTnode {
    public FormalsListNode(List<FormalDeclNode> L) {
	myFormals = L;
    }

    /** processNames
     *
     * given: a symbol table S
     * do:    process all of the formals in the list
     **/
    public LinkedList<Sym> processNames(SymTab S) {
	LinkedList<Sym> L = new LinkedList<Sym>();
	Iterator it = myFormals.iterator();
	try {
	    for (FormalDeclNode oneDecl : myFormals) {
		Sym sym = oneDecl.processNames(S);
		if (sym != null) L.add(sym);
	    }
	} catch (NoSuchElementException ex) {
	    System.err.println("unexpected NoSuchElementException in FormalsListNode.processNames");
	    System.exit(-1);
	}
	return L;
    }

    /** length **/
    public int length() {
	return myFormals.size();
    }

    // ** unparse **
    public void unparse(PrintWriter p, int indent) {
	Iterator it = myFormals.iterator();
	try {
	    while (it.hasNext()) {
		((FormalDeclNode)it.next()).unparse(p, indent);
		if (it.hasNext()) {
		    p.print(", ");
		}
	    }
	} catch (NoSuchElementException ex) {
	    System.err.println("unexpected NoSuchElementException in FormalsListNode.unparse");
	    System.exit(-1);
	}
    }
    
    public void checkTypes(String returnType){
	for(FormalDeclNode node : myFormals){
	    node.checkTypes(returnType);
	}
    }

    // list of kids (FormalDeclNodes)
    private List<FormalDeclNode> myFormals;
}

class FnBodyNode extends ASTnode {
    public FnBodyNode(DeclListNode declList, StmtListNode stmtList) {
	myDeclList = declList;
	myStmtList = stmtList;
    }

    /** processNames **/
    public void processNames(SymTab S) {
	myDeclList.processNames(S);
	myStmtList.processNames(S);
    }

    // ** unparse **
    public void unparse(PrintWriter p, int indent) {
	if (myDeclList != null) myDeclList.unparse(p, indent+2);
	if (myStmtList != null) myStmtList.unparse(p, indent+2);
    }

    
    public void checkTypes(String returnType){
	myDeclList.checkTypes(returnType);
	myStmtList.checkTypes(returnType);
    }

    // 2 kids
    private DeclListNode myDeclList;
    private StmtListNode myStmtList;
}

class StmtListNode extends ASTnode {
    public StmtListNode(List<StmtNode> L) {
	myStmts = L;
    }

    /** processNames **/
    public void processNames(SymTab S) {
	Iterator it = myStmts.iterator();
	try {
	    while (it.hasNext()) {
		((StmtNode)it.next()).processNames(S);
	    }
	} catch (NoSuchElementException ex) {
	    System.err.println("unexpected NoSuchElementException in StmtListNode.processNames");
	    System.exit(-1);
	}
    }

    // ** unparse **
    public void unparse(PrintWriter p, int indent) {
	// indent for each stmt is done here
	// each stmt is expected to end with a newline
	Iterator it = myStmts.iterator();
	try {
	    while (it.hasNext()) {
		doIndent(p, indent);
		((StmtNode)it.next()).unparse(p, indent);
	    }
	} catch (NoSuchElementException ex) {
	    System.err.println("unexpected NoSuchElementException in StmtListNode.unparse");
	    System.exit(-1);
	}
    }

    public void checkTypes(String returnType){
	for(StmtNode node : myStmts){
	    node.checkTypes(returnType);
	}
    }

    // list of kids (StmtNodes)
    private List<StmtNode> myStmts;
}

class ExpListNode extends ASTnode {
    public ExpListNode(List<ExpNode> L) {
	myExps = L;
    }

    /** processNames **/
    public void processNames(SymTab S) {
	Iterator it = myExps.iterator();
	try {
	    while (it.hasNext()) {
		((ExpNode)it.next()).processNames(S);
	    }
	} catch (NoSuchElementException ex) {
	    System.err.println("unexpected NoSuchElementException in ExpListNode.processNames");
	    System.exit(-1);
	}
    }

    /** length **/
    public int length() {
	return myExps.size();
    }

    // ** unparse **
    public void unparse(PrintWriter p, int indent) {
	Iterator it = myExps.iterator();
	try {
	    while (it.hasNext()) {
		((ExpNode)it.next()).unparse(p, 0);
		if (it.hasNext()) {
		    p.print(", ");
		}
	    }
	} catch (NoSuchElementException ex) {
	    System.err.println("unexpected NoSuchElementException in ExpListNode.unparse");
	    System.exit(-1);
	}
    }

    public void checkTypes(String returnType){
	for(ExpNode node : myExps){
	    node.checkTypes(returnType);
	}
    }

    public List<ExpNode> expressions() {
	return myExps;
    }

    // list of kids (ExpNodes)
    private List<ExpNode> myExps;
}

// **********************************************************************
// DeclNode and its subclasses
// **********************************************************************
abstract class DeclNode extends ASTnode {
    // note: only a formal decl needs to return a Sym
    //       but since we must declare the method here,
    //       we make all decl nodes return something
    //       (for non formal decls, the returned value
   //       is simply ignored)
    abstract public Sym processNames(SymTab S);

    // var/formal decls don't need to do anything, so default
    // to doing nothing
    public void checkTypes(String returnType) {}
}

class VarDeclNode extends DeclNode {
    public VarDeclNode(TypeNode type, IdNode id) {
	myType = type;
	myId = id;
    }

    /** processNames
     *
     * given: a symbol table
     * do: if this name is declared void, error!
     *     if this name has already been declared in this scope, error!
     *     if no error, add name to local symbol table
     **/
    public Sym processNames(SymTab S) {
	String name = myId.name();
	boolean badDecl = false;
	if (myType.type().equals("void")) {
	    Errors.fatal(myId.linenum(), myId.charnum(),
			 "Non-function declared void");
	    badDecl = true;
	}
	if (S.localLookup(name) != null) {
	    Errors.fatal(myId.linenum(), myId.charnum(),
			 "Multiply declared identifier");
	    badDecl = true;
	}
	if (! badDecl) {
	    try {
		Sym sym = new Sym(name, myType.type());
		S.insert(name, sym);
	    } catch (DuplicateException ex) {
		System.err.println("unexpected DuplicateException in VarDeclNode.processNames");
		System.exit(-1);
	    } catch (EmptySymTabException ex) {
		System.err.println("unexpected EmptySymTabException in VarDeclNode.processNames");
		System.exit(-1);
	    }
	}
	return null;  // return value ignored
    }

    // ** unparse **
    public void unparse(PrintWriter p, int indent) {
	doIndent(p, indent);
	myType.unparse(p, 0);
	p.print(" ");
	myId.unparse(p, 0);
	p.println(";");
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

    /** processNames
     *
     * given: a symbol table S
     * do:    If this name has already been declared in this scope
     *        then error
     *        else add name to local symbol table.
     *        In any case:
     *             enter new scope
     *             process formals
     *             if this fn not multiply decld
     *                update symtab entry with types of formals
     *             process body
     *             exit scope
     **/
    public Sym processNames(SymTab S) {
	String name = myId.name();
	FnSym sym = null;
	if (S.localLookup(name) != null) {
	    Errors.fatal(myId.linenum(), myId.charnum(),
			 "Multiply declared identifier");
	}
	else {
	    try {
		sym = new FnSym(name, myType.type(),
				myFormalsList.length());
		S.insert(name, sym);
	    } catch (DuplicateException ex) {
		System.err.println("unexpected DuplicateException in FnDeclNode.processNames");
		System.exit(-1);
	    } catch (EmptySymTabException ex) {
		System.err.println("unexpected EmptySymTabException in FnDeclNode.processNames");
		System.exit(-1);
	    }
	}
	S.addMap();
	LinkedList<Sym> L = myFormalsList.processNames(S);
	if (sym != null) sym.addFormals(L);
	myBody.processNames(S);
	try {
	    S.removeMap();
	} catch (EmptySymTabException ex) {
		System.err.println("unexpected EmptySymTabException in FnDeclNode.processNames");
		System.exit(-1);
	    }
	return null;
    }

    // ** unparse **
    public void unparse(PrintWriter p, int indent) {
	p.println();
	doIndent(p, indent);
	myType.unparse(p, 0);
	p.print(" ");
	myId.unparse(p, 0);
	p.print("(");
	if (myFormalsList != null) myFormalsList.unparse(p, 0);
	p.println(") {");
	if (myBody != null) myBody.unparse(p, indent);
	doIndent(p, indent);
	p.println("}");
    }

    public void checkTypes(String returnType){
	myType.checkTypes(returnType);
	myBody.checkTypes(myType.type());
	myFormalsList.checkTypes(myType.type());
    }

    // 4 kids
    private TypeNode myType;
    private IdNode myId;
    private FormalsListNode myFormalsList;
    private FnBodyNode myBody;
}

class FormalDeclNode extends DeclNode {
    public FormalDeclNode(TypeNode type, IdNode id) {
	myType = type;
	myId = id;
    }

    /** processNames
     *
     * given: a symbol table S
     * do:    if this formal is declared void, error!
     *        else if this formal is multiply declared
     *        then give an error msg and return null
     *        else add a new entry to S and also return that Sym
     **/
    public Sym processNames(SymTab S) {
	String name = myId.name();
	boolean badDecl = false;
	Sym sym = null;
	if (myType.type().equals("void")) {
	    Errors.fatal(myId.linenum(), myId.charnum(),
			 "Non-function declared void");
	    badDecl = true;
	}
	if (S.localLookup(name) != null) {
	    Errors.fatal(myId.linenum(), myId.charnum(),
			 "Multiply declared identifier");
	    badDecl = true;
	}
	if (! badDecl) {
	    try {
		sym = new Sym(name, myType.type());
		S.insert(name, sym);
	    } catch (DuplicateException ex) {
		System.err.println("unexpected DuplicateException in FormalDeclNode.processNames");
		System.exit(-1);
	    } catch (EmptySymTabException ex) {
		System.err.println("unexpected EmptySymTabException in FormalDeclNode.processNames");
		System.exit(-1);
	    }
	}
	return sym;
    }

    // ** unparse **
    public void unparse(PrintWriter p, int indent) {
	doIndent(p, indent);
	myType.unparse(p, indent);
	p.print(" ");
	myId.unparse(p, indent);
    }

    // 2 kids
    private TypeNode myType;
    private IdNode myId;
}

// **********************************************************************
// TypeNode and its Subclasses
// **********************************************************************
abstract class TypeNode extends ASTnode {
    /* all subclasses must provide a type method */
    abstract public String type();

    // Hopefully types have the correct type...
    public void checkTypes(String returnType) {}
}

class IntNode extends TypeNode {
    public IntNode() {
    }

    /** type **/
    public String type() {
	return "int";
    }

    // ** unparse **
    public void unparse(PrintWriter p, int indent) {
	p.print("int");
    }
}

class DblNode extends TypeNode {
    public DblNode() {
    }

    /** type **/
    public String type() {
	return "double";
    }

    // ** unparse **
    public void unparse(PrintWriter p, int indent) {
	p.print("double");
    }
}

class VoidNode extends TypeNode {
    public VoidNode() {
    }

    public String type() {
	return "void";
    }

    // ** unparse **
    public void unparse(PrintWriter p, int indent) {
	p.print("void");
    }
}

// **********************************************************************
// StmtNode and its subclasses
// **********************************************************************

abstract class StmtNode extends ASTnode {
    abstract public void processNames(SymTab S);
    abstract public void checkTypes(String returnType);
}

class AssignStmtNode extends StmtNode {
    public AssignStmtNode(AssignNode e) {
	myExp = e;
    }

    /** processNames **/
    public void processNames(SymTab S) {
	myExp.processNames(S);
    }

    public void unparse(PrintWriter p, int indent) {
	myExp.unparse(p,0,false);
	p.println(";");
    }

    public String type(){
	return myExp.type();
    }

    public void checkTypes(String returnType) {
	myExp.checkTypes(returnType);
    }

    // 1 kid
    private AssignNode myExp;
}

class PreIncStmtNode extends StmtNode {
    public PreIncStmtNode(IdNode id) {
	myId = id;
    }

    /** processNames **/
    public void processNames(SymTab S) {
	myId.processNames(S);
    }

    /** unparse **/
    public void unparse(PrintWriter p, int indent) {
	p.print("++");
	myId.unparse(p,0);
	p.println(";");
    }

    public String type(){
	return myId.type();
    }

    public void checkTypes(String returnType) {
	if(!myId.type().equals("int")) {
	    Errors.fatal(myId.linenum(), myId.charnum(), "Non-int identifier used with ++ or --");
	}
    }

    // 1 kid
    private IdNode myId;
}

class PreDecStmtNode extends StmtNode {
    public PreDecStmtNode(IdNode id) {
	myId = id;
    }

    /** processNames **/
    public void processNames(SymTab S) {
	myId.processNames(S);
    }

    /** unparse **/
    public void unparse(PrintWriter p, int indent) {
	p.print("--");
	myId.unparse(p,0);
	p.println(";");
    }

    public String type(){
	return myId.type();
    }

    public void checkTypes(String returnType) {
	if(!myId.type().equals("int")) {
	    Errors.fatal(myId.linenum(), myId.charnum(), "Non-int identifier used with ++ or --");
	}
    }

    // 1 kid
    private IdNode myId;
}

class PostIncStmtNode extends StmtNode {
    public PostIncStmtNode(IdNode id) {
	myId = id;
    }

    /** processNames **/
    public void processNames(SymTab S) {
	myId.processNames(S);
    }

    /** unparse **/
    public void unparse(PrintWriter p, int indent) {
	myId.unparse(p,0);
	p.println("++;");
    }

    public String type(){
	return myId.type();
    }

    public void checkTypes(String returnType) {
	if(!myId.type().equals("int")) {
	    Errors.fatal(myId.linenum(), myId.charnum(), "Non-int identifier used with ++ or --");
	}
    }

    // 1 kid
    private IdNode myId;
}

class PostDecStmtNode extends StmtNode {
    public PostDecStmtNode(IdNode id) {
	myId = id;
    }

    /** processNames **/
    public void processNames(SymTab S) {
	myId.processNames(S);
    }

    /** unparse **/
    public void unparse(PrintWriter p, int indent) {
	myId.unparse(p,0);
	p.println("--;");
    }

    public String type(){
	return myId.type();
    }

    public void checkTypes(String returnType) {
	if(!myId.type().equals("int")) {
	    Errors.fatal(myId.linenum(), myId.charnum(), "Non-int identifier used with ++ or --");
	}
    }

    // 1 kid
    private IdNode myId;
}

class ReadIntStmtNode extends StmtNode {
    public ReadIntStmtNode(IdNode id) {
	myId = id;
    }

    /** processNames **/
    public void processNames(SymTab S) {
	myId.processNames(S);
    }

    /** unparse **/
    public void unparse(PrintWriter p, int indent) {
	p.print("scanf(\"%d\", &");
	myId.unparse(p,0);
	p.println(");");
    }

    public void checkTypes(String returnType) {
	if(!myId.type().equals("int")) {
	    Errors.fatal(myId.linenum(), myId.charnum(), "Attempt to read a non-int id with an int format");
	}
    }

    // 1 kid
    private IdNode myId;
}

class ReadDblStmtNode extends StmtNode {
    public ReadDblStmtNode(IdNode id) {
	myId = id;
    }

    /** processNames **/
    public void processNames(SymTab S) {
	myId.processNames(S);
    }

    /** unparse **/
    public void unparse(PrintWriter p, int indent) {
	p.print("scanf(\"%f\", &");
	myId.unparse(p,0);
	p.println(");");
    }

    public void checkTypes(String returnType) {
	if(!myId.type().equals("double")) {
	    Errors.fatal(myId.linenum(), myId.charnum(), "Attempt to read a non-double id with a dbl format");
	}
    }

    // 1 kid
    private IdNode myId;
}

class WriteIntStmtNode extends StmtNode {
    public WriteIntStmtNode(ExpNode exp) {
	myExp = exp;
    }

    /** processNames **/
    public void processNames(SymTab S) {
	myExp.processNames(S);
    }

    // ** unparse **
    public void unparse(PrintWriter p, int indent) {
	p.print("printf(\"%d\", ");
	myExp.unparse(p,0);
	p.println(");");
    }

    public void checkTypes(String returnType) {
	myExp.checkTypes(returnType);

	if(myExp.type().equals("error")) {
	}else if(!myExp.type().equals("int")) {
	    Errors.fatal(myExp.linenum(), myExp.charnum(), "Attempt to write a non-int value with an int format");
	}
    }

    // 1 kid
    private ExpNode myExp;
}

class WriteDblStmtNode extends StmtNode {
    public WriteDblStmtNode(ExpNode exp) {
	myExp = exp;
    }

    /** processNames **/
    public void processNames(SymTab S) {
	myExp.processNames(S);
    }

    // ** unparse **
    public void unparse(PrintWriter p, int indent) {
	p.print("printf(\"%f\", ");
	myExp.unparse(p,0);
	p.println(");");
    }

    public void checkTypes(String returnType) {
	myExp.checkTypes(returnType);

	if(myExp.type().equals("error")) {
	}else if(!myExp.type().equals("double")) {
	    Errors.fatal(myExp.linenum(), myExp.charnum(), "Attempt to write a non-double value with a dbl format");
	}
    }

    // 1 kid
    private ExpNode myExp;
}

class WriteStrStmtNode extends StmtNode {
    public WriteStrStmtNode(ExpNode exp) {
	myExp = exp;
    }

    /** processNames **/
    public void processNames(SymTab S) {
	/* only a stringliteral is possible, so no need to typecheck */
    }

    // ** unparse **
    public void unparse(PrintWriter p, int indent) {
	p.print("printf(");
	myExp.unparse(p,0);
	p.println(");");
    }

    public void checkTypes(String returnType) {
	/* By virtue of our grammar myExp.type() == "string" */
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

    /** processNames
     *  
     *  process the condition, then enter scope; process decls & stmts;
     *  exit scope
     *
     **/
    public void processNames(SymTab S) {
	myExp.processNames(S);
	S.addMap();
	myDeclList.processNames(S);
	myStmtList.processNames(S);
	try {
	    S.removeMap();
	} catch (EmptySymTabException ex) {
		System.err.println("unexpected EmptySymTabException in IfStmtNode.processNames");
		System.exit(-1);
	    }
    }

    // ** unparse **
    public void unparse(PrintWriter p, int indent) {
	p.print("if (");
	myExp.unparse(p,0);
	p.println(") {");
	if (myDeclList != null) myDeclList.unparse(p,indent+2);
	if (myStmtList != null) myStmtList.unparse(p,indent+2);
	doIndent(p, indent);
	p.println("}");
    }

    public void checkTypes(String returnType) {
	if(!myExp.type().equals("int")){
	    Errors.fatal(myExp.linenum(), myExp.charnum(), "Non-int expression used as an if condition");
	}

	myExp.checkTypes(returnType);
	myDeclList.checkTypes(returnType);
	myStmtList.checkTypes(returnType);
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

    /** processNames
     *  
     *  process the condition, then enter scope; process decls & stmts
     *  in "then" part; then exit scope; enter scope; process decls &
     *  stmts in "else" part; exit scope
     *
     **/
    public void processNames(SymTab S) {
	myExp.processNames(S);
	S.addMap();
	myThenDeclList.processNames(S);
	myThenStmtList.processNames(S);
	try {
	    S.removeMap();
	} catch (EmptySymTabException ex) {
		System.err.println("unexpected EmptySymTabException in IfElseStmtNode.processNames");
		System.exit(-1);
	    }
	S.addMap();
	myElseDeclList.processNames(S);
	myElseStmtList.processNames(S);
	try {
	    S.removeMap();
	} catch (EmptySymTabException ex) {
		System.err.println("unexpected EmptySymTabException in IfElseStmtNode.processNames");
		System.exit(-1);
	    }
    }

    // ** unparse **
    public void unparse(PrintWriter p, int indent) {
	p.print("if (");
	myExp.unparse(p,0);
	p.println(") {");
	if (myThenDeclList != null) myThenDeclList.unparse(p,indent+2);
	if (myThenStmtList != null) myThenStmtList.unparse(p,indent+2);
	doIndent(p, indent);
	p.println("}");
	doIndent(p, indent);
	p.println("else {");
	if (myElseDeclList != null) myElseDeclList.unparse(p,indent+2);
	if (myElseStmtList != null) myElseStmtList.unparse(p,indent+2);
	doIndent(p, indent);
	p.println("}");
    }

    public void checkTypes(String returnType){

	if(!myExp.type().equals("int")){
	    Errors.fatal(myExp.linenum(), myExp.charnum(), "Non-int expression used as an if condition");
	}

	myExp.checkTypes(returnType);
	myThenDeclList.checkTypes(returnType);
	myThenStmtList.checkTypes(returnType);
	myElseStmtList.checkTypes(returnType);
	myElseDeclList.checkTypes(returnType);
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

    /** processNames
     *  
     *  process the condition, then enter scope; process decls & stmts;
     *  exit scope
     *
     **/
    public void processNames(SymTab S) {
	myExp.processNames(S);
	S.addMap();
	myDeclList.processNames(S);
	myStmtList.processNames(S);
	try {
	    S.removeMap();
	} catch (EmptySymTabException ex) {
		System.err.println("unexpected EmptySymTabException in WhileStmtNode.processNames");
		System.exit(-1);
	    }
    }

    // ** unparse **
    public void unparse(PrintWriter p, int indent) {
	p.print("while (");
	myExp.unparse(p,0);
	p.println(") {");
	if (myDeclList != null) myDeclList.unparse(p,indent+2);
	if (myStmtList != null) myStmtList.unparse(p,indent+2);
	doIndent(p, indent);
	p.println("}");
    }

    public void checkTypes(String returnType){
	myExp.checkTypes(returnType);
	myDeclList.checkTypes(returnType);
	myStmtList.checkTypes(returnType);

	if(!myExp.type().equals("int")){
	    Errors.fatal(myExp.linenum(), myExp.charnum(), "Non-int expression used as a while condition");
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

    /** processNames **/
    public void processNames(SymTab S) {
	myCall.processNames(S);
    }

    // ** unparse **
    public void unparse(PrintWriter p, int indent) {
	myCall.unparse(p,indent);
	p.println(";");
    }

    public void checkTypes(String returnType){
	myCall.checkTypes(returnType);
    }

    public String type() {
	return myCall.type();
    }

    // 1 kid
    private CallExpNode myCall;
}

class ReturnStmtNode extends StmtNode {
    public ReturnStmtNode(ExpNode exp) {
	myExp = exp;
    }

    /** processNames **/
    public void processNames(SymTab S) {
	if (myExp != null) myExp.processNames(S);
    }

    // ** unparse **
    public void unparse(PrintWriter p, int indent) {
	p.print("return");
	if (myExp != null) {
	    p.print(" ");
	    myExp.unparse(p,0);
	}
	p.println(";");
    }

    public void checkTypes(String returnType){
	if(myExp != null) {
	    myExp.checkTypes(returnType);	    
	}

	if(myExp == null && !returnType.equals("void")) { 
	    Errors.fatal(0, 0, "Missing return value");
	    return;
	}
	if(myExp != null && returnType.equals("void")) { 
	    Errors.fatal(myExp.linenum(), myExp.charnum(), "Return with a value in a void function");
	    return;
	}
	if(myExp != null) {
	    if(myExp.type().equals("error")) { return; }
	}
	if(myExp != null){
	    if(!returnType.equals(myExp.type()) && 
	       !(returnType.equals("double") && myExp.type().equals("int"))) { 
		Errors.fatal(myExp.linenum(), myExp.charnum(), "Bad return value");
	    } else if (returnType.equals("int") && myExp.type().equals("double")) {
		Errors.fatal(myExp.linenum(), myExp.charnum(), "Possible loss of precision");
	    }
	}
    }

    // 1 kid
    private ExpNode myExp;
}

// **********************************************************************
// ExpNode and its subclasses
// **********************************************************************

abstract class ExpNode extends ASTnode {
    // default version of processNames (for nodes with no names)
    public void processNames(SymTab S) {}

    abstract public int linenum();
    abstract public int charnum();
    abstract protected String typeInternal();
    protected Boolean isError = false;
    // Errors always have the special type of error
    public String type() {
	if(isError) { return "error"; }
	else { return typeInternal(); }
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
	p.print(myIntVal);
    }

    /** linenum **/
    public int linenum() {
	return myLineNum;
    }

    /** charnum **/
    public int charnum() {
	return myCharNum;
    }

    public void checkTypes(String returnType){}

    public String typeInternal() {
	return "int";
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
	p.print(myDblVal);
    }

    /** linenum **/
    public int linenum() {
	return myLineNum;
    }

    /** charnum **/
    public int charnum() {
	return myCharNum;
    }

    public void checkTypes(String returnType){}

    public String typeInternal() {
	return "double";
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

    /** linenum **/
    public int linenum() {
	return myLineNum;
    }

    /** charnum **/
    public int charnum() {
	return myCharNum;
    }

    public void checkTypes(String returnType){}

    private int myLineNum;
    private int myCharNum;
    private String myStrVal;
}

class IdNode extends ExpNode {
    public IdNode(int lineNum, int charNum, String strVal) {
	myLineNum = lineNum;
	myCharNum = charNum;
	myStrVal = strVal;
	mySym = null;
    }

    /** processNames
     *
     * check for use of an undeclared name
     * if OK, link to symtab entry
     *
     **/
    public void processNames(SymTab S) {
	Sym sym = S.globalLookup(myStrVal);
	if (sym  == null) {
	    Errors.fatal(myLineNum, myCharNum,
			 "Undeclared identifier");
	} else {
	    link(sym);
	}
    }

    /** link **/
    public void link(Sym sym) {
	mySym = sym;
    }

    // ** unparse **
    public void unparse(PrintWriter p, int indent) {
	p.print(myStrVal);
	if (mySym != null) {
	    p.print("(" + mySym.type() + ")");
	}
    }

    /** name **/
    public String name() {
	return myStrVal;
    }

    /** type **/
    public String typeInternal() {
	if (mySym != null) return mySym.type();
	else {
	    System.err.println("ID with null sym field");
	    System.exit(-1);
	}
	return null;
    }

    /** symbol-table entry */
    public Sym sym() {
	return mySym;
    }

    /** line num **/
    public int linenum() {
	return myLineNum;
    }

    /** char num **/
    public int charnum() {
	return myCharNum;
    }

    public void checkTypes(String returnType){}

    public int size() {
	return 0;
    }

    // fields
    private int myLineNum;
    private int myCharNum;
    private String myStrVal;
    private Sym mySym;
}

class CallExpNode extends ExpNode {
    public CallExpNode(IdNode name, ExpListNode elist) {
	myId = name;
	myExpList = elist;
    }

    /** processNames 
     *
     * process name of called fn and all actuals
     **/
    public void processNames(SymTab S) {
	myId.processNames(S);
	myExpList.processNames(S);
    }

    // ** unparse **
    public void unparse(PrintWriter p, int indent) {
	myId.unparse(p,0);
	p.print("(");
	if (myExpList != null) myExpList.unparse(p,0);
	p.print(")");
    }

    /** linenum **/
    public int linenum() {
	return myId.linenum();
    }

    /** charnum **/
    public int charnum() {
	return myId.charnum();
    }

    // Cascading in fn calls is a bit unituitive
    // The same error can't count twice, but we can still get multiple errors from the same
    // function if the return type doesn't match. 
    public void checkTypes(String returnType){
	if(!(myId.sym() instanceof FnSym)) {
	    Errors.fatal(myId.linenum(), myId.charnum(), "Attempt to call a non-function");
	    isError = true;
	    return;
	}

	Iterator iter = myExpList.expressions().iterator();
	FnSym fSym = (FnSym) myId.sym();
	for(Sym params : fSym.paramTypes()){
	    if(!iter.hasNext()) {
		Errors.fatal(myId.linenum(), myId.charnum(), "Function call with wrong number of args");
		return;
	    }
	    iter.next();
	}
	if(iter.hasNext()){
	    Errors.fatal(myId.linenum(), myId.charnum(), "Function call with wrong number of args");
	    return;
	}
	myExpList.checkTypes(returnType);
	iter = myExpList.expressions().iterator();
	for(Sym params : fSym.paramTypes()){
	    ExpNode param = (ExpNode) iter.next();
	    if(!param.type().equals(params.type()) && 
	       !(param.type().equals("int") && params.type().equals("double"))){
		Errors.fatal(param.linenum(), param.charnum(), "Type of actual does not match type of formal");
	    }
	}

    }

    public String typeInternal() {
	return myId.type();
    }

    public FnSym sym() {
	return (FnSym) myId.sym();
    }

    // 2 kids
    private IdNode myId;
    private ExpListNode myExpList;
}

abstract class UnaryExpNode extends ExpNode {
    public UnaryExpNode(ExpNode exp) {
	myExp = exp;
    }

    /** processNames **/
    public void processNames(SymTab S) {
	myExp.processNames(S);
    }

    /** linenum **/
    public int linenum() {
	return myExp.linenum();
    }

    /** charnum **/
    public int charnum() {
	return myExp.charnum();
    }

    public String typeInternal(){
	return myExp.type();
    }

    // one kid
    protected ExpNode myExp;
}

abstract class BinaryExpNode extends ExpNode {
    public BinaryExpNode(ExpNode exp1, ExpNode exp2) {
	myExp1 = exp1;
	myExp2 = exp2;
    }

    /** processNames **/
    public void processNames(SymTab S) {
	myExp1.processNames(S);
	myExp2.processNames(S);
    }

    /** linenum **/
    public int linenum() {
	return myExp1.linenum();
    }

    /** charnum **/
    public int charnum() {
	return myExp1.charnum();
    }

    public void checkTypes(String returnType){
	myExp1.checkTypes(returnType);
	myExp2.checkTypes(returnType);

	if(myExp1.type().equals("error") || myExp2.type().equals("error")) { 
	    isError = true;
	    return;
	}
	
	checkBinaryTypes(returnType);
    }

    public void checkBinaryTypes(String returnType){ }

    public String typeInternal(){
	return binaryType();
    }

    public String binaryType() {
	return null;
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
    // ** unparse **
    public void unparse(PrintWriter p, int indent) {
	p.print("(");
	myExp.unparse(p, 0);
	p.print("++)");
    }

    public void checkTypes(String returnType){
	myExp.checkTypes(returnType);
	if(myExp.type().equals("error")) {
	    isError = true;
	}else if(!myExp.type().equals("int")){
	    Errors.fatal(myExp.linenum(), myExp.charnum(), "Non-int identifier used with ++ or --");
	    isError = true;
	}
    }
}

class MinusMinusNode extends UnaryExpNode {
    public MinusMinusNode(ExpNode exp) {
	super(exp);
    }

    // ** unparse **
    public void unparse(PrintWriter p, int indent) {
	p.print("(");
	myExp.unparse(p, 0);
	p.print("--)");
    }

    public void checkTypes(String returnType){
	myExp.checkTypes(returnType);
	if(myExp.type().equals("error")) {
	    isError = true;
	}else if(!myExp.type().equals("int")){
	    Errors.fatal(myExp.linenum(), myExp.charnum(), "Non-int identifier used with ++ or --");
	    isError = true;
	}
    }
}

class UnaryMinusNode extends UnaryExpNode {
    public UnaryMinusNode(ExpNode exp) {
	super(exp);
    }

    // ** unparse **
    public void unparse(PrintWriter p, int indent) {
	p.print("(-");
	myExp.unparse(p, 0);
	p.print(")");
    }

    public void checkTypes(String returnType){
	myExp.checkTypes(returnType);
	if(myExp.type().equals("error")) {
	    isError = true;
	}else if(!myExp.type().equals("int") && !myExp.type().equals("double")){
	    Errors.fatal(myExp.linenum(), myExp.charnum(), "Illegal use of non-numeric operand");
	    isError = true;
	}
    }
}

class NotNode extends UnaryExpNode {
    public NotNode(ExpNode exp) {
	super(exp);
    }

    // ** unparse **
    public void unparse(PrintWriter p, int indent) {
	p.print("(!");
	myExp.unparse(p, 0);
	p.print(")");
    }
    
    public void checkTypes(String returnType){
	myExp.checkTypes(returnType);
	if(myExp.type().equals("error")) {
	    isError = true;
	}else if(!myExp.type().equals("int")){
	    Errors.fatal(myExp.linenum(), myExp.charnum(), "Logical operator applied to non-int operand");
	    isError = true;
	}
    }
}

// **********************************************************************
// Subclasses of BinaryExpNode
// **********************************************************************

abstract class ArithmeticExpNode extends BinaryExpNode {
    public ArithmeticExpNode(ExpNode exp1, ExpNode exp2) {
	super(exp1, exp2);
    }

    public void checkBinaryTypes(String returnType) {
	if(parseUtils.typeNonNumeric(myExp1.type())){
	    Errors.fatal(myExp1.linenum(), myExp1.charnum(), "Illegal use of non-numeric operand");
	    isError = true;
	}

	if(parseUtils.typeNonNumeric(myExp2.type())){
	    Errors.fatal(myExp2.linenum(), myExp2.charnum(), "Illegal use of non-numeric operand");
	    isError = true;
	}
    }

    public String binaryType() {
	if(myExp1.type().equals("double") || myExp2.type().equals("double")){
	    return "double";
	} else {
	    return "int";
	}
    }
}

abstract class LogicalExpNode extends BinaryExpNode {
    public LogicalExpNode(ExpNode exp1, ExpNode exp2) {
	super(exp1, exp2);
    }

    public void checkBinaryTypes(String returnType) {
	if(!myExp1.type().equals("int")){
	    Errors.fatal(myExp1.linenum(), myExp1.charnum(), "Logical operator applied to non-int operand");
	    isError = true;
	    //return;
	}

	if(!myExp2.type().equals("int")){
	    Errors.fatal(myExp2.linenum(), myExp2.charnum(), "Logical operator applied to non-int operand");
	    isError = true;
	    //return;
	}
    }

    public String binaryType() {
	return "int";
    }
}

abstract class EqualityExpNode extends BinaryExpNode {
    public EqualityExpNode(ExpNode exp1, ExpNode exp2) {
	super(exp1, exp2);
    }

    public void checkBinaryTypes(String returnType) {
	if(parseUtils.typeNonNumeric(myExp1.type())){
	    Errors.fatal(myExp1.linenum(), myExp1.charnum(), "Illegal use of non-numeric operand");
	    isError = true;
	}

	if(parseUtils.typeNonNumeric(myExp2.type())){
	    Errors.fatal(myExp2.linenum(), myExp2.charnum(), "Illegal use of non-numeric operand");
	    isError = true;
	}
    }

    public String binaryType(){
	return "int";
    }
}

abstract class RelationalExpNode extends BinaryExpNode {
    public RelationalExpNode(ExpNode exp1, ExpNode exp2) {
	super(exp1, exp2);
    }

    public void checkBinaryTypes(String returnType) {
	if(parseUtils.typeNonNumeric(myExp1.type())){
	    Errors.fatal(myExp1.linenum(), myExp1.charnum(), "Illegal use of non-numeric operand");
	    isError = true;
	}

	if(parseUtils.typeNonNumeric(myExp2.type())){
	    Errors.fatal(myExp2.linenum(), myExp2.charnum(), "Illegal use of non-numeric operand");
	    isError = true;
	}
    }

    public String binaryType() {
	return "int";
    }
}

class AssignNode extends BinaryExpNode {
    private static final boolean DEBUG = false;

    public AssignNode(ExpNode lhs, ExpNode exp) {
	super(lhs, exp);
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
	myExp1.unparse(p, 0);
	p.print(" = ");
	myExp2.unparse(p,0);
	p.print(")");
    }

    /** processNames **/
    public void processNames(SymTab S) {
	myExp1.processNames(S);
	myExp2.processNames(S);
    }

    public void unparse(PrintWriter p, int indent, boolean b) {
	myExp1.unparse(p, 0);
	p.print(" = ");
	myExp2.unparse(p,0);
    }

    public void checkBinaryTypes(String returnType){
	myExp1.checkTypes(returnType);
	myExp2.checkTypes(returnType);
	
	if(parseUtils.typeNonNumeric(myExp1.type())) {
	    Errors.fatal(myExp1.linenum(), myExp1.charnum(), "Illegal use of non-numeric operand");
	    isError = true;
	}
	if(myExp2 instanceof CallExpNode) {
	    FnSym call = ((CallExpNode)myExp2).sym();
	    if(parseUtils.typeNonNumeric(call.returnType())) {
		Errors.fatal(myExp2.linenum(), myExp2.charnum(), "Illegal use of non-numeric operand");
		isError = true;
	    } else if(myExp1.type().equals("int") && call.returnType().equals("double")){
		Errors.fatal(myExp2.linenum(), myExp2.charnum(), "Possible loss of precision");
	    }
	} 
	else if(parseUtils.typeNonNumeric(myExp2.type())) {
	    Errors.fatal(myExp2.linenum(), myExp2.charnum(), "Illegal use of non-numeric operand");
	    isError = true;
	}
	if(myExp1.type().equals("int") && myExp2.type().equals("double")){
	    Errors.fatal(myExp2.linenum(), myExp2.charnum(), "Possible loss of precision");
	    isError = true;
	}
    }

    public String binaryType() {
	return myExp1.type();
    }
}

// **********************************************************************
// Subclasses of ArithmeticExpNode
// **********************************************************************

class PlusNode extends ArithmeticExpNode {
    public PlusNode(ExpNode exp1, ExpNode exp2) {
	super(exp1, exp2);
    }

    // ** unparse **
    public void unparse(PrintWriter p, int indent) {
	p.print("(");
	myExp1.unparse(p, 0);
	p.print("+");
	myExp2.unparse(p, 0);
	p.print(")");
    }
}

class MinusNode extends ArithmeticExpNode {
    public MinusNode(ExpNode exp1, ExpNode exp2) {
	super(exp1, exp2);
    }

    // ** unparse **
    public void unparse(PrintWriter p, int indent) {
	p.print("(");
	myExp1.unparse(p, 0);
	p.print("-");
	myExp2.unparse(p, 0);
	p.print(")");
    }
}

class TimesNode extends ArithmeticExpNode {
    public TimesNode(ExpNode exp1, ExpNode exp2) {
	super(exp1, exp2);
    }

    // ** unparse **
    public void unparse(PrintWriter p, int indent) {
	p.print("(");
	myExp1.unparse(p, 0);
	p.print("*");
	myExp2.unparse(p, 0);
	p.print(")");
    }
}

class DivideNode extends ArithmeticExpNode {
    public DivideNode(ExpNode exp1, ExpNode exp2) {
	super(exp1, exp2);
    }

    // ** unparse **
    public void unparse(PrintWriter p, int indent) {
	p.print("(");
	myExp1.unparse(p, 0);
	p.print("/");
	myExp2.unparse(p, 0);
	p.print(")");
    }
}

// **********************************************************************
// Subclasses of LogicalExpNode
// **********************************************************************

class AndNode extends LogicalExpNode {
    public AndNode(ExpNode exp1, ExpNode exp2) {
	super(exp1, exp2);
    }

    // ** unparse **
    public void unparse(PrintWriter p, int indent) {
	p.print("(");
	myExp1.unparse(p, 0);
	p.print("&&");
	myExp2.unparse(p, 0);
	p.print(")");
    }
}

class OrNode extends LogicalExpNode {
    public OrNode(ExpNode exp1, ExpNode exp2) {
	super(exp1, exp2);
    }

    // ** unparse **
    public void unparse(PrintWriter p, int indent) {
	p.print("(");
	myExp1.unparse(p, 0);
	p.print("||");
	myExp2.unparse(p, 0);
	p.print(")");
    }
}

// **********************************************************************
// Subclasses of EqualityExpNode
// **********************************************************************

class EqualsNode extends EqualityExpNode {
    public EqualsNode(ExpNode exp1, ExpNode exp2) {
	super(exp1, exp2);
    }

    // ** unparse **
    public void unparse(PrintWriter p, int indent) {
	p.print("(");
	myExp1.unparse(p, 0);
	p.print("==");
	myExp2.unparse(p, 0);
	p.print(")");
    }
}

class NotEqualsNode extends EqualityExpNode {
    public NotEqualsNode(ExpNode exp1, ExpNode exp2) {
	super(exp1, exp2);
    }

    // ** unparse **
    public void unparse(PrintWriter p, int indent) {
	p.print("(");
	myExp1.unparse(p, 0);
	p.print("!=");
	myExp2.unparse(p, 0);
	p.print(")");
    }
}

// **********************************************************************
// Subclasses of RelationalExpNode
// **********************************************************************

class LessNode extends RelationalExpNode {
    public LessNode(ExpNode exp1, ExpNode exp2) {
	super(exp1, exp2);
    }

    // ** unparse **
    public void unparse(PrintWriter p, int indent) {
	p.print("(");
	myExp1.unparse(p, 0);
	p.print("<");
	myExp2.unparse(p, 0);
	p.print(")");
    }
}

class GreaterNode extends RelationalExpNode {
    public GreaterNode(ExpNode exp1, ExpNode exp2) {
	super(exp1, exp2);
    }

    // ** unparse **
    public void unparse(PrintWriter p, int indent) {
	p.print("(");
	myExp1.unparse(p, 0);
	p.print(">");
	myExp2.unparse(p, 0);
	p.print(")");
    }
}

class LessEqNode extends RelationalExpNode {
    public LessEqNode(ExpNode exp1, ExpNode exp2) {
	super(exp1, exp2);
    }

    // ** unparse **
    public void unparse(PrintWriter p, int indent) {
	p.print("(");
	myExp1.unparse(p, 0);
	p.print("<=");
	myExp2.unparse(p, 0);
	p.print(")");
    }
}

class GreaterEqNode extends RelationalExpNode {
    public GreaterEqNode(ExpNode exp1, ExpNode exp2) {
	super(exp1, exp2);
    }

    // ** unparse **
    public void unparse(PrintWriter p, int indent) {
	p.print("(");
	myExp1.unparse(p, 0);
	p.print(">=");
	myExp2.unparse(p, 0);
	p.print(")");
    }
}

/* Utilities */
class parseUtils {
    public static Boolean typeNonNumeric(String typeName){
	return !(typeName.equals("int") || typeName.equals("double"));
    }
}



