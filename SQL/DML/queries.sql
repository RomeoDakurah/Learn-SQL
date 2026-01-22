INSERT INTO productCategory (id, name) VALUES
(1, 'Electronics'),
(2, 'Clothing');

INSERT INTO product (id, name, categoryId, brand, size, price) VALUES
(1, 'Laptop', 1, 'Dell', NULL, 999.99),
(2, 'T-Shirt', 2, 'Nike', 'M', 29.99);

INSERT INTO inventory (id, productId, inventoryAmount, lastUpdated) VALUES
(1, 1, 3, datetime('now', '-8 days')),
(2, 2, 20, datetime('now'));

SELECT *
FROM inventory
WHERE lastUpdated < datetime('now', '-7 days');

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

SELECT
    pc.name AS category,
    SUM(i.inventoryAmount) AS totalInventory
FROM productCategory pc
JOIN product p ON pc.id = p.categoryId
JOIN inventory i ON p.id = i.productId
GROUP BY pc.name;
