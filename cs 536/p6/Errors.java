// Errors
//
// This class is used to generate warning and fatal error messages.

class Errors {
    public static Boolean errors = false;

    static void fatal(int lineNum, int charNum, String msg) {
        System.err.println(lineNum + ":" + charNum + " **ERROR** " + msg);
	Errors.errors = true;
    }

    static void warn(int lineNum, int charNum, String msg) {
        System.err.println(lineNum + ":" + charNum + " **WARNING** " + msg);
    }
}
