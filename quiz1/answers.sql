-- CREATE DATABASE inventapos 
USE inventapos;

-- Create tables
CREATE TABLE Suppliers(
SupplierID INT UNIQUE NOT NULL PRIMARY KEY,
Fname VARCHAR(50) NOT NULL,
Lname VARCHAR(50) NOT NULL,
Email VARCHAR(25) NOT NULL,
Phone INT NOT NULL
)

INSERT INTO Suppliers
VALUES
(39925251, 'KevTest', 'KimTest', 'kvnkamaa@gmail.com', 0719524276); 

CREATE TABLE Customers (
CustomerID INT UNIQUE AUTO_INCREMENT PRIMARY KEY,
Fname VARCHAR(50) NOT NULL,
Lname VARCHAR(50) NOT NULL,
Email VARCHAR(25) NOT NULL,
Phone INT NOT NULL
)

INSERT INTO Customers
VALUES
(1, 'John', 'Doe', 'johndoe@email.com', 0711242867);

CREATE TABLE Employees (
EmployeeID INT UNIQUE AUTO_INCREMENT PRIMARY KEY,
Username VARCHAR(50) NOT NULL,
PasswordHash VARCHAR(255),
Role ENUM('Admin', 'Cashier', 'Manager')
)

INSERT INTO Employees
VALUES 
(001, 'Kevin Kamau', 'roleAdmin', 'Admin'),
(002, 'CashierOne', 'cashierONE', 'Cashier');

CREATE TABLE Products (
ProductID INT UNIQUE NOT NULL AUTO_INCREMENT PRIMARY KEY,
ProductName VARCHAR(255) NOT NULL,
Category VARCHAR(255) NOT NULL,
Price DECIMAL(10,2) NOT NULL,
StockQty INT NOT NULL,
SupplierID INT,
FOREIGN KEY (SupplierID) REFERENCES Suppliers(SupplierID)
);

INSERT INTO Products
VALUES
(1, 'Sugar', 'Food', 150.00, 10, 39925251);

CREATE TABLE Sales (
SalesID INT UNIQUE AUTO_INCREMENT NOT NULL PRIMARY KEY,
CustomerID INT NOT NULL,
EmployeeID INT NOT NULL,
SaleDate DATE NOT NULL,
TotalAmt DECIMAL(10,2) NOT NULL,
FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID)
);

INSERT INTO Sales
VALUES
(1, 1, 001, '2025-01-01', 5000.00);

CREATE TABLE SaleItems (
SaleItemID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
SalesID INT NOT NULL,
ProductID INT NOT NULL,
Quantity INT NOT NULL,
SubTotal DECIMAL(10,2),
FOREIGN KEY (SalesID) REFERENCES Sales(SalesID),
FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

INSERT INTO SaleItems
VALUES
(1, 1, 1, 1, 150.00);

CREATE TABLE InventoryLogs (
LogID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
ProductID INT NOT NULL,
ChangeQty INT NOT NULL,
ChangeType ENUM('ADD', 'REMOVE'),
Note VARCHAR(255),
Timestamp DATETIME DEFAULT CURRENT_TIMESTAMP,
FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

INSERT INTO InventoryLogs (LogID, ProductID, ChangeQty, ChangeType, Note)
VALUES
(1, 1, 1, 'REMOVE', 'Removed 1kg Sugar from stock');

-- ADD INDEXES TO TABLES
CREATE INDEX idx_product_name ON Products (ProductName);
SHOW INDEXES FROM Products;

CREATE INDEX idx_salesdate ON Sales (SaleDate);
CREATE INDEX idx_sales_customer ON Sales (CustomerID);
SHOW INDEXES FROM Sales;

CREATE INDEX idx_customer_phone ON Customers (Phone);
CREATE INDEX idx_customer_name ON Customers (Fname, Lname);
SHOW INDEXES FROM Customers;

CREATE INDEX idx_inventory_product ON InventoryLogs (ProductID);
SHOW INDEXES FROM InventoryLogs;
