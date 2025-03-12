--------------------------------------------------------------------------------------------------------------------------------
/*********************************************************  SEQUENCES *********************************************************/
--------------------------------------------------------------------------------------------------------------------------------
SET SERVEROUTPUT ON;

DROP SEQUENCE flower_id_seq;
DROP SEQUENCE user_id_seq;
DROP SEQUENCE order_id_seq;
DROP SEQUENCE order_item_id_seq;
DROP SEQUENCE supplier_id_seq;

/************* CREATING SEQUENCES *************/

CREATE SEQUENCE flower_id_seq
START WITH 1
INCREMENT BY 1
CACHE 20;

CREATE SEQUENCE user_id_seq
START WITH 1
INCREMENT BY 1
CACHE 20;

CREATE SEQUENCE order_id_seq
START WITH 1
INCREMENT BY 1
CACHE 20;

CREATE SEQUENCE order_item_id_seq
START WITH 1
INCREMENT BY 1
CACHE 20;

CREATE SEQUENCE supplier_id_seq
START WITH 1
INCREMENT BY 1
CACHE 20;