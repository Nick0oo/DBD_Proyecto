#creamos y Usamos la Bd
drop database proyecto;
create database proyecto;

use proyecto;
#creamos las Primeras Tablas
CREATE TABLE type_document(
    idtype_document INT PRIMARY KEY AUTO_INCREMENT,
    type_document CHAR(2) NOT NULL UNIQUE
);

CREATE TABLE employees (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name_ VARCHAR(100),
    lastname VARCHAR(100),
    birthday DATE,
    email VARCHAR(100) UNIQUE,
    phone VARCHAR(20),
    address VARCHAR(255),
    occupation VARCHAR(100),
    date_recruitment DATE,
    document INT UNIQUE,
    idtype_document INT,
    createdAt DATETIME DEFAULT CURRENT_TIMESTAMP,
    updatedAt DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    created_by INT,  
    updated_by INT,  
    FOREIGN KEY (idtype_document) REFERENCES type_document(idtype_document)
);


CREATE TABLE customers (
    idcustomers INT PRIMARY KEY AUTO_INCREMENT,
    name_ VARCHAR(100) NOT NULL,
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
    FOREIGN KEY (idtype_document) REFERENCES type_document(idtype_document)
);
CREATE TABLE product_categories (
    idcategory INT PRIMARY KEY AUTO_INCREMENT,
    category_name VARCHAR(100) UNIQUE NOT NULL,
    description TEXT
);


CREATE TABLE products (
    idproduct INT PRIMARY KEY AUTO_INCREMENT,
    product_name VARCHAR(100) NOT NULL,
    description TEXT,
    price DECIMAL(20, 0) NOT NULL,
    idcategory INT,
    createdAt DATETIME DEFAULT CURRENT_TIMESTAMP,
    updatedAt DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (idcategory) REFERENCES product_categories(idcategory)
);


CREATE TABLE reserve_states (
    idstate INT PRIMARY KEY AUTO_INCREMENT,
    state_name VARCHAR(30) UNIQUE NOT NULL
);

CREATE TABLE reserves (
    idreserves INT PRIMARY KEY AUTO_INCREMENT,
    idstate INT,
    time_ TIME,  
    date_reserve DATE,
    idcustomers INT,
    createdAt DATETIME DEFAULT CURRENT_TIMESTAMP,
    updatedAt DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    created_by INT, 
    updated_by INT,  
    FOREIGN KEY (idcustomers) REFERENCES customers(idcustomers),
    FOREIGN KEY (idstate) REFERENCES reserve_states(idstate)
);

CREATE TABLE payment_methods (
    idmethod INT PRIMARY KEY AUTO_INCREMENT,
    method_name VARCHAR(50) UNIQUE NOT NULL
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
    FOREIGN KEY (idreserves) REFERENCES reserves(idreserves),
    FOREIGN KEY (idmethod) REFERENCES payment_methods(idmethod)
);
CREATE TABLE reserve_products (
    idreserve_product INT PRIMARY KEY AUTO_INCREMENT,
    idreserves INT,
    idproduct INT,
    quantity INT NOT NULL,
    price DECIMAL(10, 2) NOT NULL,  
    createdAt DATETIME DEFAULT CURRENT_TIMESTAMP,
    updatedAt DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (idreserves) REFERENCES reserves(idreserves),
    FOREIGN KEY (idproduct) REFERENCES products(idproduct)
    );
    
    #interar y eliminar en tabla (datos Basura)
    
Alter Table employees
ADD COLUMN proof VARCHAR(1) DEFAULT 'p';
ALTER TABLE employees
DROP COLUMN proof;





