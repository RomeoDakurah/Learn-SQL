PRAGMA foreign_keys = ON;

CREATE TABLE product (
    id INTEGER PRIMARY KEY,
    name TEXT NOT NULL CHECK(length(name) <= 256),
    categoryId INTEGER NOT NULL,
    brand TEXT CHECK(length(brand) <= 256),
    size TEXT CHECK(length(size) <= 32),
    price REAL,
    FOREIGN KEY (categoryId) REFERENCES productCategory(id)
);