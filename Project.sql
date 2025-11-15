SET SERVEROUTPUT ON;
CREATE TABLE Customers (
    SSN               NUMBER(10) NOT NULL, 
    First_Name        VARCHAR2(255) NOT NULL, 
    Last_Name         VARCHAR2(255) NOT NULL, 
    Phone             NUMBER(10) NOT NULL UNIQUE, 
    Gender            CHAR(1) NOT NULL, 
    Address           VARCHAR2(1000) NOT NULL, 
    Date_of_Birth     DATE NOT NULL, 
    Insurance_ID      NUMBER(10) NOT NULL UNIQUE, 
    PRIMARY KEY (SSN)
);

CREATE TABLE Prescription (
    Prescription_ID   number(10) NOT NULL, 
    SSN               number(10) NOT NULL, 
    Doctor_ID         number(10) NOT NULL, 
    Prescribed_Date   date NOT NULL, 
    
    PRIMARY KEY (Prescription_ID)
);

CREATE TABLE Orders (
    Order_ID          number(10) NOT NULL, 
    Prescription_ID   number(10) NOT NULL, 
    EmployeeID        number(5) NOT NULL, 
    Order_Date        date NOT NULL, 

    PRIMARY KEY (Order_ID)
);

CREATE TABLE Ordered_Drugs (
    Order_ID            number(10) NOT NULL, 
    Drug_Name           char(255) NOT NULL, 
    Batch_Number        number(10) NOT NULL, 
    Ordered_Quantity    number(10) NOT NULL, 
    Price               number(2) NOT NULL, 

    PRIMARY KEY (Order_ID, Drug_Name, Batch_Number)
);

CREATE TABLE Insurance (
    Insurance_ID    number(10) NOT NULL, 
    Company_Name    char(255) NOT NULL, 
    Start_Date      date NOT NULL, 
    End_Date        date NOT NULL, 
    Co_Insurance    number(4) NOT NULL, 
    
    PRIMARY KEY (Insurance_ID)
);

CREATE TABLE Employee (
    ID                number(5) NOT NULL, 
    SSN               number(10) NOT NULL UNIQUE, 
    License           number(10) UNIQUE, 
    First_Name        char(255) NOT NULL, 
    Last_Name         char(255) NOT NULL, 
    Start_Date        date NOT NULL, 
    End_Date          date, 
    Role              char(255) NOT NULL, 
    Salary            number(4) NOT NULL, 
    Phone_Number      number(10) NOT NULL, 
    Date_of_Birth     date NOT NULL, 

    PRIMARY KEY (ID)
);

CREATE TABLE Medicine (
    Drug_Name           char(255) NOT NULL, 
    Batch_Number        number(10) NOT NULL, 
    MedicineType        char(255) NOT NULL, 
    Manufacturer        char(255) NOT NULL, 
    Stock_Quantity      number(10) NOT NULL, 
    Expiry_Date         date NOT NULL, 
    Price               number(4) NOT NULL, 

    PRIMARY KEY (Drug_Name, Batch_Number)
);

CREATE TABLE Bill (
    Order_ID            number(10) NOT NULL, 
    CustomerSSN         number(10) NOT NULL, 
    Total_Amount        number(4) NOT NULL, 
    Customer_Payment    number(4) NOT NULL, 
    Insurance_Payment   number(4) NOT NULL, 
    
    PRIMARY KEY (Order_ID, CustomerSSN)
);

ALTER TABLE Customers ADD CONSTRAINT insures FOREIGN KEY (Insurance_ID) 
    REFERENCES Insurance (Insurance_ID) ON DELETE Set null;
    
ALTER TABLE Prescription ADD CONSTRAINT holds FOREIGN KEY (SSN) 
    REFERENCES Customers (SSN);
    
ALTER TABLE Orders ADD CONSTRAINT prepares FOREIGN KEY (EmployeeID) 
    REFERENCES Employee (ID);

