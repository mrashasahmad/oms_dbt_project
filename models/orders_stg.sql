SELECT 
    OrderID, 
    OrderDate,
    CustomerID,
    EmployeeID,
    StoreID,
    Status as StatusCD,
    StatusDesc,
    Updated_at
FROM
    {{ source('landing', 'ordr') }}