import java.io.*;
import java.util.*;

import com.sun.org.apache.bcel.internal.classfile.Code;

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
//       UnaryExpNode        
//         UnaryMinusNode    ExpNode
//         NotNode           ExpNode
//         PlusPlusNode      IdNode
//         MinusMinusNode    IdNode
//       BinaryExpNode       ExpNode, ExpNode
//         AssignNode
//         ArithBinExpNode
//           PlusNode     
//           MinusNode
//           TimesNode
//           DivideNode
//         EqualityBinExpNode
//           EqualsNode
//           NotEqualsNode
//           LessNode
//           GreaterNode
//           LessEqNode
//           GreaterEqNode
//         LogicalBinExpNode
//           AndNode
//           OrNode
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
//       UnaryExpNode,     UnaryMinusNode,  NotNode,          PlusPlusNode,
//       MinusMinusNode    BinaryExpNode    AssignNode,
//       ArithmeticBinExpNode               PlusNode,         MinusNode,
//       TimesNode,        DivideNode,      EqualityBinExpNode,
//       EqualsNode,       NotEqualsNode,
//       LessNode,         GreaterNode,     LessEqNode,       GreaterEqNode,
//       LogicalBinExpNode,                 AndNode,          OrNode
//
// **********************************************************************

// **********************************************************************
// ASTnode class (base class for all other kinds of nodes)
// **********************************************************************
abstract class ASTnode { 
	protected static final boolean DEBUG = false;
	protected static final String INT_TYPE = "int";
	protected static final String DBL_TYPE = "double";
	protected static final String ERR_TYPE = "ERR";
	protected static final String VOID_TYPE = "void";

	// every subclass must provide an unparse operation
	abstract public void unparse(PrintWriter p, int indent);

	// this method can be used by the unparse methods to do indenting
	protected void doIndent(PrintWriter p, int indent) {
		for (int k=0; k<indent; k++) p.print(" ");
	}

	// methods for type checking
	protected static boolean isErrType(String T) {
		return T.equals(ERR_TYPE);
	}

	protected static boolean isVoidType(String T) {
		return T.equals(VOID_TYPE);
	}

	protected static boolean isFnType(String T) {
		return T.indexOf("->") != -1;
	}

	protected static boolean isIntType(String T) {
		return T.equals(INT_TYPE);
	}

	protected static boolean isDblType(String T) {
		return T.equals(DBL_TYPE);
	}

	protected static boolean isNumericType(String T) {
		return T.equals(INT_TYPE) || T.equals(DBL_TYPE);
	}

	protected static boolean hasReturn(String T){
		return !T.contains("->void");
	}
	
	protected static boolean compatibleTypes(String T1, String T2) {
		// T1 is a formal's type, T2 is an actual's type
		// OK iff same type or dbl, int
		return T1.equals(T2) || (isDblType(T1) && isIntType(T2));
	}
	
	protected static List<ASTnode> dataNodes = new ArrayList<ASTnode>();
	
	abstract public void generate(); 
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

	/** typeCheck **/
	public void typeCheck() {
		myDeclList.typeCheck();

		for(DeclNode node : myDeclList.Kids()) {
			if(node instanceof FnDeclNode){
				FnDeclNode fnNode = (FnDeclNode) node;
				if(fnNode.Id().name().equals("main")) {
					return;
				}
			}
		}

		Errors.fatal(0, 0, "No main function");
	}

	public void unparse(PrintWriter p, int indent) {
		myDeclList.unparse(p, indent);
	}

	public void generate() {
		myDeclList.generateRoot();
	}

	// 1 kid
	private DeclListNode myDeclList;
	public static int CurrentOffset = 0;
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

