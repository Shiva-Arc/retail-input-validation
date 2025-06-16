import pandas as pd

df = pd.read_csv('data/raw_sales.csv')

report = {
    "Missing Product IDs": df['product_id'].isnull().sum(),
    "Missing Product Names": df['product_name'].isnull().sum(),
    "Missing Prices": df['price'].isnull().sum(),
    "Duplicate Product IDs": df['product_id'].duplicated(keep=False).sum(),
    "Price Outliers": df[(df['price'] < 0) | (df['price'] > 10000)].shape[0]
}

print("\n📊 DATA VALIDATION REPORT")
for key, value in report.items():
    print(f"{key}: {value}")
