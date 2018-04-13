public class CalculationsRunner {
	public static void main(String[] args) {
		Calculations calc = new Calculations();
		if (args.length != 2) {
			System.out.println("You must run the program with two numbers!");
		} else {
			try {
				double left = Double.parseDouble(args[0]);
				double right = Double.parseDouble(args[1]);
				
				System.out.println(left + " + " + right + " = " + calc.add(left, right));
				System.out.println(left + " - " + right + " = " + calc.subtract(left, right));
				System.out.println(left + " * " + right + " = " + calc.multiply(left, right));
				System.out.println(left + " / " + right + " = " + calc.divide(left, right));
			} catch (NumberFormatException nfe) {
				System.out.println("The input you entered did not consist of numerical values!");
			}
		}
	}

}
