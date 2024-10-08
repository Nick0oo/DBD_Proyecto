#creamos y Usamos la Bd
drop database proyecto;
create database proyecto;
use proyecto;
<<<<<<< HEAD

CREATE TABLE type_document(
    id INT PRIMARY KEY AUTO_INCREMENT,
    `name` CHAR(2) NOT NULL UNIQUE,
    createdAt DATETIME DEFAULT CURRENT_TIMESTAMP,
    updatedAt DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE users(
	id INT PRIMARY KEY AUTO_INCREMENT,
	`name` VARCHAR (100),
	email VARCHAR(150) UNIQUE,
	`password` VARCHAR (100) UNIQUE,
	createdAt DATETIME DEFAULT CURRENT_TIMESTAMP,
    updatedAt DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE roles(
	id INT PRIMARY KEY AUTO_INCREMENT,
	`name` VARCHAR (100) UNIQUE,
    createdAt DATETIME DEFAULT CURRENT_TIMESTAMP,
    updatedAt DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE people (
    id INT PRIMARY KEY AUTO_INCREMENT,
    `name` VARCHAR(100) NOT NULL,
    lastName VARCHAR(150),
    phone VARCHAR(80),
    birthday DATE,
    document INT UNIQUE,
=======
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
>>>>>>> 940caadb623d50df6f068ac348a7d9f78ef64e94
    createdAt DATETIME DEFAULT CURRENT_TIMESTAMP,
    updatedAt DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    created_by INT,  
    updated_by INT,  
<<<<<<< HEAD
    idTypeDocument INT,
    FOREIGN KEY (idTypeDocument) REFERENCES type_document(id),
    idUser INT,
    FOREIGN KEY (idUser) REFERENCES users(id)
);

CREATE TABLE usersRoles(
	id INT PRIMARY KEY AUTO_INCREMENT,
	idPeople INT,
	FOREIGN KEY (idPeople) REFERENCES people(id),
	idRole INT,
	FOREIGN KEY (idRole) REFERENCES roles(id),
    createdAt DATETIME DEFAULT CURRENT_TIMESTAMP,
    updatedAt DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE productCategories (
    id INT PRIMARY KEY AUTO_INCREMENT,
    `name` VARCHAR(100) UNIQUE NOT NULL,
    createdAt DATETIME DEFAULT CURRENT_TIMESTAMP,
    updatedAt DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

=======
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
    details TEXT
);


>>>>>>> 940caadb623d50df6f068ac348a7d9f78ef64e94
CREATE TABLE products (
    id INT PRIMARY KEY AUTO_INCREMENT,
    `name` VARCHAR(100) NOT NULL,
    details TEXT,
    price DECIMAL(20, 0) NOT NULL,
<<<<<<< HEAD
    idProductCategory INT,
    createdAt DATETIME DEFAULT CURRENT_TIMESTAMP,
    updatedAt DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (idProductCategory) REFERENCES productCategories(id)
);

CREATE TABLE reserveStates (
    id INT PRIMARY KEY AUTO_INCREMENT,
    `name` VARCHAR(30) UNIQUE NOT NULL,
    createdAt DATETIME DEFAULT CURRENT_TIMESTAMP,
    updatedAt DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
=======
    idcategory INT,
    createdAt DATETIME DEFAULT CURRENT_TIMESTAMP,
    updatedAt DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (idcategory) REFERENCES product_categories(id)
);


CREATE TABLE reserve_states (
    id INT PRIMARY KEY AUTO_INCREMENT,
    `name` VARCHAR(30) UNIQUE NOT NULL
>>>>>>> 940caadb623d50df6f068ac348a7d9f78ef64e94
);

CREATE TABLE reserves (
    id INT PRIMARY KEY AUTO_INCREMENT,
<<<<<<< HEAD
    idState INT,
    `time` TIME,  
    dateReserve DATE,
    idUser INT,
=======
    idstate INT,
    `time` TIME,  
    date_reserve DATE,
    idcustomers INT,
>>>>>>> 940caadb623d50df6f068ac348a7d9f78ef64e94
    createdAt DATETIME DEFAULT CURRENT_TIMESTAMP,
    updatedAt DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    created_by INT, 
    updated_by INT,  
<<<<<<< HEAD
    FOREIGN KEY (idUser) REFERENCES people(id),
    FOREIGN KEY (idState) REFERENCES reserveStates(id),
    createdAt DATETIME DEFAULT CURRENT_TIMESTAMP,
    updatedAt DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE paymentMethods (
    id INT PRIMARY KEY AUTO_INCREMENT,
    `name` VARCHAR(50) UNIQUE NOT NULL,
    createdAt DATETIME DEFAULT CURRENT_TIMESTAMP,
    updatedAt DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE discount (
id INT PRIMARY KEY AUTO_INCREMENT,
total INT
=======
    FOREIGN KEY (idcustomers) REFERENCES customers(id),
    FOREIGN KEY (idstate) REFERENCES reserve_states(id)
);

CREATE TABLE payment_methods (
    id INT PRIMARY KEY AUTO_INCREMENT,
    `name` VARCHAR(50) UNIQUE NOT NULL
>>>>>>> 940caadb623d50df6f068ac348a7d9f78ef64e94
);

CREATE TABLE payment (
    id INT PRIMARY KEY AUTO_INCREMENT,
    idmethod INT,
    date_pay DATE,
<<<<<<< HEAD
    totalPaid DECIMAL(10, 2) NOT NULL, -- #Precio*cantidad 
    idDiscount INT,
    idReserve INT,
=======
    price DECIMAL(20, 2) NOT NULL,  
    idreserves INT,
>>>>>>> 940caadb623d50df6f068ac348a7d9f78ef64e94
    createdAt DATETIME DEFAULT CURRENT_TIMESTAMP,
    updatedAt DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    created_by INT,  
    updated_by INT, 
<<<<<<< HEAD
    FOREIGN KEY (idReserve) REFERENCES reserves(id),
    FOREIGN KEY (idMethod) REFERENCES paymentMethods(id),
    FOREIGN KEY (idDiscount) REFERENCES discount(id)
);
CREATE TABLE reserveProducts (
    id INT PRIMARY KEY AUTO_INCREMENT,
    idReserve INT,
    idProduct INT,
    quantity INT NOT NULL,
    createdAt DATETIME DEFAULT CURRENT_TIMESTAMP,
    updatedAt DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (idReserve) REFERENCES reserves(id),
    FOREIGN KEY (idProduct) REFERENCES products(id)
    );
    

=======
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
>>>>>>> 940caadb623d50df6f068ac348a7d9f78ef64e94





