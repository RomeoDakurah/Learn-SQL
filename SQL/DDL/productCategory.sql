PRAGMA foreign_keys = ON;

CREATE TABLE productCategory (
    id INTEGER PRIMARY KEY,
    name TEXT NOT NULL CHECK(length(name) <= 256)
);