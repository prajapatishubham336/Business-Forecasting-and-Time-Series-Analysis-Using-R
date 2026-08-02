# Business-Forecasting-and-Time-Series-Analysis-Using-R
Business Forecasting using R to analyze monthly sales data, identify trends and seasonal patterns, calculate moving averages, and forecast future sales for better business decision-making.


## 📌 Project Overview

This project demonstrates **Business-Forecasting-and-Time-Series-Analysis-Using-R** with monthly sales data of a fruit juice business.

The project analyzes historical sales data, identifies trends and seasonal patterns, calculates moving averages, performs trend analysis using linear regression, and generates a forecast for the next month.

The main objective is to use **statistical analysis and time-series forecasting techniques** to support business decision-making.

---

## 🎯 Objectives

* Collect and present monthly sales data.
* Calculate descriptive statistics.
* Visualize sales using different charts.
* Create and analyze a time-series object.
* Decompose the time series into its components.
* Calculate Simple Moving Averages.
* Calculate Weighted Moving Average.
* Forecast next month's sales.
* Perform trend analysis using Linear Regression.
* Analyze quarterly seasonal variations.
* Calculate seasonal indices.
* Generate useful business recommendations.

---

## 🛠️ Technologies Used

* **R**
* **RStudio**
* Base R Statistical Functions
* Time Series Analysis
* Linear Regression
* Data Visualization

---

## 📂 Project Structure

```text
Business-Forecasting-Using-R/
│
├── Business_Forecasting.R
├── README.md
└── Dataset/
    └── sales_data.csv
```

> The dataset is created directly in the R script using monthly sales values.

---

## 📊 Dataset

The dataset contains monthly sales information for **January 2025 to December 2026**, giving a total of **24 monthly observations**.

### Dataset Variables

| Column  | Description           |
| ------- | --------------------- |
| Month   | Month and Year        |
| Sales   | Monthly sales value   |
| Quarter | Corresponding quarter |

### Sample Data

| Month  | Sales |
| ------ | ----: |
| Jan-25 |  1200 |
| Feb-25 |  1250 |
| Mar-25 |  1400 |
| Apr-25 |  1650 |
| May-25 |  1900 |
| Jun-25 |  2100 |
| Jul-25 |  1850 |
| Aug-25 |  1750 |
| Sep-25 |  1600 |
| Oct-25 |  1700 |
| Nov-25 |  1950 |
| Dec-25 |  2300 |

The same monthly pattern is provided for 2026.

---

# 🔍 Project Tasks

## Task 1: Data Collection & Presentation

The sales dataset is created using R vectors and converted into a data frame.

The project displays:

* Complete dataset
* Dataset structure
* Summary statistics
* First five records
* Last five records

```r
sales_data <- data.frame(Month, Sales)

print(sales_data)
str(sales_data)
summary(sales_data)
head(sales_data, 5)
tail(sales_data, 5)
```

---

## Task 2: Descriptive Statistics

Several statistical measures are calculated to understand the sales data.

The analysis includes:

* Total Sales
* Average Sales
* Median Sales
* Maximum Sales
* Minimum Sales
* Standard Deviation
* Variance
* Range

These measures provide an overall understanding of the business's sales performance.

---

## Task 3: Data Visualization

The project uses multiple visualization techniques to understand sales patterns.

### 📊 Bar Chart

Displays sales for each month and helps compare monthly performance.

### 📈 Line Chart

Shows the overall movement and trend of sales over time.

### 🥧 Pie Chart

Represents the contribution of each month to total sales.

### 📉 Histogram

Shows the frequency distribution of sales values.

### 📦 Box Plot

Helps identify the spread and possible outliers in the sales data.

---

## Task 4: Time Series Analysis

The monthly sales data is converted into a time-series object using:

```r
sales_ts <- ts(Sales,
               start=c(2025,1),
               frequency=12)
```

Since the data is monthly, the frequency is set to **12**.

### Time Series Decomposition

The project uses the `decompose()` function to identify:

* Trend
* Seasonal component
* Random/Irregular component

```r
decomp <- decompose(sales_ts)
plot(decomp)
```

This helps understand the different components affecting monthly sales.

---

# 📈 Task 5: Moving Average

Moving averages are used to smooth short-term fluctuations and identify the underlying sales pattern.

### 3-Month Simple Moving Average

```r
SMA3 <- stats::filter(
  Sales,
  rep(1/3,3),
  sides=1
)
```

### 4-Month Simple Moving Average

```r
SMA4 <- stats::filter(
  Sales,
  rep(1/4,4),
  sides=1
)
```

### Weighted Moving Average

A weighted moving average is calculated using:

* Previous month = 20%
* Second previous month = 30%
* Current month = 50%

```text
Forecast =
Previous-2 × 0.2
+ Previous-1 × 0.3
+ Current × 0.5
```

