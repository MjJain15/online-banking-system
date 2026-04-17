<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Login - Online Banking System</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
    <div class="login-container">
        <h1>Secure Banking Portal</h1>
        <form method="POST" action="LoginServlet">
            <div class="form-group">
                <label for="username">Username:</label>
                <input type="text" id="username" name="username" required>
            </div>
            <div class="form-group">
                <label for="password">Password:</label>
                <input type="password" id="password" name="password" required>
            </div>
            <button type="submit" class="btn">Login</button>
        </form>
        <% if(request.getParameter("error") != null) { %>
            <p class="error"><%= request.getParameter("error") %></p>
        <% } %>
    </div>
</body>
</html>