ALTER TABLE Orders ADD CONSTRAINT uses FOREIGN KEY (Prescription_ID) 
    REFERENCES Prescription (Prescription_ID);
    
ALTER TABLE Bill ADD CONSTRAINT makes FOREIGN KEY (Order_ID) 
    REFERENCES Orders (Order_ID);
    
ALTER TABLE Bill ADD CONSTRAINT pays FOREIGN KEY (CustomerSSN) 
    REFERENCES Customers (SSN);
    
INSERT INTO Employee values(1, 1234567890, 9876543210, 'John', 'Doe', TO_DATE('2024-01-01', 'YYYY-MM-DD'), NULL, 'Manager', 5000, 1234567890, TO_DATE('1990-01-01', 'YYYY-MM-DD'));
INSERT INTO Employee values(2, 2345678901, NULL, 'Jane', 'Smith', TO_DATE('2023-05-15', 'YYYY-MM-DD'), NULL, 'Assistant', 3500, 2345678901, TO_DATE('1985-05-15', 'YYYY-MM-DD'));
INSERT INTO Employee values(3, 3456789012, 8765432109, 'Michael', 'Johnson', TO_DATE('2023-09-30', 'YYYY-MM-DD'), NULL, 'Technician', 4000, 3456789012, TO_DATE('1995-09-30', 'YYYY-MM-DD'));
INSERT INTO Employee values(4, 4567890123, NULL, 'Emily', 'Brown', TO_DATE('2023-07-20', 'YYYY-MM-DD'), NULL, 'Analyst', 3800, 4567890123, TO_DATE('1988-07-20', 'YYYY-MM-DD'));
INSERT INTO Employee values(5, 5678901234, 7654321098, 'David', 'Martinez', TO_DATE('2022-03-10', 'YYYY-MM-DD'), NULL, 'Consultant', 4200, 5678901234, TO_DATE('1992-03-10', 'YYYY-MM-DD'));
INSERT INTO Employee values(6, 6789012345, NULL, 'Jessica', 'Lee', TO_DATE('2021-12-05', 'YYYY-MM-DD'), NULL, 'Assistant', 3500, 6789012345, TO_DATE('1983-12-05', 'YYYY-MM-DD'));
INSERT INTO Employee values(7, 7890123456, 6543210987, 'Daniel', 'Garcia', TO_DATE('2020-02-28', 'YYYY-MM-DD'), NULL, 'Cashier', 4500, 7890123456, TO_DATE('1998-02-28', 'YYYY-MM-DD'));
INSERT INTO Employee values(8, 8901234567, NULL, 'Sarah', 'Wilson', TO_DATE('2020-11-12', 'YYYY-MM-DD'), NULL, 'Technician', 3700, 8901234567, TO_DATE('1994-11-12', 'YYYY-MM-DD'));
INSERT INTO Employee values(9, 9012345678, 5432109876, 'Michelle', 'Lopez', TO_DATE('2019-04-25', 'YYYY-MM-DD'), NULL, 'Analyst', 4000, 9012345678, TO_DATE('1980-04-25', 'YYYY-MM-DD'));
INSERT INTO Employee values(10, 1234432112, NULL, 'Christopher', 'Taylor', TO_DATE('2018-08-18', 'YYYY-MM-DD'), NULL, 'Cashier', 5000, 1234432112, TO_DATE('1999-08-18', 'YYYY-MM-DD'));


