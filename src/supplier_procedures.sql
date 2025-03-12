--------------------------------------------------------------------------------------------------------------------------------
/********************************************************  SUPPLIER  **********************************************************/
--------------------------------------------------------------------------------------------------------------------------------

SET SERVEROUTPUT ON;

/************* FUCNTION FOR SUPPLIER AUTHENTICATION *************/

CREATE OR REPLACE FUNCTION authenticate_supplier (
    p_user_id IN VARCHAR2,
    p_password IN VARCHAR2
) RETURN BOOLEAN AS
    v_count INTEGER;
BEGIN
    -- Query to check if the user ID and password match for suppliers
    SELECT COUNT(*)
    INTO v_count
    FROM Users
    WHERE username = p_user_id
      AND password = p_password
      AND role = 'Supplier';  -- Ensure the role is Supplier

    -- Return true if authentication is successful, false otherwise
    IF v_count > 0 THEN
        RETURN TRUE;  -- Authentication successful
    ELSE
        RETURN FALSE; -- Authentication failed
    END IF;
EXCEPTION
    WHEN OTHERS THEN
        -- Handle any unexpected errors
        RETURN FALSE; -- Return false in case of an error
END authenticate_supplier;
/



/************* PROCEDURE TO UPDATE STATUS UPON SUPPLIER AUTHENTICATION *************/

CREATE OR REPLACE PROCEDURE track_supplier_shipping (
    p_user_id IN VARCHAR2,           -- Supplier's user ID
    p_password IN VARCHAR2,          -- Supplier's password
    p_order_id IN INTEGER,           -- Order ID to be updated
    p_shipping_date IN DATE          -- Shipping date
) AS
    v_is_authenticated BOOLEAN;       -- Variable to hold authentication result
BEGIN
    -- Authenticate the supplier
    v_is_authenticated := authenticate_supplier(p_user_id, p_password);

    -- Check if authentication was successful
    IF NOT v_is_authenticated THEN
        DBMS_OUTPUT.PUT_LINE('Authentication failed: Invalid supplier ID or password.');
        RETURN; -- Exit the procedure if authentication fails
    END IF;

    -- Update the order status to 'shipped' and set the shipping date
    UPDATE Orders
    SET status = 'Shipped',
        order_date = p_shipping_date -- Assuming you want to update the order date to the shipping date
    WHERE order_id = p_order_id;

    COMMIT; -- Commit the transaction
EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK; -- Rollback in case of an error
        RAISE; -- Raise the exception for further handling
END track_supplier_shipping;
/



