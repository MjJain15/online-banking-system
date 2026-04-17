<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Transfer Funds - Online Banking</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
    <div class="transfer-container">
        <h1>Fund Transfer</h1>
        <form method="POST" action="TransferServlet" onsubmit="validateForm(event)">
            <div class="form-group">
                <label for="from_account">From Account:</label>
                <input type="text" id="from_account" name="from_account" required>
            </div>
            <div class="form-group">
                <label for="to_account">To Account:</label>
                <input type="text" id="to_account" name="to_account" required>
            </div>
            <div class="form-group">
                <label for="amount">Amount ($):</label>
                <input type="number" id="amount" name="amount" step="0.01" required>
            </div>
            <button type="submit" class="btn">Transfer</button>
        </form>
        <a href="dashboard.jsp" class="btn back">Back to Dashboard</a>
    </div>
    <script src="js/validation.js"></script>
</body>
</html>
