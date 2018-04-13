import static org.junit.jupiter.api.Assertions.*;
import org.junit.jupiter.api.Test;

class CalculationsTest {
	Calculations calc = new Calculations();
	
	@Test
	void testAdd() {
		assertEquals(calc.add(1, 3), 4);
		assertEquals(calc.add(5, 3), 8);
	}

	@Test
	void testSubtract() {
		assertEquals(calc.subtract(1, 3), -2);
		assertEquals(calc.subtract(3, 1), 2);
	}

	@Test
	void testMultiply() {
		assertEquals(calc.multiply(0, 3), 0);
		assertEquals(calc.multiply(1, 3), 3);
		assertEquals(calc.multiply(5, 3), 15);
		assertEquals(calc.multiply(-5, 3), -15);
	}

	@Test
	void testDivide() {
		assertEquals(calc.divide(0, 3), 0);
		assertEquals(calc.divide(3, 1), 3);
		assertEquals(calc.divide(6, 3), 2);
	}

}
