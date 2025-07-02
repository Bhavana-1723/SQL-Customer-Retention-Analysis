CREATE DATABASE CustomerRetentionDB;
CREATE TABLE customers (customer_id INT, gender VARCHAR(10),age INT, signup_date DATE, location VARCHAR(50))
INSERT INTO customers (customer_id, gender, age, signup_date, location) VALUES
(1, 'Female', 22, '2023-02-15', 'Bangalore'),
(2, 'Male', 29, '2023-03-22', 'Mumbai'),
(3, 'Female', 31, '2023-05-10', 'Delhi'),
(4, 'Male', 25, '2023-01-18', 'Hyderabad'),
(5, 'Female', 34, '2023-04-01', 'Bangalore'),
(6, 'Male', 28, '2023-02-20', 'Mumbai'),
(7, 'Female', 23, '2023-06-12', 'Delhi'),
(8, 'Female', 26, '2023-07-01', 'Hyderabad');
CREATE TABLE orders (order_id INT,customer_id INT,order_date DATE,total_amount INT,payment_method VARCHAR(20),product_id INT)
INSERT INTO orders (order_id, customer_id, order_date, total_amount, payment_method, product_id) VALUES
(1, 1, '2023-03-01', 1299, 'Card', 3),
(2, 2, '2023-03-30', 449, 'UPI', 4),
(3, 3, '2023-05-20', 999, 'Cash', 1),
(4, 4, '2023-02-22', 3099, 'Wallet', 5),
(5, 5, '2023-04-10', 1899, 'UPI', 2),
(6, 6, '2023-03-02', 999, 'Card', 3),
(7, 7, '2023-07-20', 4299, 'Wallet', 1),
(8, 8, '2023-07-15', 799, 'Cash', 4)
CREATE TABLE products (product_id INT,category VARCHAR(50),price INT)
INSERT INTO products (product_id, category, price) VALUES
(1, 'Electronics', 4299),
(2, 'Clothing', 1899),
(3, 'Beauty', 1299),
(4, 'Home', 799),
(5, 'Books', 3099);
select * from customers
select * from orders
select * from products
SELECT COUNT(*) AS total_customers FROM customers;
SELECT customer_id, COUNT(*) AS total_orders
FROM orders
GROUP BY customer_id;
SELECT customer_id, SUM(total_amount) AS total_spent
FROM orders
GROUP BY customer_id;
SELECT customer_id, SUM(total_amount) AS total_spent
FROM orders
GROUP BY customer_id
ORDER BY total_spent DESC
OFFSET 0 ROWS FETCH NEXT 3 ROWS ONLY;
SELECT p.category, COUNT(*) AS times_bought
FROM orders o
JOIN products p ON o.product_id = p.product_id
GROUP BY p.category
ORDER BY times_bought DESC;
SELECT customer_id, COUNT(*) AS order_count
FROM orders
GROUP BY customer_id
HAVING COUNT(*) > 1;
SELECT customer_id, AVG(total_amount) AS avg_order_value
FROM orders
GROUP BY customer_id;
SELECT payment_method, SUM(total_amount) AS total_revenue
FROM orders
GROUP BY payment_method;
SELECT c.location, SUM(o.total_amount) AS city_spend
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
GROUP BY c.location
ORDER BY city_spend DESC;


