select*from logistics ;


# Shipment & Delay Analysis
# 1.What percentage of shipments are delayed vs on-time?
SELECT Logistics_Delay,COUNT(*) AS shipment_count,ROUND(COUNT(*) * 100.0 / SUM(COUNT(*)) OVER (), 2) AS percentage
FROM logistics GROUP BY Logistics_Delay; 
-- 1 delayed shipments,0 means on-time shipments

# 2.What are the most common reasons for logistics delays?
SELECT Logistics_Delay_Reason,COUNT(*) AS delay_count FROM logistics
WHERE Logistics_Delay = 1 AND Logistics_Delay_Reason <> 'None'
GROUP BY Logistics_Delay_Reason ORDER BY delay_count DESC;

# 3.How does traffic condition impact shipment delays and waiting time?
SELECT Traffic_Status,AVG(Waiting_Time) AS avg_waiting_time,
SUM(Logistics_Delay) AS delayed_shipments,COUNT(*) AS total_shipments
FROM logistics GROUP BY Traffic_Status ORDER BY avg_waiting_time DESC;

# 4.At what times do shipment delays occur most frequently?
SELECT hour,COUNT(*) AS delayed_shipments
FROM logistics WHERE Logistics_Delay = 1
GROUP BY hour ORDER BY delayed_shipments DESC;

# 5.Which time periods have the highest shipment congestion?
SELECT day_of_week,COUNT(*) AS shipment_volume
FROM logistics GROUP BY day_of_week
ORDER BY shipment_volume DESC;

SELECT day_name,COUNT(*) AS shipment_volume
FROM logistics GROUP BY day_name
ORDER BY shipment_volume DESC;

SELECT week,COUNT(*) AS shipment_volume
FROM logistics GROUP BY week
ORDER BY shipment_volume DESC;



# 2.Waiting Time & Operational Efficiency
# 1.Which assets experience the highest average waiting time?
SELECT Asset_ID,ROUND(AVG(Waiting_Time), 2) AS avg_waiting_time
FROM logistics GROUP BY Asset_ID
ORDER BY avg_waiting_time DESC;

# 2.Is higher waiting time associated with lower asset utilization?
SELECT CASE WHEN Waiting_Time < 20 THEN 'Low Waiting'
WHEN Waiting_Time BETWEEN 20 AND 40 THEN 'Medium Waiting'
ELSE 'High Waiting' END AS waiting_category,
ROUND(AVG(Asset_Utilization), 2) AS avg_asset_utilization
FROM logistics GROUP BY waiting_category;

# 3.How does waiting time affect delivery performance?
SELECT Logistics_Delay,AVG(waiting_time) AS avg_waiting_time
FROM logistics GROUP BY Logistics_Delay;

# 4.Weekly shipment demand trend
SELECT year AS year,week,COUNT(*) AS shipment_volume
FROM logistics GROUP BY year, week
ORDER BY year, week;


# 3.Asset Utilization
# 1.Which assets are under-utilized despite high demand forecasts?
SELECT Asset_ID,ROUND(AVG(Asset_Utilization), 2) AS avg_utilization,
ROUND(AVG(Demand_Forecast), 2) AS avg_demand
FROM logistics GROUP BY Asset_ID HAVING avg_utilization < 80 
AND avg_demand >= 200 ORDER BY avg_utilization ASC;

# 2.How does asset utilization vary by location (latitude & longitude)?
SELECT Latitude,Longitude,ROUND(AVG(Asset_Utilization), 2) AS avg_utilization
FROM logistics GROUP BY Latitude, Longitude;

# 4.Inventory & Demand Forecasting
# 1.Are inventory levels aligned with demand forecasts?
SELECT CASE WHEN Inventory_Level < Demand_Forecast THEN 'Understocked'
WHEN Inventory_Level = Demand_Forecast THEN 'Balanced'
ELSE 'Overstocked' END AS inventory_status,COUNT(*) AS shipment_count
FROM logistics GROUP BY inventory_status;

# 2.Do low inventory levels contribute to shipment delays?
SELECT CASE WHEN Inventory_Level < 200 THEN 'Low Inventory'
ELSE 'Sufficient Inventory'END AS inventory_group,
ROUND(AVG(Logistics_Delay), 2) AS delay_rate
FROM logistics GROUP BY inventory_group;

# 5.Revenue & Customer Behavior
# 1.Do shipment delays impact user transaction amounts?
SELECT Logistics_Delay,ROUND(AVG(User_Transaction_Amount), 2) AS avg_transaction_amount
FROM logistics GROUP BY Logistics_Delay;

# 2.Is purchase frequency affected by delayed shipments?
SELECT Logistics_Delay,ROUND(AVG(User_Purchase_Frequency), 2) AS avg_purchase_frequency
FROM logistics GROUP BY Logistics_Delay;

# 6.Environmental Impact
# 1.Do temperature and humidity correlate with shipment delays?
SELECT CASE WHEN Temperature < 20 THEN 'Low Temp'
WHEN Temperature BETWEEN 20 AND 30 THEN 'Moderate Temp'
ELSE 'High Temp'END AS temperature_range,
ROUND(AVG(Logistics_Delay), 2) AS delay_rate,
ROUND(AVG(Humidity), 2) AS avg_humidity
FROM logistics GROUP BY temperature_range;


# Financial Impact:
# Assume:
# Delay cost = 500 per shipment
# Idle cost per hour = 100

# Cost impact of delayed shipments:
SELECT COUNT(*) * 500 AS total_delay_cost
FROM logistics WHERE Logistics_Delay = 1;

# Which inefficiencies cost the most?
SELECT logistics_delay_reason,COUNT(*) * 500 AS cost_impact
FROM logistics WHERE logistics_delay = 1
GROUP BY logistics_delay_reason ORDER BY cost_impact DESC;

select day_name from logistics;