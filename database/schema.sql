CREATE DATABASE banking_system;
USE banking_system;

CREATE TABLE users (
    user_id INT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(50) UNIQUE NOT NULL,
    password VARCHAR(100) NOT NULL,
    email VARCHAR(100),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE accounts (
    account_id INT PRIMARY KEY AUTO_INCREMENT,
    account_number VARCHAR(20) UNIQUE NOT NULL,
    username VARCHAR(50) NOT NULL,
    balance DECIMAL(15, 2) DEFAULT 0,
    account_type VARCHAR(20),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (username) REFERENCES users(username)
);

CREATE TABLE transactions (
    transaction_id INT PRIMARY KEY AUTO_INCREMENT,
    from_account VARCHAR(20),
    to_account VARCHAR(20),
    amount DECIMAL(15, 2),
    transaction_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    status VARCHAR(20)
);

INSERT INTO users (username, password, email) VALUES 
('john_doe', 'password123', 'john@example.com'),
('jane_smith', 'password456', 'jane@example.com');

INSERT INTO accounts (account_number, username, balance, account_type) VALUES
('ACC001', 'john_doe', 5000, 'Savings'),
('ACC002', 'jane_smith', 3000, 'Checking');
