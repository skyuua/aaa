package project01;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.io.Reader;

public class FamilyAccount {
	public static void main(String[] args) {
		int account=10000;
		boolean flag=true;
		
		while(flag) {
		BufferedReader br=null;
		BufferedWriter bw=null;
		System.out.println("--------家庭收支记账软件-----------");
		System.out.println("\t1收支明细");
		System.out.println("\t2登记收入");
		System.out.println("\t3登记支出");
		System.out.println("\t4退        出");
		System.out.print("\t请选择（1-4）：");
		char choice=Utility.readMenuSelection();
		switch(choice) {
		case '1':
			System.out.println("--------当前收支明细记录-----------");
			System.out.println("收支\t账户金额\t收支金额\t说 明");
			try {
				br=new BufferedReader(new FileReader("detail.txt"));
				String data;
				while((data=br.readLine())!=null) {
					System.out.println(data);
				}
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				if(br!=null) {
					try {
						br.close();
					} catch (IOException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}
			}
			break;
		case '2':
			int money;
			String detail;
			System.out.print("本次收入金额：");
			money=Utility.readNumber();
			account+=money;
			System.out.print("本次收入说明：");
			detail=Utility.readString();
			try {
				bw=new BufferedWriter(new FileWriter("detail.txt",true));
				bw.write("收入\t"+account+"\t"+money+"\t"+detail);
				bw.newLine();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				if(bw!=null) {
					try {
						bw.close();
					} catch (IOException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}
			}
			break;
		case '3':
			int money1;
			String detail1;
			System.out.print("本次支出金额：");
			money1=Utility.readNumber();
			account-=money1;
			System.out.print("本次支出说明：");
			detail1=Utility.readString();
			try {
				bw=new BufferedWriter(new FileWriter("detail.txt",true));
				bw.write("支出\t"+account+"\t"+money1+"\t"+detail1);
				bw.newLine();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				if(bw!=null) {
					try {
						bw.close();
					} catch (IOException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}
			}
			break;
		case '4':
			System.out.print("确认是否退出(Y/N)：");
			if(Utility.readConfirmSelection()=='Y') {
				flag=false;
				
			}
			break;
		}
		}
		
	}
}
