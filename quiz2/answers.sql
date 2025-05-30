-- using same database as quiz1. tables to be used are SaleItems Products and Sales.

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