-- 1. Missing Values
SELECT * FROM sales WHERE product_id IS NULL OR product_name IS NULL OR price IS NULL;

-- 2. Duplicate Product IDs
SELECT product_id, COUNT(*) AS dup_count
FROM sales
GROUP BY product_id
HAVING dup_count > 1;

-- 3. Price Outliers
SELECT * FROM sales WHERE price < 0 OR price > 10000;
