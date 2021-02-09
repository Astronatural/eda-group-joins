-- 0. Get all the users
SELECT * FROM customers;


--Get all customers and their addresses.
SELECT * FROM "customers"
JOIN "addresses" ON "customers"."id"="addresses"."customer_id";


--Get all orders and their line items (orders, quantity and product).
SELECT * FROM "orders"
JOIN "line_items" ON "orders"."id"="line_items"."order_id"
JOIN "products" ON "line_items"."product_id"="products"."id";


--Which warehouses have cheetos?
SELECT * FROM "warehouse"
JOIN "warehouse_product" ON "warehouse"."id"="warehouse_product"."warehouse_id"
JOIN "products" ON "warehouse_product"."product_id"="products"."id"
WHERE "product_id"='5';


--Which warehouses have diet pepsi?
SELECT * FROM "warehouse"
JOIN "warehouse_product" ON "warehouse"."id"="warehouse_product"."warehouse_id"
JOIN "products" ON "warehouse_product"."product_id"="products"."id"
WHERE "product_id"='6';


--Get the number of orders for each customer. NOTE: It is OK if those without orders are not included in results.
SELECT count(*), "customers"."first_name" FROM "orders"
JOIN "addresses" ON "orders"."address_id"="addresses"."id"
JOIN "customers" ON "customers"."id"="addresses"."customer_id"
GROUP BY "customers"."first_name";


--How many customers do we have?
SELECT count(*) FROM "customers";


--How many products do we carry?  
SELECT count(*) FROM "products";


--What is the total available on-hand quantity of diet pepsi?
SELECT count(*) FROM "warehouse"
JOIN "warehouse_product" on "warehouse"."id"="warehouse_product"."warehouse_id"
JOIN "products" on "warehouse_product"."product_id"="products"."id"
WHERE "products"."id"=6;  --or WHERE "products"."description"='diet_pepsi';


--How much was the total cost for each order?
SELECT sum(unit_price), "orders"."id" FROM "orders"
JOIN "addresses" ON "orders"."address_id"="addresses"."id"
JOIN "customers" ON "customers"."id"="addresses"."customer_id"
JOIN "line_items" ON "line_items"."order_id"="orders"."id"
JOIN "products" ON "products"."id"="line_items"."product_id"
GROUP BY "orders"."id";
