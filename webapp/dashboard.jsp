<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Dashboard - Online Banking</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
    <div class="dashboard-container">
        <h1>Welcome, <%= session.getAttribute("username") %></h1>
        
        <div class="account-info">
            <h2>Your Accounts</h2>
            <%
                String username = (String) session.getAttribute("username");
                if(username == null) {
                    response.sendRedirect("login.jsp");
                    return;
                }
                
                try {
                    Connection conn = DBConnection.getConnection();
                    String query = "SELECT * FROM accounts WHERE username=?";
                    PreparedStatement pst = conn.prepareStatement(query);
                    pst.setString(1, username);
                    ResultSet rs = pst.executeQuery();
                    
                    while(rs.next()) {
                        out.println("<div class='account'>");
                        out.println("<p>Account: " + rs.getString("account_number") + "</p>");
                        out.println("<p>Balance: $" + rs.getDouble("balance") + "</p>");
                        out.println("</div>");
                    }
                    conn.close();
                } catch(Exception e) {
                    e.printStackTrace();
                }
            %>
        </div>
        
        <a href="transfer.jsp" class="btn">Make Transfer</a>
        <a href="logout.jsp" class="btn logout">Logout</a>
    </div>
</body>
</html>
