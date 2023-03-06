-- 5. Get the products that have the highest and lowest manufacturing costs.
-- The final output should contain these fields,
-- product_code
-- product
-- manufacturing_cost
-- Viewing the table
select * from gdb023.fact_manufacturing_cost;

-- Query for the required output
select a.product_code,b.product,a.manufacturing_cost 
from gdb023.fact_manufacturing_cost as a 
join gdb023.dim_product as b
on a.product_code = b.product_code
where a.manufacturing_cost = (select max(manufacturing_cost) from gdb023.fact_manufacturing_cost) or 
a.manufacturing_cost = (select min(manufacturing_cost) from gdb023.fact_manufacturing_cost)
order by a.manufacturing_cost Desc;


