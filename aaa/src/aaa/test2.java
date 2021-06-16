package aaa;

class A {
	private int a;

	public void setA(int a) {
		this.a = a;
	}

	public int getA() {
		return a;
	}
}

class B extends A {
	private int a;

	public void setA(int a) {
		this.a = a;
	}
	 public int getA(){
	 return a;
	 }
}

public class test2 {

	public static void main(String[] args) {
		A c = new B();

		c.setA(5);

		System.out.println(c.getA());
	}
}


