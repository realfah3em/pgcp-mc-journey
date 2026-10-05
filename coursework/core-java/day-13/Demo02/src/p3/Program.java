package p3;

// static local class is not allowed
// local class allows only non static fields and methods
class Test {
	static int outer_field1 = 10;
	int outer_field2 = 20;

	public void method1() {
		class Local {
			int local_field1 = 10;

			public void method1() {
				System.out.println(local_field1);
				System.out.println(outer_field1);
				System.out.println(outer_field2);
			}

			// static int local_field2 = 20; // NOT OK
			// public static void method2() {} // NOT OK
		}
		// Local class is accessiable only within the methods they are declared
		Local l1 = new Local();
	}

	public static void method2() {
		class Local {
			int local_field1 = 10;

			public void method1() {
				System.out.println(local_field1);
				System.out.println(outer_field1);
				// System.out.println(outer_field2); // NOT OK

			}

			// static int local_field2 = 20; // NOT OK
			// public static void method2() {} // NOT OK
		}

		Local l1 = new Local();
	}
}

public class Program {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

	}

}
