-- vista 1 Vista para usuarios con sus roles
CREATE VIEW users_with_roles AS
SELECT u.id AS userId, u.email, r.name AS roleName
FROM users u
INNER JOIN usersRoles ur ON u.id = ur.idUser
INNER JOIN roles r ON ur.idRole = r.id;

-- vista 2 Vista para productos y sus categorías
CREATE VIEW products_with_categories AS
SELECT p.id AS productId, p.name AS productName, c.name AS categoryName, p.price
FROM products p
INNER JOIN productCategories c ON p.idProductCategory = c.id;

-- vista 3 Vista para reservas con estado y creador
CREATE VIEW reserves_with_state AS
SELECT r.id AS reserveId, r.dateReserve, rs.name AS stateName, r.created_by
FROM reserves r
INNER JOIN reserveStates rs ON r.idState = rs.id;

-- vista 4 Vista de pagos con métodos y estado
CREATE VIEW payment_details AS
SELECT p.id AS paymentId, p.totalPay, pm.name AS methodName, sp.name AS statusName
FROM payment p
INNER JOIN paymentTransactionInformation pti ON p.idTransaction = pti.id
INNER JOIN paymentMethods pm ON pti.idPayMethods = pm.id
INNER JOIN statusPayment sp ON pti.idStatus = sp.id;

-- vista 5 Vista para personas con sus teléfonos
CREATE VIEW people_with_phones AS
SELECT pe.id AS personId, pe.name, pe.lastName, pp.number, tp.name AS typePhone
FROM people pe
INNER JOIN people_phone pp ON pe.id = pp.idPerson
INNER JOIN typePhoneNumber tp ON pp.idTypePhone = tp.id;

-- vista 6 Vista para reservas y productos reservados
CREATE VIEW reserve_products_details AS
SELECT rp.id AS reserveProductId, r.id AS reserveId, p.name AS productName, rp.quantity
FROM reserveProducts rp
INNER JOIN reserves r ON rp.idReserve = r.id
INNER JOIN products p ON rp.idProduct = p.id;

-- vista 7 Vista de reservas con productos y estados
CREATE VIEW reserves_products_states AS
SELECT 
    r.id AS reserveId, 
    r.dateReserve, 
    rs.name AS stateName, 
    p.name AS productName, 
    rp.quantity
FROM reserves r
INNER JOIN reserveStates rs ON r.idState = rs.id
INNER JOIN reserveProducts rp ON r.id = rp.idReserve
INNER JOIN products p ON rp.idProduct = p.id;

-- vista 8 Vista de pagos realizados por usuarios
CREATE VIEW user_payments AS
SELECT 
    u.id AS userId, 
    u.email, 
    p.id AS paymentId, 
    p.totalPay, 
    pm.name AS paymentMethod
FROM payment p
INNER JOIN paymentTransactionInformation pti ON p.idTransaction = pti.id
INNER JOIN users u ON pti.idCustomers = u.id
INNER JOIN paymentMethods pm ON pti.idPayMethods = pm.id;

-- vista 9 Vista de productos más vendidos
CREATE VIEW top_selling_products AS
SELECT 
    p.id AS productId, 
    p.name AS productName, 
    SUM(rp.quantity) AS totalQuantitySold
FROM reserveProducts rp
INNER JOIN products p ON rp.idProduct = p.id
GROUP BY p.id, p.name
ORDER BY totalQuantitySold DESC;

-- vista 10 Vista de personas y sus direcciones
CREATE VIEW people_with_addresses AS
SELECT 
    p.id AS personId, 
    p.name, 
    p.lastName, 
    a.neighborhood, 
    a.street, 
    c.name AS cityName
FROM people p
INNER JOIN address a ON p.idAddress = a.id
INNER JOIN city c ON a.idCity = c.id;
 
-- vista 11 Vista para estados de pagos y sus transacciones
CREATE VIEW payment_status_transactions AS
SELECT 
    pti.id AS transactionId, 
    sp.name AS statusName, 
    pm.name AS paymentMethod, 
    pti.numberTarjet, 
    pgr.gateway_response AS gatewayResponse, 
    pgr.transaction_date
FROM paymentTransactionInformation pti
INNER JOIN statusPayment sp ON pti.idStatus = sp.id
INNER JOIN paymentMethods pm ON pti.idPayMethods = pm.id
LEFT JOIN paymentGatewayRecords pgr ON pti.id = pgr.idTransaction;

