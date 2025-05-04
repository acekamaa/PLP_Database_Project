# PLP_Database_Project

## 🧾Inventa POS System

## 📌 Project Title

InventaPOS - Point of Sale API

## 📄 Description

InventaPOS is a backend API built with **FastAPI** for managing sales, products, and transactions in a Point of Sale system. It supports full **CRUD operations**, stores data in a **MySQL database**, and is designed for both retail and small business use cases.

## 🚀 Features

- Create, view, update, and delete products
- Manage sales and individual sale items
- MySQL database integration
- Swagger UI for easy API testing

## 🛠️ How to Setup & Run the Project

📌 Clone the repo 
https://github.com/acekamaa/PLP_Database_Project

📌 Install Dependencies
pip install fastapi uvicorn mysql-connector-python pydantic

📌 Set Up MySQL
import the SQL Schema file
mysql -u your_user -p < inventaPOS_schema.sql

Update database.py with your MySQL credentials.

📌 Run the Server
uvicorn main:app --reload

Open in browser

## 📄 Database ERD 

https://lucid.app/lucidchart/5c0d6055-d1ba-40f5-9941-8fe8011148d8/view