INSERT INTO Insurance VALUES (1, 'Insurance Company 1', TO_DATE('2023-01-01', 'YYYY-MM-DD'), TO_DATE('2024-01-01', 'YYYY-MM-DD'), 20);
INSERT INTO Insurance VALUES (2, 'Insurance Company 2', TO_DATE('2022-06-15', 'YYYY-MM-DD'), TO_DATE('2023-06-15', 'YYYY-MM-DD'), 15);
INSERT INTO Insurance VALUES (3, 'Insurance Company 3', TO_DATE('2023-03-10', 'YYYY-MM-DD'), TO_DATE('2024-03-10', 'YYYY-MM-DD'), 25);
INSERT INTO Insurance VALUES (4, 'Insurance Company 4', TO_DATE('2022-09-01', 'YYYY-MM-DD'), TO_DATE('2023-09-01', 'YYYY-MM-DD'), 18);
INSERT INTO Insurance VALUES (5, 'Insurance Company 5', TO_DATE('2022-07-20', 'YYYY-MM-DD'), TO_DATE('2023-07-20', 'YYYY-MM-DD'), 22);
INSERT INTO Insurance VALUES (6, 'Insurance Company 6', TO_DATE('2022-12-01', 'YYYY-MM-DD'), TO_DATE('2023-12-01', 'YYYY-MM-DD'), 17);
INSERT INTO Insurance VALUES (7, 'Insurance Company 7', TO_DATE('2023-05-15', 'YYYY-MM-DD'), TO_DATE('2024-05-15', 'YYYY-MM-DD'), 21);
INSERT INTO Insurance VALUES (8, 'Insurance Company 8', TO_DATE('2022-11-30', 'YYYY-MM-DD'), TO_DATE('2023-11-30', 'YYYY-MM-DD'), 19);
INSERT INTO Insurance VALUES (9, 'Insurance Company 9', TO_DATE('2023-02-28', 'YYYY-MM-DD'), TO_DATE('2024-02-28', 'YYYY-MM-DD'), 23);
INSERT INTO Insurance VALUES (10, 'Insurance Company 10', TO_DATE('2022-10-15', 'YYYY-MM-DD'), TO_DATE('2023-10-15', 'YYYY-MM-DD'), 16);


-- Inserting values into the Customers table one by one
INSERT INTO Customers VALUES (123456789, 'John', 'Doe', 1987534734, 'M', '123 Main St, City, State, 12345', TO_DATE('1990-01-01', 'YYYY-MM-DD'), 1);
INSERT INTO Customers VALUES (987654321, 'Jane', 'Doe', 5154854448, 'F', '456 Elm St, City, State, 54321', TO_DATE('1995-05-10', 'YYYY-MM-DD'), 2);
INSERT INTO Customers VALUES (555555555, 'Bob', 'Smith', 1547896324, 'M', '789 Oak St, City, State, 67890', TO_DATE('1985-08-15', 'YYYY-MM-DD'), 3);
INSERT INTO Customers VALUES (111111111, 'Alice', 'Johnson', 5478963217, 'F', '321 Pine St, City, State, 54321', TO_DATE('1988-04-20', 'YYYY-MM-DD'), 4);
INSERT INTO Customers VALUES (222222222, 'Michael', 'Brown', 4587963217, 'M', '654 Cedar St, City, State, 98765', TO_DATE('1976-10-12', 'YYYY-MM-DD'), 5);
INSERT INTO Customers VALUES (333333333, 'Emily', 'Wilson', 1458752367, 'F', '987 Maple St, City, State, 23456', TO_DATE('1992-12-30', 'YYYY-MM-DD'), 6);
INSERT INTO Customers VALUES (444444444, 'David', 'Martinez', 4585896320, 'M', '741 Birch St, City, State, 67890', TO_DATE('1980-07-05', 'YYYY-MM-DD'), 7);
INSERT INTO Customers VALUES (888888888, 'Jennifer', 'Anderson', 4587963456, 'F', '852 Walnut St, City, State, 12345', TO_DATE('1998-02-18', 'YYYY-MM-DD'), 8);
INSERT INTO Customers VALUES (666666666, 'Christopher', 'Taylor', 5896321478, 'M', '369 Oak St, City, State, 54321', TO_DATE('1991-09-15', 'YYYY-MM-DD'), 9);
INSERT INTO Customers VALUES (777777777, 'Jessica', 'Lee', 4589632589, 'F', '963 Elm St, City, State, 87654', TO_DATE('1987-06-25', 'YYYY-MM-DD'), 10);

