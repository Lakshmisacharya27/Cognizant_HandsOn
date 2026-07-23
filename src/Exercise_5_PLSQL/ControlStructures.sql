-- Scenario 1: Apply 1% discount for customers above 60 years

BEGIN
    FOR customer_rec IN (
        SELECT CustomerID, Age
        FROM Customers
        WHERE Age > 60
    )
    LOOP
        UPDATE Loans
        SET InterestRate = InterestRate - 1
        WHERE CustomerID = customer_rec.CustomerID;
    END LOOP;

    COMMIT;
END;
/

-- Scenario 2: Promote customers to VIP

BEGIN
    FOR customer_rec IN (
        SELECT CustomerID, Balance
        FROM Customers
    )
    LOOP
        IF customer_rec.Balance > 10000 THEN
            UPDATE Customers
            SET IsVIP = 'TRUE'
            WHERE CustomerID = customer_rec.CustomerID;
        END IF;
    END LOOP;

    COMMIT;
END;
/

-- Scenario 3: Loan reminders

BEGIN
    FOR loan_rec IN (
        SELECT CustomerID, LoanID, DueDate
        FROM Loans
        WHERE DueDate BETWEEN SYSDATE AND SYSDATE + 30
    )
    LOOP
        DBMS_OUTPUT.PUT_LINE(
            'Reminder: Customer '
            || loan_rec.CustomerID
            || ' Loan '
            || loan_rec.LoanID
            || ' is due on '
            || loan_rec.DueDate
        );
    END LOOP;
END;
/