package adminPackage;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import jakarta.servlet.http.HttpSession;

public class DatabaseUtilization {

    private static Connection con = null;
    private static PreparedStatement ps = null;
    private static ResultSet rs = null;

    public static boolean validateAdminLogin(HttpSession session, String uName, String uPassword) {
        boolean isValid = false;

        try {
            con = DatabaseConnect.getConnection();
            String sql = "SELECT * FROM admin WHERE userName=? AND password=?";
            ps = con.prepareStatement(sql);
            ps.setString(1, uName);
            ps.setString(2, uPassword);
            rs = ps.executeQuery();

            if (rs.next()) {
                session.setAttribute("userLoginName", uName);
                isValid = true;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return isValid;
    }

    public static List<Admin> getAdminDetails(String adminName) {
        List<Admin> adminList = new ArrayList<>();
        try {
            con = DatabaseConnect.getConnection();
            String sql = "SELECT * FROM admin WHERE userName=?";
            ps = con.prepareStatement(sql);
            ps.setString(1, adminName);
            rs = ps.executeQuery();

            while (rs.next()) {
                int id = rs.getInt("adminID");
                String name = rs.getString("adminName");
                String role = rs.getString("adminRole");
                String userName = rs.getString("userName");
                String password = rs.getString("password");

                Admin admin = new Admin(id, name, role, userName, password);
                adminList.add(admin);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return adminList;
    }

    // Update Admin Details
    public static boolean updateAdminDetails(String id, String name, String role, String userName, String password) {
        boolean isUpdated = false;
        try {
            con = DatabaseConnect.getConnection();
            String sql = "UPDATE admin SET adminName=?, adminRole=?, userName=?, password=? WHERE adminID=?";
            ps = con.prepareStatement(sql);
            ps.setString(1, name);
            ps.setString(2, role);
            ps.setString(3, userName);
            ps.setString(4, password);
            ps.setString(5, id);

            int result = ps.executeUpdate();
            isUpdated = (result > 0);

        } catch (Exception e) {
            e.printStackTrace();
        }
        return isUpdated;
    }

    // Delete Admin Details
    public static boolean deleteAdmin(String id) {
        boolean isDeleted = false;
        try {
            con = DatabaseConnect.getConnection();
            String sql = "DELETE FROM admin WHERE adminID=?";
            ps = con.prepareStatement(sql);
            ps.setString(1, id);

            int result = ps.executeUpdate();
            isDeleted = (result > 0);

        } catch (Exception e) {
            e.printStackTrace();
        }
        return isDeleted;
    }

    public static boolean insertAdminDetails(String name, String role, String userName, String password) {
        boolean isInserted = false;
        Connection con = null;
        PreparedStatement ps = null;

        try {
            con = DatabaseConnect.getConnection();

            String sql = "INSERT INTO admin(adminName, adminRole, userName, password) VALUES (?, ?, ?, ?)";
            ps = con.prepareStatement(sql);

            ps.setString(1, name);
            ps.setString(2, role);
            ps.setString(3, userName);
            ps.setString(4, password);

            int result = ps.executeUpdate();
            isInserted = (result > 0);
            System.out.println("Insert Result: " + result);

        } catch (SQLException e) {
            System.err.println("SQL Error: " + e.getMessage());
            e.printStackTrace();
        } finally {
            try {
                if (ps != null) ps.close();
                if (con != null) con.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return isInserted;
    }

}
