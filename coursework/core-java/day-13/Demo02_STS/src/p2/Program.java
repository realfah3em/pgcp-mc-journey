package p2;

class Outer {
	static int outerField1 = 10;
	int outerField2 = 20;

	// non static nested class
	class Inner {
		// static fields cannot be declared
		// static int innerfield1;

		// only non static fields are allowed
		int innerField2 = 200;

		// static methods cannot be defined
		// public static void method1() {}

		// only non static methods can be defined
		public void method2() {
			System.out.println(innerField2);
			System.out.println(outerField1);
			System.out.println(outerField2); // OK
		}

	}
}

public class Program {

	public static void main(String[] args) {
		// Outer o1 = new Outer();
		// Outer.Inner in = o1.new Inner();

		Outer.Inner in = new Outer().new Inner();

	}

}
