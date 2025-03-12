--------------------------------------------------------------------------------------------------------------------------------
/**********************************************************  ADMIN  ***********************************************************/
--------------------------------------------------------------------------------------------------------------------------------

SET SERVEROUTPUT ON;

DROP PROCEDURE add_flower;
DROP PROCEDURE update_flower;
DROP PROCEDURE delete_flower;
DROP PROCEDURE view_all_customers;
DROP PROCEDURE view_all_orders;
DROP PROCEDURE view_all_flower_details;

/************* Procedure to View Flower Details *************/

CREATE OR REPLACE PROCEDURE view_all_flower_details AS
BEGIN
    FOR rec IN (
        SELECT flower_id, name, description, price, category, stock_quantity
        FROM Flowers
    ) LOOP
        DBMS_OUTPUT.PUT_LINE('Flower ID: ' || rec.flower_id || 
                             ', Name: ' || rec.name || 
                             ', Description: ' || rec.description || 
                             ', Price: ' || rec.price || 
                             ', Category: ' || rec.category || 
                             ', Stock Quantity: ' || rec.stock_quantity);
    END LOOP;
END;
/



/************* Procedure to Add Flower *************/

CREATE OR REPLACE PROCEDURE add_flower(
    p_name IN VARCHAR2,
    p_description IN VARCHAR2, 
    p_price IN DECIMAL,
    p_category IN VARCHAR2,
    p_stock_quantity IN INT
) AS
BEGIN
    INSERT INTO Flowers (flower_id, name, description, price, category, stock_quantity)
    VALUES (flower_id_seq.NEXTVAL, p_name, p_description, p_price, p_category, p_stock_quantity);
    COMMIT;
END;
/



/************* Procedure to Update Flower *************/

CREATE OR REPLACE PROCEDURE update_flower(
    p_flower_id IN INT,
    p_name IN VARCHAR2,
    p_description IN VARCHAR2,
    p_price IN DECIMAL,
    p_category IN VARCHAR2,
    p_stock_quantity IN INT
) AS
BEGIN
    UPDATE Flowers
    SET name = p_name,
        description = p_description,
        price = p_price,
        category = p_category,
        stock_quantity = p_stock_quantity
    WHERE flower_id = p_flower_id;
    COMMIT;
END;
/



/************* Procedure to Delete Flower *************/

CREATE OR REPLACE PROCEDURE delete_flower(
    p_flower_id IN INT
) AS
BEGIN
    DELETE FROM Flowers 
    WHERE flower_id = p_flower_id ;
    COMMIT;
END;
/



/************* Procedure to View All Customers *************/

CREATE OR REPLACE PROCEDURE view_all_customers AS
BEGIN
    FOR rec IN (
        SELECT user_id, username, email, role
        FROM Users
        WHERE role = 'Customer'
    ) LOOP
        DBMS_OUTPUT.PUT_LINE('User  ID: ' || rec.user_id || 
                             ', Username: ' || rec.username || 
                             ', Email: ' || rec.email || 
                             ', Role: ' || rec.role);
    END LOOP;
END;
/



/************* Procedure to View All Orders *************/

CREATE OR REPLACE PROCEDURE view_all_orders AS
BEGIN
    FOR rec IN (
        SELECT order_id, user_id, order_date, status
        FROM Orders
    ) LOOP
        DBMS_OUTPUT.PUT_LINE('Order ID: ' || rec.order_id || 
                             ', User ID: ' || rec.user_id || 
                             ', Order Date: ' || TO_CHAR(rec.order_date, 'YYYY-MM-DD HH24:MI:SS') || 
                             ', Status: ' || rec.status);
    END LOOP;
END;
/


