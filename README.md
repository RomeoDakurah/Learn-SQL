# Learn-SQL

This project demonstrates basic **SQL database design and queries** using SQLite.  
It includes tables for product categories, products, and inventory, along with queries to analyze inventory data.

## Database Design

### Tables

1. **productCategory**
   - `id` (PRIMARY KEY)  
   - `name` (TEXT, required, max 256 characters)

2. **product**
   - `id` (PRIMARY KEY)  
   - `name` (TEXT, required, max 256 characters)  
   - `categoryId` (FOREIGN KEY → productCategory.id)  
   - `brand` (TEXT, optional, max 256 characters)  
   - `size` (TEXT, optional, max 32 characters)  
   - `price` (REAL)

3. **inventory**
   - `id` (PRIMARY KEY)  
   - `productId` (FOREIGN KEY → product.id)  
   - `inventoryAmount` (INTEGER, required)  
   - `lastUpdated` (DATETIME)

## Queries

- Insert sample data for categories, products, and inventory  
- Retrieve inventory not updated in the last week  
- Retrieve products with inventory less than 5, including category, brand, and size  
- Calculate total inventory per product category 

## SQLite Usage

1. Open SQLite in terminal:

```bash
sqlite3 inventory.db

2. Enable foreign keys:

PRAGMA foreign_keys = ON;

3. Run SQL scripts in order:

.read SQL/DDL/productCategory.sql
.read SQL/DDL/product.sql
.read SQL/DDL/inventory.sql
.read SQL/DML/queries.sql