-- Scenario 1: Monthly Interest

CREATE OR REPLACE PROCEDURE ProcessMonthlyInterest
AS
BEGIN
    UPDATE Accounts
    SET Balance = Balance + (Balance * 0.01)
    WHERE AccountType = 'Savings';

    COMMIT;
END;
/

-- Scenario 2: Employee Bonus

CREATE OR REPLACE PROCEDURE UpdateEmployeeBonus
(
    deptName VARCHAR2,
    bonusPercent NUMBER
)
AS
BEGIN
    UPDATE Employees
    SET Salary = Salary + (Salary * bonusPercent / 100)
    WHERE Department = deptName;

    COMMIT;
END;
/

-- Scenario 3: Fund Transfer

CREATE OR REPLACE PROCEDURE TransferFunds
(
    fromAccount NUMBER,
    toAccount NUMBER,
    amount NUMBER
)
AS
    balance NUMBER;
BEGIN

    SELECT Balance
    INTO balance
    FROM Accounts
    WHERE AccountID = fromAccount;

    IF balance >= amount THEN

        UPDATE Accounts
        SET Balance = Balance - amount
        WHERE AccountID = fromAccount;

        UPDATE Accounts
        SET Balance = Balance + amount
        WHERE AccountID = toAccount;

        COMMIT;

    ELSE
        DBMS_OUTPUT.PUT_LINE('Insufficient Balance');
    END IF;

END;
/