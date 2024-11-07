SELECT 
    OrderID, 
    OrderDate,
    CustomerID,
    EmployeeID,
    StoreID,
    Status as StatusCD,
    CASE
        WHEN Status = '01' THEN 'In Progress'
        WHEN Status = '02' THEN 'Completed'
        WHEN Status = '03' THEN 'Cancelled'
        ELSE NULL
    END AS StatusDesc,
    Updated_at
FROM
    {{ source('landing', 'ordr') }}