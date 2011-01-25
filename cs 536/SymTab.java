import java.util.*;

/*
	Class representing a symbol table
*/
public class SymTab {
    private List<HashMap<String, Sym>> symList = new LinkedList<HashMap<String, Sym>>();

	/*	Adds a symbol to the current table */
    public void insert(String name, Sym sym) 
	throws DuplicateException, EmptySymTabException
    {
	if (symList.size() == 0){
	    throw new EmptySymTabException();
	}

	HashMap<String, Sym> currentList = symList.get(0);
	if (currentList.containsKey(name)){
	    throw new DuplicateException();
	}

	currentList.put(name, sym);
    }

		/* Push a new map onto the list oof symbol maps */
    public void addMap(){
	if (symList.size() == 0){
		symList.add(new HashMap<String, Sym>());
	} else {
	symList.add(0, new HashMap<String, Sym>());
	}
    }

		/* Return the symbol of a given type, or null if none 
				exists in the current map 
		*/
    public Sym localLookup(String name){
	if (symList.size() == 0) { return null; }
	return symList.get(0).get(name);
    }

    public Sym globalLookup(String name){
	for (HashMap<String, Sym> map : symList){
	    if (map.get(name) != null){
		return map.get(name);
	    }
	}
	return null;
    }

    public void removeMap() 
	throws EmptySymTabException
    {
	if (symList.size() == 0)
		throw new EmptySymTabException();
	symList.remove(0);
    }

    public void print()
    {
	System.out.println("\nSYMBOL TABLE\n");
	for(HashMap<String, Sym> map : symList){
	    System.out.println(map.toString());
	}
    }
}

