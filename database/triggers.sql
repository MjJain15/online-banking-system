DELIMITER //

CREATE TRIGGER log_transaction
AFTER UPDATE ON accounts
FOR EACH ROW
BEGIN
    IF NEW.balance != OLD.balance THEN
        INSERT INTO transactions (from_account, to_account, amount, status)
        VALUES (OLD.account_number, NEW.account_number, ABS(NEW.balance - OLD.balance), 'Completed');
    END IF;
END//

DELIMITER ;
