from fastapi import FastAPI, HTTPException
import models
from schemas import ProductCreate, Product

app = FastAPI()

@app.post("/products/", response_model=Product)
def create(data: ProductCreate):
    new_id = models.create_product(data)
    return {**data.dict(), "product_id": new_id}

@app.get("/products/", response_model=list[Product])
def list_products():
    return models.get_products()

@app.get("/products/{product_id}", response_model=Product)
def get(product_id: int):
    product = models.get_product(product_id)
    if not product:
        raise HTTPException(status_code=404, detail="Not found")
    return product

@app.put("/products/{product_id}")
def update(product_id: int, data: ProductCreate):
    models.update_product(product_id, data)
    return {"message": "Product updated"}

@app.delete("/products/{product_id}")
def delete(product_id: int):
    models.delete_product(product_id)
    return {"message": "Product deleted"}
