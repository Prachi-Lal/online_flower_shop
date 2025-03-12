--------------------------------------------------------------------------------------------------------------------------------
/***********************************************************  REPORTS  ********************************************************/
--------------------------------------------------------------------------------------------------------------------------------
SET AUTOTRACE ON;

SET SERVEROUTPUT ON;

DROP VIEW vw_total_flowers;
DROP VIEW vw_flowers_stock;
DROP VIEW vw_total_stock_value;
DROP VIEW vw_total_users;
DROP VIEW vw_users_list;
DROP VIEW vw_total_suppliers;
DROP VIEW vw_suppliers_list;
DROP VIEW vw_total_orders;
DROP VIEW vw_orders_list;
DROP VIEW vw_orders_by_status;
DROP VIEW vw_order_items_list;

DROP MATERIALIZED VIEW Order_Summary;
DROP MATERIALIZED VIEW Flower_Stock_Status;

/************* VIEWS *************/

CREATE OR REPLACE VIEW vw_total_flowers AS
SELECT COUNT(*) AS total_flowers FROM Flowers;

CREATE OR REPLACE VIEW vw_flowers_stock AS
SELECT name, stock_quantity FROM Flowers ORDER BY name;

CREATE OR REPLACE VIEW vw_total_stock_value AS
SELECT SUM(price * stock_quantity) AS total_stock_value FROM Flowers;

CREATE OR REPLACE VIEW vw_total_users AS
SELECT COUNT(*) AS total_users FROM Users;

CREATE OR REPLACE VIEW vw_users_list AS
SELECT username, email, role FROM Users ORDER BY username;

CREATE OR REPLACE VIEW vw_total_suppliers AS
SELECT COUNT(*) AS total_suppliers FROM Suppliers;

CREATE OR REPLACE VIEW vw_suppliers_list AS
SELECT name, contact_info FROM Suppliers ORDER BY name;

CREATE OR REPLACE VIEW vw_total_orders AS
SELECT COUNT(*) AS total_orders FROM Orders;

CREATE OR REPLACE VIEW vw_orders_list AS
SELECT order_id, user_id, order_date, status FROM Orders ORDER BY order_date DESC;

CREATE OR REPLACE VIEW vw_orders_by_status AS
SELECT status, COUNT(*) AS total_orders FROM Orders GROUP BY status;

CREATE OR REPLACE VIEW vw_order_items_list AS
SELECT order_item_id, order_id, flower_id, quantity FROM Order_Items;



/************* MATERIALIZED VIEWS *************/

CREATE MATERIALIZED VIEW Order_Summary AS
SELECT 
    COUNT(DISTINCT o.order_id) AS total_orders,
    SUM(oi.quantity * f.price) AS total_revenue,
    COUNT(DISTINCT o.user_id) AS unique_customers
FROM 
    Orders o
JOIN 
    Order_Items oi ON o.order_id = oi.order_id
JOIN 
    Flowers f ON oi.flower_id = f.flower_id
WHERE 
    o.status = 'Delivered' -- Only consider delivered orders
GROUP BY 
    o.order_date;

CREATE INDEX idx_order_summary_total_orders ON Order_Summary(total_orders);


CREATE MATERIALIZED VIEW Flower_Stock_Status AS
SELECT 
    f.flower_id,
    f.name,
    f.stock_quantity,
    COALESCE(SUM(oi.quantity), 0) AS total_orders
FROM 
    Flowers f
LEFT JOIN 
    Order_Items oi ON f.flower_id = oi.flower_id
GROUP BY 
    f.flower_id, f.name, f.stock_quantity;
    






