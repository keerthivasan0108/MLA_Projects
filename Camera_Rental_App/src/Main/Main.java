package Main;

import java.util.Scanner;

import javax.sound.midi.SysexMessage;

import Login.Login;
import Options.My_camera;
import Options.options;

public class Main {
	static Scanner sc = new Scanner(System.in);
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		options o = new options();
		o.dummy_data_mycamera();
		o.dummy_data_all_cameras();
		
		System.out.println("+------------------------------------+");
		System.out.println("|	WELCOME TO CAMERA RENTAL APP	 |");
		System.out.println("+------------------------------------+");
		System.out.println("PLEASE LOGIN TO CONTINUE - ");
		System.out.println();
		Login obj = new Login();
		
		
	}
	
	

}
