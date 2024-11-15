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
-- triggers 4 Trigger para actualizar descuentos automáticamente
DELIMITER $$
CREATE TRIGGER auto_discount_update
AFTER INSERT ON reserveProducts
FOR EACH ROW
BEGIN
    UPDATE discount SET total = total + 10 WHERE id = NEW.idDiscount;
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
-- triggers 6 Trigger para validar la cantidad de productos reservados
DELIMITER $$
CREATE TRIGGER validate_reserve_quantity
BEFORE INSERT ON reserveProducts
FOR EACH ROW
BEGIN
    IF NEW.quantity <= 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Quantity must be greater than zero.';
    END IF;
END$$
DELIMITER ;
