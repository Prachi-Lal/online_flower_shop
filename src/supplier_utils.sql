--------------------------------------------------------------------------------------------------------------------------------
/*****************************************************  SUPPLIER UTILS  *******************************************************/
--------------------------------------------------------------------------------------------------------------------------------

SET SERVEROUTPUT ON;

/************* FUCNTION FOR SUPPLIER AUTHENTICATION *************/

DECLARE
    v_user_id VARCHAR2(50);          -- Variable to hold the user ID
    v_password VARCHAR2(50);         -- Variable to hold the password
    v_is_authenticated BOOLEAN;       -- Variable to hold the authentication result
BEGIN
    -- Assign values to the variables (you can replace these with actual values)
    v_user_id := 'supplier_user';     -- Replace with actual user ID
    v_password := 'supplier_password'; -- Replace with actual password

    -- Call the function to authenticate the supplier
    v_is_authenticated := authenticate_supplier(v_user_id, v_password);

    -- Display the result
    IF v_is_authenticated THEN
        DBMS_OUTPUT.PUT_LINE('Authentication successful.');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Authentication failed: Invalid user ID or password.');
    END IF;
END;
/



/************* PROCEDURE TO UPDATE STATUS UPON SUPPLIER AUTHENTICATION *************/

DECLARE
    v_supplier_id INT := 1;                     -- Replace with actual supplier ID
    v_password VARCHAR2(50) := 'supplier_password'; -- Replace with actual password
    v_order_id INTEGER := 123;                   -- Replace with actual order ID
    v_shipping_date DATE := SYSDATE;             -- Replace with actual shipping date
BEGIN
    -- Call the procedure to track supplier shipping
    track_supplier_shipping(v_supplier_id, v_password, v_order_id, v_shipping_date);

    -- Output a success message
    DBMS_OUTPUT.PUT_LINE('Shipping information updated successfully.');
EXCEPTION
    WHEN OTHERS THEN
        -- Handle any exceptions that may occur
        DBMS_OUTPUT.PUT_LINE('An error occurred: ' || SQLERRM);
END;
/

