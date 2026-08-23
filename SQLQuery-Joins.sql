USE  bikestores;

/* ================================================================
   8. JOINS
   ================================================================ */


/* -------------------------------
   INNER JOIN

   Returns only matching records
   from both tables.
   ------------------------------- */


-- Products with their stock information
SELECT
    p.product_name,
    s.store_id,
    s.quantity
FROM production.products AS p
INNER JOIN production.stocks AS s
    ON p.product_id = s.product_id;


-- Products with their category
SELECT
    p.product_name,
    c.category_name,
    p.list_price
FROM production.products AS p
INNER JOIN production.categories AS c
    ON p.category_id = c.category_id;


-- Products with their brand
SELECT
    p.product_name,
    b.brand_name
FROM production.products AS p
INNER JOIN production.brands AS b
    ON p.brand_id = b.brand_id;


/* -------------------------------
   LEFT JOIN

   Returns ALL records from the
   left table and matching records
   from the right table.
   ------------------------------- */


-- All products and their stock
SELECT
    p.product_name,
    p.product_id,
    s.quantity
FROM production.products AS p
LEFT JOIN production.stocks AS s
    ON p.product_id = s.product_id;


-- Products that have NO order items
SELECT
    p.product_name,
    oi.order_id
FROM production.products AS p
LEFT JOIN sales.order_items AS oi
    ON p.product_id = oi.product_id
WHERE oi.order_id IS NULL;


-- Customers who have NEVER placed an order
SELECT
    c.first_name,
    c.last_name,
    o.order_id
FROM sales.customers AS c
LEFT JOIN sales.orders AS o
    ON c.customer_id = o.customer_id
WHERE o.order_id IS NULL;


/* -------------------------------
   RIGHT JOIN

   Returns ALL records from the
   right table and matching records
   from the left table.
   ------------------------------- */


SELECT
    p.product_name,
    p.product_id,
    s.quantity
FROM production.products AS p
RIGHT JOIN production.stocks AS s
    ON p.product_id = s.product_id;


/* -------------------------------
   FULL OUTER JOIN

   Returns ALL records from BOTH
   tables.

   Matching records are combined.
   Non-matching records show NULL.
   ------------------------------- */


SELECT
    p.product_name,
    p.product_id,
    s.quantity
FROM production.products AS p
FULL OUTER JOIN production.stocks AS s
    ON p.product_id = s.product_id;


/* -------------------------------
   CROSS JOIN

   Creates every possible
   combination between two tables.

   No ON condition is required.
   ------------------------------- */


SELECT
    p.product_name,
    b.brand_name
FROM production.products AS p
CROSS JOIN production.brands AS b;

SELECT * FROM sales.customers;