-- triggers 1 Trigger para actualizar updatedAt en reservas
DELIMITER $$
CREATE TRIGGER update_reserve_timestamp
BEFORE UPDATE ON reserves
FOR EACH ROW
BEGIN
    SET NEW.updatedAt = CURRENT_TIMESTAMP;
END$$
DELIMITER ;

-- triggers 2  Trigger para evitar eliminación de usuarios con reservas activas
DELIMITER $$
CREATE TRIGGER prevent_user_deletion
BEFORE DELETE ON users
FOR EACH ROW
BEGIN
    IF EXISTS (SELECT 1 FROM reserves WHERE idUser = OLD.id) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Cannot delete user with active reservations.';
    END IF;
END$$
DELIMITER ;

-- Triggers 3 Trigger para registrar cambios en productos
DELIMITER $$
CREATE TRIGGER log_product_changes
AFTER UPDATE ON products
FOR EACH ROW
BEGIN
    INSERT INTO productCategories_log (productId, oldName, newName, changeDate)
    VALUES (OLD.id, OLD.name, NEW.name, CURRENT_TIMESTAMP);
END$$
DELIMITER ;

DELIMITER $$
CREATE TRIGGER auto_discount_update
AFTER INSERT ON reserveProducts
FOR EACH ROW
BEGIN
    DECLARE discountId INT;

    -- Buscar el idDiscount relacionado con la reserva
    SELECT p.idDiscount 
    INTO discountId
    FROM payment p
    INNER JOIN reserves r ON p.idTransaction = r.id
    WHERE r.id = NEW.idReserve;

    -- Actualizar el total del descuento, si existe
    IF discountId IS NOT NULL THEN
        UPDATE discount 
        SET total = total + 10
        WHERE id = discountId;
    END IF;
END$$
DELIMITER ;


-- triggers 5 Trigger para registrar pagos
DELIMITER $$
CREATE TRIGGER log_payment
AFTER INSERT ON payment
FOR EACH ROW
BEGIN
    INSERT INTO payment_log (paymentId, amount, logDate) VALUES (NEW.id, NEW.totalPay, CURRENT_TIMESTAMP);
END$$
DELIMITER ;

-- triggers 6 Trigger para verificar existencia de categoría en productos
DELIMITER $$
CREATE TRIGGER validate_product_category
BEFORE INSERT ON products
FOR EACH ROW
BEGIN
    IF NOT EXISTS (SELECT 1 FROM productCategories WHERE id = NEW.idProductCategory) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Product category does not exist.';
    END IF;
END$$
DELIMITER ;

-- triggers 7  Trigger para Evitar Duplicados en Teléfonos de Personas
DELIMITER $$
CREATE TRIGGER prevent_duplicate_phone
BEFORE INSERT ON people_phone
FOR EACH ROW
BEGIN
    IF EXISTS (
        SELECT 1 
        FROM people_phone 
        WHERE idPerson = NEW.idPerson AND `number` = NEW.number
    ) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Duplicate phone number for this person is not allowed.';
    END IF;
END$$
DELIMITER ;

-- triggers 8 Trigger para validar correo único al insertar usuarios
DELIMITER $$
CREATE TRIGGER validate_unique_email
BEFORE INSERT ON users
FOR EACH ROW
BEGIN
    IF EXISTS (SELECT 1 FROM users WHERE email = NEW.email) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Email already exists.';
    END IF;
END$$
DELIMITER ;

-- triggers 9  Trigger para asegurar que el estado de una reserva es válido
DELIMITER $$
CREATE TRIGGER validate_reserve_state
BEFORE INSERT ON reserves
FOR EACH ROW
BEGIN
    IF NOT EXISTS (SELECT 1 FROM reserveStates WHERE id = NEW.idState) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Invalid reserve state.';
    END IF;
END$$
DELIMITER ;

-- trigger 10 Trigger para garantizar valores positivos en pagos
DELIMITER $$
CREATE TRIGGER validate_payment_amount
BEFORE INSERT ON payment
FOR EACH ROW
BEGIN
    IF NEW.totalPay <= 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Payment amount must be greater than zero.';
    END IF;
END$$
DELIMITER ;

-- trigger 11 Trigger para Bloquear Productos con Precio Negativo
DELIMITER $$
CREATE TRIGGER prevent_negative_price
BEFORE INSERT ON products
FOR EACH ROW
BEGIN
    IF NEW.price < 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Price cannot be negative.';
    END IF;
END$$
DELIMITER ;
