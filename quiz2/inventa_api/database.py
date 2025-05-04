import mysql.connector

conn = mysql.connector.connect(
    host="localhost",
    user="root",
    password="123456789",
    database="inventapos"
)

cursor = conn.cursor(dictionary=True)
