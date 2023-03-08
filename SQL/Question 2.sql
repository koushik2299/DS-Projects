-- Question 2
-- What is the percentage of unique product increase in 2021 vs. 2020? The
-- final output contains these fields,
-- unique_products_2020
-- unique_products_2021
-- percentage_chg

-- Getting Unique Products in two years
SELECT fiscal_year,COUNT(DISTINCT(product_code)) as "Number of Unique Products"
 from gdb023.fact_gross_price group by fiscal_year;
 
 -- Caluculating the percentages
SELECT 245 AS unique_products_2020 , 334 as unique_products_2021,
((334-245)/245)*100 as Percentage_chg;

Select COUNT(DISTINCT case when fiscal_year = 2020 then product_code end) as "unique_products_2020",
COUNT(DISTINCT CASE WHEN fiscal_year = 2021 then product_code end) as "unique_products_2021",
((COUNT(DISTINCT CASE WHEN fiscal_year = 2021 then product_code end)-COUNT(case when fiscal_year = 2020 then product_code end))/COUNT(case when fiscal_year = 2020 then product_code end))*100 as "percentage_change"
 from gdb023.fact_gross_price;
