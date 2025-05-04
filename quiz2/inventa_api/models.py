from database import conn, cursor

def create_product(data):
    cursor.execute("INSERT INTO Products (Name, Price, Stock) VALUES (%s, %s, %s)",
                   (data.name, data.price, data.stock))
    conn.commit()
    return cursor.lastrowid

def get_products():
    cursor.execute("SELECT * FROM Products")
    return cursor.fetchall()

def get_product(product_id):
    cursor.execute("SELECT * FROM Products WHERE ProductID = %s", (product_id,))
    return cursor.fetchone()

def update_product(product_id, data):
    cursor.execute("UPDATE Products SET Name=%s, Price=%s, Stock=%s WHERE ProductID=%s",
                   (data.name, data.price, data.stock, product_id))
    conn.commit()

def delete_product(product_id):
    cursor.execute("DELETE FROM Products WHERE ProductID = %s", (product_id,))
    conn.commit()
