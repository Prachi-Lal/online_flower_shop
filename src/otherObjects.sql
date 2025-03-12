
DROP PROCEDURE place_order;
DROP PROCEDURE update_order_status;

DROP TRIGGER update_stock_after_order;

-- Function to Validate User : Tested


-- Trigger to Update Stock After Order 
CREATE OR REPLACE TRIGGER update_stock_after_order
AFTER INSERT ON Order_Items
FOR EACH ROW
BEGIN
    UPDATE Flowers
    SET stock_quantity = stock_quantity - :NEW.quantity
    WHERE flower_id = :NEW.flower_id;
END;
/


-- Procedure to Place Order : Tested
CREATE OR REPLACE PROCEDURE place_order(
    p_user_id IN INT,
    p_flower_id IN INT,
    p_quantity IN INT
) AS
    v_order_id INT;
BEGIN
    -- Insert into Orders table
    INSERT INTO Orders (order_id, user_id, order_date, status)
    VALUES (order_id_seq.NEXTVAL, p_user_id, SYSDATE, 'Pending')
    RETURNING order_id INTO v_order_id;

    -- Insert into Order_Items table
    INSERT INTO Order_Items (order_item_id, order_id, flower_id, quantity)
    VALUES (order_item_id_seq.NEXTVAL, v_order_id, p_flower_id, p_quantity);

    COMMIT;
END;
/

-- Procedure to Update Order Status with Supplier Authentication
CREATE OR REPLACE PROCEDURE update_order_status(
    p_order_id IN INT,
    p_status IN VARCHAR2,
    p_supplier_id IN INT
) AS
    v_flower_id INT;
    v_supplier_id INT;
BEGIN
    -- Check if the supplier is associated with the order
    SELECT oi.supplier_id
    INTO v_supplier_id
    FROM Order_Items oi
    JOIN Orders o ON oi.order_id = o.order_id
    WHERE o.order_id = p_order_id
    AND oi.supplier_id = p_supplier_id
    AND ROWNUM = 1; -- Limit to one result

    -- If the supplier is found, update the order status
    UPDATE Orders
    SET status = p_status
    WHERE order_id = p_order_id;

    COMMIT;
    DBMS_OUTPUT.PUT_LINE('Order status updated successfully.');
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Error: Supplier is not authorized to update this order status.');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
END;
/


-- Procedure to View Supplier and Order Information
CREATE OR REPLACE PROCEDURE view_supplier_orders(
    p_supplier_id IN INT
) AS
BEGIN
    FOR rec IN (
        SELECT o.order_id, o.order_date, o.status, f.name AS flower_name, oi.quantity
        FROM Orders o
        JOIN Order_Items oi ON o.order_id = oi.order_id
        JOIN Flowers f ON oi.flower_id = f.flower_id
        WHERE oi.supplier_id = p_supplier_id
    ) LOOP
        DBMS_OUTPUT.PUT_LINE('Order ID: ' || rec.order_id || 
                             ', Order Date: ' || rec.order_date || 
                             ', Status: ' || rec.status || 
                             ', Flower: ' || rec.flower_name || 
                             ', Quantity: ' || rec.quantity);
    END LOOP;
END;
/


