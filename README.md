# OLA End-to-End Data Analytics

## 📌 Project Overview

This project is an end-to-end data analytics project based on OLA ride booking data. The project focuses on analyzing ride booking and operational data to understand customer demand, ride completion, cancellations, vehicle performance, revenue, and customer experience.

The analysis follows a complete data analytics workflow, starting from data cleaning and preparation and progressing through SQL-based business analysis and interactive Power BI visualization.

The goal is to transform raw ride booking data into meaningful business insights that can support operational improvements and data-driven decision-making.

## 🎯 Business Objective

The primary objective of this project is to understand the factors affecting OLA ride performance and identify areas where business operations can be improved.

The analysis focuses on questions such as:

* When is ride demand highest and lowest?
* Which pickup locations generate the most bookings?
* Which locations have lower ride completion rates?
* What are the major customer and driver cancellation patterns?
* How do different vehicle types perform?
* How does ride distance relate to booking value?
* What patterns can be observed in customer ratings?
* Which areas or time periods may require operational attention?

## 🛠️ Tools & Technologies

* **Microsoft Excel** – Data cleaning, preparation, and initial data inspection
* **PostgreSQL** – Database creation, data storage, and analysis
* **SQL** – Business questions, aggregations, filtering, calculations, and performance analysis
* **Power BI** – Interactive dashboard development, visualization, and business reporting

## 🔄 Project Workflow

**Raw Data → Excel Cleaning → PostgreSQL → SQL Analysis → Power BI Dashboard → Business Insights & Recommendations**

### 1. Data Cleaning & Preparation

The OLA ride booking dataset was prepared using Microsoft Excel before being imported into PostgreSQL.

The preparation process included:

* Reviewing the dataset structure
* Cleaning missing or blank values
* Checking duplicate records
* Reviewing column headers and data types
* Preparing the cleaned dataset for database analysis
* Saving the prepared data in a suitable format for PostgreSQL

### 2. Data Storage & SQL Analysis

The cleaned dataset was imported into PostgreSQL and analyzed using SQL.

Business-focused SQL analysis was performed to evaluate:

* Booking trends
* Day and time demand patterns
* Booking status and completion
* Pickup location performance
* Customer cancellations
* Driver cancellations
* Cancellation reasons
* Vehicle type performance
* Payment methods
* Ride distance and booking value
* Customer and driver ratings
* High-value bookings

SQL views were also created to organize and reuse important analytical results.

### 3. Power BI Dashboard

The analyzed data was used to develop an interactive Power BI dashboard.

The dashboard is organized around major business areas:

* **Overall** – Overall booking and ride performance
* **Vehicle Type** – Performance across different vehicle categories
* **Revenue** – Booking value and revenue-related analysis
* **Cancellation** – Customer and driver cancellation patterns
* **Ratings** – Customer and driver rating analysis

The dashboard is designed to make key trends and performance indicators easier to understand and support business decision-making.

## 📊 Key Analysis Areas

### Booking & Demand Analysis

* Overall booking trends
* Day-of-week performance
* Hourly demand patterns
* High and low demand periods

### Location Performance

* Pickup location booking volume
* Ride completion rates
* Locations with weaker operational performance
* Comparison of demand and successful ride completion

### Cancellation Analysis

* Customer cancellation patterns
* Driver cancellation patterns
* Cancellation reasons
* Vehicle-type cancellation comparison
* Location and time-based cancellation patterns

### Vehicle Performance

* Booking volume by vehicle type
* Completion and cancellation performance
* Customer and driver ratings by vehicle type

### Revenue & Ride Analysis

* Booking value analysis
* High-value rides
* Ride distance versus booking value
* Revenue patterns across different categories

### Customer Experience

* Customer ratings
* Driver ratings
* Waiting time analysis
* Relationship between operational performance and customer experience

## 📁 Project Structure

ola-ride-analytics/
│
├── README.md
│
├── Cleaned_Data/
│   └── CLEANED_OLA_DATA.csv
│
├── SQL_Analysis/
│   └── OLA_SQL_Analysis.sql
│
├── PowerBI_Dashboard/
│   ├── OLA_DASHBOARD.pbix
│   └── OLA_DASHBOARD-1.pbix
│
└── Project_Report/
    └── OLA_Project_Report.pdf

## 📊 Power BI Dashboards

Two interactive Power BI dashboards were developed to analyse Ola ride-booking performance.

The dashboards cover key business areas, including overall bookings, vehicle type performance, revenue, cancellations, and customer and driver ratings.

The complete Power BI dashboard files are available in the `PowerBI_Dashboard` folder.

## 💡 Business Insights

The SQL analysis and Power BI dashboards provide insights into booking trends, ride completion, cancellation patterns, vehicle performance, revenue, and customer experience.
The detailed analysis and findings are documented in the project report.

## 🎯 Expected Business Value

This analysis can help identify:

* High-demand periods requiring better resource allocation
* Locations with high demand but weaker completion performance
* Major cancellation patterns and potential operational issues
* Vehicle categories requiring closer performance monitoring
* Revenue and booking-value patterns
* Factors affecting customer experience and ratings

## 📚 Skills Demonstrated

* Data Cleaning & Preparation
* Exploratory Data Analysis
* SQL Business Analysis
* PostgreSQL
* Data Aggregation & Calculation
* Data Visualization
* Power BI Dashboard Development
* Business Insight Generation
* Data-Driven Decision Making

## 👤 Author

**Mohammed Adnan Khan**

MBA – Business Analytics
