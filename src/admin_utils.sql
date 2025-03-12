--------------------------------------------------------------------------------------------------------------------------------
/*******************************************************  ADMIN UTILS *********************************************************/
--------------------------------------------------------------------------------------------------------------------------------

SET SERVEROUTPUT ON;

/************* Procedure to View Flower Details *************/

BEGIN
    view_all_flower_details;
END;
/


/************* Procedure to Add Flower *************/

BEGIN
    add_flower(
        'Rose', 
        'Beautiful red rose', 
        150.00, 
        'Romantic', 
        100
    );
    DBMS_OUTPUT.PUT_LINE('Flower added successfully.');
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
END;
/



/************* Procedure to Update Flower *************/

DECLARE
    v_flower_id INT := 1; -- Set the flower ID to update
BEGIN
    update_flower(
        v_flower_id, 
        'Tulip', 
        'Bright yellow tulip', 
        120.50, 
        'Spring', 
        50
    );
    DBMS_OUTPUT.PUT_LINE('Flower updated successfully.');
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
END;
/



/************* Procedure to Delete Flower *************/

DECLARE
    v_flower_id INT := 1; -- Set the flower ID to delete
BEGIN
    delete_flower(v_flower_id);
    DBMS_OUTPUT.PUT_LINE('Flower deleted successfully.');
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
END;
/



/************* Procedure to View All Customers *************/

BEGIN
    view_all_customers;
END;
/



/************* Procedure to View All Orders *************/

BEGIN
    view_all_orders;
END;
/

