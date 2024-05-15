-- Active: 1715633466013@@127.0.0.1@3306@cooperative_mountain_fe2c50_db

CREATE TABLE IF NOT EXISTS accounts (
    id VARCHAR(255) NOT NULL primary key COMMENT 'primary key',
    createdAt DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT 'Time Created',
    updatedAt DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Last Update',
    name varchar(255) COMMENT 'User Name',
    email varchar(255) COMMENT 'User Email',
    picture varchar(255) COMMENT 'User Picture'
) default charset utf8mb4 COMMENT '';

DROP TABLE accounts;

CREATE TABLE cars (
    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    createdAt DATETIME DEFAULT CURRENT_TIMESTAMP,
    updatedAt DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    make VARCHAR(255) NOT NULL,
    model VARCHAR(255) NOT NULL,
    year INT UNSIGNED NOT NULL,
    price INT UNSIGNED NOT NULL,
    imgUrl VARCHAR(1000) NOT NULL,
    description VARCHAR(1000),
    engineType ENUM(
        "V6",
        "V8",
        "V10",
        "4-Cylinder",
        "chuncko",
        "unknown"
    ),
    color VARCHAR(255),
    mileage INT NOT NULL,
    hasCleanTitle BOOLEAN NOT NULL,
    creatorId VARCHAR(255) NOT NULL,
    -- FOREIGN KEY will not let a car be created if the creatorId on the car does not match the id of an account
    -- ON DELETE CASCADE gets rid of all orphaned data (if an account is deleted, get rid off all the cars that account created)
    FOREIGN KEY (creatorId) REFERENCES accounts (id) ON DELETE CASCADE
);

SELECT * FROM accounts;

INSERT INTO
    cars (
        make,
        model,
        year,
        price,
        imgUrl,
        description,
        engineType,
        color,
        mileage,
        hasCleanTitle,
        creatorId
    )
VALUES (
        "George",
        "Jetson",
        2000,
        1000000,
        "https://images.unsplash.com/photo-1598558543997-cd2a5d01c559?q=80&w=2340&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
        "Poot poot",
        "unknown",
        "silver",
        0,
        true,
        "662818ab0bd0398d8bf3cd62"
    );

SELECT * FROM cars;

SELECT * FROM accounts WHERE id = "65f87bc1e02f1ee243874743";

SELECT * FROM cars JOIN accounts ON cars.creatorId = accounts.id;

CREATE TABLE houses (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    sqft INT NOT NULL,
    bedrooms INT NOT NULL,
    bathrooms INT NOT NULL,
    imgUrl VARCHAR(255) NOT NULL,
    description VARCHAR(255) NOT NULL,
    price INT NOT NULL,
    createdAt DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT 'Time Created',
    updatedAt DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Last Update',
    creatorId VARCHAR(255) NOT NULL,
    FOREIGN KEY (creatorId) REFERENCES accounts (id) ON DELETE CASCADE
);

DROP TABLE houses;

INSERT INTO
    houses (
        sqft,
        bedrooms,
        bathrooms,
        imgUrl,
        description,
        price,
        creatorId
    )
VALUES (
        1200,
        3,
        2,
        "https://i.pinimg.com/736x/86/10/60/86106086e9594672ad7408913b5a3a24.jpg",
        "This house is for sale.",
        320000,
        "6643d723c1cc31588e2996b2"
    );

SELECT houses.*, accounts.*
FROM houses
    JOIN accounts ON accounts.id = houses.creatorId
WHERE
    houses.id = 1;

SELECT houses.*, accounts.*
FROM houses
    JOIN accounts ON accounts.id = houses.creatorId