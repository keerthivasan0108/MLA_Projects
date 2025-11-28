package Login;

import java.util.Scanner;

import Options.options;

public class Login {
	Scanner sc = new Scanner(System.in);
	public Login() {
		
		System.out.print("USERNAME - ");
		String user = sc.next();
		System.out.print("PASSWORD - ");
		String pass = sc.next();
		validate(user, pass);
		
	}
	
	public static void validate(String user, String pass) {
		if(user.equals("admin") && pass.equals("admin123")) {
			options o = new options();
			o.option();
		}
		else {
			System.out.println("INVALID USERNAME OR PASSWORD");
			new Login();
		}
		
	}
	
	
}
