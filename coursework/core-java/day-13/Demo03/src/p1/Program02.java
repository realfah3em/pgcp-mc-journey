package p1;

import java.lang.reflect.Constructor;
import java.lang.reflect.Field;
import java.lang.reflect.Method;

public class Program02 {

	public static void myJavapTool(String classname) {
		try {
			Class<?> c = Class.forName(classname);

			System.out.println("Information about - " + c.getSimpleName() + " class");
			System.out.println("Super class - " + c.getSuperclass());

			// fields
			System.out.println("Fields of the class - ");
			Field[] fields = c.getDeclaredFields();
			for (Field f : fields) {
				System.out.println(f);
			}
			System.out.println("------------------------------------------------");

			// constructors
			System.out.println("Constructors of the class - ");
			Constructor[] constructors = c.getDeclaredConstructors();
			for (Constructor constructor : constructors)
				System.out.println(constructor);
			System.out.println("------------------------------------------------");

			// methods
			Method[] methods = c.getDeclaredMethods();
			for (Method method : methods)
				System.out.println(method);
			System.out.println("------------------------------------------------");

		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}

	}

	public static void main(String[] args) {
		// javap java.lang.String
//		myJavapTool("java.lang.String");
//		myJavapTool("java.lang.Object");
//		myJavapTool("java.util.ArrayList");
//		myJavapTool("java.util.Vector");
		myJavapTool("java.util.Scanner");
	}

}
