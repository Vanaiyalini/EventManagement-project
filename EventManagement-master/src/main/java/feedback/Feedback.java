package feedback;

public class Feedback {
	private int ID;
	private String Name;
	private String Email;
	private String Review;
	
	public Feedback(int ID, String Name, String Email, String Review) {
		this.ID = ID;
		this.Name = Name;
		this.Email = Email;
		this.Review = Review;
	}

	public int getFeedbackID() { 
		return ID;
	}

	public String getUserName() {
		return Name;
	}
	
	public String getUserEmail() {
		return Email;
	}

	public String getUserReview() {
		return Review;
	}
}
