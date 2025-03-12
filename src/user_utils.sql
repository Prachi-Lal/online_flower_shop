--------------------------------------------------------------------------------------------------------------------------------
/*******************************************************  USER UTILS *********************************************************/
--------------------------------------------------------------------------------------------------------------------------------

SET SERVEROUTPUT ON;

/************* PROCEDURE FOR USER REGISTRATION *************/

BEGIN
    register_user('john_doe', 'password123', 'john@example.com', 'Customer');
END;
/



/************* FUNCTION FOR USER AUTHENTICATION *************/

DECLARE
    v_result VARCHAR2(50);
BEGIN
    v_result := validate_user('customer4', 'pass101');
    DBMS_OUTPUT.PUT_LINE(v_result);
END;
/



/************* PROCEDURE TO VIEW ALL FLOWERS *************/

DECLARE
    
BEGIN
    
    View_All_Flowers;
END;
/



/************* PROCEDURE TO PLACE ORDER AFTER AUTHENTICATION USER AND QUANTITY CHECK *************/

SET SERVEROUTPUT ON;

select * from flowers;

DECLARE
    v_username VARCHAR2(50) := 'customer1'; -- Replace with a valid username
    v_password VARCHAR2(50) := 'pass123';    -- Replace with the corresponding password
    v_flower_id INT := 3;                     -- Replace with a valid flower ID
    v_quantity INT := 2;                      -- Replace with the desired quantity
BEGIN
    -- Call the place_order procedure
    place_order(v_username, v_password, v_flower_id, v_quantity);
END;
/
select * from flowers;


select * from order_details;

select flower_id, sum(total_cost) from order_details 
group by flower_id;
