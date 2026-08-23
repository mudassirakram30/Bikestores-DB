USE bikestores;


/* ================================================================
   1. BASIC QUERYING
   ================================================================ */

-- Select all columns and all rows
SELECT *
FROM sales.customers;


-- Select specific columns
SELECT
    customer_id,
    first_name,
    last_name
FROM sales.customers;


/* ================================================================
   2. FILTERING
   ================================================================ */


/* ------------------------------------
   COMPARISON OPERATORS

   >   Greater than
   <   Less than
   =   Equal to
   >=  Greater than or equal to
   <=  Less than or equal to
   !=  Not equal to
   <>  Not equal to
   ------------------------------- */


-- Greater than
SELECT *
FROM sales.customers
WHERE customer_id > 50;


-- Less than
SELECT *
FROM sales.customers
WHERE customer_id < 50;


-- Greater than or equal to
SELECT *
FROM sales.customers
WHERE customer_id >= 50;


-- Less than or equal to
SELECT *
FROM sales.customers
WHERE customer_id <= 50;


-- Equal to
SELECT *
FROM sales.customers
WHERE customer_id = 50;


-- Not equal to
SELECT *
FROM sales.customers
WHERE state != 'CA';


/* -------------------------------
   LOGICAL OPERATORS

   AND = Both conditions must be true
   OR  = At least one condition must be true
   NOT = Reverses a condition
   ------------------------------- */


-- AND
-- Both conditions must match
SELECT *
FROM sales.customers
WHERE first_name = 'Garry'
  AND state = 'TX';


-- OR
-- At least one condition must match
SELECT *
FROM sales.customers
WHERE state = 'NY'
   OR state = 'TX';


-- NOT
-- State must NOT be CA
SELECT *
FROM sales.customers
WHERE state != 'CA';


/* -------------------------------
   NULL VALUES

   IS NULL     = Value is missing
   IS NOT NULL = Value exists
   ------------------------------- */


-- Customers who have not provided a phone number
SELECT *
FROM sales.customers
WHERE phone IS NULL;


-- Customers who have provided a phone number
SELECT *
FROM sales.customers
WHERE phone IS NOT NULL;


/* -------------------------------
   BETWEEN

   BETWEEN includes both values.
   ------------------------------- */


-- Customer IDs from 5 through 56
SELECT *
FROM sales.customers
WHERE customer_id BETWEEN 5 AND 56;


/* -------------------------------
   IN

   IN is used to check multiple values.
   ------------------------------- */


-- Using OR
SELECT *
FROM sales.customers
WHERE state = 'NY'
   OR state = 'CA';


-- Using IN (recommended)
SELECT *
FROM sales.customers
WHERE state IN ('NY', 'CA');


/* ================================================================
   3. ALIAS
   ================================================================ */


-- AS gives a column a temporary name
SELECT
    first_name + ' ' + last_name AS full_name
FROM sales.customers;


/* ================================================================
   4. LIMITING ROWS
   ================================================================ */


-- Return only the first 15 rows
SELECT TOP 15 *
FROM sales.customers;


-- Skip 10 rows and return the next 10 rows
SELECT *
FROM sales.customers
ORDER BY first_name
OFFSET 10 ROWS
FETCH NEXT 10 ROWS ONLY;


/* ================================================================
   5. ORDER BY
   ================================================================ */


-- Ascending order
SELECT *
FROM sales.customers
ORDER BY first_name ASC;


-- Descending order
SELECT *
FROM sales.customers
ORDER BY first_name DESC;


-- Multiple columns
-- First sort by state, then by first name
SELECT *
FROM sales.customers
ORDER BY state ASC,
         first_name DESC;


-- First name ascending,
-- last name descending
SELECT *
FROM sales.customers
ORDER BY first_name ASC,
         last_name DESC;


/* ================================================================
   6. SUBQUERY
   ================================================================ */


-- Find customers who have placed an order
SELECT *
FROM sales.customers
WHERE customer_id IN
(
    SELECT customer_id
    FROM sales.orders
);


/* ================================================================
   7. COUNT
   ================================================================ */


-- Count all products
SELECT COUNT(*)
FROM production.products;


-- Count all stock records
SELECT COUNT(*)
FROM production.stocks;