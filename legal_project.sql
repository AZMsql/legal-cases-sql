
-- Legal Cases SQL Project
--Schema: cases(id, filed_date, status, court, case_type, amount)
--Author: Aziza M. Brown

—Task 1: New cases by year
SELECT strftime( ‘%Y’, filed_date) AS year,
	COUNT(*) AS case_count
FROM cases
GROUP BY year
ORDER BY year;

—Task 2: Open vs. closed counts
SELECT status, 
	COUNT(*) AS case_count
FROM cases
GROUP BY status;

—Task 3: Average claim amount by case type
SELECT case_type,
	AVG(amount) AS avg_claim
FROM cases
GROUP BY case_type
ORDER BY avg_claim DESC;

—Task 4: Top 5 courts by filings
SELECT court,
	COUNT(*) AS filings 
FROM cases
GROUP BY court
ORDER BY filings DESC
LIMIT 5;

—Task 5: Year-over-year growth in filings
SELECT strftime( ‘%Y’, filed_date) AS year,
	COUNT(*) AS filings
FROM cases
GROUP BY year
ORDER BY year;

—Task 6: High-value cases (amount > X)
SELECT id, case_type, amount
FROM cases
WHERE amount > 100000
ORDER BY amount DESC;

—Task 7: Case types with average amount > X
SELECT case_type,
	AVG(amount) AS avg_claim
FROM cases
GROUP BY case_type
HAVING AVG(amount) > 50000
ORDER BY avg_claim DESC;

—Task 8: Distinct case types list
SELECT DISTINCT case_type
FROM cases
ORDER BY case_type;

—Task 9: Monthly filings (last 12 months)
SELECT strftime(‘%Y-%m’, filed_date)  AS month,
	COUNT(*) AS filings
FROM cases
GROUP BY month
ORDER BY month DESC
LIMIT 12;

—Task 10: Percent of cases by status
SELECT status
	ROUND(100.0 * COUNT( * ) ? (SELECT COUNT( * ) FROM cases, 2) AS percent
FROM cases
GROUP BY status
ORDER BY percent DESC;
