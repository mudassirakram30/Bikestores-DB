use bikestores ;

--section 4

--task 20

SELECT
    categories.category_name,
    COUNT(products.product_id) AS product_count
FROM production.categories
JOIN production.products
    ON categories.category_id = products.category_id
GROUP BY categories.category_name;

--task 21
SELECT
    brands.brand_name,
    AVG(products.list_price) AS average_price
FROM production.brands
JOIN production.products
    ON brands.brand_id = products.brand_id
GROUP BY brands.brand_name;

--task 22
SELECT
    stores.store_name,
    COUNT(orders.order_id) AS total_orders
FROM sales.stores
JOIN sales.orders
    ON stores.store_id = orders.store_id
GROUP BY stores.store_name;

--task 23
SELECT
    order_items.order_id,
    SUM(order_items.quantity * order_items.list_price * (1 - order_items.discount)) AS total_revenue
FROM sales.order_items
GROUP BY order_items.order_id;

--task 24

SELECT
    customers.first_name + ' ' + customers.last_name AS customer_name,
    COUNT(orders.order_id) AS order_count
FROM sales.customers
JOIN sales.orders
    ON customers.customer_id = orders.customer_id
GROUP BY customers.first_name, customers.last_name
ORDER BY order_count DESC;


--task 25
SELECT TOP 1
    brands.brand_name,
    AVG(products.list_price) AS average_price
FROM production.brands
JOIN production.products
    ON brands.brand_id = products.brand_id
GROUP BY brands.brand_name
ORDER BY average_price DESC;

--task 26
SELECT
    categories.category_name,
    COUNT(products.product_id) AS product_count
FROM production.categories
JOIN production.products
    ON categories.category_id = products.category_id
GROUP BY categories.category_name
HAVING COUNT(products.product_id) > 50;


--task 27

SELECT
    stores.store_name,
    SUM(order_items.quantity * order_items.list_price * (1 - order_items.discount)) AS total_revenue
FROM sales.stores
JOIN sales.orders
    ON stores.store_id = orders.store_id
JOIN sales.order_items
    ON orders.order_id = order_items.order_id
GROUP BY stores.store_name;

-- task 28

SELECT
    staffs.first_name + ' ' + staffs.last_name AS staff_name,
    COUNT(orders.order_id) AS order_count
FROM sales.staffs
JOIN sales.orders
    ON staffs.staff_id = orders.staff_id
GROUP BY staffs.first_name, staffs.last_name
HAVING COUNT(orders.order_id) > 50;