	/** typeCheck **/
	public void typeCheck() {
		Iterator it = myDecls.iterator();
		try {
			while (it.hasNext()) {
				((DeclNode)it.next()).typeCheck();
			}
		} catch (NoSuchElementException ex) {
			System.err.println("unexpected NoSuchElementException in DeclListNode.typeCheck");
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

	public List<DeclNode> Kids() {
		return myDecls;
	}

	public int size() {
		int size = 0;
		for(DeclNode node : myDecls){
			if(node instanceof VarDeclNode){
				VarDeclNode dnode = (VarDeclNode) node;
				size += dnode.size();
			}
		}

		return size;
	}

	public void generateRoot() {
		Codegen.genData();

		for(DeclNode node : myDecls) {
			if(node instanceof VarDeclNode){
				VarDeclNode varNode = (VarDeclNode) node;
				varNode.generate();
			}
		}

		for(ASTnode node : ASTnode.dataNodes){
			node.generate();
		}
		
		Codegen.genText();

		for(DeclNode node : myDecls){
			if(node instanceof FnDeclNode){
				FnDeclNode dnode = (FnDeclNode) node;
				dnode.generate();
			}
		}
	}

	public void generate() {
		for(DeclNode node : myDecls) {
			node.generate();
		}
	}

	public int setOffset(int offset) {
		for(DeclNode node : myDecls){
			offset = node.setOffset(offset);
		}
		return offset;
	}

	// list of kids (DeclNodes)
	private List<DeclNode> myDecls;

	public void printOffsets() {
		for(DeclNode node : myDecls){
			node.printOffsets();
		}
		
	}
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
	public LinkedList processNames(SymTab S) {
		LinkedList L = new LinkedList();
		Iterator it = myFormals.iterator();
		try {
			while (it.hasNext()) {
				Sym sym = ((FormalDeclNode)it.next()).processNames(S);
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

	public int setReg(int start) {
		int offset = start;
		for(int i=0; i< myFormals.size(); i++){
			offset = myFormals.get(i).setReg(start + i, offset);
			
		}

		return offset;
	}

	public void generate() {		
		for(FormalDeclNode node : myFormals){
			node.generate();
		}
	}

	public void printOffsets(){
		for(FormalDeclNode node : myFormals){
			node.printOffsets();
		}
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

	public int size() {
		int size = 0;
		for(FormalDeclNode node : myFormals){
			size += node.size();
		}

		return size;
	}
	
	// list of kids (FormalDeclNodes)
	public List<FormalDeclNode> myFormals;
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

	/** typeCheck **/
	public void typeCheck(String returnType) {
		myStmtList.typeCheck(returnType);
	}

	// ** unparse **
	public void unparse(PrintWriter p, int indent) {
		if (myDeclList != null) myDeclList.unparse(p, indent+2);
		if (myStmtList != null) myStmtList.unparse(p, indent+2);
	}

	public void generate(){
		myDeclList.generate();
		myStmtList.generate();
	}

	public int size() {
		return myDeclList.size() + myStmtList.size();
	}

	public int setOffset(int offset) {
		offset = myDeclList.setOffset(offset);
		//return offset;
		return myStmtList.setOffset(offset);
	}
	
	public void printOffsets(){
		myDeclList.printOffsets();
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

	/** typeCheck **/
	public void typeCheck(String returnType) {
		Iterator it = myStmts.iterator();
		try {
			while (it.hasNext()) {
				((StmtNode)it.next()).typeCheck(returnType);
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

	public void generate(){
		for(StmtNode node : myStmts){
			node.generate();
		}
	}

	public int setOffset(int offset){
		for(StmtNode node : myStmts){
			offset = node.setOffset(offset);
		}
		
		return offset;
	}
	
	public int size() {
		int size = 0;
		for(StmtNode node : myStmts) {
			size += node.size();
		}

		return size;
	}

	// list of kids (StmtNodes)
	private List<StmtNode> myStmts;
}

class ExpListNode extends ASTnode {
	public ExpListNode(List<ExpNode> L) {
		myExps = L;
	}

	/** typeCheck **/
	public void typeCheck(LinkedList<String> L) {
		int k=0;
		Iterator it = myExps.iterator();
		try {
			while (it.hasNext()) {
				ExpNode exp = (ExpNode)it.next();
				String actualT = exp.typeCheck();
				if (!isErrType(actualT)) {
					String paramT = L.get(k);
					if (!compatibleTypes(paramT, actualT)) {
						Errors.fatal(exp.linenum(), exp.charnum(),
								"Type of actual does not match type of formal");
					}
				}
				k++;
			}
		} catch (NoSuchElementException ex) {
			System.err.println("unexpected NoSuchElementException in ExpListNode.processNames");
			System.exit(-1);
		}
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

	public void generate() {}
	
	public List<ExpNode> children() {
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

	public void printOffsets() {	
	}

	// default version of typeCheck for var and formal decls
	public void typeCheck() {
	}

	public int setOffset(int offset) { return offset; }
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
		if (isVoidType(myType.type())) {
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
				Sym sym = new Sym(myType.type());
				S.insert(name, sym);
				myId.link(sym);
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

	public void typeCheck() {
		Sym s = myId.sym();
	}

	// ** unparse **
	public void unparse(PrintWriter p, int indent) {
		doIndent(p, indent);
		myType.unparse(p, 0);
		p.print(" ");
		myId.unparse(p, 0);
		p.println(";");
	}

	public int size() {
		if(ASTnode.isDblType(myType.type())){
			return 8;
		} else {
			return 4;
		}
	}
	
	public void printOffsets() {	
		Codegen.generate("# " + myId.name() + ", " + offset());
	}

	public void generate(){
		// If it's a global var, then do the .data stuff
		if(myId.sym().offset == -1) {
			Codegen.genStaticVar(myId.label(), this.size());
		}
	}

	public int setOffset(int offset) {
		if(ASTnode.isDblType(myType.type())) {
			offset += 4;
		}
		myId.sym().offset = offset;
		return offset + size(); 
	}

	public int offset() {
		return myId.sym().offset;
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
				sym = new FnSym(myType.type(),
						myFormalsList.length());
				S.insert(name, sym);
				myId.link(sym);
			} catch (DuplicateException ex) {
				System.err.println("unexpected DuplicateException in FnDeclNode.processNames");
				System.exit(-1);
			} catch (EmptySymTabException ex) {
				System.err.println("unexpected EmptySymTabException in FnDeclNode.processNames");
				System.exit(-1);
			}
		}
		S.addMap();
		LinkedList L = myFormalsList.processNames(S);
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

	/** typeCheck **/
	public void typeCheck() {
		myBody.typeCheck(myType.type());
		int offset = myFormalsList.setReg(-12);
		myBody.setOffset(0);
	}

	/* Stack Format
	 * 
	 * ^^ Higher addresses ^^
	 * 
	 * fn input 1
	 * fn input 2
	 * ...
	 * fn input n
	 * $ra for this function
	 * $fp for last function
	 * body decl 1 				<-- $fp
	 * body decl 2
	 * ...
	 * body decl n              <-- $sp
	 * 
	 * vv Lower addresses  vv
	 */
	public void generate() {
		int size =  myBody.size();
		Codegen.generateLabeled(myId.label(), "nop", "function " + myId.name());
		myFormalsList.printOffsets();
		myBody.printOffsets();
		//Codegen.generate("subu", "$fp", "$fp", size + myFormalsList.size());
		Codegen.genPush("$ra", 4);
		Codegen.genPush("$fp", 4);
		Codegen.generateWithComment("move", "init fp", "$fp", "$sp");
		Codegen.generateWithComment("subu", "allocate AR", "$sp", "$sp", Integer.toString(size + 8));
		//Codegen.generate("addi", "$fp", "$fp", 8 + myBody.size() + myFormalsList.size());		
		myFormalsList.generate();
		myBody.generate();
		
		if(myId.name().equals("main")) {
			Codegen.generateWithComment("addi", "done", "$2", "$0", "10");
			Codegen.generate("syscall");
		} else {
			// Ensure that even if they don't explicitly say "return" we still return
			new ReturnStmtNode(null).generate();
		}
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

	public IdNode Id () {
		return myId;
	}

	public int size() {
		return myFormalsList.size() + myBody.size();
	}

	public List<FormalDeclNode> myFormals() {
		return myFormalsList.myFormals;
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

	public void printOffsets() {
		Codegen.generate("# " + myId.name() + ", " + offset());
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
		if (isVoidType(myType.type())) {
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
				sym = new Sym(myType.type());
				S.insert(name, sym);
				myId.link(sym);
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

	public int setReg(int start, int offset){
		if(ASTnode.isDblType(myType.type())) {
			//offset -= 4;
		}
		myId.sym().setReg(start);
		myId.sym().offset = offset;
		offset -= this.size();
		return offset;
	}

	public void generate(){
		//Codegen.generateIndexed("lw", myId.sym().register, "$sp", myId.sym().offset, myId.name());
	}

	public int size() {
		if(ASTnode.isDblType(myType.type())){
			return 8;
		} else {
			return 4;
		}
	}
	
	public int offset() {
		return myId.sym().offset;
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
	
	public void generate() {}
}

class IntNode extends TypeNode {
	public IntNode() {
	}

	/** type **/
	public String type() {
		return INT_TYPE;
	}

	// ** unparse **
	public void unparse(PrintWriter p, int indent) {
		p.print(INT_TYPE);
	}
}

class DblNode extends TypeNode {
	public DblNode() {
	}

	/** type **/
	public String type() {
		return DBL_TYPE;
	}

	// ** unparse **
	public void unparse(PrintWriter p, int indent) {
		p.print(DBL_TYPE);
	}
}

class VoidNode extends TypeNode {
	public VoidNode() {
	}

	public String type() {
		return VOID_TYPE;
	}

	// ** unparse **
	public void unparse(PrintWriter p, int indent) {
		p.print(VOID_TYPE);
	}
}

// **********************************************************************
// StmtNode and its subclasses
// **********************************************************************

abstract class StmtNode extends ASTnode {
	abstract public void processNames(SymTab S);
	abstract public void typeCheck(String T);

	public void generate() {}
	// Most statements don't declare any variables, so their effect on the
	// stack size is zero
	public int size() { return 0; }
	// Similarly, if the statement doesn't open up a new declarative block, then
	// the offset will remain the same
	public int setOffset(int offset) { return offset; }
}

class AssignStmtNode extends StmtNode {
	public AssignStmtNode(AssignNode e) {
		myExp = e;
	}

	/** processNames **/
	public void processNames(SymTab S) {
		myExp.processNames(S);
	}

	/** typeCheck **/
	public void typeCheck(String retType) {
		myExp.typeCheck();
	}

	public void unparse(PrintWriter p, int indent) {
		myExp.unparse(p,0,false);
		p.println(";");
	}

	public void generate() {
		myExp.generate();
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

	/** typeCheck **/
	public void typeCheck(String retType) {
		String T = myId.typeCheck();
		if (!isErrType(T)) {
			if (!isIntType(T)) {
				Errors.fatal(myId.linenum(), myId.charnum(),
				"Non-int identifier used with ++ or --");
			}
		}
	}

	/** unparse **/
	public void unparse(PrintWriter p, int indent) {
		p.print("++");
		myId.unparse(p,0);
		p.println(";");
	}

	public void generate() {
		Codegen.generate("lw", "$t8", myId.label());
		Codegen.generateWithComment("addi", this, "$t8", "$t8", "1");
		Codegen.generate("sw", "$t8", myId.label());
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

	/** typeCheck **/
	public void typeCheck(String retType) {
		String T = myId.typeCheck();
		if (!isErrType(T)) {
			if (!isIntType(T)) {
				Errors.fatal(myId.linenum(), myId.charnum(),
				"Non-int identifier used with ++ or --");
			}
		}
	}

	/** unparse **/
	public void unparse(PrintWriter p, int indent) {
		p.print("--");
		myId.unparse(p,0);
		p.println(";");
	}

	public void generate() {
		Codegen.generate("lw", "$t8", myId.label());
		Codegen.generateWithComment("addi", this, "$t8", "$t8", "-1");
		Codegen.generate("sw", "$t8", myId.label());
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

	/** typeCheck **/
	public void typeCheck(String retType) {
		String T = myId.typeCheck();
		if (!isErrType(T)) {
			if (!isIntType(T)) {
				Errors.fatal(myId.linenum(), myId.charnum(),
				"Non-int identifier used with ++ or --");
			}
		}
	}

	/** unparse **/
	public void unparse(PrintWriter p, int indent) {
		myId.unparse(p,0);
		p.println("++;");
	}


	public void generate() {
		Codegen.generate("lw", "$t8", myId.label());
		Codegen.generateWithComment("addi", this, "$t8", "$t8", "1");
		Codegen.generate("sw", "$t8", myId.label());
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

	/** typeCheck **/
	public void typeCheck(String retType) {
		String T = myId.typeCheck();
		if (!isErrType(T)) {
			if (!isIntType(T)) {
				Errors.fatal(myId.linenum(), myId.charnum(),
				"Non-int identifier used with ++ or --");
			}
		}
	}

	/** unparse **/
	public void unparse(PrintWriter p, int indent) {
		myId.unparse(p,0);
		p.println("--;");
	}


	public void generate() {
		Codegen.generate("lw", "$t8", myId.label());
		Codegen.generateWithComment("addi", this, "$t8", "$t8", "-1");
		Codegen.generate("sw", "$t8", myId.label());
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

	/** typeCheck **/
	public void typeCheck(String retType) {
		String T = myId.typeCheck();
		if (!isIntType(T)) {
			Errors.fatal(myId.linenum(), myId.charnum(),
					"Attempt to read a non-int id with an int format");
		}
	}

	/** unparse **/
	public void unparse(PrintWriter p, int indent) {
		p.print("scanf(\"%d\", &");
		myId.unparse(p,0);
		p.println(");");
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

	/** typeCheck **/
	public void typeCheck(String retType) {
		String T = myId.typeCheck();
		if (!isDblType(T)) {
			Errors.fatal(myId.linenum(), myId.charnum(),
					"Attempt to read a non-double id with a dbl format");
		}
	}

	/** unparse **/
	public void unparse(PrintWriter p, int indent) {
		p.print("scanf(\"%f\", &");
		myId.unparse(p,0);
		p.println(");");
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

	/** typeCheck **/
	public void typeCheck(String retType) {
		String T = myExp.typeCheck();
		if (!isIntType(T) && !isErrType(T)) {
			Errors.fatal(myExp.linenum(), myExp.charnum(),
					"Attempt to write a non-int value with an int format");
		}
	}

	// ** unparse **
	public void unparse(PrintWriter p, int indent) {
		p.print("printf(\"%d\", ");
		myExp.unparse(p,0);
		p.println(");");
	}

	public void generate(){
		myExp.generate();
		Codegen.genPop("$a0", 4);
		Codegen.generateWithComment("li", "system call code for print_int", "$v0", "1");
		Codegen.generateWithComment("syscall", this, "", "", "");
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

	/** typeCheck **/
	public void typeCheck(String retType) {
		String T = myExp.typeCheck();
		if (!isDblType(T) && !isErrType(T)) {
			Errors.fatal(myExp.linenum(), myExp.charnum(),
					"Attempt to write a non-double value with a dbl format");
		}
	}

	// ** unparse **
	public void unparse(PrintWriter p, int indent) {
		p.print("printf(\"%d\", ");
		myExp.unparse(p,0);
		p.println(");");
	}

	public void generate(){
		myExp.generate();
		Codegen.genPop("$f12", 8);
		Codegen.generateWithComment("li", "system call code for print_double", "$v0", "3");
		Codegen.generateWithComment("syscall", "printf(\"%f\");");
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
		/* only a stringliteral is possible, so no need to check */
	}

	/** typeCheck **/
	public void typeCheck(String retType) {
		/* only a stringliteral is possible, so no need to typecheck */
		myExp.typeCheck();
	}

	public void generate(){
		StringLitNode node = (StringLitNode) myExp;
		Codegen.generateWithComment("la", this, "$a0", node.label(), "");
		Codegen.generate("li", "$v0", 4);
		Codegen.generate("syscall");
	}
	
	// ** unparse **
	public void unparse(PrintWriter p, int indent) {
		p.print("printf(");
		myExp.unparse(p,0);
		p.println(");");
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

	/** typeCheck **/
	public void typeCheck(String retType) {
		String T = myExp.typeCheck();
		if (! isIntType(T) && ! isErrType(T)) {
			Errors.fatal(myExp.linenum(), myExp.charnum(),
					"Non-int expression used as an if condition");
		}
		myStmtList.typeCheck(retType);
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

	public int size() {
		return myDeclList.size() + myStmtList.size();
	}

	public int setOffset(int offset){
		offset = myDeclList.setOffset(offset);
		return myStmtList.setOffset(offset);
	}
	
	public void generate() {
		myExp.generate();
		String elseLabel = Codegen.nextLabel();
		Codegen.generateWithComment("beq", "if", "$t8", "$zero", elseLabel);
		myDeclList.generate();
		myStmtList.generate();
		Codegen.generateLabeled(elseLabel, "nop", "else");
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

	/** typeCheck **/
	public void typeCheck(String retType) {
		String T = myExp.typeCheck();
		if (! isIntType(T) && ! isErrType(T)) {
			Errors.fatal(myExp.linenum(), myExp.charnum(),
					"Non-int expression used as an if condition");
		}
		myThenStmtList.typeCheck(retType);
		myElseStmtList.typeCheck(retType);
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

	public int size() {
		return myThenDeclList.size() + myElseStmtList.size() + myElseStmtList.size() + myElseDeclList.size();
	}


	public int setOffset(int offset){
		offset = myThenDeclList.setOffset(offset);
		offset = myThenStmtList.setOffset(offset);

		offset = myElseDeclList.setOffset(offset);
		offset = myElseStmtList.setOffset(offset);
		return offset;
	}
	
	public void generate() {
		myExp.generate();
		String elseLabel = Codegen.nextLabel();
		String doneLabel = Codegen.nextLabel();
		Codegen.generateWithComment("beq", "if", "$t8", "$zero", elseLabel);
		myThenDeclList.generate();
		myThenStmtList.generate();
		Codegen.generate("j", doneLabel);
		Codegen.generateLabeled(elseLabel, "nop", "else");
		myElseDeclList.generate();
		myElseStmtList.generate();
		Codegen.generateLabeled(doneLabel, "nop", "end if");
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

	/** typeCheck **/
	public void typeCheck(String retType) {
		String T = myExp.typeCheck();
		if (! isIntType(T) && ! isErrType(T)) {
			Errors.fatal(myExp.linenum(), myExp.charnum(),
					"Non-int expression used as a while condition");
		}
		myStmtList.typeCheck(retType);
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

	public int size() {
		return myDeclList.size() + myStmtList.size();
	}

	public int setOffset(int offset){
		offset = myDeclList.setOffset(offset);
		offset = myStmtList.setOffset(offset);
		return offset;
	}
	

	public void generate() {
		String conditionalLabel = Codegen.nextLabel() + "_while_start";
		String doneLabel = Codegen.nextLabel() + "_Done";
		Codegen.generateLabeled(conditionalLabel,"nop", "while");
		myExp.generate();
		Codegen.generateWithComment("beq", "while", "$t8", "$zero", doneLabel);
		myDeclList.generate();
		myStmtList.generate();
		Codegen.generate("j", conditionalLabel);
		Codegen.generateLabeled(doneLabel, "nop", "end while");
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

	/** typeCheck **/
	public void typeCheck(String retType) {
		myCall.typeCheck();
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
	
	public void generate(){
		Codegen.generateWithComment("subu", "pad", "$sp", "$sp", "8");
		myCall.generate();
	}

	// 1 kid
	private CallExpNode myCall;
}

class ReturnStmtNode extends StmtNode {
	public ReturnStmtNode(ExpNode exp) {
		myExp = exp;
	}

	/** typeCheck **/
	public void typeCheck(String retType) {
		if (myExp != null) {
			// return with a value
			// error if
			// (a) fn return type is void, or
			// (b) value type is non-numeric, or
			// (c) value type is dbl and return type is int
			String T = myExp.typeCheck();
			if (isVoidType(retType)) {
				Errors.fatal(myExp.linenum(), myExp.charnum(),
				"Return with a value in a void function");
				return;
			}
			if (isErrType(T)) return;
			if (! isNumericType(T) || (isDblType(T) && isIntType(retType))) {
				Errors.fatal(myExp.linenum(), myExp.charnum(),
				"Bad return value");
			}
		}
		else {
			// return w/o value
			// error if fn return type is NOT void
			if (! isVoidType(retType)) {
				Errors.fatal(0, 0, "Missing return value");
			}
		}
		myRetType = retType;
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

	public void generate(){
		if(myExp != null){
			myExp.generate();
			Codegen.genPop("$v0", 4);
			if(this.isDblType(myRetType)) {
				if(myExp.isDouble) {
					Codegen.genPop("$v1", 4);
				} else {
					Codegen.int2Dbl("$v0", "$f8");
					Codegen.generate("mfc1", "$v0", "$f8");
					Codegen.generate("mfc1", "$v1", "$f9");
				}
			}
		}
		Codegen.generate("move", "$sp", "$fp");
		Codegen.genPop("$fp", 4);
		Codegen.genPop("$ra", 4);
		Codegen.generate("jr", "$ra");
	}
	
	// 1 kid
	private ExpNode myExp;
	private String myRetType;
}

// **********************************************************************
// ExpNode and its subclasses
// **********************************************************************

abstract class ExpNode extends ASTnode {
	// default version of processNames (for nodes with no names)
	public void processNames(SymTab S) {}

	abstract public String typeCheck();
	abstract public int linenum();
	abstract public int charnum();
	protected Boolean isDouble = false;

	// An expression should generate code which leaves its value
	// on the top of the stack. Any expression is allowed to use
	// $t8 and $t9 only.
	public void generate() { 
		Codegen.generateWithComment("nop", this, "", "", "");
	}
}

class IntLitNode extends ExpNode {
	public IntLitNode(int lineNum, int charNum, int intVal) {
		myLineNum = lineNum;
		myCharNum = charNum;
		myIntVal = intVal;
	}

	/** typeCheck **/
	public String typeCheck() {
		return INT_TYPE;
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

	public void generate() {
		Codegen.generateWithComment("li", "literal", "$t8", Integer.toString(myIntVal));
		Codegen.genPush("$t8", 4);
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
		isDouble = true;
	}

	/** typeCheck **/
	public String typeCheck() {
		return DBL_TYPE;
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

	public void generate() {
		// TODO: handle non-ints
		/*
		Codegen.generateWithComment("li", this, "$t8", Integer.toString((int)myDblVal), "");
		Codegen.generate("mtc1", "$t8", "$f8");
		Codegen.genPush("$f8", 8);*/
		/*Codegen.generate("li", "$t8", "4295032832");
		Codegen.generate("mtc1", "$t8", "$f8");*/
		Codegen.generateWithComment("li.d", this, "$f8", Double.toString(myDblVal), "");
		Codegen.genPush("$f8", 8);
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

	/** typeCheck **/
	public String typeCheck() {
		label = Codegen.nextLabel();
		ASTnode.dataNodes.add(this);
		return "string";
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

	public void generate(){
		Codegen.genLabel(label);
		Codegen.generate(".asciiz", myStrVal);
	}
	
	public String label(){
		return label;
	}
	
	private String label;
	private int myLineNum;
	private int myCharNum;
	private String myStrVal;
}

class IdNode extends ExpNode {
	public IdNode(int lineNum, int charNum, String strVal) {
		myLineNum = lineNum;
		myCharNum = charNum;
		myStrVal = strVal;
	}

	/** typeCheck **/
	public String typeCheck() {
		isDouble = mySym.type().equals(DBL_TYPE);
		if (mySym != null) return mySym.type();
		else {
			System.err.println("ID with null sym field in IdNode.typeCheck");
			System.exit(-1);
		}
		return null;
	}

	/** processNames
	 *
	 * check for use of an undeclared name
	 * if OK, link to symtab entry
	 *
	 **/
	public void processNames(SymTab S) {
		Sym localSym = S.localLookup(myStrVal);
		local = (localSym != null);

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
		p.print("(" + mySym.type() + "; offset: " + mySym.offset + ")");
	}

	/** name **/
	public String name() {
		return myStrVal;
	}

	/** type **/
	public String type() {
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

	public String label() {
		/*
		if(local) {
			return Integer.toString(mySym.offset) + "($fp)";
		} else {
			return myStrVal;
		}*/
		if(mySym.offset != -1) {
			return Integer.toString(-mySym.offset) + "($fp)";
		} else {
			// "Main" is a special word that we can't rewrite, but every other label should be
			// prefixed with "var" to avoid using protected words
			if(myStrVal.equals("main")) {
				return "main";
			} else {
				return "var_" + myStrVal;
			}
		}
	}

	public void generate() {
		if(ASTnode.isDblType(mySym.type())) {
			Codegen.generateWithComment("l.d", this, "$f8", this.label(), "");
			Codegen.genPush("$f8", 8);
		} else {
			Codegen.generateWithComment("lw", this, "$t8", this.label(), "");
			if(this.isDouble) {
				Codegen.int2Dbl("$t8", "$f10");
				Codegen.genPush("$f10", 8);
			} else { 
				Codegen.genPush("$t8", 4);
			}
		}
	}

	// fields
	private int myLineNum;
	private int myCharNum;
	private String myStrVal;
	private Sym mySym;
	private Boolean local;
}

class CallExpNode extends ExpNode {
	public CallExpNode(IdNode name, ExpListNode elist) {
		myId = name;
		myExpList = elist;
	}

	/** typeCheck **/
	public String typeCheck() {
		String T = myId.typeCheck();
		// check that ID is a fn
		if (! isFnType(T)) {
			Errors.fatal(myId.linenum(), myId.charnum(),
					"Attempt to call a non-function");
			return ERR_TYPE;
		}

		// check number of args
		FnSym s = (FnSym)myId.sym();
		if (s == null) {
			System.out.println("null sym for ID in CallExpNode.typeCheck");
			System.exit(-1);
		}

		int numParams = s.numparams();
		if (numParams != myExpList.length()) {
			Errors.fatal(myId.linenum(), myId.charnum(),
					"Function call with wrong number of args");
			return s.returnType();
		}

		// check type of each arg
		myExpList.typeCheck(s.paramTypes());
		return s.returnType();
	}

	/** processNames 
	 *
	 * process name of called fn and all actuals
	 **/
	public void processNames(SymTab S) {
		myId.processNames(S);
		myExpList.processNames(S);
		fnToCall = (FnSym) S.globalLookup(myId.name());
		this.isDouble = ASTnode.isDblType(fnToCall.returnType());
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
	
	public void generate(){
		pushChildren();
		Codegen.generateWithComment("jal", this, myId.label(), "", "");
		if(ASTnode.hasReturn(myId.type())) {
			if(myId.type().contains("->double")){
				Codegen.genPush("$v1", 4);
				Codegen.genPush("$v0", 4);
			} else if (this.isDouble) {
				Codegen.int2Dbl("$v0", "$f8");
				Codegen.genPush("$f8", 8);
			} else {
				Codegen.genPush("$v0", 4);
			}
		}
	}
	
	/**
	 * Pushes the inputs to the called function onto the stack
	 */
	protected void pushChildren(){
		Iterator<String> paramTypes = fnToCall.paramTypes().iterator();
		for(int i = myExpList.children().size() - 1; i >= 0; i--){
			ExpNode node = myExpList.children().get(i);
			node.generate();
			if(ASTnode.isDblType(fnToCall.paramTypes().get(i)) &&
					!node.isDouble){
				Codegen.genPop("$t8", 4);
				Codegen.int2Dbl("$t8", "$f8");
				Codegen.genPush("$f8", 8);
			}
		}
	}

	// 2 kids
	private IdNode myId;
	private ExpListNode myExpList;
	private FnSym fnToCall;
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

	public void generate(){
		//myExp.isDouble = this.isDouble;
		myExp.generate();
		isDouble = isDouble || myExp.isDouble;
		
		if(this.isDouble) {
			Codegen.genPop("$f8", 8);
			generateUnary();
			Codegen.genPush("$f8", 8);
		} else {
			Codegen.genPop("$t8", 4);
			generateUnary();
			Codegen.genPush("$t8", 4);
		}
	}

	public void generateUnary() {}

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

	// By default, a binary expression calculates both children, then
	// puts their values in $t8 and $t9. The subclass uses these values
	// to calculate a new value for $t8, which is then pushed back onto the
	// stack.
	public void generate(){
		this.isDouble = isDouble || myExp1.isDouble || myExp2.isDouble;
		
		myExp1.generate();
		myExp2.generate();
		if(isDouble) {
			if(!myExp2.isDouble){
				Codegen.genPop("$t8", 4);
				Codegen.int2Dbl("$t8", "$f10");
			} else {
				Codegen.genPop("$f10", 8);
			}
			if(!myExp1.isDouble){
				Codegen.genPop("$t9", 4);
				Codegen.generate("mtc1", "$t9", "$f8");
				Codegen.generate("cvt.d.w", "$f8", "$f8");
			} else {
				Codegen.genPop("$f8", 8);
			}
			generateBinary();
			Codegen.genPush("$f8", 8);
		} else {
			Codegen.genPop("$t9", 4);
			Codegen.genPop("$t8", 4);
			generateBinary();
			Codegen.genPush("$t8", 4);
		}
	}

	public void generateBinary() {

	}

	// two kids
	protected ExpNode myExp1;
	protected ExpNode myExp2;
}

// **********************************************************************
// Subclasses of UnaryExpNode
// **********************************************************************

class PlusPlusNode extends UnaryExpNode {
	public PlusPlusNode(IdNode id) {
		super(id);
	}

	/** typeCheck **/
	public String typeCheck() {
		String T = myExp.typeCheck();
		if (! isErrType(T)) {
			if (! isIntType(T)) {
				Errors.fatal(myExp.linenum(), myExp.charnum(),
				"Non-int identifier used with ++ or --");
				return ERR_TYPE;
			}
			return INT_TYPE;
		} else return T;
	}

	// ** unparse **
	public void unparse(PrintWriter p, int indent) {
		p.print("(");
		myExp.unparse(p, 0);
		p.print("++");
		p.print(")");
	}

	public void generate() {
		IdNode myId = (IdNode) myExp;
		Codegen.generate("lw", "$t8", myId.label());
		Codegen.genPush("$t8", 4);
		Codegen.generateWithComment("addi", this, "$t8", "$t8", "1");
		Codegen.generate("sw", "$t8", myId.label());
	}
}

class MinusMinusNode extends UnaryExpNode {
	public MinusMinusNode(IdNode id) {
		super(id);
	}

	/** typeCheck **/
	public String typeCheck() {
		String T = myExp.typeCheck();
		if (! isErrType(T)) {
			if (! isIntType(T)) {
				Errors.fatal(myExp.linenum(), myExp.charnum(),
				"Non-int identifier used with ++ or --");
				return ERR_TYPE;
			}
			return INT_TYPE;
		} else return T;
	}

	// ** unparse **
	public void unparse(PrintWriter p, int indent) {
		p.print("(");
		myExp.unparse(p, 0);
		p.print("--");
		p.print(")");
	}

	public void generate() {
		IdNode myId = (IdNode) myExp;
		Codegen.generate("lw", "$t8", myId.label());
		Codegen.genPush("$t8", 4);
		Codegen.generateWithComment("addi", this, "$t8", "$t8", "-1");
		Codegen.generate("sw", "$t8", myId.label());
	}
}

class UnaryMinusNode extends UnaryExpNode {
	public UnaryMinusNode(ExpNode exp) {
		super(exp);
	}

	/** typeCheck **/
	public String typeCheck() {
		String T = myExp.typeCheck();
		if (! isNumericType(T) && ! isErrType(T)) {
			Errors.fatal(myExp.linenum(), myExp.charnum(),
					"Illegal use of non-numeric operand");
			return ERR_TYPE;
		}
		this.isDouble = myExp.isDouble;
		return T;
	}

	// ** unparse **
	public void unparse(PrintWriter p, int indent) {
		p.print("(-");
		myExp.unparse(p, 0);
		p.print(")");
	}


	public void generateUnary() {
		if(this.isDouble) {
			Codegen.generate("li.d", "$f10", "-1.0");
			Codegen.generateWithComment("mul.d", this, "$f8", "$f8", "$f10");
		} else {
			Codegen.generate("li", "$t9", "-1");
			Codegen.generateWithComment("mult", this, "$t8", "$t9", "");
			Codegen.generate("mflo", "$t8");
		}
	}
}

class NotNode extends UnaryExpNode {
	public NotNode(ExpNode exp) {
		super(exp);
	}

	/** typeCheck **/
	public String typeCheck() {
		String T = myExp.typeCheck();
		if (! isIntType(T) && ! isErrType(T)) {
			Errors.fatal(myExp.linenum(), myExp.charnum(),
					"Logical operator applied to non-int operand");
			return ERR_TYPE;
		}
		return T;
	}

	// ** unparse **
	public void unparse(PrintWriter p, int indent) {
		p.print("(!");
		myExp.unparse(p, 0);
		p.print(")");
	}


	public void generateUnary() {
		Codegen.num2bool("$t8");
		String zero = Codegen.nextLabel();
		String done = Codegen.nextLabel();		
		Codegen.generateWithComment("beq", this, "$t8", "$zero", zero);
		Codegen.generate("li", "$t8", "0");
		Codegen.generate("j", done);
		Codegen.generateLabeled(zero, "nop", "");
		Codegen.generate("li", "$t8", "1");
		Codegen.generateLabeled(done, "nop", "end not");
		//Codegen.num2bool("$t8");
	}
}

// **********************************************************************
// Subclasses of BinaryExpNode
// **********************************************************************

class AssignNode extends BinaryExpNode {
	private static final boolean DEBUG = false;

	public AssignNode(ExpNode lhs, ExpNode exp) {
		super(lhs, exp);
	}

	/** typeCheck **/
	public String typeCheck() {
		String retType;
		String T1 = myExp1.typeCheck();
		String T2 = retType = myExp2.typeCheck();
		if (! isNumericType(T1) && ! isErrType(T1)) {
			Errors.fatal(myExp1.linenum(), myExp1.charnum(),
			"Illegal use of non-numeric operand");
			T1 = ERR_TYPE;
		}
		if (! isNumericType(T2) && ! isErrType(T2)) {
			Errors.fatal(myExp2.linenum(), myExp2.charnum(),
					"Illegal use of non-numeric operand");
			return ERR_TYPE;
		}
		if (isErrType(T1) || isErrType(T2)) return ERR_TYPE;
		if (isIntType(T1) && isDblType(T2)) {
			Errors.fatal(myExp2.linenum(), myExp2.charnum(),
					"Possible loss of precision");
			return ERR_TYPE;
		}
		IdNode lhs = (IdNode) myExp1;
		this.isDouble = ASTnode.isDblType(lhs.type());
		return T1;
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

	public void generate(){
		IdNode lhs = (IdNode) myExp1;

		if(ASTnode.isDblType(lhs.type())){
			myExp2.generate();
			if (!myExp2.isDouble) {
				Codegen.genPop("$t8", 4);
				Codegen.int2Dbl("$t8", "$f8");
			} else {
				Codegen.genPop("$f8", 8);
			}
			Codegen.generateWithComment("s.d", this, "$f8", lhs.label(), "");
			Codegen.genPush("$f8", 8);
		} else {
			myExp2.generate();
			Codegen.genPop("$t8", 4);
			Codegen.generateWithComment("sw", this, "$t8", lhs.label(), "");
			Codegen.genPush("$t8", 4);
		}
	}
}

abstract class ArithmeticBinExpNode extends BinaryExpNode {
	public ArithmeticBinExpNode(ExpNode exp1, ExpNode exp2) {
		super(exp1, exp2);
	}

	/** typeCheck **/
	public String typeCheck() {
		String T1 = myExp1.typeCheck();
		String T2 = myExp2.typeCheck();
		if (! isNumericType(T1) && ! isErrType(T1)) {
			Errors.fatal(myExp1.linenum(), myExp1.charnum(),
			"Illegal use of non-numeric operand");
		}
		if (! isNumericType(T2) && ! isErrType(T2)) {
			Errors.fatal(myExp2.linenum(), myExp2.charnum(),
					"Illegal use of non-numeric operand");
			return ERR_TYPE;
		}
		if (isErrType(T1) || isErrType(T2)) return ERR_TYPE;
		else {
			if (isDblType(T1) || isDblType(T2)) return DBL_TYPE;
			else return INT_TYPE;
		}
	}
}

abstract class EqualityBinExpNode extends BinaryExpNode {
	public EqualityBinExpNode(ExpNode exp1, ExpNode exp2) {
		super(exp1, exp2);
	}

	/** typeCheck **/
	public String typeCheck() {
		String T1 = myExp1.typeCheck();
		String T2 = myExp2.typeCheck();
		if (! isNumericType(T1) && ! isErrType(T1)) {
			Errors.fatal(myExp1.linenum(), myExp1.charnum(),
			"Illegal use of non-numeric operand");
			T1 = ERR_TYPE;
		}
		if (! isNumericType(T2) && ! isErrType(T2)) {
			Errors.fatal(myExp2.linenum(), myExp2.charnum(),
					"Illegal use of non-numeric operand");
			return ERR_TYPE;
		}
		if (isErrType(T1) || isErrType(T2)) return ERR_TYPE;
		else return INT_TYPE;
	}	
	
	public void generate(){
		isDouble = isDouble || myExp1.isDouble || myExp2.isDouble;
		
		myExp1.generate();
		myExp2.generate();
		if(isDouble) {
			if(!myExp2.isDouble){
				Codegen.genPop("$t8", 4);
				Codegen.generate("mtc1", "$t8", "$f8");
				Codegen.generate("cvt.d.w", "$f10", "$f8");
			} else {
				Codegen.genPop("$f10", 8);
			}
			if(!myExp1.isDouble){
				Codegen.genPop("$t9", 4);
				Codegen.generate("mtc1", "$t9", "$f8");
				Codegen.generate("cvt.d.w", "$f8", "$f8");
			} else {
				Codegen.genPop("$f8", 8);
			}
			generateBinary();
			Codegen.genPush("$t8", 4);
		} else {
			Codegen.genPop("$t9", 4);
			Codegen.genPop("$t8", 4);
			generateBinary();
			Codegen.genPush("$t8", 4);
		}
	}
}

abstract class LogicalBinExpNode extends BinaryExpNode {
	public LogicalBinExpNode(ExpNode exp1, ExpNode exp2) {
		super(exp1, exp2);
	}

	/** typeCheck **/
	public String typeCheck() {
		String T1 = myExp1.typeCheck();
		String T2 = myExp2.typeCheck();
		String retType = INT_TYPE;
		if (! isIntType(T1) && ! isErrType(T1)) {
			Errors.fatal(myExp1.linenum(), myExp1.charnum(),
			"Logical operator applied to non-int operand");
			retType = ERR_TYPE;
		}
		if (! isIntType(T2) && ! isErrType(T2)) {
			Errors.fatal(myExp2.linenum(), myExp2.charnum(),
					"Logical operator applied to non-int operand");
			retType = ERR_TYPE;
		}
		if (isErrType(T1) || isErrType(T2)) return ERR_TYPE;
		else return retType;
	}
}

// **********************************************************************
// Subclasses of ArithmeticBinExpNode
// **********************************************************************

class PlusNode extends ArithmeticBinExpNode {
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

	public void generateBinary(){
		if(isDouble){
			Codegen.generateWithComment("add.d", this, "$f8", "$f8", "$f10");
		} else {
			Codegen.generateWithComment("add", this, "$t8", "$t8", "$t9");
		}
	}
}

class MinusNode extends ArithmeticBinExpNode {
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

	public void generateBinary(){
		if(isDouble){
			Codegen.generateWithComment("sub.d", this, "$f8", "$f8", "$f10");
		} else {
			Codegen.generateWithComment("sub", this, "$t8", "$t8", "$t9");
		}
	}
}

class TimesNode extends ArithmeticBinExpNode {
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

	public void generateBinary(){
		if(isDouble){
			Codegen.generateWithComment("mul.d", this, "$f8", "$f8", "$f10");
		} else {
			Codegen.generateWithComment("mult", this, "$t8", "$t9", "");
			Codegen.generateWithComment("mflo", this, "$t8", "", "");
		}
	}
}

class DivideNode extends ArithmeticBinExpNode {
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

	public void generateBinary(){
		if(isDouble){
			Codegen.generateWithComment("div.d", this, "$f8", "$f8", "$f10");
		} else {
			Codegen.generateWithComment("div", this, "$t8", "$t9", "");
			Codegen.generateWithComment("mflo", this, "$t8", "", "");
		}
	}
}

class EqualsNode extends EqualityBinExpNode {
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

	public void generateBinary() {
		if(isDouble) {
			Codegen.generateWithComment("c.eq.d", this, "$f8", "$f10", "");
			Codegen.setRegForFloatBool("$t8", true);
		} else {
			Codegen.generateWithComment("sub", this, "$t8", "$t8", "$t9");
			Codegen.num2bool("$t8");
			// At this point, t8 is 0 if they're equal, or 1 if they're not
			// So if it's less than 1, set it to 1
			Codegen.generate("slti", "$t8", "$t8", "1");
		}
	}
}

class NotEqualsNode extends EqualityBinExpNode {
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

	public void generateBinary() {
		if(isDouble) {
			Codegen.generateWithComment("c.eq.d", this, "$f8", "$f10", "");
			Codegen.setRegForFloatBool("$t8", false);
		} else {
			Codegen.generateWithComment("sub", this, "$t8", "$t8", "$t9");
			Codegen.num2bool("$t8");
		}
	}
}

class LessNode extends EqualityBinExpNode {
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
	
	public void generateBinary() {
		if(isDouble) {
			Codegen.generateWithComment("c.lt.d", this, "$f8", "$f10", "");
			Codegen.setRegForFloatBool("$t8", true);
		} else {
			Codegen.generateWithComment("sub", this, "$t8", "$t8", "$t9");
			Codegen.generate("slt", "$t8", "$t8", "$zero");
			Codegen.num2bool("$t8");
		}
	}
}

class GreaterNode extends EqualityBinExpNode {
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
	
	public void generateBinary() {
		if(isDouble) {
			Codegen.generateWithComment("c.lt.d", this, "$f10", "$f8", "");
			Codegen.setRegForFloatBool("$t8", true);
		} else {
			Codegen.generateWithComment("sub", this, "$t8", "$t8", "$t9");
			Codegen.generate("slt", "$t8", "$zero", "$t8");
			Codegen.num2bool("$t8");
		}
	}
}

class LessEqNode extends EqualityBinExpNode {
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

	public void generateBinary() {
		if(isDouble) {
			Codegen.generateWithComment("c.le.d", this, "$f8", "$f10", "");
			Codegen.setRegForFloatBool("$t8", true);
		} else {
			Codegen.generateWithComment("sub", this, "$t8", "$t8", "$t9");
			Codegen.generate("slti", "$t8", "$t8", "1");
			Codegen.num2bool("$t8");
		}
	}
}

class GreaterEqNode extends EqualityBinExpNode {
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
	
	public void generateBinary() {
		if(isDouble) {
			Codegen.generateWithComment("c.le.d", this, "$f10", "$f8", "");
			Codegen.setRegForFloatBool("$t8", true);
		} else {
			Codegen.generateWithComment("sub", this, "$t8", "$t8", "$t9");
			Codegen.generate("li", "$t9", "-1");
			Codegen.generate("slt", "$t8", "$t9", "$t8");
			Codegen.num2bool("$t8");
		}
	}
}


// **********************************************************************
// Subclasses of LogicalBinExpNode
// **********************************************************************

class AndNode extends LogicalBinExpNode {
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
	
	public void generate(){
		String fail = Codegen.nextLabel();
		String done = Codegen.nextLabel();
		
		myExp1.generate();
		Codegen.genPop("$t8", 4);
		Codegen.num2bool("$t8");
		Codegen.generateWithComment("beq", this, "$t8", "$zero", fail);
		
		// First expression passed; now we need to check second
		myExp2.generate();
		Codegen.genPop("$t9", 4);
		Codegen.num2bool("$t9");
		Codegen.generate("beq", "$t9", "$zero", fail);
		// OK, both passed, so set to one
		Codegen.generate("li", "$t8", "1");
		Codegen.generate("j", done);
		// If we're here, at least one failed
		Codegen.generateLabeled(fail, "nop", "");
		Codegen.generate("li", "$t8", "0");
		Codegen.generateLabeled(done, "nop", "endand");
		Codegen.genPush("$t8", 4);
	}
}

class OrNode extends LogicalBinExpNode {
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
	
	public void generate(){
		String pass = Codegen.nextLabel();
		String done = Codegen.nextLabel();
		
		myExp1.generate();
		Codegen.genPop("$t8", 4);
		Codegen.num2bool("$t8");
		Codegen.generateWithComment("bne", this, "$t8", "$zero", pass);
		
		// First expression passed; now we need to check second
		myExp2.generate();
		Codegen.genPop("$t9", 4);
		Codegen.num2bool("$t9");
		Codegen.generate("bne", "$t9", "$zero", pass);
		// OK, both passed, so set to one
		Codegen.generate("li", "$t8", "0");
		Codegen.generate("j", done);
		// If we're here, at least one failed
		Codegen.generateLabeled(pass, "nop", "");
		Codegen.generate("li", "$t8", "1");
		Codegen.generateLabeled(done, "nop", "endand");
		Codegen.genPush("$t8", 4);
	}
}





