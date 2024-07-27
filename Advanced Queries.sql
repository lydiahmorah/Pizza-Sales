-- 1.Calculate the percentage contribution of each pizza type to total revenue.
SELECT 
    pt.name, SUM(p.price * od.quantity) AS revenue
FROM
    pizza_types AS pt
        INNER JOIN
    pizzas AS p ON pt.pizza_type_id = p.pizza_type_id
        JOIN
    order_details AS od ON p.pizza_id = od.pizza_id
GROUP BY pt.name
ORDER BY revenue DESC LIMIT 3;

-- Determine the top 3 most ordered pizza types based on revenue for each pizza category.
SELECT date, SUM(revenue) OVER (ORDER BY date) AS cum_revenue 
FROM (
  SELECT 
    orders.date, 
    SUM(pizzas.price * order_details.quantity) AS revenue 
  FROM 
    pizzas 
  INNER JOIN order_details ON pizzas.pizza_id = order_details.pizza_id 
  INNER JOIN orders ON order_details.order_id = orders.order_id 
  GROUP BY orders.date
) AS sales;