-- Inserting values into the Prescription table
-- Inserting values into the Prescription table one by one
INSERT INTO Prescription (Prescription_ID, SSN, Doctor_ID, Prescribed_Date)
VALUES (1, 123456789, 10001, TO_DATE('2024-05-01', 'YYYY-MM-DD'));

INSERT INTO Prescription (Prescription_ID, SSN, Doctor_ID, Prescribed_Date)
VALUES (2, 987654321, 10002, TO_DATE('2024-05-02', 'YYYY-MM-DD'));

INSERT INTO Prescription (Prescription_ID, SSN, Doctor_ID, Prescribed_Date)
VALUES (3, 555555555, 10003, TO_DATE('2024-05-03', 'YYYY-MM-DD'));

INSERT INTO Prescription (Prescription_ID, SSN, Doctor_ID, Prescribed_Date)
VALUES (4, 111111111, 10004, TO_DATE('2024-05-04', 'YYYY-MM-DD'));

INSERT INTO Prescription (Prescription_ID, SSN, Doctor_ID, Prescribed_Date)
VALUES (5, 222222222, 10005, TO_DATE('2024-05-05', 'YYYY-MM-DD'));

INSERT INTO Prescription (Prescription_ID, SSN, Doctor_ID, Prescribed_Date)
VALUES (6, 333333333, 10006, TO_DATE('2024-05-06', 'YYYY-MM-DD'));

INSERT INTO Prescription (Prescription_ID, SSN, Doctor_ID, Prescribed_Date)
VALUES (7, 444444444, 10007, TO_DATE('2024-05-07', 'YYYY-MM-DD'));

INSERT INTO Prescription (Prescription_ID, SSN, Doctor_ID, Prescribed_Date)
VALUES (8, 555555555, 10008, TO_DATE('2024-05-08', 'YYYY-MM-DD'));

INSERT INTO Prescription (Prescription_ID, SSN, Doctor_ID, Prescribed_Date)
VALUES (9, 666666666, 10009, TO_DATE('2024-05-09', 'YYYY-MM-DD'));

INSERT INTO Prescription (Prescription_ID, SSN, Doctor_ID, Prescribed_Date)
VALUES (10, 777777777, 10010, TO_DATE('2024-05-10', 'YYYY-MM-DD'));

-- Inserting values into the Orders table
-- Inserting values into the Orders table
INSERT INTO Orders (Order_ID, Prescription_ID, EmployeeID, Order_Date)
VALUES (10001, 1, 1, TO_DATE('2024-05-01', 'YYYY-MM-DD'));

INSERT INTO Orders (Order_ID, Prescription_ID, EmployeeID, Order_Date)
VALUES (10002, 2, 2, TO_DATE('2024-05-02', 'YYYY-MM-DD'));

INSERT INTO Orders (Order_ID, Prescription_ID, EmployeeID, Order_Date)
VALUES (10003, 3, 3, TO_DATE('2024-05-03', 'YYYY-MM-DD'));

INSERT INTO Orders (Order_ID, Prescription_ID, EmployeeID, Order_Date)
VALUES (10004, 4, 4, TO_DATE('2024-05-04', 'YYYY-MM-DD'));

INSERT INTO Orders (Order_ID, Prescription_ID, EmployeeID, Order_Date)
VALUES (10005, 5, 5, TO_DATE('2024-05-05', 'YYYY-MM-DD'));

INSERT INTO Orders (Order_ID, Prescription_ID, EmployeeID, Order_Date)
VALUES (10006, 6, 6, TO_DATE('2024-05-06', 'YYYY-MM-DD'));

INSERT INTO Orders (Order_ID, Prescription_ID, EmployeeID, Order_Date)
VALUES (10007, 7, 7, TO_DATE('2024-05-07', 'YYYY-MM-DD'));

