USE proyecto;

-- ÍNDICE AGRUPADO (Clustered Index) EN LA TABLA 'users'
CREATE INDEX idx_users_email ON users(email);
-- Consulta que utiliza el índice agrupado
SELECT * 
FROM users
WHERE email = 'luis.moreno@example.com';

-- ÍNDICE AGRUPADO (Clustered Index) EN LA TABLA 'people'
CREATE INDEX idx_people_document ON people(document);
-- Consulta que utiliza el índice agrupado
SELECT name, lastName 
FROM people
WHERE document = 12345678;

-- ÍNDICE AGRUPADO (Clustered Index) EN LA TABLA 'products'
CREATE INDEX idx_products_id ON products(id);
-- Consulta que utiliza el índice agrupado
SELECT id, `name`, price 
FROM products 
WHERE id = 1;

-- ÍNDICE AGRUPADO (Clustered Index) EN LA TABLA 'paymentTransactionInformation'
CREATE INDEX idx_paymentTransaction_user_status ON paymentTransactionInformation(idCustomers);
-- Consulta que utiliza el índice agrupado
SELECT id, numberTarjet 
FROM paymentTransactionInformation 
WHERE idCustomers = 5;

-- ÍNDICE AGRUPADO (Clustered Index) EN LA TABLA 'address'
CREATE INDEX idx_address_city_neighborhood ON address(idCity);
-- Consulta que utiliza el índice agrupado
SELECT * 
FROM address 
WHERE idCity = 1 ;


-- ÍNDICE NO AGRUPADO (Non-Clustered Index) EN LA TABLA 'products'
CREATE INDEX idx_products_name ON products(`name`);
-- Consulta que utiliza el índice no agrupado
SELECT id, `name`, price
FROM products
WHERE `name` LIKE 'Cancha%';

-- ÍNDICE NO AGRUPADO (Non-Clustered Index) EN LA TABLA 'reserveProducts'
CREATE INDEX idx_reserveProducts_quantity ON reserveProducts(quantity);
-- Consulta que utiliza el índice no agrupado
SELECT idReserve, idProduct, quantity
FROM reserveProducts
WHERE quantity >= 1;

-- ÍNDICE NO AGRUPADO (Non-Clustered Index) EN LA TABLA 'products'
CREATE INDEX idx_products_price ON products(price);
-- Consulta que utiliza el índice no agrupado
SELECT id, name, price 
FROM products 
WHERE price > 500;

-- ÍNDICE NO AGRUPADO (Non-Clustered Index) EN LA TABLA 'reserves'
CREATE INDEX idx_reserves_date ON reserves(dateReserve);
-- Consulta que utiliza el índice no agrupado
SELECT * 
FROM reserves 
WHERE dateReserve = '2024-11-01';

-- ÍNDICE NO AGRUPADO (Non-Clustered Index) EN LA TABLA 'paymentTransactionInformation'
CREATE INDEX idx_paymentTransaction_payMethods ON paymentTransactionInformation(idPayMethods);
-- Consulta que utiliza el índice no agrupado
SELECT id, numberTarjet 
FROM paymentTransactionInformation 
WHERE idPayMethods = 3;

-- ÍNDICE NO AGRUPADO (Non-Clustered Index) EN LA TABLA 'people'
CREATE INDEX idx_people_lastName ON people(lastName);
-- Consulta que utiliza el índice no agrupado
SELECT id, `name`, lastName 
FROM people 
WHERE lastName = 'Herrera';

-- ÍNDICE NO AGRUPADO (Non-Clustered Index) EN LA TABLA 'payment'
CREATE INDEX idx_payment_totalPay ON payment(totalPay);
-- Consulta que utiliza el índice no agrupado
SELECT id, totalPay 
FROM payment 
WHERE totalPay > 60;


-- ÍNDICE ÚNICO (Unique Index) EN LA TABLA 'roles'
CREATE UNIQUE INDEX idx_roles_name ON roles(name);
-- Consulta que utiliza el índice único
SELECT * 
FROM roles
WHERE name = 'Admin';

-- ÍNDICE ÚNICO (Unique Index) EN LA TABLA 'reserveStates'
CREATE UNIQUE INDEX idx_reserveStates_name ON reserveStates(name);
-- Consulta que utiliza el índice único
SELECT * 
FROM reserveStates
WHERE name = 'Confirmado';

-- ÍNDICE ÚNICO (Unique Index) EN LA TABLA 'email'
CREATE UNIQUE INDEX idx_users_email_unique ON users(email);
-- Consulta que utiliza el índice único
SELECT id, email 
FROM users 
WHERE email = 'camilo.vargas@example.com';

-- ÍNDICE ÚNICO (Unique Index) EN LA TABLA 'paymentMethods'
CREATE UNIQUE INDEX idx_paymentMethods_name ON paymentMethods(`name`);
-- Consulta que utiliza el índice único
SELECT *
FROM paymentMethods 
WHERE `name` = 'Tarjeta de Crédito';

