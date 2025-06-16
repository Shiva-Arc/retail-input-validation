import pandas as pd
import sqlite3

# Load CSV
df = pd.read_csv('data/raw_sales.csv')

# Save to SQLite
conn = sqlite3.connect('iv.db')
df.to_sql('sales', conn, if_exists='replace', index=False)

print("Data loaded successfully into iv.db")
