-- vista 1 Vista para usuarios con sus roles
CREATE VIEW users_with_roles AS
SELECT u.id AS userId, u.email, r.name AS roleName
FROM users u
JOIN usersRoles ur ON u.id = ur.idUser
JOIN roles r ON ur.idRole = r.id;
-- vista 2 Vista para productos y sus categorías
CREATE VIEW products_with_categories AS
SELECT p.id AS productId, p.name AS productName, c.name AS categoryName, p.price
FROM products p
JOIN productCategories c ON p.idProductCategory = c.id;
-- vista 3 Vista para reservas con estado y creador
CREATE VIEW reserves_with_state AS
SELECT r.id AS reserveId, r.dateReserve, rs.name AS stateName, r.created_by
FROM reserves r
JOIN reserveStates rs ON r.idState = rs.id;
-- vista 4 Vista de pagos con métodos y estado
CREATE VIEW payment_details AS
SELECT p.id AS paymentId, p.totalPay, pm.name AS methodName, sp.name AS statusName
FROM payment p
JOIN paymentTransactionInformation pti ON p.idTransaction = pti.id
JOIN paymentMethods pm ON pti.idPayMethods = pm.id
JOIN statusPayment sp ON pti.idStatus = sp.id;
-- vista 5 Vista para personas con sus teléfonos
CREATE VIEW people_with_phones AS
SELECT pe.id AS personId, pe.name, pe.lastName, pp.number, tp.name AS typePhone
FROM people pe
JOIN people_phone pp ON pe.id = pp.idPerson
JOIN typePhoneNumber tp ON pp.idTypePhone = tp.id;
-- vista 6 Vista para reservas y productos reservados
CREATE VIEW reserve_products_details AS
SELECT rp.id AS reserveProductId, r.id AS reserveId, p.name AS productName, rp.quantity
FROM reserveProducts rp
JOIN reserves r ON rp.idReserve = r.id
JOIN products p ON rp.idProduct = p.id;
