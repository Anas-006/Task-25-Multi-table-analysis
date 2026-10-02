select 
o.id as order_id,
o.customer_id,
od.product_id,
p.product_name,
od.unit_price,
(od.quantity*od.unit_price)as sales_amount,
od.quantity
from orders o
join order_details od on o.id=od.order_id
join products p on od.product_id=p.id
limit 10;

SELECT
    SUM(od.quantity * od.unit_price) AS total_sales
FROM order_details od;

SELECT
    p.product_name AS product_name,
    SUM(od.quantity) AS total_quantity,
    SUM(od.quantity * od.unit_price) AS total_sales
FROM order_details od
JOIN products p
    ON od.product_id = p.id
GROUP BY p.product_name
ORDER BY total_sales DESC;

SELECT
    o.customer_id AS customer_id,
    SUM(od.quantity * od.unit_price) AS total_sales
FROM orders o
JOIN order_details od
    ON o.id = od.order_id
GROUP BY o.customer_id
ORDER BY total_sales DESC;

SELECT
    o.employee_id AS employee_id,
    SUM(od.quantity * od.unit_price) AS total_sales
FROM orders o
JOIN order_details od
    ON o.id = od.order_id
GROUP BY o.employee_id
ORDER BY total_sales DESC;

SELECT
    YEAR(o.order_date) AS order_year,
    MONTH(o.order_date) AS order_month,
    SUM(od.quantity * od.unit_price) AS total_sales
FROM orders o
JOIN order_details od
    ON o.id = od.order_id
GROUP BY
    YEAR(o.order_date),
    MONTH(o.order_date)
ORDER BY
    order_year,
    order_month;

SELECT
    p.product_name AS product_name,
    SUM(od.quantity * od.unit_price) AS total_sales
FROM order_details od
JOIN products p
    ON od.product_id = p.id
GROUP BY p.product_name
ORDER BY total_sales DESC
LIMIT 10;

SELECT
    COUNT(*) AS joined_rows,
    COUNT(DISTINCT o.id) AS unique_orders,
    SUM(od.quantity * od.unit_price) AS total_sales
FROM orders o
JOIN order_details od
    ON o.id = od.order_id;

SELECT
    COUNT(DISTINCT o.id) AS total_orders,
    SUM(od.quantity) AS total_quantity,
    SUM(od.quantity * od.unit_price) AS total_sales,
    AVG(od.quantity * od.unit_price) AS average_line_sales
FROM orders o
JOIN order_details od
    ON o.id = od.order_id;

