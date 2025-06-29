package feedback;

import java.sql.Connection;
import java.sql.Statement;

public class feedbackUtil {
	
	private static boolean successMsg;
	private static Connection con = null;
	private static Statement st = null;

	public static boolean insertFeedback(String name, String email, String review) {
		successMsg = false;

		try {
			con = FeedbackDBConnect.getConnection(); 
			st = con.createStatement();
			
			
			String sql = "INSERT INTO feedback (Name, Email, Review) VALUES ('" + name + "', '" + email + "', '" + review + "')";
			int result = st.executeUpdate(sql);
			
			if (result > 0) {
				successMsg = true;
			}
		} catch (Exception e) {
			System.out.println("Error while inserting feedback: " + e.getMessage());
			e.printStackTrace();
		} finally {
			try {
				if (st != null) st.close();
				if (con != null) con.close();
			} catch (Exception e) {
				System.out.println("Error closing resources: " + e.getMessage());
			}
		}
		
		return successMsg;
	}
}