The weighted moving average gives more importance to the most recent sales value.

---

# 📊 Task 6: Trend Analysis

A **Linear Regression Model** is used to identify the overall sales trend.

```r
Time <- 1:length(Sales)

trend_model <- lm(Sales ~ Time)
```

The model estimates:

* Intercept
* Slope
* Trend values
* Forecast for January 2027

The trend line is plotted together with actual sales values to visually compare actual performance with the estimated trend.

### Regression Model

The model follows the general form:

```text
Sales = Intercept + Slope × Time
```

---

# 📅 Task 7: Seasonal Variation

The monthly data is divided into four quarters:

| Quarter | Months                      |
| ------- | --------------------------- |
| Q1      | January, February, March    |
| Q2      | April, May, June            |
| Q3      | July, August, September     |
| Q4      | October, November, December |

Quarter-wise average sales are calculated using:

```r
aggregate(Sales ~ Quarter,
          data=sales_data,
          mean)
```

### Seasonal Index

The seasonal index is calculated as:

```text
Seasonal Index =
Seasonal Average / Overall Average × 100
```

A seasonal index greater than **100** indicates above-average demand, while an index below **100** indicates below-average demand.

The quarter with the highest seasonal index is identified as the quarter with the highest demand.

---

# 💼 Task 8: Business Interpretation

The project identifies:

* Highest sales month
* Lowest sales month
* Overall sales trend
* Quarter with highest seasonal demand
* Forecasted sales for the next month

These results are converted into practical business recommendations.

---

# 📌 Business Decisions

Based on the analysis, the following business decisions can be considered:

### 1. Increase Inventory

Inventory can be increased before high-demand periods to avoid stock shortages.

### 2. Offer Discounts

Discounts and special offers can be introduced during low-sales months to improve demand.

### 3. Improve Marketing

Marketing and promotional campaigns can be increased during periods of lower sales.

### 4. Demand Planning

Historical sales trends and seasonal patterns can be used for better inventory and production planning.

### 5. Sales Forecasting

Weighted moving averages and trend analysis can help management estimate future sales.

---

# 📈 Key Insights

The analysis helps the business understand:

* Monthly sales performance
* Overall sales trend
* Seasonal demand patterns
* High-demand quarters
* Low-demand periods
* Short-term future sales expectations

This information can support better **inventory management, marketing planning, production planning, and sales strategy**.

---

# 🚀 How to Run the Project

## Step 1: Install R

Download and install R from the official R website.

## Step 2: Install RStudio

RStudio can be used as the development environment for running the project.

## Step 3: Open the R Script

Open:

```text
Business_Forecasting.R
```

in RStudio.

## Step 4: Run the Script

Run the complete script or execute each task separately.

The script will generate:

* Statistical outputs
* Bar chart
* Line chart
* Pie chart
* Histogram
* Box plot
* Time-series plot
* Time-series decomposition
* Moving averages
* Trend line
* Seasonal analysis
* Business interpretations

---

# 📦 R Packages

This project primarily uses **Base R**, so no external packages are required for the main analysis.

Functions used include:

```r
data.frame()
summary()
mean()
median()
sd()
var()
barplot()
plot()
pie()
hist()
boxplot()
ts()
decompose()
filter()
lm()
predict()
aggregate()
```

---

# 📁 Files

| File                     | Description             |
| ------------------------ | ----------------------- |
| `Business_Forecasting.R` | Complete R source code  |
| `README.md`              | Project documentation   |
| `Dataset/`               | Optional dataset folder |

---

# 🎓 Learning Outcomes

After completing this project, you will understand:

* Data collection and presentation in R
* Descriptive statistics
* Data visualization
* Time-series analysis
* Time-series decomposition
* Simple Moving Average
* Weighted Moving Average
* Linear Regression
* Trend analysis
* Seasonal analysis
* Seasonal indices
* Business forecasting
* Data-driven business decisions

---

# 🔮 Future Improvements

The project can be further improved by:

* Using a larger real-world sales dataset.
* Comparing multiple forecasting models.
* Implementing Exponential Smoothing.
* Implementing ARIMA forecasting.
* Measuring forecast accuracy using MAE, MSE and RMSE.
* Creating an interactive dashboard using Shiny.
* Adding automated future-month forecasts.
* Comparing actual sales with forecasted sales.

---

# 👨‍💻 Author

**Shubham**

This project was developed as a practical implementation of **Business Forecasting and Time Series Analysis using R**.

---

## ⭐ Conclusion

This project demonstrates how historical business sales data can be analyzed using R to identify **trends, seasonal patterns and future demand**.

By combining descriptive statistics, visualization, moving averages, time-series decomposition, linear regression and seasonal analysis, businesses can make more informed decisions regarding **inventory, marketing and sales planning**.
