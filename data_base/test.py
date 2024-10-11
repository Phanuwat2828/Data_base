import random
from datetime import datetime, timedelta

# Sample data pools
customer_ids = ['c09', 'c10', 'c11', 'c12', 'c13', 'c14', 'c15', 'c16', 'c17', 'c18']
shop_ids = ['s01', 's02', 's03', 's04', 's05', 's06', 's07', 's08']
product_ids = ['p01', 'p02', 'p03', 'p04', 'p05', 'p06', 'p07', 'p08', 'p19', 'p20', 'p21', 'p22', 'p23', 'p24', 'p25']

def random_date(year):
    start_date = datetime(year, 1, 1)
    end_date = datetime(year, 12, 31)
    delta = end_date - start_date
    random_days = random.randint(0, delta.days)
    return start_date + timedelta(days=random_days)

oid = 7
for year in range(2020, 2031):
    for _ in range(10):  # 10 orders per year
        cusid = random.choice(customer_ids)
        shopid = random.choice(shop_ids)
        odate = random_date(year).strftime('%d-%m-%Y')
        # 70% chance the order is completed
        if random.random() < 0.7:
            fdate_dt = datetime.strptime(odate, '%d-%m-%Y') + timedelta(days=random.randint(1, 14))
            fdate = fdate_dt.strftime('%d-%m-%Y')
            status = random.choice([1, 2, 3])
            review = random.uniform(1, 5) if status == 3 else 0
        else:
            fdate = 'NULL'
            status = random.choice([1, 2])
            review = 0
        list_price = random.randint(100, 100000)
        discount_point = random.randint(0, min(5000, list_price))
        final_price = list_price - discount_point
        print(f"INSERT INTO orders VALUES({oid}, '{cusid}', '{shopid}', '{odate}', {fdate if fdate != 'NULL' else 'NULL'}, {list_price}, {discount_point}, {final_price}, {status}, {round(review,1)});")
        
        # Order Details
        num_items = random.randint(1, 5)
        for _ in range(num_items):
            pid = random.choice(product_ids)
            amount = random.randint(1, 10)
            use_point = random.randint(0, 1000)
            item_price = (amount * random.randint(10, 1000)) - use_point
            print(f"INSERT INTO order_detail (oid, pid, amount, use_point, item_price) VALUES({oid}, '{pid}', {amount}, {use_point}, {item_price});")
        
        oid += 1
