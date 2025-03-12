--------------------------------------------------------------------------------------------------------------------------------
/*****************************************************  BULK INSERT  *******************************************************/
--------------------------------------------------------------------------------------------------------------------------------

SET SERVEROUTPUT ON;

DECLARE
  v_flower_id INT;
  v_name VARCHAR(50);
  v_description VARCHAR2(4000);
  v_price NUMBER(10, 2);
  v_category VARCHAR2(50);
  v_stock_quantity INT ;
BEGIN
  FOR i IN 1..10 LOOP 
    v_flower_id := flower_id_seq.NEXTVAL; 
    v_name := 'Flower ' || v_flower_id; 
    v_description := 'Flower ' || v_flower_id || 'Description';
    v_price := 00.0;
    v_category := 'Flower ' || v_flower_id || 'Category';
    v_stock_quantity := 10 ;
    
    INSERT INTO Flowers (flower_id, name, description, price, category, stock_quantity)
      VALUES (v_flower_id, v_name, v_description, v_price, v_category, v_stock_quantity);
  END LOOP;

  COMMIT;
END;
/

SELECT * FROM Flowers;