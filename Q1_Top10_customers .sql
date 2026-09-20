  create database olist;
use olist;



# Question 1: Who are the top 10 customers by total amount spent?

select * from customers;
select * from orders;
select * from `order payments`;

#We need:
#   1. customer_id (from 'customers' and 'orders' tables) - identifies the customer
#   2. order_id (from 'orders' and 'order payments' tables) - identifies what the customer purchased
#   3. payment_value (from 'order payments' tables) - identifies how much the customer paid



#List the actual column header names of the tables:
describe orders;
describe `order payments`;
describe customers;

#The column header names in the "orders" table is incorrect. The names are C1 to C8, while the actual meaningful names
#are in the first row of the table data. We need to fix the table headers first.

#Replace the column headers with the correct header names found in the first row of the table.
ALTER TABLE orders
RENAME COLUMN C1 TO order_id;
ALTER TABLE orders
RENAME COLUMN C2 TO customer_id;
ALTER TABLE orders
RENAME COLUMN C3 TO order_status;
ALTER TABLE orders
RENAME COLUMN C4 TO order_purchase_timestamp;
ALTER TABLE orders
RENAME COLUMN C5 TO order_approved_at;
ALTER TABLE orders
RENAME COLUMN C6 TO order_delivered_carrier_date;
ALTER TABLE orders
RENAME COLUMN C7 TO order_delivered_customer_date;
ALTER TABLE orders
RENAME COLUMN C8 TO order_estimated_delivery_date;

#Validate the contents of the "orders" table if the column names are now correct.
select * from orders;

#Delete the first row of the table that contains the header names, instead of the actual data
DELETE FROM orders
WHERE order_id = 'order_id';

#Validate the contents of the "orders" table if it now has the correct header names, and if the first row contains the actual data.
select * from orders;

#Now that our header names in the “orders” table are correct, we can create the SQL commands to aggregate, sort, and get the top 10:
SELECT
    o.customer_id,
    SUM(op.payment_value) AS total_spent
FROM orders as o
JOIN `order payments` as op
    ON o.order_id = op.order_id
GROUP BY o.customer_id
ORDER BY total_spent DESC
LIMIT 10;


