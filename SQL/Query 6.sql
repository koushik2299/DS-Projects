-- Generate a report which contains the top 5 customers who received an
-- average high pre_invoice_discount_pct for the fiscal year 2021 and in the
-- Indian market. The final output contains these fields,
-- customer_code
-- customer
-- average_discount_percentage

SELECT * FROM gdb023.dim_customer;
SELECT * FROM gdb023.fact_pre_invoice_deductions;


SELECT a.customer_code, ANY_VALUE(b.customer) AS customer, AVG(a.pre_invoice_discount_pct) AS "average_discount_percentage"
FROM gdb023.fact_pre_invoice_deductions AS a
JOIN gdb023.dim_customer AS b ON a.customer_code = b.customer_code
WHERE b.market = "India"
GROUP BY a.customer_code
ORDER BY average_discount_percentage DESC
LIMIT 5;