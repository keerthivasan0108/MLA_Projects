package Options;

import java.util.HashMap;
import java.util.Map;
import java.util.Scanner;

public class options {
	static HashMap<Integer,My_camera> my_cameras = new HashMap<>();
	static HashMap<Integer,All_cameras> all_cameras = new HashMap<>();
	static Scanner sc = new Scanner(System.in);
	static boolean choice1 = true;
	static boolean choice2 = true;
	static boolean choice3 = true;
	public static void option() {
		
		
		while(choice1) {
			System.out.println("1. MY CAMERA");
			System.out.println("2. RENT A CAMERA");
			System.out.println("3. VIEW ALL CAMERAS");
			System.out.println("4. MY WALLET");
			System.out.println("5. EXIT");
			System.out.println();
			System.out.print("ENTER THE OPTION TO PROCEED : ");
			int o = sc.nextInt();
			cases(o);
		}
		
		
		
	}
	
	public static void cases(int o) {
		
		
		switch(o) {
			case 1:
				System.out.println();
				choice2 = true;
				mycamera();
				break;
			case 2:
				Rent_camera();
				break;
			case 3:
				list_all_cameras();
				break;
			case 4:
				choice3 = true;
				Wallet_option();
				break;
			case 5:
				choice1 = false;
				System.out.println();
				System.out.println("Exiting...");
				break;
				
				
		}
	}
	
	public static void mycamera() {
							
		while(choice2) {
			System.out.println("1. ADD");
			System.out.println("2. REMOVE");
			System.out.println("3. VIEW MY CAMERAS");
			System.out.println("4.GO TO PREVIOUS MENU");
			System.out.println();
			System.out.print("ENTER THE OPTION TO PROCEED : ");
			int m = sc.nextInt();
			sc.nextLine();
			
			switch(m) {
				case 1:
					System.out.println("ENTER THE CAMERA BRAND - ");
					String brand = sc.nextLine();
					System.out.println("ENTER THE MODEL - ");
					String model = sc.nextLine();
					System.out.println("ENTER THE PER DAY PRICE (INR) - ");
					double price = sc.nextDouble();
					sc.nextLine();
					System.out.println("ENTER THE STATUS - ");
					String status = sc.nextLine();
					add_my_camera(brand,model,price,status);
					
					break;
				case 2:
					System.out.println();
					list_all_my_cameras();
					System.out.println("ENTER THE CAMERA ID TO REMOVE - ");
					int id = sc.nextInt(); 
					remove_my_camera(id);
					break;
				case 3:
					list_all_my_cameras();
					
					break;
				case 4:
					choice2 = false;
					break;
					
			}
				
			
		}
		
	}
	
	
	public static void dummy_data_mycamera() {
		my_cameras.put(1, new My_camera(1, "Canon", "EOS 1500D", 35000.0f, "Available"));
		my_cameras.put(4, new My_camera(4, "Fujifilm", "X-T200", 52000.0f, "Available"));
		my_cameras.put(7, new My_camera(7, "Leica", "V-Lux 5", 95000.0f, "Rented"));
//		my_cameras.put(4, new My_camera(14,"Sony","DSLR12",200.0,"Available"));
//		my_cameras.put(5, new My_camera(15,"Samsung","SM123",200.0,"Available"));
//		my_cameras.put(6, new My_camera(16,"SONY","SONY1234",123.0,"Available"));
//		my_cameras.put(7, new My_camera(17,"canon","5050",25000.0,"Available"));
//		my_cameras.put(8, new My_camera(18,"nikon","2030",500.0,"Available"));

	}
	
	public static void dummy_data_all_cameras() {
		  all_cameras.put(1, new All_cameras(1, "Canon", "EOS 1500D", 35000.0f, "Available"));
	      all_cameras.put(2, new All_cameras(2, "Nikon", "D3500", 40000.0f, "Available"));
	      all_cameras.put(3, new All_cameras(3, "Sony", "Alpha ILCE-6000Y", 58000.0f, "Rented"));
	      all_cameras.put(4, new All_cameras(4, "Fujifilm", "X-T200", 52000.0f, "Available"));
	      all_cameras.put(5, new All_cameras(5, "Panasonic", "Lumix G7", 45000.0f, "Available"));
	      all_cameras.put(6, new All_cameras(6, "Olympus", "OM-D E-M10 Mark IV", 62000.0f, "Available"));
	      all_cameras.put(7, new All_cameras(7, "Leica", "V-Lux 5", 95000.0f, "Rented"));
	      all_cameras.put(8, new All_cameras(8, "GoPro", "Hero 10 Black", 55000.0f, "Available"));
	      all_cameras.put(9, new All_cameras(9, "Canon", "PowerShot G7 X Mark III", 60000.0f, "Available"));
	      all_cameras.put(10, new All_cameras(10, "Nikon", "Z50", 78000.0f, "Available"));
	}
	
