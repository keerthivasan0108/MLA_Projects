package Options;

public class All_cameras {
	int Camera_id;
	String Camera_brand;
	String Camera_Model;
	double Price;
	String status;
	public All_cameras(int camera_id, String camera_brand, String camera_Model, double price, String status) {
		
		this.Camera_id = camera_id;
		this.Camera_brand = camera_brand;
		this.Camera_Model = camera_Model;
		this.Price = price;
		this.status = status;
	}
	
	public void list_all_cameras() {
		System.out.printf("%-10s %-15s %-15s %-12s %-10s%n",this.Camera_id,this.Camera_brand,this.Camera_Model,this.Price,this.status);
	}
	
}
