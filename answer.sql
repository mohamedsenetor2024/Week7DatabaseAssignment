
-- ============================================
-- WEEK 7 ASSIGNMENT: DATABASE DESIGN AND NORMALIZATION
-- QUESTION 1: ACHIEVING FIRST NORMAL FORM (1NF)
-- ============================================

-- Step 1: Create a new normalized table
CREATE TABLE ProductDetail_1NF (
    OrderID INT NOT NULL,
    CustomerName VARCHAR(100) NOT NULL,
    ProductName VARCHAR(100) NOT NULL,
    PRIMARY KEY (OrderID, ProductName)
);

-- Step 2: Insert normalized records
-- Each row contains only one product per order

INSERT INTO ProductDetail_1NF (OrderID, CustomerName, ProductName)
VALUES
(101, 'John Doe', 'Laptop'),
(101, 'John Doe', 'Mouse'),
(102, 'Jane Smith', 'Tablet'),
(102, 'Jane Smith', 'Keyboard'),
(102, 'Jane Smith', 'Mouse'),
(103, 'Emily Clark', 'Phone');

-- Step 3: Display the normalized table
SELECT * FROM ProductDetail_1NF;


17:02:50	CREATE TABLE ProductDetail_1NF (     OrderID INT NOT NULL,     CustomerName VARCHAR(100) NOT NULL,     ProductName VARCHAR(100) NOT NULL,     PRIMARY KEY (OrderID, ProductName) )	0 row(s) affected	0.125 sec

17:02:50	INSERT INTO ProductDetail_1NF (OrderID, CustomerName, ProductName) VALUES (101, 'John Doe', 'Laptop'), (101, 'John Doe', 'Mouse'), (102, 'Jane Smith', 'Tablet'), (102, 'Jane Smith', 'Keyboard'), (102, 'Jane Smith', 'Mouse'), (103, 'Emily Clark', 'Phone')	6 row(s) affected Records: 6  Duplicates: 0  Warnings: 0	0.031 sec

17:02:50	SELECT * FROM ProductDetail_1NF LIMIT 0, 1000	6 row(s) returned	0.000 sec / 0.000 sec


-- ============================================
-- END OF QUESTION 1
-- ============================================








-- =====================================================
-- WEEK 7 ASSIGNMENT: DATABASE DESIGN AND NORMALIZATION
-- QUESTION 2: ACHIEVING SECOND NORMAL FORM (2NF)
-- =====================================================

-- Objective:
-- Eliminate partial dependencies by separating
-- order information from product and quantity details.

-- Step 1: Remove existing tables if they exist.
-- Drop child tables before parent tables because
-- of foreign key constraints.

DROP TABLE IF EXISTS OrderItems;
DROP TABLE IF EXISTS orderdetails;
DROP TABLE IF EXISTS Orders;

-- Step 2: Create the Orders table.
-- This table stores order information and customer names.
-- OrderID is the primary key.

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerName VARCHAR(100) NOT NULL
);

-- Step 3: Create the OrderItems table.
-- This table stores products and their quantities.
-- The combination of OrderID and Product is the
-- composite primary key.
-- OrderID is also a foreign key referencing Orders.

CREATE TABLE OrderItems (
    OrderID INT NOT NULL,
    Product VARCHAR(100) NOT NULL,
    Quantity INT NOT NULL,
    PRIMARY KEY (OrderID, Product),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);

-- Step 4: Insert records into the Orders table.

INSERT INTO Orders (OrderID, CustomerName)
VALUES
(101, 'John Doe'),
(102, 'Jane Smith'),
(103, 'Emily Clark');

-- Step 5: Insert records into the OrderItems table.

INSERT INTO OrderItems (OrderID, Product, Quantity)
VALUES
(101, 'Laptop', 2),
(101, 'Mouse', 1),
(102, 'Tablet', 3),
(102, 'Keyboard', 1),
(102, 'Mouse', 2),
(103, 'Phone', 1);

-- Step 6: Display all records from the Orders table.

SELECT * FROM Orders;

-- Step 7: Display all records from the OrderItems table.

SELECT * FROM OrderItems;

-- Step 8: Retrieve complete order information
-- using INNER JOIN.

SELECT
    Orders.OrderID,
    Orders.CustomerName,
    OrderItems.Product,
    OrderItems.Quantity
FROM Orders
INNER JOIN OrderItems
    ON Orders.OrderID = OrderItems.OrderID
ORDER BY Orders.OrderID;

-- Step 9: Verify the number of records in each table.

SELECT COUNT(*) AS TotalOrders FROM Orders;

SELECT COUNT(*) AS TotalOrderItems FROM OrderItems;

-- =====================================================
-- END OF QUESTION 2
-- SECOND NORMAL FORM (2NF) ACHIEVED
-- =====================================================
