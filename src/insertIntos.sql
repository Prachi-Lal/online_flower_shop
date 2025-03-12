--------------------------------------------------------------------------------------------------------------------------------
/***********************************************************  DATA  ********************************************************/
--------------------------------------------------------------------------------------------------------------------------------


SET SERVEROUTPUT ON;

INSERT INTO Flowers (flower_id, name, description, price, category, stock_quantity) VALUES
(flower_id_seq.NEXTVAL, 'Rose', 'A beautiful red rose', 10.00, 'Roses', 100);

INSERT INTO Flowers (flower_id, name, description, price, category, stock_quantity) VALUES
(flower_id_seq.NEXTVAL, 'Tulip', 'A vibrant yellow tulip', 8.50, 'Tulips', 50);

INSERT INTO Flowers (flower_id, name, description, price, category, stock_quantity) VALUES
(flower_id_seq.NEXTVAL, 'Lily', 'A fragrant white lily', 12.00, 'Lilies', 30);

INSERT INTO Flowers (flower_id, name, description, price, category, stock_quantity) VALUES
(flower_id_seq.NEXTVAL, 'Daisy', 'A cheerful white daisy', 5.00, 'Daisies', 80);

INSERT INTO Flowers (flower_id, name, description, price, category, stock_quantity) VALUES
(flower_id_seq.NEXTVAL, 'Sunflower', 'A tall sunflower with a bright yellow face', 15.00, 'Sunflowers', 40);

INSERT INTO Flowers (flower_id, name, description, price, category, stock_quantity) VALUES
(flower_id_seq.NEXTVAL, 'Orchid', 'An exotic purple orchid', 20.00, 'Orchids', 25);

INSERT INTO Flowers (flower_id, name, description, price, category, stock_quantity) VALUES
(flower_id_seq.NEXTVAL, 'Carnation', 'A classic pink carnation', 7.50, 'Carnations', 60);

INSERT INTO Flowers (flower_id, name, description, price, category, stock_quantity) VALUES
(flower_id_seq.NEXTVAL, 'Chrysanthemum', 'A colorful chrysanthemum', 9.00, 'Chrysanthemums', 70);

INSERT INTO Flowers (flower_id, name, description, price, category, stock_quantity) VALUES
(flower_id_seq.NEXTVAL, 'Peony', 'A lush pink peony', 18.00, 'Peonies', 20);

INSERT INTO Flowers (flower_id, name, description, price, category, stock_quantity) VALUES
(flower_id_seq.NEXTVAL, 'Hydrangea', 'A beautiful blue hydrangea', 22.00, 'Hydrangeas', 15);



INSERT INTO Users (user_id, username, password, email, role) VALUES
(user_id_seq.NEXTVAL, 'admin', 'admin123', 'admin@example.com', 'Admin');

INSERT INTO Users (user_id, username, password, email, role) VALUES
(user_id_seq.NEXTVAL, 'customer1', 'pass123', 'customer1@example.com', 'Customer');

INSERT INTO Users (user_id, username, password, email, role) VALUES
(user_id_seq.NEXTVAL, 'customer2', 'pass456', 'customer2@example.com', 'Customer');

INSERT INTO Users (user_id, username, password, email, role) VALUES
(user_id_seq.NEXTVAL, 'customer3', 'pass789', 'customer3@example.com', 'Customer');

INSERT INTO Users (user_id, username, password, email, role) VALUES
(user_id_seq.NEXTVAL, 'customer4', 'pass101', 'customer4@example.com', 'Customer');

INSERT INTO Users (user_id, username, password, email, role) VALUES
(user_id_seq.NEXTVAL, 'customer5', 'pass202', 'customer5@example.com', 'Customer');

INSERT INTO Users (user_id, username, password, email, role) VALUES
(user_id_seq.NEXTVAL, 'customer6', 'pass303', 'customer6@example.com', 'Customer');

INSERT INTO Users (user_id, username, password, email, role) VALUES
(user_id_seq.NEXTVAL, 'customer7', 'pass404', 'customer7@example.com', 'Customer');

INSERT INTO Users (user_id, username, password, email, role) VALUES
(user_id_seq.NEXTVAL, 'customer8', 'pass505', 'customer8@example.com', 'Customer');

INSERT INTO Users (user_id, username, password, email, role) VALUES
(user_id_seq.NEXTVAL, 'customer9', 'pass606', 'customer9@example.com', 'Customer');



INSERT INTO Suppliers (supplier_id, name, contact_info) VALUES
(supplier_id_seq.NEXTVAL, 'Floral Supply Co.', '123-456-7890');

INSERT INTO Suppliers (supplier_id, name, contact_info) VALUES
(supplier_id_seq.NEXTVAL, 'Blooming Flowers', '987-654-3210');

INSERT INTO Suppliers (supplier_id, name, contact_info) VALUES
(supplier_id_seq.NEXTVAL, 'Petal Pushers', '555-123-4567');

