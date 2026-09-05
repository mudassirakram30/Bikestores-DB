use bikestores ;

--section 5

--task 36
SELECT
    c.state,
    COUNT(DISTINCT c.customer_id) AS total_customers,
    SUM(oi.quantity * oi.list_price * (1 - oi.discount)) AS total_revenue
FROM sales.customers c
JOIN sales.orders o
    ON c.customer_id = o.customer_id
JOIN sales.order_items oi
    ON o.order_id = oi.order_id
GROUP BY c.state
ORDER BY total_revenue DESC;

--task 37

SELECT
    product_name,
    category_id,
    list_price,
    RANK() OVER (
        PARTITION BY category_id
        ORDER BY list_price DESC
    ) AS price_rank
FROM production.products;

--task 38

SELECT
    MONTH(o.order_date) AS order_month,
    COUNT(DISTINCT o.order_id) AS order_count,
    SUM(oi.quantity * oi.list_price * (1 - oi.discount)) AS total_revenue
FROM sales.orders o
JOIN sales.order_items oi
    ON o.order_id = oi.order_id
WHERE YEAR(o.order_date) = 2017
GROUP BY MONTH(o.order_date)
ORDER BY order_month;

--task 39
SELECT
    store_id,
    product_name,
    SUM(quantity) AS total_quantity
FROM sales.orders o
JOIN sales.order_items oi
    ON o.order_id = oi.order_id
JOIN production.products p
    ON oi.product_id = p.product_id
GROUP BY store_id, product_name
ORDER BY store_id, total_quantity DESC;



--task 40
SELECT
    s.store_name,
    st.first_name,
    st.last_name,
    COUNT(o.order_id) AS number_of_orders,
    SUM(oi.quantity * oi.list_price) AS total_revenue
FROM sales.stores s
JOIN sales.staffs st
    ON s.store_id = st.store_id
JOIN sales.orders o
    ON st.staff_id = o.staff_id
JOIN sales.order_items oi
    ON o.order_id = oi.order_id
GROUP BY
    s.store_name,
    st.first_name,
    st.last_name
ORDER BY total_revenue DESC;