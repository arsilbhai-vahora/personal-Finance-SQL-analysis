# Personal Finance SQL Analysis

## Project Overview
This project analyzes personal finance transaction data using SQL to uncover spending patterns, savings trends, and budget insights across multiple years.

## Dataset
- **Source:** [Kaggle - Personal Transactions Dataset](https://www.kaggle.com)
- **Records:** Personal income and expense transactions
- **Fields:** Date, Description, Amount, Transaction Type, Category, Account Name

## Tools Used
- SQLite / DB Browser for SQLite
- SQL (Aggregations, CASE WHEN, Subqueries, Window Functions)

## Business Questions Answered
1. What is the total income vs total expenses?
2. Which categories have the highest spending?
3. Which month had the highest spending?
4. What is the average monthly savings?
5. Which months did expenses exceed income?
6. What are the top 5 largest single transactions?
7. What percentage of spending does each category represent?
8. What is the monthly spending trend over time?
9. How does spending vary by category month-over-month?
10. What does the full monthly financial summary look like?
    
## Key Findings
- Total income across all transactions was $124,269.76 vs total expenses of $96,083.78,
  resulting in an overall surplus of $28,185.98
- Credit Card Payment was the highest spending category at $33,041.36 (34.39%),
  followed by Mortgage & Rent at $24,754.50 (25.76%) and Home Improvement at $19,092.87 (19.87%)
- Together the top 3 categories account for 80% of all spending
- June 2019 was the highest spending month at $11,999.60
- Average monthly savings was $1,342.19
- Expenses exceeded income in 3 months: May 2018, January 2019, and June 2019
- The 2 largest single transactions were both Home Improvement payments to Mike's
  Construction Co. — $9,200 in June 2019 and $8,000 in May 2018, which explains
  why those months had unusually high spending
- Monthly spending trend shows 2018 was generally stable ($2,900–$3,500/month)
  with spikes in May 2018 and mid-2019 due to home improvement costs
- Best savings month was January 2018 with a 59.07% savings rate
  and worst was May 2018 at -123.74% due to the $8,000 home improvement payment
- Query 9 shows 319 rows of category-level monthly data across 21 spending categories

## What I Learned
- Writing complex SQL queries using CASE WHEN, subqueries, and window functions
- Analyzing real-world financial data to extract meaningful business insights
- Structuring a data analysis project for a professional portfolio
