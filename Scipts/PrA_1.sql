-- PrA 1 Insertar un nuevo usuario
DELIMITER //
CREATE PROCEDURE add_user(IN email VARCHAR(255), IN password VARCHAR(255))
BEGIN
    INSERT INTO users (email, password) VALUES (email, password);
END// 
DELIMITER ;

-- PrA 2 Actualizar el estado de una reserva
DELIMITER //
CREATE PROCEDURE update_reserve_state(IN reserveId INT, IN newStateId INT)
BEGIN
    UPDATE reserves SET idState = newStateId WHERE id = reserveId;
END //
DELIMITER ;

-- PrA 3 Eliminar un producto por ID
DELIMITER //
CREATE PROCEDURE delete_product(IN productId INT)
BEGIN
    DELETE FROM products WHERE id = productId;
END //
DELIMITER ;

-- PrA 4 Obtener el total de pagos realizados
DELIMITER //
CREATE PROCEDURE get_total_payments(OUT total DECIMAL(20, 2))
BEGIN
    SELECT SUM(totalPay) INTO total FROM payment;
END//
DELIMITER ;

-- PrA 5 Agregar un nuevo método de pago
DELIMITER //
CREATE PROCEDURE add_payment_method(IN methodName VARCHAR(255))
BEGIN
    INSERT INTO paymentMethods (name) VALUES (methodName);
END //
DELIMITER ;

-- PrA 6 Listar productos por categoría
DELIMITER //
CREATE PROCEDURE list_products_by_category(IN categoryId INT)
BEGIN
    SELECT id, name, price FROM products WHERE idProductCategory = categoryId;
END//
DELIMITER ;

DELIMITER //

-- PrA 7 Registrar una nueva dirección
DELIMITER //
CREATE PROCEDURE add_address(
    IN cityId INT,
    IN neighborhood VARCHAR(255),
    IN street VARCHAR(255)
)
BEGIN
    INSERT INTO address (idCity, neighborhood, street)
    VALUES (cityId, neighborhood, street);
END//
DELIMITER ;

-- PrA 8 Actualizar el número de teléfono de una persona
DELIMITER //
CREATE PROCEDURE update_phone_number(
    IN personId INT,
    IN typePhoneId INT,
    IN newNumber VARCHAR(255)
)
BEGIN
    UPDATE people_phone
    SET `number` = newNumber, idTypePhone = typePhoneId
    WHERE idPerson = personId;
END//
DELIMITER ;

-- PrA 9 Consultar reservas por usuario
DELIMITER //
CREATE PROCEDURE get_reserves_by_user(IN userId INT)
BEGIN
    SELECT r.id, r.dateReserve, r.time, rs.`name` AS state
    FROM reserves r
    JOIN reserveStates rs ON r.idState = rs.id
    WHERE r.idUser = userId;
END//
DELIMITER ;

-- PrA 10 Asignar un rol a un usuario
DELIMITER //
CREATE PROCEDURE assign_role_to_user(IN userId INT, IN roleId INT)
BEGIN
    INSERT INTO usersRoles (idUser, idRole)
    VALUES (userId, roleId);
END//
DELIMITER ;

-- PrA 11 Listar productos con descuento aplicado
DELIMITER //
CREATE PROCEDURE list_discounted_products()
BEGIN
    SELECT p.id, p.name, p.price, d.total AS discount
    FROM products p
    JOIN reserveProducts rp ON rp.idProduct = p.id
    JOIN payment pay ON pay.id = rp.idReserve
    LEFT JOIN discount d ON d.id = pay.idDiscount
    WHERE d.total > 0;
END//
DELIMITER ;

-- PrA 12 Consultar historial de pagos de un usuario
DELIMITER //
CREATE PROCEDURE get_payment_history(IN userId INT)
BEGIN
    SELECT pt.id, pt.totalPay, pm.`name` AS paymentMethod, pt.createdAt
    FROM payment pt
    JOIN paymentTransactionInformation pti ON pti.id = pt.idTransaction
    JOIN paymentMethods pm ON pm.id = pti.idPayMethods
    WHERE pti.idCustomers = userId;
END//
DELIMITER ;

-- PrA 13 Registrar una transacción de pago
DELIMITER //
CREATE PROCEDURE add_payment_transaction(
    IN customerId INT,
    IN cardNumber VARCHAR(255),
    IN statusId INT,
    IN methodId INT,
    OUT transactionId INT
)
BEGIN
    INSERT INTO paymentTransactionInformation (idCustomers, numberTarjet, idStatus, idPayMethods)
    VALUES (customerId, cardNumber, statusId, methodId);
    
    SET transactionId = LAST_INSERT_ID();
END//
DELIMITER ;

-- PrA 14 Listar direcciones por ciudad
DELIMITER //
CREATE PROCEDURE list_addresses_by_city(IN cityId INT)
BEGIN
    SELECT id, neighborhood, street
    FROM address
    WHERE idCity = cityId;
END//
DELIMITER ;

-- PrA 15 Consultar facturas de un usuario
DELIMITER //
CREATE PROCEDURE get_invoices_by_user(IN customerId INT)
BEGIN
    SELECT i.id, i.invoiceDate, i.idEmployees, i.idDetails
    FROM invoice i
    WHERE i.idCustomers = customerId;
END//
DELIMITER ;

-- PrA 16 Verificar disponibilidad de un producto

DELIMITER //
CREATE PROCEDURE check_product_availability(IN productId INT, OUT available INT)
BEGIN
    SELECT COUNT(*) INTO available
    FROM reserveProducts
    WHERE idProduct = productId;
END//
DELIMITER ;

