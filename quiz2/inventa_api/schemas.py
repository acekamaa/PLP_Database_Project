from pydantic import BaseModel

class ProductBase(BaseModel):
    name: str
    price: float
    stock: int

class ProductCreate(ProductBase):
    pass

class Product(ProductBase):
    product_id: int

    class Config:
        orm_mode = True