-- ÍNDICE ÚNICO (Unique Index) EN LA TABLA 'type_document'
CREATE UNIQUE INDEX idx_typeDocument_name ON type_document(`name`);
-- Consulta que utiliza el índice único
SELECT id, `name` 
FROM type_document 
WHERE `name` = 'CC';

-- ÍNDICE ÚNICO (Unique Index) EN LA TABLA 'productCategories'
CREATE UNIQUE INDEX idx_productCategories_name ON productCategories(`name`);
-- Consulta que utiliza el índice único
SELECT id, `name` 
FROM productCategories 
WHERE `name` = 'Cancha de Voleibol';

-- ÍNDICE ÚNICO (Unique Index) EN LA TABLA 'people'
CREATE UNIQUE INDEX idx_people_document ON people(document);
-- Consulta que utiliza el índice único
SELECT id, `name`, lastName 
FROM people 
WHERE document = 12345678;


-- ÍNDICE COMPUESTO (Composite Index) EN LA TABLA 'address'
CREATE INDEX idx_address_city_neighborhood ON address(idCity, neighborhood);
-- Consulta que utiliza el índice compuesto
SELECT * 
FROM address
WHERE idCity = 1 AND neighborhood = 'Chapinero';

-- ÍNDICE COMPUESTO (Composite Index) EN LA TABLA 'paymentTransactionInformation'
CREATE INDEX idx_paymentTransaction_user_status ON paymentTransactionInformation(idCustomers, idStatus);
-- Consulta que utiliza el índice compuesto
SELECT id, numberTarjet 
FROM paymentTransactionInformation
WHERE idCustomers = 5 AND idStatus = 2;

-- ÍNDICE COMPUESTO (Composite Index) EN LA TABLA 'reserves'
CREATE INDEX idx_reserves_user_date ON reserves(idUser, dateReserve);
-- Consulta que utiliza el índice compuesto
SELECT * 
FROM reserves 
WHERE idUser = 3 AND dateReserve = '2024-11-01';

-- ÍNDICE COMPUESTO (Composite Index) EN LA TABLA 'people_phone'
CREATE INDEX idx_people_phone_person_type ON people_phone(idPerson, idTypePhone);
-- Consulta que utiliza el índice compuesto
SELECT * 
FROM people_phone 
WHERE idPerson = 4 AND idTypePhone = 1;

-- ÍNDICE COMPUESTO (Composite Index) EN LA TABLA 'reserveProducts'
CREATE INDEX idx_reserveProducts_reserve_product ON reserveProducts(idReserve, idProduct);
-- Consulta que utiliza el índice compuesto
SELECT * 
FROM reserveProducts 
WHERE idReserve = 1 OR idProduct = 3;

-- ÍNDICE COMPUESTO (Composite Index) EN LA TABLA 'invoice'
CREATE INDEX idx_invoice_customer_employee ON invoice(idCustomers, idEmployees);
-- Consulta que utiliza el índice compuesto
SELECT * 
FROM invoice 
WHERE idCustomers = 2 OR idEmployees = 5;

-- ÍNDICE COMPUESTO (Composite Index) EN LA TABLA 'paymentGatewayRecords'
CREATE INDEX idx_paymentGateway_transaction_status ON paymentGatewayRecords(idTransaction, idStatus);
-- Consulta que utiliza el índice compuesto
SELECT * 
FROM paymentGatewayRecords 
WHERE idTransaction = 7 OR idStatus = 1;

-- ÍNDICE COMPUESTO (Composite Index) EN LA TABLA 'invoice'
CREATE INDEX idx_invoice_customer_employee_date ON invoice(idCustomers, idEmployees, invoiceDate);
-- Consulta que utiliza el índice compuesto
SELECT 
    invoice.id, 
    invoice.invoiceDate, 
    people.`name` AS customerName
FROM 
    invoice
INNER JOIN 
    people 
ON 
    invoice.idCustomers = people.idUser
WHERE 
    invoice.idCustomers = 3
ORDER BY 
    invoice.idEmployees ASC, 
    invoice.invoiceDate DESC;

-- ÍNDICE COMPUESTO (Composite Index) EN LA TABLA 'reserves'
CREATE INDEX idx_reserves_state_user_date ON reserves(idState, idUser, dateReserve);
-- Consulta que utiliza el índice compuesto
SELECT 
    reserves.id, 
    reserves.`time`, 
    reserves.dateReserve, 
    reserveStates.`name` AS reserveStateName
FROM 
    reserves
INNER JOIN 
    reserveStates 
ON 
    reserves.idState = reserveStates.id
WHERE 
    reserves.idState = 2
ORDER BY 
    reserves.idUser DESC, 
    reserves.dateReserve ASC;