INSERT INTO Suppliers (supplier_id, name, contact_info) VALUES
(supplier_id_seq.NEXTVAL, 'Garden Delights', '555-987-6543');

INSERT INTO Suppliers (supplier_id, name, contact_info) VALUES
(supplier_id_seq.NEXTVAL, 'Flower Power', '555-111-2222');

INSERT INTO Suppliers (supplier_id, name, contact_info) VALUES
(supplier_id_seq.NEXTVAL, 'The Flower Shop', '555-222-3333');

INSERT INTO Suppliers (supplier_id, name, contact_info) VALUES
(supplier_id_seq.NEXTVAL, 'Natures Beauty', '555-333-4444');

INSERT INTO Suppliers (supplier_id, name, contact_info) VALUES
(supplier_id_seq.NEXTVAL, 'Fresh Blooms', '555-444-5555');

INSERT INTO Suppliers (supplier_id, name, contact_info) VALUES
(supplier_id_seq.NEXTVAL, 'Petals N Stems', '555-555-6666');

INSERT INTO Suppliers (supplier_id, name, contact_info) VALUES
(supplier_id_seq.NEXTVAL, 'The Bloom Room', '555-666-7777');



INSERT INTO Orders (order_id, user_id, order_date, status) VALUES
(order_id_seq.NEXTVAL, 2, SYSDATE, 'Pending');

INSERT INTO Orders (order_id, user_id, order_date, status) VALUES
(order_id_seq.NEXTVAL, 3, SYSDATE, 'Shipped');

INSERT INTO Orders (order_id, user_id, order_date, status) VALUES
(order_id_seq.NEXTVAL, 4, SYSDATE, 'Pending');

INSERT INTO Orders (order_id, user_id, order_date, status) VALUES
(order_id_seq.NEXTVAL, 5, SYSDATE, 'Delivered');

INSERT INTO Orders (order_id, user_id, order_date, status) VALUES
(order_id_seq.NEXTVAL, 6, SYSDATE, 'Pending');

INSERT INTO Orders (order_id, user_id, order_date, status) VALUES
(order_id_seq.NEXTVAL, 7, SYSDATE, 'Shipped');

INSERT INTO Orders (order_id, user_id, order_date, status) VALUES
(order_id_seq.NEXTVAL, 8, SYSDATE, 'Pending');

INSERT INTO Orders (order_id, user_id, order_date, status) VALUES
(order_id_seq.NEXTVAL, 9, SYSDATE, 'Delivered');

INSERT INTO Orders (order_id, user_id, order_date, status) VALUES
(order_id_seq.NEXTVAL, 10, SYSDATE, 'Pending');

INSERT INTO Orders (order_id, user_id, order_date, status) VALUES
(order_id_seq.NEXTVAL, 1, SYSDATE, 'Shipped');



INSERT INTO Order_Items (order_item_id, order_id, flower_id, supplier_id, quantity) VALUES
(order_item_id_seq.NEXTVAL, 1, 1, 1, 2); 

INSERT INTO Order_Items (order_item_id, order_id, flower_id, supplier_id, quantity) VALUES
(order_item_id_seq.NEXTVAL, 1, 3, 2, 1); 

INSERT INTO Order_Items (order_item_id, order_id, flower_id, supplier_id, quantity) VALUES
(order_item_id_seq.NEXTVAL, 2, 2, 3, 3);  

INSERT INTO Order_Items (order_item_id, order_id, flower_id, supplier_id, quantity) VALUES
(order_item_id_seq.NEXTVAL, 2, 4, 4, 2);  

INSERT INTO Order_Items (order_item_id, order_id, flower_id, supplier_id, quantity) VALUES
(order_item_id_seq.NEXTVAL, 3, 5, 5, 1);  

INSERT INTO Order_Items (order_item_id, order_id, flower_id, supplier_id, quantity) VALUES
(order_item_id_seq.NEXTVAL, 4, 6, 6, 2);  
INSERT INTO Order_Items (order_item_id, order_id, flower_id, supplier_id, quantity) VALUES
(order_item_id_seq.NEXTVAL, 3, 6, 7, 3);  

INSERT INTO Order_Items (order_item_id, order_id, flower_id, supplier_id, quantity) VALUES
(order_item_id_seq.NEXTVAL, 4, 7, 8, 5);  
INSERT INTO Order_Items (order_item_id, order_id, flower_id, supplier_id, quantity) VALUES
(order_item_id_seq.NEXTVAL, 5, 8, 9, 2);  

INSERT INTO Order_Items (order_item_id, order_id, flower_id, supplier_id, quantity) VALUES
(order_item_id_seq.NEXTVAL, 6, 9, 9, 1);

commit;


SELECT * FROM flowers;
SELECT * FROM Users;
SELECT * FROM Suppliers;
SELECT * FROM Orders;
SELECT * FROM Order_Items;


select f.flower_id, sum(quantity*price) as total
from flowers f
join order_items oi 
on f.flower_id = oi.flower_id
group by f.flower_id;
