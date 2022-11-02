USE sql_hr;
DROP TABLE accounts;
CREATE TABLE accounts(id INT, 
						account_name VARCHAR(10), 
                        account_balance DECIMAL(6,3));

INSERT INTO accounts
VALUES(1, 'John', 300),
		(2, 'Nancy', 800);
        
SELECT * FROM accounts;

START TRANSACTION;
UPDATE accounts
	SET account_balance = account_balance - 100
	WHERE id = 1;
UPDATE accounts
	SET account_balance = account_balance + 100
    WHERE id = 2;
    COMMIT;
    
-- ----------
START TRANSACTION;
UPDATE accounts
	SET account_balance = account_balance - 100
	WHERE id = 1;
UPDATE accounts
	SET account_balance = account_balance + 100
    WHERE id = 3;
    COMMIT;
    
SELECT * FROM accounts;

-- ROLLBACK

START TRANSACTION;
UPDATE accounts
	SET account_balance = account_balance - 100
	WHERE id = 1;
UPDATE accounts
	SET account_balance = account_balance + 100
    WHERE id = 3;
    ROLLBACK;
--     COMMIT; 

-- SAVE POINT
INSERT INTO accounts
VALUES(3, 'George', 0);

SELECT * FROM accounts;

START TRANSACTION;
UPDATE accounts
	SET account_balance = account_balance - 100
	WHERE id = 1;
SAVEPOINT save_1;
UPDATE accounts
	SET account_balance = account_balance + 100
    WHERE id = 5;
ROLLBACK TO save_1;
UPDATE accounts
	SET account_balance = account_balance + 100
    WHERE id = 3;
COMMIT;
    
SELECT * FROM accounts;