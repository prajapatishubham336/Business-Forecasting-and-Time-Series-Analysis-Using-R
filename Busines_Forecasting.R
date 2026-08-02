# BUSINESS FORECASTING USING R
# Datasets

Month <- c("Jan-25","Feb-25","Mar-25","Apr-25","May-25","Jun-25",
           "Jul-25","Aug-25","Sep-25","Oct-25","Nov-25","Dec-25",
           "Jan-26","Feb-26","Mar-26","Apr-26","May-26","Jun-26",
           "Jul-26","Aug-26","Sep-26","Oct-26","Nov-26","Dec-26")

Sales <- c(1200,1250,1400,1650,1900,2100,
           1850,1750,1600,1700,1950,2300,
           1300,1350,1500,1750,2000,2250,
           1950,1850,1700,1800,2100,2450)

# TASK 1 : DATA COLLECTION & PRESENTATION
sales_data <- data.frame(Month, Sales)

cat("Complete Dataset\n")
print(sales_data)


cat("\nStructure of Dataset\n")
str(sales_data)

cat("\nSummary Statistics\n")
print(summary(sales_data))

cat("\nFirst Five Records\n")
print(head(sales_data, 5))

cat("\nLast Five Records\n")
print(tail(sales_data, 5))

# TASK 2 : DESCRIPTIVE STATISTICS
cat("\nTotal Sales =", sum(Sales))

cat("\nAverage Sales =", mean(Sales))

cat("\nMedian Sales =", median(Sales))

cat("\nMaximum Sales =", max(Sales))

cat("\nMinimum Sales =", min(Sales))

cat("\nStandard Deviation =", sd(Sales))

cat("\nVariance =", var(Sales))

cat("\nRange = ")
print(range(Sales))

# TASK 3 : DATA VISUALIZATION

# 1. Bar Chart

barplot(Sales,
        names.arg=Month,
        col="skyblue",
        main="Monthly Sales of Fruit Juice",
        xlab="Month",
        ylab="Sales",
        las=2)

# 2. Line Chart

plot(Sales,
     type="o",
     col="blue",
     pch=16,
     xaxt="n",
     main="Monthly Sales Trend",
     xlab="Month",
     ylab="Sales")

axis(1,at=1:length(Month),labels=Month,las=2)

# 3. Pie Chart

pie(Sales,
    labels=Month,
    col=rainbow(24),
    main="Sales Distribution")

# 4. Histogram

hist(Sales,
     col="lightgreen",
     main="Histogram of Sales",
     xlab="Sales",
     ylab="Frequency")

# 5. Box Plot

boxplot(Sales,
        col="pink",
        main="Box Plot of Sales",
        ylab="Sales")


# TASK 4 : COMPONENTS OF TIME SERIES
# Create Time Series Object
sales_ts <- ts(Sales, start=c(2025,1), frequency=12)

# Display Time Series
print(sales_ts)

# Plot Time Series
plot(sales_ts,
     main="Monthly Sales Time Series",
     xlab="Year",
     ylab="Sales",
     col="blue",
     lwd=2)

# Decompose Time Series
decomp <- decompose(sales_ts)

# Plot Components
plot(decomp)

# TASK 5 : MOVING AVERAGE

# 3-Month Simple Moving Average
SMA3 <- stats::filter(Sales, rep(1/3,3), sides=1)

cat("\n3-Month Moving Average\n")
print(SMA3)

# 4-Month Simple Moving Average
SMA4 <- stats::filter(Sales, rep(1/4,4), sides=1)

cat("\n4-Month Moving Average\n")
print(SMA4)

# Weighted Moving Average
weights <- c(0.2,0.3,0.5)

WMA <- rep(NA, length(Sales))

for(i in 3:length(Sales))
{
  WMA[i] <- Sales[i-2]*0.2 +
    Sales[i-1]*0.3 +
    Sales[i]*0.5
}

cat("\nWeighted Moving Average\n")
print(WMA)

# Forecast Next Month
forecast <- Sales[22]*0.2 +
  Sales[23]*0.3 +
  Sales[24]*0.5

cat("\nForecast for Next Month =", forecast)

# TASK 6 : TREND ANALYSIS

# Create Time Variable
Time <- 1:length(Sales)

# Linear Regression Model
trend_model <- lm(Sales ~ Time)

# Model Summary
summary(trend_model)

# Regression Equation
cat("\nIntercept =", coef(trend_model)[1])

cat("\nSlope =", coef(trend_model)[2])

# Predict January 2027
predict(trend_model,
        newdata=data.frame(Time=25))

# Trend Values
trend <- predict(trend_model)

# Plot Actual Sales
plot(Time, Sales,
     pch=16,
     col="blue",
     xlab="Time",
     ylab="Sales",
     main="Actual Sales vs Trend Line")

# Add Trend Line
lines(Time,
      trend,
      col="red",
      lwd=2)


# TASK 7 : SEASONAL VARIATION

# Arrange data Quarter-wise
Quarter <- rep(c("Q1","Q2","Q3","Q4"), each=3, times=2)

sales_data <- data.frame(Month, Quarter, Sales)

print(sales_data)

# Overall Average
overall_avg <- mean(Sales)
cat("\nOverall Average =", overall_avg)

# Seasonal Average
seasonal_avg <- aggregate(Sales ~ Quarter,
                          data=sales_data,
                          mean)

cat("\nSeasonal Average\n")
print(seasonal_avg)

# Seasonal Index
seasonal_avg$Seasonal_Index <-
  (seasonal_avg$Sales / overall_avg) * 100

cat("\nSeasonal Index\n")
print(seasonal_avg)

# Quarter with Maximum Demand
max_quarter <-
  seasonal_avg$Quarter[which.max(seasonal_avg$Seasonal_Index)]

cat("\nQuarter with Highest Demand =", max_quarter)

# TASK 8 : BUSINESS INTERPRETATION

# Highest Sales Month
highest_month <- Month[which.max(Sales)]
highest_sales <- max(Sales)

cat("\nHighest Sales Month =", highest_month)
cat("\nHighest Sales =", highest_sales)

# Lowest Sales Month
lowest_month <- Month[which.min(Sales)]
lowest_sales <- min(Sales)

cat("\nLowest Sales Month =", lowest_month)
cat("\nLowest Sales =", lowest_sales)

# Sales Trend
cat("\nSales Trend : Increasing")

# Highest Seasonal Index
highest_index <-
  seasonal_avg$Quarter[which.max(seasonal_avg$Seasonal_Index)]

cat("\nHighest Seasonal Index Quarter =",
    highest_index)

# Forecast Next Month using Weighted Moving Average
forecast <- Sales[22]*0.2 +
  Sales[23]*0.3 +
  Sales[24]*0.5

cat("\nForecast Next Month Sales =", forecast)

# BUSINESS DECISIONS

cat("\n\nBusiness Decisions\n")

cat("\n1. Increase inventory before high-demand season.")

cat("\n2. Offer discounts during low-sales months.")

cat("\n3. Improve marketing and promotional campaigns to increase overall sales.")
