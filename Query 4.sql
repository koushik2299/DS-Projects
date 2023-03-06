-- 4. Follow-up: Which segment had the most increase in unique products in
-- 2021 vs 2020? The final output contains these fields,
-- segment
-- product_count_2020
-- product_count_2021
-- difference

-- Getting the Number of Unique_Products in 2020 and 2021
SELECT p.segment, COUNT(DISTINCT case when s.fiscal_year = 2020 then (s.product_code) end) AS "product_count_2020",
COUNT(distinct CASE WHEN s.fiscal_year = 2021 THEN (s.product_code) END) AS "product_count_2021",
COUNT(distinct CASE WHEN s.fiscal_year = 2021 THEN (s.product_code) END) - COUNT(DISTINCT case when s.fiscal_year = 2020 then (s.product_code) end) as "difference"
from gdb023.fact_gross_price as s join gdb023.dim_product as p  on s.product_code=p.product_code group by p.segment order by difference desc;