SELECT
    os.StoreID,
    SUM(ofact.Revenue) as ActualSales,
    SUM(st.SalesTarget) as TargetSales
FROM 
    {{ ref('orders_stg') }} os 
JOIN 
    {{ ref('orders_fact') }} ofact ON os.OrderID = ofact.OrderID 
JOIN
    {{ ref('salestargets') }} st ON st.StoreID = os.StoreID
GROUP BY os.StoreID
