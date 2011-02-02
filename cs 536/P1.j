import java.util.*;
/*
	Tests the Sym and SymTab classes	
*/
public class P1 {
	public static void main(String[] args){
		testSym();
		testSymTab();
	}

	private static void testSymTab(){
		try {
			SymTab s = new SymTab();
			Sym sm = new Sym("test");
			try {
				s.insert("test", sm);
				System.out.println("Didn't throw empty exception");
			} catch (EmptySymTabException e) { }
			try {
				s.removeMap();
				System.out.println("Didn't throw empty exception");
			} catch (EmptySymTabException e) { }

			s.addMap();
			s.insert("test", sm);
			try {
				s.insert("test", sm);
				System.out.println("Didn't throw dup exception");
			} catch (DuplicateException e) { }

			if (s.localLookup("test") == null || s.globalLookup("test") == null) {
				System.out.println("Didn't get inserted");
			}
			s.addMap();
			if (s.localLookup("test") != null || s.globalLookup("test") == null) {
				System.out.println("Didn't work with two lists");
			}
			s.removeMap();
			if (s.localLookup("test") == null || s.globalLookup("test") == null) {
				System.out.println("Remove didn't work");
			}
		} catch (Exception e) {
			System.out.println("Unknown exception:" + e.toString());
			e.printStackTrace();
		}
	}

	private static void testSym(){
		Sym s = new Sym("test");
		if (s.getType() != "test"){
			System.out.println("Sym didn't have type test");
		}
	}
}
