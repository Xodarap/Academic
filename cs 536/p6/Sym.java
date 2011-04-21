import java.util.*;

// **********************************************************************
// The Sym class defines a symbol-table entry;
// an object that contains a type (a String).
// **********************************************************************
//
// Methods
// =======
//
// constructor
// -----------
// Sym(String S)         -- constructor: creates a Sym with the given type
//
// accessor
// --------
// type()             -- returns this symbol's type
//
// other
// -----
// makeComplete()    -- marks this sym as complete
// toString()        -- prints the values associated with this Sym

class Sym {
    public Sym(String T) {
	myType = T;
	myComplete = true;
    }

    public Sym(String T, boolean comp) {
	this(T);
	myComplete = comp;
    }

    public String type() {
	return myType;
    }

    public String toString() {
	return "";
    }

    public void setReg(int num){
	if (num < 8)
	    register = "$t" + Integer.toString(num);
	else
	    register = "too many args";
    }

  // fields
    protected String myType;
    public int offset;
    public String register = "$tz";
    private boolean myComplete;
}

// **********************************************************************
// The FnSym class is a subclass of the Sym class, just for functions.
// The myReturnType field holds the return type, and there are new fields
// to hold information about the parameters.
// **********************************************************************
class FnSym extends Sym {
    public FnSym(String T, int numparams) {
	super("->"+T);
	myReturnType = T;
	myNumParams = numparams;
    }

    public void addFormals(LinkedList<Sym> L) {
	myParamTypes = new LinkedList<String>();
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

    public LinkedList<String> paramTypes() {
	return myParamTypes;
    }

    // new fields
    private String myReturnType;
    private int myNumParams;
    private LinkedList<String> myParamTypes;
}


