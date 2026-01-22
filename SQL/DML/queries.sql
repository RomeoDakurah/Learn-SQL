-- Insert product categories
INSERT INTO productCategory (id, name) VALUES
(1, 'Electronics'),
(2, 'Clothing');

-- Insert products
-- Each product must reference an existing productCategory
INSERT INTO product (id, name, categoryId, brand, size, price) VALUES
(1, 'Laptop', 1, 'Dell', NULL, 999.99),
(2, 'T-Shirt', 2, 'Nike', 'M', 29.99);

-- Insert inventory records
-- lastUpdated uses SQLite datetime functions
INSERT INTO inventory (id, productId, inventoryAmount, lastUpdated) VALUES
(1, 1, 3, datetime('now', '-8 days')),
(2, 2, 20, datetime('now'));

-- Inventory not updated in the last 7 days
SELECT *
FROM inventory
WHERE lastUpdated < datetime('now', '-7 days');

-- Products with low inventory (inventoryAmount < 5)
-- Returns product details and current inventory
SELECT
    p.id,
    p.name,
    pc.name AS category,
    p.brand,
    p.size,
    i.inventoryAmount
FROM product p
JOIN productCategory pc ON p.categoryId = pc.id
JOIN inventory i ON p.id = i.productId
WHERE i.inventoryAmount < 5;

-- Total inventory amount per product category
SELECT
    pc.name AS category,
    SUM(i.inventoryAmount) AS totalInventory
FROM productCategory pc
JOIN product p ON pc.id = p.categoryId
JOIN inventory i ON p.id = i.productId
GROUP BY pc.name;
