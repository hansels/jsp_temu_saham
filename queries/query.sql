CREATE DATABASE IF NOT EXISTS TemuSahamDb;

USE TemuSahamDb;

CREATE TABLE IF NOT EXISTS Categories (
    id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(1000) NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS Users (
    id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(1000) NOT NULL,
    type VARCHAR(30) NOT NULL,
    email VARCHAR(1000) NOT NULL,
    password VARCHAR(1000) NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS Companies (
    id INT NOT NULL AUTO_INCREMENT,
    user_id INT NOT NULL,
    category_id INT,
    name VARCHAR(1000),
    description VARCHAR(1000),
    location VARCHAR(1000),
    investment_target BIGINT(20),
    image TEXT,
    email VARCHAR(1000),
    phone VARCHAR(1000),
    url VARCHAR(1000),
    founded_year CHAR(4),
    is_invested CHAR(1),
    is_completed CHAR(1),
    PRIMARY KEY (id),
    FOREIGN KEY (user_id) REFERENCES Users(id),
    FOREIGN KEY (category_id) REFERENCES Categories(id)
);

CREATE TABLE IF NOT EXISTS Investments (
    id INT NOT NULL AUTO_INCREMENT,
    user_id INT NOT NULL,
    company_id INT NOT NULL,
    percentage DOUBLE(6, 2) NOT NULL,
    created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP(),
    amount INT NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (user_id) REFERENCES Users(id),
    FOREIGN KEY (company_id) REFERENCES Companies(id)
);