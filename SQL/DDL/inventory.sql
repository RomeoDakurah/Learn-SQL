PRAGMA foreign_keys = ON;

CREATE TABLE inventory (
    id INTEGER PRIMARY KEY,
    productId INTEGER NOT NULL,
    inventoryAmount INTEGER NOT NULL,
    lastUpdated DATETIME,
    FOREIGN KEY (productId) REFERENCES product(id)
);