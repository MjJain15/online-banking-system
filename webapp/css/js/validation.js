function validateForm(event) {
    const fromAccount = document.getElementById("from_account").value;
    const toAccount = document.getElementById("to_account").value;
    const amount = document.getElementById("amount").value;
    
    if (fromAccount === "" || toAccount === "" || amount === "") {
        alert("All fields are required!");
        event.preventDefault();
        return false;
    }
    
    if (amount <= 0) {
        alert("Amount must be greater than 0!");
        event.preventDefault();
        return false;
    }
    
    if (fromAccount === toAccount) {
        alert("From and To accounts cannot be the same!");
        event.preventDefault();
        return false;
    }
    
    return true;
}
