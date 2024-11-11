WITH FirstYearSales AS(
SELECT product_id, year, quantity, price, 
min(year) OVER (PARTITION BY product_id) as first_year
FROM SALES
)
SELECT product_id, first_year, quantity, price 
FROM FirstYearSales
WHERE year = first_year
