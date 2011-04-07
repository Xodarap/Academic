import java.util.*;

// **********************************************************************
// The Sym class defines a symbol-table entry;
// an object that contains a name (a String) and a type (a String).
// **********************************************************************
//
// Methods
// =======
//
// constructor
// -----------
// Sym(String S)         -- constructor: creates a Sym with the given name
// Sym(String S, String T) -- constructor: creates a Sym with the given name
//                          and the given type
// accessor
// --------
// name()             -- returns this symbol's name
// type()             -- returns this symbol's type
//
// other
// -----
// makeComplete()    -- marks this sym as complete
// toString()        -- prints the values associated with this Sym

class Sym {
    public Sym(String S) {
	myName = S;
	myComplete = true;
    }

    public Sym(String S, String T) {
	this(S);
	myType = T;
    }

    public Sym(String S, String T, boolean comp) {
	this(S, T);
	myComplete = comp;
    }

    public String name() {
	return myName;
    }

    public String type() {
	return myType;
    }

    public String toString() {
	return "";
    }

  // fields
    private String myName;
    protected String myType;
    private boolean myComplete;
}

// **********************************************************************
// The FnSym class is a subclass of the Sym class, just for functions.
// The myReturnType field holds the return type, and there are new fields
// to hold information about the parameters.
// **********************************************************************
class FnSym extends Sym {
    public FnSym(String S, String T, int numparams) {
	super(S, "->"+T);
	myReturnType = T;
	myNumParams = numparams;
    }

    public void addFormals(LinkedList<Sym> L) {
	myParamSyms = L;
	// UPDATE TYPE STRING
	boolean first = true;
	Iterator<Sym> it = L.descendingIterator();
	while (it.hasNext()) {
	    Sym oneSym = it.next();
	    if (first) {
		myType = oneSym.type() + myType;
		first = false;
	    } else {
		myType = oneSym.type() + "," + myType;
	    }
	}
    }
    
    public String returnType() {
	return myReturnType;
    }

    public int numparams() {
	return myNumParams;
    }

    public LinkedList<Sym> paramTypes() {
	return myParamSyms;
    }

    // new fields
    private String myReturnType;
    private int myNumParams;
    private LinkedList<Sym> myParamSyms;
}


