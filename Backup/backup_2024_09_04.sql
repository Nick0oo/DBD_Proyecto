#creamos y Usamos la Bd
drop database proyecto;
create database proyecto;
<<<<<<< HEAD
use proyecto;
CREATE TABLE type_document(
    id INT PRIMARY KEY AUTO_INCREMENT,
    `name` CHAR(2) NOT NULL UNIQUE
=======

use proyecto;
#creamos las Primeras Tablas
CREATE TABLE type_document(
    idtype_document INT PRIMARY KEY AUTO_INCREMENT,
    type_document CHAR(2) NOT NULL UNIQUE
>>>>>>> 940caadb623d50df6f068ac348a7d9f78ef64e94
);

CREATE TABLE employees (
    id INT PRIMARY KEY AUTO_INCREMENT,
<<<<<<< HEAD
    `name` VARCHAR(100),
=======
    name_ VARCHAR(100),
>>>>>>> 940caadb623d50df6f068ac348a7d9f78ef64e94
    lastname VARCHAR(100),
    birthday DATE,
    email VARCHAR(100) UNIQUE,
    phone VARCHAR(20),
    address VARCHAR(255),
    occupation VARCHAR(100),
<<<<<<< HEAD
    date_recruitment DATE UNIQUE,
=======
    date_recruitment DATE,
>>>>>>> 940caadb623d50df6f068ac348a7d9f78ef64e94
    document INT UNIQUE,
    idtype_document INT,
    createdAt DATETIME DEFAULT CURRENT_TIMESTAMP,
    updatedAt DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    created_by INT,  
    updated_by INT,  
<<<<<<< HEAD
    FOREIGN KEY (idtype_document) REFERENCES type_document(id)
=======
    FOREIGN KEY (idtype_document) REFERENCES type_document(idtype_document)
>>>>>>> 940caadb623d50df6f068ac348a7d9f78ef64e94
);


CREATE TABLE customers (
<<<<<<< HEAD
    id INT PRIMARY KEY AUTO_INCREMENT,
    `name` VARCHAR(100) NOT NULL,
=======
    idcustomers INT PRIMARY KEY AUTO_INCREMENT,
    name_ VARCHAR(100) NOT NULL,
>>>>>>> 940caadb623d50df6f068ac348a7d9f78ef64e94
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
<<<<<<< HEAD
    FOREIGN KEY (idtype_document) REFERENCES type_document(id)
);
CREATE TABLE product_categories (
    id INT PRIMARY KEY AUTO_INCREMENT,
    `name` VARCHAR(100) UNIQUE NOT NULL,
    description_ TEXT
=======
    FOREIGN KEY (idtype_document) REFERENCES type_document(idtype_document)
);
CREATE TABLE product_categories (
    idcategory INT PRIMARY KEY AUTO_INCREMENT,
    category_name VARCHAR(100) UNIQUE NOT NULL,
    description TEXT
>>>>>>> 940caadb623d50df6f068ac348a7d9f78ef64e94
);


CREATE TABLE products (
<<<<<<< HEAD
    id INT PRIMARY KEY AUTO_INCREMENT,
    `name` VARCHAR(100) NOT NULL,
    description_ TEXT,
=======
    idproduct INT PRIMARY KEY AUTO_INCREMENT,
    product_name VARCHAR(100) NOT NULL,
    description TEXT,
>>>>>>> 940caadb623d50df6f068ac348a7d9f78ef64e94
    price DECIMAL(20, 0) NOT NULL,
    idcategory INT,
    createdAt DATETIME DEFAULT CURRENT_TIMESTAMP,
    updatedAt DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
<<<<<<< HEAD
    FOREIGN KEY (idcategory) REFERENCES product_categories(id)
=======
    FOREIGN KEY (idcategory) REFERENCES product_categories(idcategory)
>>>>>>> 940caadb623d50df6f068ac348a7d9f78ef64e94
);


CREATE TABLE reserve_states (
<<<<<<< HEAD
    id INT PRIMARY KEY AUTO_INCREMENT,
    `name` VARCHAR(30) UNIQUE NOT NULL
);

CREATE TABLE reserves (
    id INT PRIMARY KEY AUTO_INCREMENT,
    idstate INT,
    `time` TIME,  
=======
    idstate INT PRIMARY KEY AUTO_INCREMENT,
    state_name VARCHAR(30) UNIQUE NOT NULL
);

CREATE TABLE reserves (
    idreserves INT PRIMARY KEY AUTO_INCREMENT,
    idstate INT,
    time_ TIME,  
>>>>>>> 940caadb623d50df6f068ac348a7d9f78ef64e94
    date_reserve DATE,
    idcustomers INT,
    createdAt DATETIME DEFAULT CURRENT_TIMESTAMP,
    updatedAt DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    created_by INT, 
    updated_by INT,  
<<<<<<< HEAD
    FOREIGN KEY (idcustomers) REFERENCES customers(id),
    FOREIGN KEY (idstate) REFERENCES reserve_states(id)
);

CREATE TABLE payment_methods (
    id INT PRIMARY KEY AUTO_INCREMENT,
    `name` VARCHAR(50) UNIQUE NOT NULL
=======
    FOREIGN KEY (idcustomers) REFERENCES customers(idcustomers),
    FOREIGN KEY (idstate) REFERENCES reserve_states(idstate)
);

CREATE TABLE payment_methods (
    idmethod INT PRIMARY KEY AUTO_INCREMENT,
    method_name VARCHAR(50) UNIQUE NOT NULL
>>>>>>> 940caadb623d50df6f068ac348a7d9f78ef64e94
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
<<<<<<< HEAD
    FOREIGN KEY (idreserves) REFERENCES reserves(id),
    FOREIGN KEY (idmethod) REFERENCES payment_methods(id)
);
CREATE TABLE reserve_products (
    id INT PRIMARY KEY AUTO_INCREMENT,
=======
    FOREIGN KEY (idreserves) REFERENCES reserves(idreserves),
    FOREIGN KEY (idmethod) REFERENCES payment_methods(idmethod)
);
CREATE TABLE reserve_products (
    idreserve_product INT PRIMARY KEY AUTO_INCREMENT,
>>>>>>> 940caadb623d50df6f068ac348a7d9f78ef64e94
    idreserves INT,
    idproduct INT,
    quantity INT NOT NULL,
    price DECIMAL(10, 2) NOT NULL,  
    createdAt DATETIME DEFAULT CURRENT_TIMESTAMP,
    updatedAt DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
<<<<<<< HEAD
    FOREIGN KEY (idreserves) REFERENCES reserves(id),
    FOREIGN KEY (idproduct) REFERENCES products(id)
=======
    FOREIGN KEY (idreserves) REFERENCES reserves(idreserves),
    FOREIGN KEY (idproduct) REFERENCES products(idproduct)
>>>>>>> 940caadb623d50df6f068ac348a7d9f78ef64e94
    );
    
    #interar y eliminar en tabla (datos Basura)
    
Alter Table employees
ADD COLUMN proof VARCHAR(1) DEFAULT 'p';
ALTER TABLE employees
DROP COLUMN proof;





