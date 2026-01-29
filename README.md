# End-to-End Logistics ETL & Analytics Project

## Project Overview
OptiFlow Logistics is experiencing frequent shipment delays, high waiting times, inefficient asset utilization, and limited operational visibility. These challenges increase operational costs, reduce customer satisfaction, and make demand planning difficult.

This project delivers an end-to-end ETL and analytics solution using **Python, SQL, and Power BI** to transform raw logistics data into actionable business insights.

## Business Objectives
- Reduce shipment delays and waiting times  
- Identify key operational bottlenecks  
- Improve asset utilization and allocation  
- Align inventory levels with demand forecasts  
- Quantify the financial impact of operational inefficiencies  
- Enable data-driven decision-making through interactive dashboards  

## Stakeholders
- **Operations Manager** – Monitor delays, waiting times, and asset efficiency  
- **Logistics Planner** – Optimize routing, scheduling, and asset allocation  
- **Supply Chain Manager** – Improve inventory and demand alignment  
- **Finance Team** – Assess cost impact of delays  
- **Executive Leadership** – Track KPIs and overall operational performance  

## Data Description
The dataset contains approximately **1,000 shipment-level records** with the following attributes:  
- Timestamp (Date & Time)  
- Asset ID  
- Location (Latitude, Longitude)  
- Shipment Status & Delay Flag  
- Waiting Time  
- Traffic Status  
- Logistics Delay Reason  
- Asset Utilization  
- Inventory Level & Demand Forecast  
- Customer Transactions & Purchase Frequency  
- Environmental Factors (Temperature, Humidity)  

## ETL Architecture

### Extract
- Raw logistics data ingested from CSV files  
- Data loaded into Python using Pandas  

### Transform
- Data cleaning (null handling, data type corrections)  
- Feature engineering (delay flags, waiting time categories, inventory status)  
- KPI calculations and aggregations using SQL and Python  

### Load
- Transformed data stored in MySQL tables  
- Optimized SQL views created for analytics  
- Power BI connected to MySQL for reporting  

**Data Flow:**  
`Source → Python → MySQL → Power BI`  

## SQL-Based Analysis & Key Findings

### Shipment & Delay Analysis
- 56.6% of shipments are delayed, indicating systemic inefficiencies  
- Primary delay drivers:
  - Weather (151)  
  - Traffic (135)  
  - Mechanical Failure (133)  
- Delays peak during business hours (8 AM – 2 PM)  
- Highest shipment congestion observed on specific weekdays  

### Waiting Time & Operational Efficiency
- Certain assets consistently experience higher waiting times  
- Asset utilization remains stable at ~79%, regardless of waiting time  
- Waiting time is a direct contributor to shipment delays  
- Weekly shipment demand shows identifiable peak periods  

### Asset Utilization
- Identified under-utilized assets despite high demand forecasts  
- Significant geographic variation in asset utilization  

### Inventory & Demand Forecasting
- 73.6% of shipments are overstocked, indicating inventory imbalance  
- Inventory level is not a primary driver of shipment delays  

### Revenue & Customer Behavior
- Delayed shipments show slightly higher transaction values  
- Purchase frequency is marginally lower for delayed shipments  

### Environmental Impact
- Higher delay rates observed under low-temperature conditions  
- Humidity remains consistently high across shipments  

### Financial Impact
- Estimated **$283,000 cost impact** from delayed shipments  
- Highest cost contributors:
  - Weather-related delays  
  - Traffic congestion  
  - Mechanical failures  

## 📈 Power BI Dashboard Design

### Dashboard Pages
- **Executive Overview** – KPIs, delay %, total cost impact  
- **Shipment & Delay Analysis** – Delay reasons, peak hours, congestion trends  
- **Operational Efficiency & Waiting Time** – Waiting time patterns, weekly demand  
- **Inventory, Temperature & Financial Impact** – Inventory status and cost drivers  

### Key Features
- Interactive filters & slicers (Date, Asset, Traffic Status)  
- Page navigation for stakeholder-specific views  
- KPI cards and trend analysis visuals  

## Business Recommendations
- Implement predictive routing using traffic and weather data  
- Optimize shipment scheduling to avoid peak congestion hours  
- Improve preventive maintenance to reduce mechanical failures  
- Reallocate assets based on utilization and demand forecasts  
- Reduce overstocking through improved demand planning  
- Monitor high-value shipments with stricter SLA controls  

## Conclusion
This project demonstrates how an end-to-end ETL and analytics solution can significantly improve logistics operations. By integrating Python, SQL, and Power BI, the analysis uncovered key inefficiencies driving shipment delays and operational costs. The resulting dashboards empower stakeholders to make data-driven decisions that enhance efficiency, reduce costs, and improve customer satisfaction.

## Technology Stack
- **Python (Pandas, SQLAlchemy)** – Data extraction, transformation, and analysis  
- **MySQL** – Centralized analytical data storage  
- **Power BI** – Interactive dashboards and reporting  
- **Jupyter Notebook** – ETL development and orchestration  

## Project Outcomes
- Delivered a complete end-to-end ETL & BI solution  
- Quantified operational inefficiencies and financial impact  
- Built executive-ready, interactive dashboards  
- Created a strong portfolio project showcasing real-world data engineering and analytics skills

