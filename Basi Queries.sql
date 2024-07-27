CREATE database pizza_hub;
use pizza_hub;

-- 1. The total number of orders placed
SELECT 
    COUNT(order_id) AS total_orders
FROM
    orders;
    
-- 2.Total revenue generated from pizza sales
SELECT SUM(p.price*od.quantity) AS 	total_revenue
FROM pizzas p
JOIN order_details od
ON p.pizza_id=od.pizza_id;

-- 3.Identify the highest-priced pizza.
SELECT 
    pt.name, pz.price AS highest_price
FROM
    pizza_types pt
        JOIN
    pizzas pz ON pt.pizza_type_id = pz.pizza_type_id
ORDER BY highest_price DESC
LIMIT 1;

-- 4.Identify the most common pizza size ordered.
SELECT 
    pz.size, COUNT(od.order_details_id) AS order_count
FROM
    pizzas pz
        JOIN
    order_details od ON pz.pizza_id = od.pizza_id
GROUP BY pz.size
ORDER BY order_count DESC
LIMIT 1;

-- 5.List the top 5 most ordered pizza types along with their quantities.
SELECT 
    pt.name, SUM(od.quantity) AS quantity_ordred
FROM pizzas p 
INNER JOIN pizza_types pt ON p.pizza_type_id=pt.pizza_type_id
        JOIN
    order_details od ON p.pizza_id= od.pizza_id
GROUP BY pt.name
ORDER BY quantity_ordred DESC
LIMIT 5;


