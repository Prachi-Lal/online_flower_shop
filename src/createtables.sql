--------------------------------------------------------------------------------------------------------------------------------
/***********************************************************  SCHEMA  ********************************************************/
--------------------------------------------------------------------------------------------------------------------------------


SET SERVEROUTPUT ON;

-- Drop tables if they exist
DROP TABLE Order_Items CASCADE CONSTRAINTS;
DROP TABLE Orders CASCADE CONSTRAINTS;
DROP TABLE Users CASCADE CONSTRAINTS;
DROP TABLE Flowers CASCADE CONSTRAINTS;
DROP TABLE Suppliers CASCADE CONSTRAINTS;


-- Create Flowers Table
CREATE TABLE Flowers (
    flower_id INT PRIMARY KEY,
    name VARCHAR2(100) NOT NULL,
    description VARCHAR2(4000), -- Use VARCHAR2 for description
    price NUMBER(10, 2) NOT NULL,
    category VARCHAR2(50),
    stock_quantity INT NOT NULL
);

-- Create Users Table
CREATE TABLE Users (
    user_id INT PRIMARY KEY,
    username VARCHAR2(50) UNIQUE NOT NULL,
    password VARCHAR2(50) NOT NULL,
    email VARCHAR2(100) UNIQUE NOT NULL,
    role VARCHAR2(20) CHECK (role IN ('Admin', 'Customer'))
);

-- Create Orders Table
CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    user_id INT,
    order_date DATE DEFAULT SYSDATE,
    status VARCHAR2(20) CHECK (status IN ('Pending', 'Shipped', 'Delivered')),
    FOREIGN KEY (user_id) REFERENCES Users(user_id) ON DELETE CASCADE
);

-- Create Suppliers Table   
CREATE TABLE Suppliers (
    supplier_id INT PRIMARY KEY,
    name VARCHAR2(100) NOT NULL,
    contact_info VARCHAR2(100)
);

-- Create Order_Items Table
CREATE TABLE Order_Items (
    order_item_id INT PRIMARY KEY,
    order_id INT,
    flower_id INT,
    quantity INT NOT NULL,
    supplier_id INT,
    FOREIGN KEY (order_id) REFERENCES Orders(order_id) ON DELETE CASCADE,
    FOREIGN KEY (flower_id) REFERENCES Flowers(flower_id) ON DELETE CASCADE,
    FOREIGN KEY (supplier_id) REFERENCES Suppliers(supplier_id) ON DELETE CASCADE
);


--------------------------------------------------------------------------------------------------------------------------------
/**************************************************************  INDEXES  *****************************************************/
--------------------------------------------------------------------------------------------------------------------------------

DROP INDEX idx_orders_user_id;
DROP INDEX idx_order_items_order_flower;


CREATE INDEX idx_orders_user_id ON Orders(user_id);
CREATE INDEX idx_order_items_order_flower ON Order_Items(order_id, flower_id);