INSERT INTO Orders (Order_ID, Prescription_ID, EmployeeID, Order_Date)
VALUES (10008, 8, 8, TO_DATE('2024-05-08', 'YYYY-MM-DD'));

INSERT INTO Orders (Order_ID, Prescription_ID, EmployeeID, Order_Date)
VALUES (10009, 9, 9, TO_DATE('2024-05-09', 'YYYY-MM-DD'));

INSERT INTO Orders (Order_ID, Prescription_ID, EmployeeID, Order_Date)
VALUES (10010, 10, 10, TO_DATE('2024-05-10', 'YYYY-MM-DD'));

-- Inserting values into the Bill table
INSERT INTO Bill (Order_ID, CustomerSSN, Total_Amount, Customer_Payment, Insurance_Payment)
VALUES (10001, 123456789, 100, 90, 10);

INSERT INTO Bill (Order_ID, CustomerSSN, Total_Amount, Customer_Payment, Insurance_Payment)
VALUES (10002, 987654321, 150, 100, 50);

INSERT INTO Bill (Order_ID, CustomerSSN, Total_Amount, Customer_Payment, Insurance_Payment)
VALUES (10003, 555555555, 200, 150, 50);

INSERT INTO Bill (Order_ID, CustomerSSN, Total_Amount, Customer_Payment, Insurance_Payment)
VALUES (10004, 111111111, 120, 120, 0);

INSERT INTO Bill (Order_ID, CustomerSSN, Total_Amount, Customer_Payment, Insurance_Payment)
VALUES (10005, 222222222, 180, 100, 80);

INSERT INTO Bill (Order_ID, CustomerSSN, Total_Amount, Customer_Payment, Insurance_Payment)
VALUES (10006, 333333333, 220, 200, 20);

INSERT INTO Bill (Order_ID, CustomerSSN, Total_Amount, Customer_Payment, Insurance_Payment)
VALUES (10007, 444444444, 250, 200, 50);

INSERT INTO Bill (Order_ID, CustomerSSN, Total_Amount, Customer_Payment, Insurance_Payment)
VALUES (10008, 555555555, 300, 300, 0);

INSERT INTO Bill (Order_ID, CustomerSSN, Total_Amount, Customer_Payment, Insurance_Payment)
VALUES (10009, 666666666, 180, 180, 0);

INSERT INTO Bill (Order_ID, CustomerSSN, Total_Amount, Customer_Payment, Insurance_Payment)
VALUES (10010, 777777777, 200, 150, 50);


-- Inserting values into the Medicine table with specific MedicineType
INSERT INTO Medicine (Drug_Name, Batch_Number, MedicineType, Manufacturer, Stock_Quantity, Expiry_Date, Price)
VALUES ('Paracetamol', 1001, 'Over the counter', 'ABC Pharmaceuticals', 500, TO_DATE('2025-12-31', 'YYYY-MM-DD'), 10);

INSERT INTO Medicine (Drug_Name, Batch_Number, MedicineType, Manufacturer, Stock_Quantity, Expiry_Date, Price)
VALUES ('Amoxicillin', 1002, 'Prescription only', 'XYZ Pharma', 300, TO_DATE('2025-10-31', 'YYYY-MM-DD'), 15);

INSERT INTO Medicine (Drug_Name, Batch_Number, MedicineType, Manufacturer, Stock_Quantity, Expiry_Date, Price)
VALUES ('Lisinopril', 1003, 'Prescription only', 'PQR Pharmaceuticals', 200, TO_DATE('2025-09-30', 'YYYY-MM-DD'), 20);

INSERT INTO Medicine (Drug_Name, Batch_Number, MedicineType, Manufacturer, Stock_Quantity, Expiry_Date, Price)
VALUES ('Atorvastatin', 1004, 'Prescription only', 'LMN Pharma', 400, TO_DATE('2025-11-30', 'YYYY-MM-DD'), 25);

