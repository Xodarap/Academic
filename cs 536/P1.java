// **********************************************************************
// This program is designed to test the Sym and SymTab classes
// It tests all of the Sym methods and the SymTab methods as follows:
//    removeMap: including removing from an empty list, which should
//               cause an exceptioon
//    addMap:    add to an empty and a non-empty SymTab
//    insert: insert into a SymTab with 0 HashMaps (should cause exception),
//                   1 HashMap, and more than 1
//            insert of a new name, and of a duplicate in a SymTab with
//                   just one HashMap and with more than one (should cause
//                   an exception in both cases)
//            insert of a name that is in a HashMap but not the 1st one
//                   (so should NOT cause an exception)
//    localLookup: both successful and failing lookups in a symboltable
//                 with just one HashMap, and in a symboltable with
//                 multiple HashMaps (including a case where localLookup
//                 should fail, but globalLookup should succeed);
//                 lookup after adding a name then calling removeMap;
//                 also test localLookup in a SymTab with NO HashMap
//                 (should just return null, no exception)
//    globalLookup: both successful and failing lookups in a symboltable
//                  with just one HashMap, and in a symboltable with
//                  multiple HashMaps, including cases where the
//                  looked-up name is in the first HashMap, the
//                  last HashMap, and some intermediate HashMap;
//                  also test globalLookup in a SymTab with NO HashMap
//                  (should just return null, no exception)
//    print:     print a SymTab with one empty HashMap, with several non-empty
//               HashMaps, and with no HashMaps
//
// Problems with the Sym and/or SymTab methods are reported to stderr
// **********************************************************************//

import java.io.*;

