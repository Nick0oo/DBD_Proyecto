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




