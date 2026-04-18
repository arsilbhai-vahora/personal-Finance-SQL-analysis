--1) Total Income vs Total Expenses
SELECT "Transaction Type", ROUND(sum(Amount),2) as Total
from personal_transactions
GROUP BY "Transaction Type";

--2) Highest Spending 10 Category
SELECT Category, ROUND(sum(Amount),2) as Total_Spending
from personal_transactions
where "Transaction Type" = "debit"
group by Category
order by Total_Spending DESC
LIMIT 10;

--3) Month with the Highest Spending
SELECT substr(Date, 7, 4) || '-' || substr(date, 1, 2) AS Month, round(SUM(Amount),2) AS Total_Spending
FROM personal_transactions
WHERE "Transaction Type" = 'debit'
GROUP BY Month
ORDER by Total_Spending DESC
LIMIT 1;

--4) Average Monthly Saving
SELECT round(AVG(Montly_Saving),2) AS Avg_Monthly_Saving
From (
	SELECT
	substr(Date, 7, 4)||'-'|| substr(Date, 1, 2) AS Month,
	SUM(CASE WHEN "Transaction Type" = 'credit' THEN Amount ELSE 0 END)-
	SUM(CASE WHEN "Transaction Type" = 'debit' THEN Amount ELSE 0 END) AS Montly_Saving
	FROM personal_transactions
	GROUP BY substr(Date, 7, 4)||'-'|| SUBSTR(Date, 1, 2)
);

--5) Months when Expenses Exceeded Income
SELECT Month, Income, Expenses
From(
	SELECT
	SUBSTR(Date, 7, 4)||'-'|| SUBSTR(Date, 1, 2) As Month,
	SUM(CASE WHEN "Transaction Type"= 'credit' THEN Amount ELSE 0 END) AS Income,
	SUM(CASE WHEN "Transaction Type"= 'debit' THEN Amount ELSE 0 END) AS Expenses
	FROM personal_transactions
	GROUP BY SUBSTR(Date, 7, 4) ||'-'|| SUBSTR(Date, 1, 2)
)
WHERE Expenses > Income;

--6) Top 5 Largest Single TRANSACTION
SELECT Date, Description, Amount, Category
FROM personal_transactions
ORDER BY Amount DESC
LIMIT 5;

--7) Spending % By Category
SELECT Category,
	round(SUM(Amount), 2) AS Category_Total,
	round(SUM(Amount)*100.0/ SUM(SUM(Amount)) OVER (), 2) AS Percentage
FROM personal_transactions
WHERE "Transaction Type" = 'debit'
Group BY Category
ORDER BY percentage DESC;

--8) Monthly Spending Trend
SELECT
	substr(Date, 7, 4) || '-' || substr(Date, 1, 2) AS Month,
	round(SUM(Amount), 2) AS TOtal_Spending
FROM personal_transactions
WHERE "Transaction Type" = 'debit'
GROUP BY substr(Date, 7, 4) || '-' || substr(Date, 1, 2)
ORDER BY Month;

--9) Category Spending Month-Over-Month
SELECT
	substr(Date, 7, 4) || '-' || substr(Date, 1, 2) AS Month,
	Category,
	round(SUM(Amount), 2) AS TOtal_Spending
FROM personal_transactions
WHERE "Transaction Type" = 'debit'
GROUP BY substr(Date, 7, 4) || '-' || substr(Date, 1, 2), Category
ORDER BY Category, Month;

--10) Full Monthly Summary
SELECT 
	substr(Date, 7, 4) || '-' || substr(Date, 1, 2) AS Month,
	ROUND(SUM(CASE WHEN "Transaction Type" = 'credit' THEN Amount ELSE 0 END),2) AS Income,
	ROUND(SUM(CASE WHEN "Transaction Type" = 'debit' THEN Amount ELSE 0 END),2) AS Expenses,
	ROUND(SUM(CASE WHEN "Transaction Type" = 'credit' THEN Amount ELSE 0 END) -
		  SUM(CASE WHEN "Transaction Type" = 'debit' THEN Amount ELSE 0 END),2) AS Saving,
	ROUND((SUM(CASE WHEN "Transaction Type" = 'credit' THEN Amount ELSE 0 END) -
		   SUM (CASE WHEN "Transaction Type" = 'debit' THEN Amount ELSE 0 END)) * 100.0/
		   NULLIF(SUM(CASE WHEN "Transaction Type" = 'credit' THEN Amount ELSE 0 END), 0), 2) AS Savings_Rate_Pct
	FROM personal_transactions
	GROUP BY substr(DATE,7, 4) || '-' || substr(Date, 1, 2)
	ORDER BY Month;
		  
	