class P1 {
    public static void main(String[] args)
	throws EmptySymTabException, DuplicateException {
	Sym sym, oneSym;
	SymTab symtab = new SymTab();
	String name, status;  


	// TEST SYM METHODS
	oneSym = new Sym("int");
	String type = oneSym.getType();
	if (! type.equals("int")) {
	    System.err.println("Sym.getType returns wrong value");
	}
	type = oneSym.toString();
	if (! type.equals("int")) {
	    System.err.println("Sym.toString returns wrong value");
	}

	// TEST SYMTAB METHODS

	// test removeMap
	try {
	    symtab.removeMap();
	} catch (EmptySymTabException ex) {
	System.err.println("removeMap: Unexpected EmptySymTabException for removeMap on symtab with one map");
	}

	try {
	    symtab.removeMap();
	    System.err.println("removeMap: No EmptySymTabException for removeMap on symtab with no map");
	} catch (EmptySymTabException ex) {
	}



	// test addMap
	symtab = new SymTab();
	symtab.addMap();
	symtab.addMap();

	// test insert
	symtab = new SymTab();
	symtab.removeMap();
	try {
	    symtab.insert("aaa", oneSym);
	    System.err.println("insert: No EmptySymTab exception when inserting into symtab with no maps");
	} catch (EmptySymTabException ex) {
	}

	symtab.addMap();
	symtab.insert("aaa", oneSym);
	// test duplicate in same map and in a different map
	try {
	    symtab.insert("aaa", oneSym);
	    System.err.println("insert: Missing DuplicateException for insert into table with 1 item");
	} catch (DuplicateException ex) {
	}

	symtab.addMap();
	try {
	    symtab.insert("aaa", oneSym);
	} catch (DuplicateException ex) {
	    System.err.println("insert: DuplicateException for insert into table with dup in different map");
	}

	// test duplicate in a map with more than one item
	symtab.insert("bbb", oneSym);
	try {
	    symtab.insert("aaa", oneSym);
	    System.err.println("insert: Missing DuplicateException for insert into table with 2 items");
	} catch (DuplicateException ex) {
	}

	// test localLookup and globalLookup in a symtab with no map
	symtab = new SymTab();
	symtab.removeMap();
	try {
	    if (symtab.localLookup("aaa") != null) {
		System.err.println("localLookup: did not return null for symtab with no maps");
	    } 
	} catch (Exception ex) {
	    System.err.println("localLookup: unexpected exception for lookup in symtab with no maps");
	}

	try {
	    if (symtab.globalLookup("aaa") != null) {
		System.err.println("globalLookup: did not return null for symtab with no maps");
	    } 
	} catch (Exception ex) {
	    System.err.println("globalLookup: unexpected exception for lookup in symtab with no maps");
	}

	// test localLookup and globalLookup in a symtab with one map
	symtab = new SymTab();
	if (symtab.localLookup("aaa") != null) {
	    System.err.println("localLookup: null not returned for lookup of aaa in new symtab");
	}

	if (symtab.globalLookup("aaa") != null) {
	    System.err.println("gloablLookup: null not returned for lookup of aaa in new symtab");
	}

	symtab.insert("aaa", oneSym);
	if (symtab.localLookup("aaa") == null) {
	    System.err.println("localLookup: unexpected failure for table with 1 item ");
	}
	if (symtab.localLookup("a") != null) {
	    System.err.println("localLookup: unexpected success for table with 1 item ");
	}

	if (symtab.globalLookup("aaa") == null) {
	    System.err.println("globalLookup: unexpected failure for table with 1 item ");
	}
	if (symtab.globalLookup("a") != null) {
	    System.err.println("globalLookup: unexpected success for table with 1 item ");
	}

	// test localLookup and globalLookup in a symtab with four maps
	symtab.addMap();
	symtab.insert("bbb", oneSym);
	symtab.addMap();
	symtab.insert("ccc", oneSym);
	symtab.addMap();
	Sym localSym = new Sym("double");
	symtab.insert("ddd", localSym);
	if (symtab.localLookup("aaa") != null) {
	    System.err.println("localLookup: null not returned for lookup of value aaa in 4th map");
	}
	if (symtab.globalLookup("aaa") != oneSym) {
	    System.err.println("globalLookup: bad value returned for lookup of value aaa in 4th map");
	}

	if (symtab.localLookup("bbb") != null) {
	    System.err.println("localLookup: null not returned for lookup of value bbb in 3rd map");
	}
	if (symtab.globalLookup("bbb") != oneSym) {
	    System.err.println("globalLookup: bad value returned for lookup of value bbb in 3rd map");
	}

	if (symtab.localLookup("ddd") != localSym) {
	    System.err.println("localLookup: bad value returned for lookup of value ddd in local map");
	}
	if (symtab.globalLookup("ddd") != localSym) {
	    System.err.println("globalLookup: bad value returned for lookup of value ddd in local map");
	}

	// test local and global lookups after removing a map
	symtab.removeMap();
	if (symtab.localLookup("ddd") != null) {
	    System.err.println("localLookup: null not returned for lookup of ddd after removing its table");
	}
	if (symtab.globalLookup("ddd") != null) {
	    System.err.println("globalLookup: null not returned for lookup of ddd after removing its table");
	}

	// test print of symtab with no maps, one empty map, two non-empty maps
	symtab = new SymTab();
	symtab.removeMap();
	symtab.print();
	symtab.addMap();
	symtab.print();
	symtab.insert("2aaa", oneSym);
	symtab.addMap();
	symtab.insert("1bbb", oneSym);
	symtab.insert("1ccc", localSym);
	symtab.print();
	
	// insert 10 items, look them all up both locally and globally,
	// both just after one insertion, and after all insertions
	symtab = new SymTab();
	name = "b";
	sym = new Sym("float");
	for (int j=0; j<10; j++) {
	    try {
		symtab.insert(name, sym);
	    } catch (DuplicateException ex) {
		System.err.println("insert: DuplicateException for table with 1 HashMap, multiple entries");
	    } catch (EmptySymTabException ex) {
		System.err.println("insert: EmptySymTabException for table with 1 HashMap, multiple entries");
	    }
	    if (symtab.localLookup(name) == null) {
		System.err.println("localLookup: unexpected failure for table with 1 HashMap, multiple entries");
	    }
	    else if (symtab.localLookup(name) != sym) {
		System.err.println("localLookup: wrong value returned for table with 1 HashMap, multiple entries");
	    }
	    if (symtab.globalLookup(name) == null) {
		System.err.println("globalLookup: unexpected failure for table with 1 HashMap, multiple entries");
	    }
	    else if (symtab.globalLookup(name) != sym) {
		System.err.println("globalLookup: wrong value returned for table with 1 HashMap, multiple entries");
	    }
	    name += "b";
	}

	name = "b";
	for (int j=0; j<10; j++) {
	    if (symtab.localLookup(name) == null) {
		System.err.println("localLookup: unexpected failure for table with 1 HashMap, multiple entries (lookup after inserting all)");
	    }
	    if (symtab.globalLookup(name) == null) {
		System.err.println("globalLookup: unexpected failure for table with 1 HashMap, multiple entries (lookup after inserting all)");
	    }
	    name += "b";
	}

	// SYMTAB WITH TWO HASHMAPS
	// add a new HashMap and try both local and global lookup
	// of entries in the old HashMap
	symtab.addMap();
	name = "b";
	if (symtab.globalLookup(name) != sym) {
	    System.err.println("globalLookup: bad value returned for name in non-local HashMap of table with 2 HashMaps");
	}
	for (int j=0; j<10; j++) {
	    if (symtab.localLookup(name) != null) {
		System.err.println("localLookup: unexpected success for table with 2 HashMaps");
	    }
	    if (symtab.globalLookup(name) != sym) {
		System.err.println("globalLookup: unexpected failure for table with 2 HashMaps ");
	    }
	    name += "b";
	}

	// add names that are already in the first HashMap to the new
	// HashMap; make sure that they can be inserted
	// and that they're found by both local and global lookup
	name = "b";
	for (int j=0; j<10; j++) {
	    sym = new Sym("float");
	    try {
		symtab.insert(name, sym);
		if (symtab.localLookup(name) == null) {
		    System.err.println("localLookup: unexpected null for table with 2 HashMaps");
		}
		else if (symtab.localLookup(name) != sym) {
		    System.err.println("localLookup: wrong value returned for table with 2 HashMaps");
		}
		if (symtab.globalLookup(name) == null) {
		    System.err.println("globalLookup: unexpected failure for table with 2 HashMaps ");
		}
		else if (symtab.globalLookup(name) != sym) {
		    System.err.println("globalLookup: unexpected failure for table with 2 HashMaps");
		}
	    } catch (DuplicateException ex) {
		System.err.println("insert: unexpected DuplicateException for insert into table with 2 HashMaps");
	    } catch (EmptySymTabException ex) {
		System.err.println("insert: unexpected EmptySymTabException for insert into table with 2 HashMaps");
	    }
	    name += "b";
	}
	
	// add names (to the 2nd HashMap) that are NOT in the 1st one
	// make sure both local and global lookup find them
	name = "c";
	for (int j=0; j<10; j++) {
	    sym = new Sym("int");
	    try {
		symtab.insert(name, sym);
		if (symtab.localLookup(name) == null) {
		    System.err.println("localLookup: unexpected failure for table with 2 HashMaps, new name ");
		}
		else if (symtab.localLookup(name) != sym) {
		    System.err.println("localLookup: bad value returned for table with 2 HashMaps, new name ");
		}
		if (symtab.globalLookup(name) == null) {
		    System.err.println("globalLookup: unexpected failure for table with 2 HashMaps, new name ");
		}
		else if (symtab.globalLookup(name) != sym) {
		    System.err.println("globalLookup: bad value returned for table with 2 HashMaps, new name ");
		}
	    } catch (DuplicateException ex) {
		System.err.println("insert: unexpected DuplicateException for table with 2 HashMaps, new name");
	    } catch (EmptySymTabException ex) {
		System.err.println("insert: unexpected EmptySymTabException for table with 2 HashMaps, new name");
	    }
	    name += "b";
	}
	

	// SYMTAB WITH MANY HASHMAPS (20 NAMES IN EACH)
	for (int j=0; j<100; j++) {
	    Integer tableint = new Integer(j);
	    symtab.addMap();
	    for (int k=0; k<20; k++) {
		Integer symint = new Integer(k);
		name = tableint.toString() + symint.toString();
		sym = new Sym("int");
		try {
		    symtab.insert(name, sym);
		    if (symtab.localLookup(name) != sym) {
			System.err.println("localLookup: unexpected failure for table with many HashMaps");
		    }
		    if (symtab.globalLookup(name) != sym) {
			System.err.println("globalLookup: unexpected failure for table with many HashMaps ");
		    }
		} catch (DuplicateException ex) {
		    System.err.println("insert: DuplicateException for table with many HashMaps");
		} catch (EmptySymTabException ex) {
		    System.err.println("insert: EmptySymTabException for table with many HashMaps");
		}
	    }
	}

	// test globalLookup on one name from each HashMap
	for (int j=0; j<100; j++) {
	    Integer tableint = new Integer(j);
	    name = tableint.toString() + "6";
	    if (symtab.globalLookup(name) == null) {
		System.err.println("globalLookup: unexpected failure for table with many HashMaps (after all inserted)");
	    }
	}
    }	
}
