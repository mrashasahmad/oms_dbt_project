SELECT
    os.CustomerID,
    c.CustomerName,
    SUM(os.OrderCount) AS OrderCount,
    SUM(os.revenue) as Revenue
FROM 
    {{ ref('orders_fact') }} os 
JOIN 
    {{ ref('customers_stg') }} c 
ON os.CustomerID = c.CustomerID
GROUP BY 
    os.CustomerID,
    c.CustomerName 