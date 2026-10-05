package p1;

public class Program01 {

	public static void main(String[] args) {
		// get the meta data object of any class
		// way 1
		Class<?> c1 = String.class;

		// way 2
		String s1 = "sunbeam";
		Class<?> c2 = s1.getClass();

		// way 3
		try {
			Class<?> c3 = Class.forName("java.lang.String");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}

}
