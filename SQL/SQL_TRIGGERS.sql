-- TRIGGERS

CREATE TRIGGER new_price
BEFORE INSERT ON sql_store.products
FOR EACH ROW
SET NEW.unit_price = NEW.unit_price-(NEW.unit_price*0.1);

INSERT INTO sql_store.products
VALUES(12, 'books', 30, 50.5);
SELECT * FROM sql_store.products;


-- --------------------------------

USE sql_store;

CREATE TRIGGER status_trigger
AFTER INSERT ON orders
FOR EACH ROW
INSERT order_statuses(order_status_id, name)
VALUES (order_status_id, 'order unsuccessful');

INSERT INTO orders(order_id, customer_id, order_date, comments, shipped_date, shipper_id)
VALUES(11, 2, '2019-04-07', 'order was not successful', '2019-04-07', 3);

SELECT * FROM orders;
SELECT * FROM order_statuses;

DROP TRIGGER status_trigger;