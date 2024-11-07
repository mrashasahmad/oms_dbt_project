{{ config(materialized='table') }}

SELECT 
    o.OrderID,
    o.OrderDate,
    o.CustomerID,
    o.EmployeeID,
    o.StoreID,
    o.StatusCD,
    o.StatusDesc,
    o.Updated_at,
    COUNT(DISTINCT o.OrderID) as OrderCount,
    SUM(oi.TotalPrice) as Revenue
FROM 
    {{ ref('orders_stg') }} o
 JOIN
    {{ ref('orderitems_stg') }} oi ON o.OrderID = oi.OrderID 
GROUP BY
    o.OrderID,
    o.OrderDate,
    o.CustomerID,
    o.EmployeeID,
    o.StoreID,
    o.StatusCD,
    o.StatusDesc,
    o.Updated_at