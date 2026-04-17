import java.sql.*;

public class DBConnection {
    public static Connection getConnection() {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            return DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/banking_system", "root", "password");
        } catch(Exception e) {
            e.printStackTrace();
            return null;
        }
    }
}
