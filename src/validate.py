import sqlite3

# Connect to DB
conn = sqlite3.connect("iv.db")
cursor = conn.cursor()

print("🔍 Missing Values:")
for row in cursor.execute("""
SELECT * FROM sales WHERE product_id IS NULL OR product_name IS NULL OR price IS NULL;
"""):
    print(row)

print("\n📦 Duplicate Product IDs:")
for row in cursor.execute("""
SELECT product_id, COUNT(*) FROM sales
GROUP BY product_id HAVING COUNT(*) > 1;
"""):
    print(row)

print("\n💸 Price Outliers:")
for row in cursor.execute("""
SELECT * FROM sales WHERE price < 0 OR price > 10000;
"""):
    print(row)

conn.close()
