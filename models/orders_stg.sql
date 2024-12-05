SELECT 
    OrderID, 
    OrderDate,
    CustomerID,
    EmployeeID,
    StoreID,
    Status as StatusCD,
    Status as StatusDesc,
    Updated_at
FROM
    {{ source('landing', 'ordr') }}