INSERT INTO Medicine (Drug_Name, Batch_Number, MedicineType, Manufacturer, Stock_Quantity, Expiry_Date, Price)
VALUES ('Omeprazole', 1005, 'Prescription only', 'RST Pharmaceuticals', 250, TO_DATE('2025-08-31', 'YYYY-MM-DD'), 18);

INSERT INTO Medicine (Drug_Name, Batch_Number, MedicineType, Manufacturer, Stock_Quantity, Expiry_Date, Price)
VALUES ('Aspirin', 1006, 'Over the counter', 'DEF Pharma', 600, TO_DATE('2025-07-31', 'YYYY-MM-DD'), 12);

INSERT INTO Medicine (Drug_Name, Batch_Number, MedicineType, Manufacturer, Stock_Quantity, Expiry_Date, Price)
VALUES ('Metformin', 1007, 'Prescription only', 'GHI Pharmaceuticals', 350, TO_DATE('2025-06-30', 'YYYY-MM-DD'), 16);

INSERT INTO Medicine (Drug_Name, Batch_Number, MedicineType, Manufacturer, Stock_Quantity, Expiry_Date, Price)
VALUES ('Simvastatin', 1008, 'Prescription only', 'JKL Pharma', 450, TO_DATE('2025-05-31', 'YYYY-MM-DD'), 22);

INSERT INTO Medicine (Drug_Name, Batch_Number, MedicineType, Manufacturer, Stock_Quantity, Expiry_Date, Price)
VALUES ('Losartan', 1009, 'Prescription only', 'MNO Pharmaceuticals', 550, TO_DATE('2025-04-30', 'YYYY-MM-DD'), 30);

INSERT INTO Medicine (Drug_Name, Batch_Number, MedicineType, Manufacturer, Stock_Quantity, Expiry_Date, Price)
VALUES ('Warfarin', 1010, 'Restricted', 'STU Pharma', 150, TO_DATE('2025-03-31', 'YYYY-MM-DD'), 28);

-- Inserting values into the Ordered_Drugs table
INSERT INTO Ordered_Drugs (Order_ID, Drug_Name, Batch_Number, Ordered_Quantity, Price)
VALUES (1, 'Paracetamol', 1001, 50, 10);

INSERT INTO Ordered_Drugs (Order_ID, Drug_Name, Batch_Number, Ordered_Quantity, Price)
VALUES (2, 'Amoxicillin', 1002, 30, 15);

INSERT INTO Ordered_Drugs (Order_ID, Drug_Name, Batch_Number, Ordered_Quantity, Price)
VALUES (3, 'Lisinopril', 1003, 20, 20);

INSERT INTO Ordered_Drugs (Order_ID, Drug_Name, Batch_Number, Ordered_Quantity, Price)
VALUES (4, 'Atorvastatin', 1004, 40, 25);

INSERT INTO Ordered_Drugs (Order_ID, Drug_Name, Batch_Number, Ordered_Quantity, Price)
VALUES (5, 'Omeprazole', 1005, 25, 18);

INSERT INTO Ordered_Drugs (Order_ID, Drug_Name, Batch_Number, Ordered_Quantity, Price)
VALUES (6, 'Aspirin', 1006, 60, 12);

INSERT INTO Ordered_Drugs (Order_ID, Drug_Name, Batch_Number, Ordered_Quantity, Price)
VALUES (7, 'Metformin', 1007, 35, 16);

INSERT INTO Ordered_Drugs (Order_ID, Drug_Name, Batch_Number, Ordered_Quantity, Price)
VALUES (8, 'Simvastatin', 1008, 45, 22);

INSERT INTO Ordered_Drugs (Order_ID, Drug_Name, Batch_Number, Ordered_Quantity, Price)
VALUES (9, 'Losartan', 1009, 55, 30);

INSERT INTO Ordered_Drugs (Order_ID, Drug_Name, Batch_Number, Ordered_Quantity, Price)
VALUES (10, 'Warfarin', 1010, 15, 28);



