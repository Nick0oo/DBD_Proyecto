#creamos y Usamos la Bd
drop database proyecto;
create database proyecto;
use proyecto;
CREATE TABLE type_document(
    id INT PRIMARY KEY AUTO_INCREMENT,
    `name` CHAR(2) NOT NULL UNIQUE
);

CREATE TABLE employees (
    id INT PRIMARY KEY AUTO_INCREMENT,
    `name` VARCHAR(100),
    lastname VARCHAR(100),
    birthday DATE,
    email VARCHAR(100) UNIQUE,
    phone VARCHAR(20),
    address VARCHAR(255),
    occupation VARCHAR(100),
    date_recruitment DATE UNIQUE,
    document INT UNIQUE,
    idtype_document INT,
    createdAt DATETIME DEFAULT CURRENT_TIMESTAMP,
    updatedAt DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    created_by INT,  
    updated_by INT,  
    FOREIGN KEY (idtype_document) REFERENCES type_document(id)
);


CREATE TABLE customers (
    id INT PRIMARY KEY AUTO_INCREMENT,
    `name` VARCHAR(100) NOT NULL,
    lastname VARCHAR(150),
    email VARCHAR(150) UNIQUE,
    phone VARCHAR(80),
    birthday DATE,
    document INT UNIQUE,
    idtype_document INT,
    createdAt DATETIME DEFAULT CURRENT_TIMESTAMP,
    updatedAt DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    created_by INT,  
    updated_by INT,  
    FOREIGN KEY (idtype_document) REFERENCES type_document(id)
);
CREATE TABLE product_categories (
    id INT PRIMARY KEY AUTO_INCREMENT,
    `name` VARCHAR(100) UNIQUE NOT NULL,
    description_ TEXT
);


CREATE TABLE products (
    id INT PRIMARY KEY AUTO_INCREMENT,
    `name` VARCHAR(100) NOT NULL,
    description_ TEXT,
    price DECIMAL(20, 0) NOT NULL,
    idcategory INT,
    createdAt DATETIME DEFAULT CURRENT_TIMESTAMP,
    updatedAt DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (idcategory) REFERENCES product_categories(id)
);


CREATE TABLE reserve_states (
    id INT PRIMARY KEY AUTO_INCREMENT,
    `name` VARCHAR(30) UNIQUE NOT NULL
);

CREATE TABLE reserves (
    id INT PRIMARY KEY AUTO_INCREMENT,
    idstate INT,
    `time` TIME,  
    date_reserve DATE,
    idcustomers INT,
    createdAt DATETIME DEFAULT CURRENT_TIMESTAMP,
    updatedAt DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    created_by INT, 
    updated_by INT,  
    FOREIGN KEY (idcustomers) REFERENCES customers(id),
    FOREIGN KEY (idstate) REFERENCES reserve_states(id)
);

CREATE TABLE payment_methods (
    id INT PRIMARY KEY AUTO_INCREMENT,
    `name` VARCHAR(50) UNIQUE NOT NULL
);

CREATE TABLE payment (
    id INT PRIMARY KEY AUTO_INCREMENT,
    idmethod INT,
    date_pay DATE,
    price DECIMAL(20, 2) NOT NULL,  
    idreserves INT,
    createdAt DATETIME DEFAULT CURRENT_TIMESTAMP,
    updatedAt DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    created_by INT,  
    updated_by INT, 
    FOREIGN KEY (idreserves) REFERENCES reserves(id),
    FOREIGN KEY (idmethod) REFERENCES payment_methods(id)
);
CREATE TABLE reserve_products (
    id INT PRIMARY KEY AUTO_INCREMENT,
    idreserves INT,
    idproduct INT,
    quantity INT NOT NULL,
    price DECIMAL(10, 2) NOT NULL,  
    createdAt DATETIME DEFAULT CURRENT_TIMESTAMP,
    updatedAt DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (idreserves) REFERENCES reserves(id),
    FOREIGN KEY (idproduct) REFERENCES products(id)
    );
    
    #interar y eliminar en tabla (datos Basura)
    
Alter Table employees
ADD COLUMN proof VARCHAR(1) DEFAULT 'p';
ALTER TABLE employees
DROP COLUMN proof;





