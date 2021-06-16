package aaa;

class Super {
	public int get() {
		return 4;
	}
}

class test1 extends Super {
	
	public static void main(String[] args) {
		double a = 2.0;
		double b = 2.0;
		Double c = 2.0;
		Double d = 2.0;
		Integer t=1;
		System.out.println(a == b);
		System.out.println(c == d);
		System.out.println(a == d);

	}
}
