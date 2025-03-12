SET SERVEROUTPUT ON;












DECLARE
    v_user_id INT := 1;  
    v_flower_id INT := 2;  
    v_quantity INT := 2;  
BEGIN
    place_order(p_user_id => v_user_id, 
                p_flower_id => v_flower_id, 
                p_quantity => v_quantity);
END;
/
    
DECLARE
    v_order_id NUMBER := 1;          -- Specify the order ID to update
    v_new_status VARCHAR2(20) := 'Shipped'; -- Specify the new status
    v_supplier_id NUMBER := 2;       -- Specify the supplier ID
BEGIN
    -- Call the procedure to update the order status
    update_order_status(v_order_id, v_new_status, v_supplier_id);
END;
/

DECLARE
    v_supplier_id INT := 2; -- Specify the supplier ID to view orders for
BEGIN
    -- Call the procedure to view orders for the supplier
    view_supplier_orders(v_supplier_id);
END;
/
