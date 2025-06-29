package contactus;

import java.sql.Connection;
import java.sql.Statement;

public class contacusUtil {
	
	private static boolean successMsg;
	private static Connection con = null;
	private static Statement st = null;

	// Insert data into the contactus table
	public static boolean insertcontactus(String name, String email, String message) {
		successMsg = false;

		try {
			// Establish the connection
			con = DBconnect.getConnection();
			st = con.createStatement();
			
			// SQL insert query
			String sql = "INSERT INTO contactus (Name, Email, Message) VALUES ('"+name+"', '"+email+"', '"+message+"')";
			int result = st.executeUpdate(sql);
			
			// Check if the query was successful
			if (result > 0) {
				successMsg = true;
			}
		} catch (Exception e) {
			System.out.println("Error while inserting contact details: " + e.getMessage());
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
