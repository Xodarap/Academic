public class Sym
{
    private String symType;
    public Sym(String type){
	symType = type;
    }

    public String getType(){
	return symType;
    }

    public String toString(){
	return getType();
    }
}