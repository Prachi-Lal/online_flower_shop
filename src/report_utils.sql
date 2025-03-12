--------------------------------------------------------------------------------------------------------------------------------
/*******************************************************  REPORT UTILS ********************************************************/
--------------------------------------------------------------------------------------------------------------------------------

SET SERVEROUTPUT ON;

/************* VIEWS *************/

SELECT * FROM vw_total_flowers;

SELECT * FROM vw_flowers_stock;

SELECT * FROM vw_total_stock_value;

SELECT * FROM vw_total_users;

SELECT * FROM vw_users_list;

SELECT * FROM vw_total_suppliers;

SELECT * FROM vw_suppliers_list;

SELECT * FROM vw_total_orders;

SELECT * FROM vw_orders_list;

SELECT * FROM vw_orders_by_status;

SELECT * FROM vw_order_items_list;


/************* MATERIALIZED VIEWS *************/

EXECUTE DBMS_MVIEW.REFRESH('Order_Summary');
EXECUTE DBMS_MVIEW.REFRESH('Flower_Stock_Status');

SELECT * FROM Order_Summary;


SET AUTOTRACE ON STATISTICS;
SELECT * FROM Flower_Stock_Status;

















