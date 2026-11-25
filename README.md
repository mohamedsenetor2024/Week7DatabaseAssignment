# Week 7 Assignment: Database Design and Normalization

## Overview

This project focuses on relational database design and normalization using MySQL. It demonstrates how to organize database tables, eliminate data redundancy, establish relationships between tables, and improve data integrity through normalization techniques.

The assignment covers two important normalization stages: First Normal Form (1NF) and Second Normal Form (2NF).

## Learning Objectives

By completing this assignment, I have learned how to:

- Understand the principles of relational database design and normalization.
- Apply First Normal Form (1NF) to eliminate repeating groups and multiple values in a single column.
- Apply Second Normal Form (2NF) to eliminate partial dependencies.
- Identify functional dependencies in relational database tables.
- Create properly structured tables using SQL.
- Implement primary keys and foreign key constraints.
- Use SQL JOIN operations to retrieve related information from multiple tables.

## Technologies and Tools

- **Database:** MySQL 8.0
- **SQL Editor:** MySQL Workbench
- **Code Editor:** Visual Studio Code
- **Version Control:** Git
- **Repository Hosting:** GitHub

## Assignment Tasks

### Question 1: Achieving First Normal Form (1NF)

The original `ProductDetail` table contained multiple products in a single column, violating First Normal Form.

**Problem identified:**
- Multiple product values were stored in one cell.
- The table did not maintain atomic values in every column.

**Solution implemented:**

Created a new table called `ProductDetail_1NF` with the following columns:

| Column | Description |
|---|---|
| OrderID | Identifies the order |
| CustomerName | Stores the customer's name |
| ProductName | Stores one product per row |

Each product is stored in a separate row, ensuring that every column contains a single atomic value.

**Result:** The table successfully satisfies First Normal Form (1NF).

### Question 2: Achieving Second Normal Form (2NF)

The original `OrderDetails` table was already in 1NF but contained a partial dependency.

The assumed composite primary key was `(OrderID, Product)`.

**Problem identified:**

- `CustomerName` depended only on `OrderID`.
- `Quantity` depended on the entire composite key.
- This partial dependency violated Second Normal Form.

**Solution implemented:**

The original table was divided into two related tables.

**1. Orders Table**

Stores customer and order information.

| Column | Description |
|---|---|
| OrderID (Primary Key) | Uniquely identifies each order |
| CustomerName | Stores the customer's name |

**2. OrderItems Table**

Stores products and their corresponding quantities.

| Column | Description |
|---|---|
| OrderID (Primary Key, Foreign Key) | References the Orders table |
| Product (Primary Key) | Identifies the product within an order |
| Quantity | Stores the quantity ordered |

A foreign key relationship was established between `Orders` and `OrderItems` using `OrderID`.

**Result:** The tables satisfy Second Normal Form (2NF) by eliminating partial dependencies.

## Database Relationships

The database uses a one-to-many relationship:

- One order can contain multiple products.
- Each order item belongs to one order.
- The `OrderID` foreign key connects the two tables.

## SQL Implementation

All SQL solutions are organized in a single file:

`answer.sql`

The file contains:

1. Table creation statements.
2. Primary key and foreign key definitions.
3. Normalized data insertion statements.
4. SELECT queries for displaying records.
5. An INNER JOIN query for retrieving related order information.
6. COUNT queries for verifying inserted records.

## Testing and Verification

The SQL statements were designed for execution and testing in MySQL Workbench.

The expected results are:

| Table | Expected Records |
|---|---:|
| ProductDetail_1NF | 6 |
| Orders | 3 |
| OrderItems | 6 |

The INNER JOIN query should return six records containing the order ID, customer name, product, and quantity.

## Project Structure

```text
Week-7-Database-Design/
│
├── answer.sql
└── README.md
```

## How to Run the Project

1. Clone or download the project repository from GitHub.
2. Open MySQL Workbench.
3. Connect to your MySQL database server.
4. Select the appropriate database.
5. Open the `answer.sql` file.
6. Execute the SQL statements in order.
7. Verify the resulting tables and records.
8. Run the INNER JOIN query to confirm the relationship between the tables.

**Note:** The SQL script includes DROP TABLE statements for resetting existing assignment tables during testing. These statements delete existing table data, so use them carefully.

## Key Learning Outcomes

Through this assignment, I gained practical experience in:

- Database normalization and relational database design.
- Eliminating repeating groups and partial dependencies.
- Structuring database tables efficiently.
- Establishing primary key and foreign key relationships.
- Inserting, retrieving, and validating relational data.
- Using INNER JOIN to combine information from related tables.

## Conclusion

This assignment demonstrates the importance of database normalization in developing reliable, organized, and maintainable relational databases.

By applying 1NF and 2NF, I transformed unstructured and partially dependent data into properly organized relational tables, improving data integrity and reducing unnecessary duplication.

---

**Assignment:** Week 7 – Database Design and Normalization  
**Database System:** MySQL  
**Submission File:** `answer.sql`  
**Documentation:** `README.md`