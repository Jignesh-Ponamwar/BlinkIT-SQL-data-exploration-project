import pandas as pd
import sqlalchemy


engine = sqlalchemy.create_engine("mysql+pymysql://root:root@localhost/blinkit")

df1 = pd.read_csv(r"C:\Users\jigne\Downloads\archive\blinkit_customer_feedback.csv")
df1.to_sql("customer_feedback", con=engine, if_exists="replace", index=False)

df2 = pd.read_csv(r"C:\Users\jigne\Downloads\archive\blinkit_customers.csv")
df2.to_sql("customers", con=engine, if_exists="replace", index=False)

df3 = pd.read_csv(r"C:\Users\jigne\Downloads\archive\blinkit_delivery_performance.csv")
df3.to_sql("delivery_performance", con=engine, if_exists="replace", index=False)

df4 = pd.read_csv(r"C:\Users\jigne\Downloads\archive\blinkit_inventory.csv")
df4.to_sql("inventory", con=engine, if_exists="replace", index=False)

df5 = pd.read_csv(r"C:\Users\jigne\Downloads\archive\blinkit_inventoryNew.csv")
df5.to_sql("inventory_new", con=engine, if_exists="replace", index=False)

df6 = pd.read_csv(r"C:\Users\jigne\Downloads\archive\blinkit_marketing_performance.csv")
df6.to_sql("marketing_performance", con=engine, if_exists="replace", index=False)

df7 = pd.read_csv(r"C:\Users\jigne\Downloads\archive\blinkit_order_items.csv")
df7.to_sql("order_items", con=engine, if_exists="replace", index=False)

df8 = pd.read_csv(r"C:\Users\jigne\Downloads\archive\blinkit_orders.csv")
df8.to_sql("orders", con=engine, if_exists="replace", index=False)

df9 = pd.read_csv(r"C:\Users\jigne\Downloads\archive\blinkit_products.csv")
df9.to_sql("products", con=engine, if_exists="replace", index=False)

print("DONE!")
