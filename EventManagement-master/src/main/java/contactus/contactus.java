package contactus;

public class contactus {
	private int ID;
	private String Name;
	private String Email;
	private String Message;
	
	
	public contactus(int ID, String Name, String Email, String Message) {
		this.ID = ID;
		this.Name = Name;
		this.Email = Email;
		this.Message = Message;
	}

	public int getUserID() { 
		return ID;
	}

	public String getUserName() {
		return Name;
	}
	
	public String getUserEmail() {
		return Email;
	}

	public String getUserPhone() {
		return Message;
	}
}





