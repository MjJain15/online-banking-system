import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;
import java.time.LocalDateTime;

public class TransferServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String fromAccount = request.getParameter("from_account");
        String toAccount = request.getParameter("to_account");
        double amount = Double.parseDouble(request.getParameter("amount"));
        
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/banking_system", "root", "password");
            
            // Check balance
            String checkBalance = "SELECT balance FROM accounts WHERE account_number=?";
            PreparedStatement pst1 = conn.prepareStatement(checkBalance);
            pst1.setString(1, fromAccount);
            ResultSet rs = pst1.executeQuery();
            
            if(rs.next() && rs.getDouble("balance") >= amount) {
                // Deduct from sender
                String deduct = "UPDATE accounts SET balance=balance-? WHERE account_number=?";
                PreparedStatement pst2 = conn.prepareStatement(deduct);
                pst2.setDouble(1, amount);
                pst2.setString(2, fromAccount);
                pst2.executeUpdate();
                
                // Add to receiver
                String add = "UPDATE accounts SET balance=balance+? WHERE account_number=?";
                PreparedStatement pst3 = conn.prepareStatement(add);
                pst3.setDouble(1, amount);
                pst3.setString(2, toAccount);
                pst3.executeUpdate();
                
                response.sendRedirect("dashboard.jsp?success=Transfer successful");
            } else {
                response.sendRedirect("transfer.jsp?error=Insufficient balance");
            }
            conn.close();
        } catch(Exception e) {
            e.printStackTrace();
        }
    }
}
