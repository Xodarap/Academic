
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

    // default version of typeCheck for var and formal decls
    public void typeCheck() {
    }
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

    // 2 kids
    private TypeNode myType;
    private IdNode myId;
}
