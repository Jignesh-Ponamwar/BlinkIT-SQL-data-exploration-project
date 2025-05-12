# 📊 Blinkit SQL Data Exploration Project 

A exploratory data analysis project to create and explore Blinkit's database and solve business problems with ad-hoc analysis.

![Logo](https://upload.wikimedia.org/wikipedia/commons/thumb/2/2f/Blinkit-yellow-app-icon.svg/250px-Blinkit-yellow-app-icon.svg.png)

<br>

## 🧠 About the Project

This project analyzes Blinkit's database by exploring various tables in MYSQL and performing ad-hoc queries to analysze inventory wastages,delivery optimization and customer retention rates.

<br>

## 🎯 Project Objectives

- Built a MYSQL database with various tables using the 11 csv files from the downloaded dataset.
- Perform ad-hoc SQL analysis to solve operational challenges.
- Analyze:
  - Reasons for inventory wastage and stock outages.
  - Delivery timing and performance optimization.
  - Customer retention and repeat order behaviour

<br>

## 📁 Dataset Information

- **Source**: Kaggle
- **File**: `archive`
- [📄 Download the Dataset](archive.zip)


<br>

## 🛠️ Tools & Technologies Used

- **Language**: SQL (MySQL)
- **IDE**: MySQL Workbench
- **Others**: SQLAlchemy (Python for importing data)


<br>

## 🧹 Data Preprocessing

- Explored the csv datasets using MS Excel to understand schema types and tables structure.
- Designed a MYSQL database and populated the data from 11 CSV files to SQL using a Python script for automation.
- Explored all the tables in the dataset to assess the quality of data and ensure no inconsistency or errors were present.

<br>

- [🗂️ View Python Script](csvtosql.py)

- Python code snippet
```python
import pandas as pd
import sqlalchemy


engine = sqlalchemy.create_engine("mysql+pymysql://root:root@localhost/blinkit")

df1 = pd.read_csv(r"C:\Users\jigne\Downloads\archive\blinkit_customer_feedback.csv")
df1.to_sql("customer_feedback", con=engine, if_exists="replace", index=False)

print("DONE!")
```
<br>

## 🗃️ SQL analysis

- From the products and inventory tables, analyzed product wastage by calculating the amount of damaged stock received and optimizing inventory based on product shelf life using joins, CTEs (Common Table Expressions), and various aggregate functions.
- Used the delivery_performance table to analyze potential reasons for delivery delays along with average delay time, distance, and reason using CTEs, CASE statements, and grouping.
- Calculated customer repeat rates and identify areas for improvement to improve retention, using CTEs and various aggregate functions on the customers and customer_feedback tables.


<br>


## 🧾 SQL Query Snippets

- [📋 View full SQL Query script 1](Problem_1.sql)
- [📋 View full SQL Query script 2](Problem_2.sql)
- [📋 View full SQL Query script 3](Problem_3.sql)

- SQL code snippet
```sql
-- DELIVERY DELAY TIME AND REASONS FOR DELAYED DELIVERY

select * from delivery_performance;

select * from delivery_performance where delivery_time_minutes <=0;

WITH delivery AS (
SELECT 
    *,
    (CASE
        WHEN delivery_time_minutes < 0 THEN delivery_time_minutes * (- 1)
        ELSE delivery_time_minutes
    END) AS delivery_delay
FROM
    delivery_performance)
    
SELECT 
    delivery_status,
    ROUND(AVG(distance_km), 2) AS avg_distance_km,
    ROUND(AVG(delivery_delay)) AS avg_delay,
    reasons_if_delayed
FROM
    delivery
GROUP BY delivery_status , reasons_if_delayed
HAVING avg_delay > 5;

-- PROVIDES THE REASON FOR DELIVERY ALONG WITH AVG DELAY IN TIME AND AVG DISTANCE FOR THOSE DELIVERYS
```
<br>
- 🖼️ Output Screenshots
<table>
  <tr>
    <td><img src="SS1.png" width="475"/></td>
    <td><img src="SS2.png" width="475"/></td>
  </tr>
  <tr>
    <<td><img src="SS3.png" width="475"/></td>
    <td><img src="SS4.png" width="475"/></td>
  </tr>
  <tr>
    <td><img src="SS5.png" width="475"/></td>
    <td><img src="SS6.png" width="475"/></td>
  </tr>
</table>

<br>

## 🔍 Key Insights & Conclusions

- Several product categories had more than 10% damaged stock received, with the Household Care category leading at 18–25%.
- Based on the shelf life, fresh stock items such as fruits, vegetables, and dairy products need the most optimization.
- Some orders showed an average delay of around 11 to 23 minutes in the delivery, with traffic being the most common reason for delay.
- The company is performing exceptionally well in retaining customers, with an approximate 94% repeat rate.
- However, improvements in delivery and customer service could contribute to better customer acquisition and retention.


<br>

## 📝 Recommendations

- Brands supplying Household Care products should be contacted and warned about the high rate of damaged stock received. They should be encouraged to use better transportation services to minimize future stock damage.
- Fresh product categories like fruits, vegetables, and dairy must be prioritized for inventory management and timely restocking.
- Delivery performance can be improved by identifying stores with the most amount of delayed deliveries and potentially adding smaller delivery hubs to serve busy areas.
- Delivery and customer service should be further optimized to increase repeat customer rates and improve overall customer satisfaction.
