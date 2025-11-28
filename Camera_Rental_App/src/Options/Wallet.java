package Options;

public class Wallet {
	static double my_balance = 200000;
	
	public void deposit(double amt) {
		my_balance += amt;
	}
	
	public void Check_Balance() {
		System.out.println("Available Balance : "+my_balance);
		
	}
	
	public double Get_balance() {
		return my_balance;
	}
}