	public static void list_all_my_cameras() {
		System.out.println();
		System.out.println("=== CAMERA PRODUCT LIST ===");
	    System.out.printf("%-10s %-15s %-15s %-12s %-10s%n",
	            "CAMERA_ID", "BRAND", "MODEL", "PRICE(₹)", "STATUS");
	    System.out.println("-----------------------------------------------------------------------");
		for(Map.Entry<Integer, My_camera> map : my_cameras.entrySet()) {
			My_camera a = map.getValue();
			a.list_camera();
		}
		System.out.println("-----------------------------------------------------------------------");
	}
	
	public static void list_all_cameras() {
		System.out.println();
		System.out.println("=== CAMERA PRODUCT LIST ===");
	    System.out.printf("%-10s %-15s %-15s %-12s %-10s%n",
	            "CAMERA_ID", "BRAND", "MODEL", "PRICE(₹)", "STATUS");
	    System.out.println("-----------------------------------------------------------------------");
	    
	    for(Map.Entry<Integer,All_cameras> map:all_cameras.entrySet()) {
	    	All_cameras a = map.getValue();
	    	a.list_all_cameras();
	    }
	    System.out.println("-----------------------------------------------------------------------");
	}
	
	public static void add_my_camera(String Brand,String Model,double Price,String status) {
		int lastid = 0;
		for(Map.Entry<Integer, All_cameras> map : all_cameras.entrySet()) {
			All_cameras a = map.getValue();
			lastid = a.Camera_id;
			
		}
		lastid++;
		all_cameras.put(lastid,new All_cameras(lastid,Brand,Model,Price,status));
		my_cameras.put(lastid,new My_camera(lastid,Brand,Model,Price,status));
		System.out.println();
		System.out.println("YOUR CAMERA HAS BEEN SUCCESSFULLY ADDED TO THE LIST.");
		
	}
	
	public static void remove_my_camera(int id) {
		
		my_cameras.remove(id);
		System.out.println();
		System.out.println("CAMERA SUCCESSFULLY REMOVED FROM THE LIST");
		System.out.println();
	}
	
	public static void Wallet_option() {
		while(choice3) {
			System.out.println();
			System.out.println("1.CHECK BALANCE ");
			System.out.println("2. DEPOSIT AMOUNT");
			System.out.println("3. GO TO PREVIOUS MENU");
			
			System.out.println("ENTER THE OPTION TO PROCEED : ");
			int o = sc.nextInt();
			Wallet w = new Wallet();
			switch(o) {
				case 1:
					w.Check_Balance();
					break;
				case 2:
					System.out.println("ENTER A AMOUNT : ");
					int b = sc.nextInt();
					w.deposit(b);
					break;
				case 3:
					choice3 = false;
					break;
				
			}
			
		}
	}
	
	public static void Rent_camera() {
		list_all_cameras();
		System.out.println("ENTER THE CAMERA ID TO BE RENTED : ");
		int id = sc.nextInt();
		boolean rented = false;
		boolean Id = false;
		
		
		
			String rentedd = all_cameras.get(id).status;
			if(rentedd.equals("Rented")) {
				
				rented = true;
				
			}
		
		
		for(Map.Entry<Integer, My_camera> map1:my_cameras.entrySet()) {
			My_camera m1 = map1.getValue();
			if(m1.Camera_id==id) {
				
				Id = true;
				break;
			}
			
		}
		
		
		
		Wallet w = new Wallet();
		
		if(w.Get_balance()<all_cameras.get(id).Price || rented || Id) {
			if(rented) {
				System.out.println();
				System.out.println("THE CAMERA IS OUT OF STOCKS");
				System.out.println();
			}
			else if(Id){
				System.out.println();
				System.out.println("YOU ALREADY RENTED IT.");
				System.out.println();
			}
			else {
				System.out.println();
				System.out.println("THE AVAILABLE BALANCE IS LOW");
				System.out.println();
			}
		}
		else {
			System.out.println();
			System.out.println("THE CAMERA IS RENTED SUCCESSFULLY");
			all_cameras.get(id).status = "Rented";
			System.out.println();
		}
		
	    
	}
	
}

