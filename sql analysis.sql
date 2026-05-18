-- Inventory Optimization and risk analysis

SELECT  
p.Device_Name,
p.Device_Brand,
i.Device_Stock_Quantity,
i.Device_Reorder_Level,
(i.Device_Reorder_Level - i.Device_Stock_Quantity) AS Shortage_Amount,
((i.Device_Reorder_Level - i.Device_Stock_Quantity) * pr.Device_Price) AS Investment_Required
FROM tok.Inventory_Warehouse i
JOIN tok.purchused_Product p ON i.Device_ID = p.Device_ID
JOIN tok.Procurement_Logistic pr ON i.Device_ID = pr.Device_ID
WHERE i.Device_Stock_Quantity < i.Device_Reorder_Level
ORDER BY Investment_Required DESC;

 
 SELECT count(*) AS Shortage_Amount
from tok.inventory_warehouse i
where (i.Device_Reorder_Level - i.Device_Stock_Quantity) >= 0;

-- device need tight control/high value and high dependancy suppliers
SELECT 
Device_Supplier,
COUNT(DISTINCT Device_ID) AS Unique_Products_Sourced,
SUM(Device_Price * Quantity_Imported) AS Total_Sourced_Value,
GROUP_CONCAT(DISTINCT Country_Of_Origin) AS Sourcing_Countries
FROM tok.Procurement_Logistic pr join tok.supplier s on s.device_1d = pr.device_id
GROUP BY Device_Supplier
ORDER BY Total_Sourced_Value DESC;

-- analysis Warehouse Space Utilization
SELECT 
p.Device_Category,
 SUM(i.Device_Stock_Quantity) AS Total_Units,
 SUM(p.Device_Weight * i.Device_Stock_Quantity) AS Total_Weight_In_Warehouse,
i.Device_Location_In_Warehouse
FROM tok.purchused_Product p
JOIN tok.Inventory_Warehouse i ON p.Device_ID = i.Device_ID
GROUP BY p.Device_Category, i.Device_Location_In_Warehouse
ORDER BY Total_Weight_In_Warehouse DESC;



-- procedure

CREATE DEFINER=`root`@`localhost` PROCEDURE `GetSupplierStockAlerts`(

)
SELECT 
        p.Device_ID,
        p.Device_Name,
        p.Device_Brand,
        p.Device_Category,
        i.Device_Stock_Quantity,
        i.Device_Reorder_Level,
        
        -- 2. Calculate exactly how many units to order to fix the shortage
        (i.device_reorder_level-i.Device_Stock_Quantity) AS Units_To_Order,
        
        -- 3. Calculate financial cost per item to restock
        pl.Device_Price,
        (i.device_reorder_level-i.Device_Stock_Quantity) * pl.Device_Price AS Total_Restock_Cost,
        
        -- 4. Provide warehouse location so staff can verify physical inventory
        i.Device_Location_In_Warehouse,
        s.device_Supplier_Contact,
        s.device_Supplier_Email
    FROM tok.purchused_product p
    -- Link the core product to its inventory status
    INNER JOIN tok.Inventory_Warehouse i ON p.Device_ID = i.Device_ID
    -- Link to get price metrics
    INNER JOIN tok.Procurement_Logistic pl ON pl.Device_ID = i.Device_ID
    -- Link to get specific supplier contact info
    INNER JOIN tok.Supplier s ON pl.Device_id = s.Device_1d
    
    -- 5. Filter criteria: Only show items below safety stock for the chosen supplier
    WHERE i.Device_Stock_Quantity < i.Device_Reorder_Level
      
      
    -- 6. Prioritize by the highest financial risk / cost
    ORDER BY Total_Restock_Cost DESC