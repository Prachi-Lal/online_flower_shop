--------------------------------------------------------------------------------------------------------------------------------
/**********************************************************  USER  ************************************************************/
--------------------------------------------------------------------------------------------------------------------------------

SET SERVEROUTPUT ON;

DROP PROCEDURE register_user;
DROP FUNCTION validate_user;
DROP PROCEDURE place_order;
DROP TRIGGER update_stock_after_order;


/************* PROCEDURE FOR USER REGISTRATION *************/

CREATE OR REPLACE PROCEDURE register_user(
    p_username IN VARCHAR2,
    p_password IN VARCHAR2,
    p_email IN VARCHAR2,
    p_role IN VARCHAR2
) AS
BEGIN
    -- Insert a new user into the Users table
    INSERT INTO Users (user_id, username, password, email, role)
    VALUES (user_id_seq.NEXTVAL, p_username, p_password, p_email, p_role);

    COMMIT; -- Commit the transaction
    DBMS_OUTPUT.PUT_LINE('User  registered successfully: ' || p_username);
EXCEPTION
    WHEN DUP_VAL_ON_INDEX THEN
        DBMS_OUTPUT.PUT_LINE('Error: Username or email already exists.');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
END;
/



/************* FUNCTION FOR USER AUTHENTICATION *************/

CREATE OR REPLACE FUNCTION validate_user(
    p_username IN VARCHAR2,
    p_password IN VARCHAR2
) RETURN VARCHAR2 AS
    v_count INT;
BEGIN
    SELECT COUNT(*)
    INTO v_count
    FROM Users
    WHERE username = p_username AND password = p_password;

    IF v_count > 0 THEN
        RETURN 'Login Successful';
    ELSE
        RETURN 'Login Failed';
    END IF;
EXCEPTION
    WHEN OTHERS THEN
        RETURN 'Error: ' || SQLERRM;
END;
/



/************* PROCEDURE TO VIEW ALL FLOWERS *************/

CREATE OR REPLACE PROCEDURE View_All_Flowers AS
BEGIN
    FOR flower_record IN (SELECT * FROM Flowers) LOOP
        -- Output the flower information
        DBMS_OUTPUT.PUT_LINE('Flower ID: ' || flower_record.flower_id || 
                             ', Name: ' || flower_record.name || 
                             ', Description: ' || flower_record.description || 
                             ', Price: ' || flower_record.price || 
                             ', Category: ' || flower_record.category || 
                             ', Stock Quantity: ' || flower_record.stock_quantity);
    END LOOP;
END View_All_Flowers;
/



/************* PROCEDURE TO PLACE ORDER AFTER AUTHENTICATION USER AND QUANTITY CHECK *************/

CREATE OR REPLACE PROCEDURE place_order(
    p_username IN VARCHAR2,
    p_password IN VARCHAR2,
    p_flower_id IN INT,
    p_quantity IN INT
) AS
    v_order_id INT;
    v_stock_quantity INT;
    v_user_id INT;
    v_result varchar2(50);
BEGIN
    /*SELECT user_id INTO v_user_id
    FROM Users
    WHERE username = p_username AND password = p_password AND role = 'Customer';*/
    v_result := validate_user(p_username, p_password);
    DBMS_OUTPUT.PUT_LINE(v_result);
    
    IF v_result != 'Login Successful' THEN
        RETURN;
    END IF;
    
    -- Check if the flower exists and get the stock quantity
    SELECT stock_quantity INTO v_stock_quantity
    FROM Flowers
    WHERE flower_id = p_flower_id;

    -- Check if the requested quantity is available
    IF p_quantity > v_stock_quantity THEN
        DBMS_OUTPUT.PUT_LINE('Insufficient stock. Available quantity: ' || v_stock_quantity);
        RETURN; -- Quit the procedure
    END IF;

    -- Insert into Orders table
    INSERT INTO Orders (order_id, user_id, order_date, status)
    VALUES (order_id_seq.NEXTVAL, v_user_id, SYSDATE, 'Pending')
    RETURNING order_id INTO v_order_id;

    -- Insert into Order_Items table
    INSERT INTO Order_Items (order_item_id, order_id, flower_id, quantity)
    VALUES (order_item_id_seq.NEXTVAL, v_order_id, p_flower_id, p_quantity);

    COMMIT;

    DBMS_OUTPUT.PUT_LINE('Order placed successfully. Order ID: ' || v_order_id);
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Authentication failed: Invalid username or password.');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An error occurred: ' || SQLERRM);
END;
/



/************* Trigger to Update Stock After Order *************/

CREATE OR REPLACE TRIGGER update_stock_after_order
AFTER INSERT ON Order_Items
FOR EACH ROW
BEGIN
    UPDATE Flowers
    SET stock_quantity = stock_quantity - :NEW.quantity
    WHERE flower_id = :NEW.flower_id;
END;
/