drop table Ordered_Drugs;

CREATE TABLE Ordered_Drugs (
    Order_ID            number(10) NOT NULL, 
    Drug_Name           char(255) NOT NULL, 
    Batch_Number        number(10) NOT NULL, 
    Ordered_Quantity    number(10) NOT NULL, 
    Price               number(2) NOT NULL, 

    PRIMARY KEY (Order_ID, Drug_Name, Batch_Number)
);

ALTER TABLE Ordered_Drugs ADD CONSTRAINT contains FOREIGN KEY (Order_ID) 
    REFERENCES Orders (Order_ID) ON DELETE Cascade;
    
ALTER TABLE Ordered_Drugs ADD CONSTRAINT Fulfilled FOREIGN KEY (Drug_Name, Batch_Number) 
    REFERENCES Medicine (Drug_Name, Batch_Number);


INSERT INTO Ordered_Drugs (Order_ID, Drug_Name, Batch_Number, Ordered_Quantity, Price)
VALUES (10001, 'Paracetamol', 1001, 50, 10);

INSERT INTO Ordered_Drugs (Order_ID, Drug_Name, Batch_Number, Ordered_Quantity, Price)
VALUES (10002, 'Amoxicillin', 1002, 30, 15);

INSERT INTO Ordered_Drugs (Order_ID, Drug_Name, Batch_Number, Ordered_Quantity, Price)
VALUES (10003, 'Lisinopril', 1003, 20, 20);

INSERT INTO Ordered_Drugs (Order_ID, Drug_Name, Batch_Number, Ordered_Quantity, Price)
VALUES (10004, 'Atorvastatin', 1004, 40, 25);

INSERT INTO Ordered_Drugs (Order_ID, Drug_Name, Batch_Number, Ordered_Quantity, Price)
VALUES (10005, 'Omeprazole', 1005, 25, 18);

INSERT INTO Ordered_Drugs (Order_ID, Drug_Name, Batch_Number, Ordered_Quantity, Price)
VALUES (10006, 'Aspirin', 1006, 60, 12);

INSERT INTO Ordered_Drugs (Order_ID, Drug_Name, Batch_Number, Ordered_Quantity, Price)
VALUES (10007, 'Metformin', 1007, 35, 16);

INSERT INTO Ordered_Drugs (Order_ID, Drug_Name, Batch_Number, Ordered_Quantity, Price)
VALUES (10008, 'Simvastatin', 1008, 45, 22);

INSERT INTO Ordered_Drugs (Order_ID, Drug_Name, Batch_Number, Ordered_Quantity, Price)
VALUES (10009, 'Losartan', 1009, 55, 30);

INSERT INTO Ordered_Drugs (Order_ID, Drug_Name, Batch_Number, Ordered_Quantity, Price)
VALUES (10010, 'Warfarin', 1010, 15, 28);


select * from Customers;

select * from Prescription;

select * from Orders;

select * from Ordered_Drugs;

select * from Insurance;

select * from Employee;

select * from Medicine;

select * from Bill;

-- Add more values here...
CREATE OR REPLACE PROCEDURE REPORT_EXPIRING_DRUGS
AS 
BEGIN 
   DBMS_OUTPUT.PUT_LINE('ALL DRUGS EXPIRING IN NEXT 60 DAYS');
    

    FOR item IN 
    (
        SELECT 
            drug_name,
            batch_number,
            manufacturer,
            stock_quantity,
            expiry_date
        FROM MEDICINE
        WHERE expiry_date < SYSDATE + 60
    )
    LOOP 
        DBMS_OUTPUT.PUT_LINE(
            item.drug_name || ', Batch: ' || item.batch_number || ', Manufacturer: ' || item.manufacturer || 
            ', Stock Quantity: ' || item.stock_quantity || ', Expiry Date: ' || item.expiry_date
        );
    END LOOP;
END;








