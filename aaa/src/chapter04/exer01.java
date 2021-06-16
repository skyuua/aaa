package chapter04;

public class exer01 {
	public static void main(String[] args) {
		Husband husband=new Husband();
		husband.setName("sfsf");
		husband.setAge(23);
		Wife wife=new Wife("sfs",23,husband);
		husband.setWife(wife);
		wife.getInfo();
		husband.getInfo();
	}

}
class Husband{
	private String name;
	private int age;
	private Wife wife;
	
	public Husband() {
		super();
	}

	public Husband(String name, int age, Wife wife) {
		super();
		this.name = name;
		this.age = age;
		this.wife = wife;
	}
	
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	public Wife getWife() {
		return wife;
	}

	public void setWife(Wife wife) {
		this.wife = wife;
	}

	public void getInfo() {
		System.out.println("姓名："+name+" 年龄"+age+" 妻子的姓名:"+wife.getName()+" 妻子的年龄："+wife.getAge());
	}
}
class Wife{
	private String name;
	private int age;
	private Husband husband;
	
	public Wife() {
		super();
	}

	public Wife(String name, int age, Husband husband) {
		super();
		this.name = name;
		this.age = age;
		this.husband = husband;
	}
	
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	public Husband getHusband() {
		return husband;
	}

	public void setHusband(Husband husband) {
		this.husband = husband;
	}

	public void getInfo() {
		System.out.println("姓名："+name+" 年龄"+age+" 丈夫的姓名:"+husband.getName()+" 丈夫的年龄："+husband.getAge());
	}
}