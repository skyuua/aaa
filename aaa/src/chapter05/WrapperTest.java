package chapter05;

import org.junit.jupiter.api.Test;

public class WrapperTest {
	@Test
	public void test1() {
		int num1=10;
		Integer integer = new Integer(num1);
		Integer integer2 = new Integer("10");
		System.out.println(integer==integer2);
		System.out.println(integer==num1);
		double doubleValue = integer.doubleValue();
		System.out.println(integer.toString());
	}
	@Test
	public void test2() {
		Integer in1=new Integer(12);
		int num1=in1.intValue();
		double doubleValue = in1.doubleValue();
		System.out.println(doubleValue);
	}
}
