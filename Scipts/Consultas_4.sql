use proyecto;


#consulta 1 Listar los usuarios junto con su rol correspondiente
SELECT u.name AS Usuario, r.name AS Rol
FROM users u
INNER JOIN usersRoles ur ON u.id = ur.idUser
INNER JOIN roles r ON ur.idRole = r.id;

#consulta 1 Listar los usuarios junto con su rol correspondiente
SELECT u.name AS Usuario, r.name AS Rol
FROM users u
INNER JOIN people p ON u.id = p.idUser
INNER JOIN usersRoles ur ON p.id = ur.idPeople
INNER JOIN roles r ON ur.idRole = r.id;

#consulta 2 Listar las reservas realizadas por cada usuario, junto con el estado de la reserva
SELECT p.name AS Usuario, r.dateReserve AS Fecha, s.name AS Estado
FROM reserves r
INNER JOIN reserveStates s ON r.idState = s.id
INNER JOIN people p ON r.idUser = p.id;

#consulta 3 Consultar los productos reservados junto con los detalles de la reserva y el nombre del cliente
SELECT p.name AS Cliente, pr.name AS Producto, rp.quantity AS Cantidad, r.dateReserve AS Fecha
FROM reserveProducts rp
INNER JOIN products pr ON rp.idProduct = pr.id
INNER JOIN reserves r ON rp.idReserve = r.id
INNER JOIN people p ON r.idUser = p.id;

#consulta 4 Obtener el nombre de los clientes que han reservado productos específicos (Cancha de Fútbol 5)
SELECT p.name AS Cliente, pr.name AS Producto
FROM people p
INNER JOIN reserves r ON p.id = r.idUser
INNER JOIN reserveProducts rp ON r.id = rp.idReserve
INNER JOIN products pr ON rp.idProduct = pr.id
WHERE pr.name = 'Cancha futbol 5';

#consulta 5 Ver los métodos de pago utilizados por los clientes en sus reservas
SELECT p.name AS Cliente, pm.name AS MetodoPago
FROM payment pay
INNER JOIN paymentMethods pm ON pay.idMethod = pm.id
INNER JOIN reserves r ON pay.idReserve = r.id
INNER JOIN people p ON r.idUser = p.id;

# consulta 6 Mostrar todos los productos reservados por fecha de reserva
SELECT r.dateReserve AS Fecha, pr.name AS Producto, rp.quantity AS Cantidad
FROM reserveProducts rp
INNER JOIN products pr ON rp.idProduct = pr.id
INNER JOIN reserves r ON rp.idReserve = r.id;

#  consulta 7 Mostrar las reservas confirmadas con sus respectivas canchas
SELECT p.name AS Cliente, r.dateReserve AS Fecha, pr.name AS Cancha
FROM reserves r
INNER JOIN reserveStates rs ON r.idState = rs.id
INNER JOIN reserveProducts rp ON r.id = rp.idReserve
INNER JOIN products pr ON rp.idProduct = pr.id
INNER JOIN people p ON r.idUser = p.id
WHERE rs.name = 'Confirmada';

# consulta 8 Listar los usuarios que han utilizado un descuento en sus pagos
SELECT p.name AS Cliente, d.total AS Descuento
FROM payment pay
INNER JOIN discount d ON pay.idDiscount = d.id
INNER JOIN reserves r ON pay.idReserve = r.id
INNER JOIN people p ON r.idUser = p.id;

# consulta 9 Ver los detalles de los pagos realizados, incluyendo descuentos y métodos de pago
SELECT p.name AS Cliente, pay.totalPaid AS TotalPagado, d.total AS Descuento, pm.name AS MetodoPago
FROM payment pay
INNER JOIN reserves r ON pay.idReserve = r.id
INNER JOIN people p ON r.idUser = p.id
INNER JOIN discount d ON pay.idDiscount = d.id
INNER JOIN paymentMethods pm ON pay.idMethod = pm.id;

# consulta 10 Mostrar los productos de todas las categorías
SELECT c.name AS Categoria, pr.name AS Producto, pr.price AS Precio
FROM productCategories c
INNER JOIN products pr ON pr.idProductCategory = c.id;

# consulta 11 Consultar las reservas pendientes y sus productos
SELECT p.name AS Cliente, pr.name AS Producto, r.dateReserve AS Fecha
FROM reserves r
INNER JOIN reserveStates rs ON r.idState = rs.id
INNER JOIN reserveProducts rp ON r.id = rp.idReserve
INNER JOIN products pr ON rp.idProduct = pr.id
INNER JOIN people p ON r.idUser = p.id
WHERE rs.name = 'Pendiente';

# consulta 12 Ver todas las canchas reservadas junto con la cantidad de horas reservadas
SELECT pr.name AS Cancha, rp.quantity AS HorasReservadas
FROM reserveProducts rp
INNER JOIN products pr ON rp.idProduct = pr.id
INNER JOIN reserves r ON rp.idReserve = r.id;

# consulta 13 Listar los métodos de pago utilizados para las reservas confirmadas
SELECT p.name AS Cliente, pm.name AS MetodoPago
FROM payment pay
INNER JOIN paymentMethods pm ON pay.idMethod = pm.id
INNER JOIN reserves r ON pay.idReserve = r.id
INNER JOIN people p ON r.idUser = p.id
INNER JOIN reserveStates rs ON r.idState = rs.id
WHERE rs.name = 'Confirmada';

# consulta 14 Listar los usuarios con más reservas realizadas
SELECT p.name AS Cliente, COUNT(r.id) AS TotalReservas
FROM reserves r
INNER JOIN people p ON r.idUser = p.id
GROUP BY p.name
ORDER BY TotalReservas DESC;

#consulta 15 Ver los productos más reservados
SELECT pr.name AS Producto, COUNT(rp.id) AS TotalReservas
FROM reserveProducts rp
INNER JOIN products pr ON rp.idProduct = pr.id
GROUP BY pr.name
ORDER BY TotalReservas DESC;

#consulta 16 Ingresos totales por fecha de reserva
SELECT r.dateReserve AS Fecha, SUM(pay.totalPaid) AS IngresosTotales
FROM payment pay
INNER JOIN reserves r ON pay.idReserve = r.id
GROUP BY r.dateReserve
ORDER BY r.dateReserve DESC;

# consulta 17 Usuarios que nunca han hecho una reserva
SELECT p.name AS Usuario
FROM people p
LEFT JOIN reserves r ON p.id = r.idUser
WHERE r.id IS NULL;

# consulta 18 Listar productos reservados en un rango de fechas
SELECT pr.name AS Producto, r.dateReserve AS Fecha
FROM reserveProducts rp
INNER JOIN products pr ON rp.idProduct = pr.id
INNER JOIN reserves r ON rp.idReserve = r.id
WHERE r.dateReserve BETWEEN '2024-01-01' AND '2024-12-31';

# consulta 19 Promedio de pagos realizados por método de pago
SELECT pm.name AS MetodoPago, AVG(pay.totalPaid) AS PromedioPago
FROM payment pay
INNER JOIN paymentMethods pm ON pay.idMethod = pm.id
GROUP BY pm.name;

# consulta 20 Ver las reservas que incluyen descuentos mayores a un valor específico
SELECT p.name AS Cliente, d.total AS Descuento, r.dateReserve AS Fecha
FROM payment pay
INNER JOIN discount d ON pay.idDiscount = d.id
INNER JOIN reserves r ON pay.idReserve = r.id
INNER JOIN people p ON r.idUser = p.id
WHERE d.total > 10; 

# consulta 21 Listar los 3 productos con el precio más alto
SELECT pr.name AS Producto, pr.price AS Precio
FROM products pr
ORDER BY pr.price DESC
LIMIT 3; 

#consulta 22 Historial de reservas de un usuario específico
SELECT r.dateReserve AS Fecha, s.name AS Estado, pr.name AS Producto
FROM reserves r
INNER JOIN reserveStates s ON r.idState = s.id
INNER JOIN reserveProducts rp ON r.id = rp.idReserve
INNER JOIN products pr ON rp.idProduct = pr.id
INNER JOIN people p ON r.idUser = p.id
WHERE p.name = 'María Gómez';

# consulta 23 Métodos de pago más usados
SELECT pm.name AS MetodoPago, COUNT(pay.id) AS VecesUtilizado
FROM payment pay
INNER JOIN paymentMethods pm ON pay.idMethod = pm.id
GROUP BY pm.name
ORDER BY VecesUtilizado DESC;

# consulta 24 Ver todas las reservas realizadas en el último mes
SELECT p.name AS Cliente, r.dateReserve AS Fecha, s.name AS Estado
FROM reserves r
INNER JOIN people p ON r.idUser = p.id
INNER JOIN reserveStates s ON r.idState = s.id
WHERE r.dateReserve >= DATE_SUB(CURDATE(), INTERVAL 1 MONTH);

# consulta 25 Cantidad total de productos reservados por categoría
SELECT c.name AS Categoria, COUNT(rp.id) AS TotalReservados
FROM reserveProducts rp
INNER JOIN products pr ON rp.idProduct = pr.id
INNER JOIN productCategories c ON pr.idProductCategory = c.id
GROUP BY c.name
ORDER BY TotalReservados DESC;

# consulta 26 Obtener todos los usuarios y sus roles (si los tienen):
SELECT 
    u.id AS user_id, 
    u.name AS user_name, 
    r.name AS role_name
FROM 
    users u
LEFT JOIN 
    usersRoles ur ON u.id = ur.idUser
LEFT JOIN 
    roles r ON ur.idRole = r.id;

#consulta 27 Listar las reservas junto con el estado de cada reserva:
SELECT 
    r.id AS reserve_id, 
    r.time, 
    r.dateReserve, 
    s.name AS state_name
FROM 
    reserves r
LEFT JOIN 
    reserveStates s ON r.idState = s.id;

#consulta 28 Mostrar todos los productos junto con su categoría:
SELECT 
    p.id AS product_id, 
    p.name AS product_name, 
    c.name AS category_name
FROM 
    products p
LEFT JOIN 
    productCategories c ON p.idProductCategory = c.id;

#consulta 29  Listar los pagos realizados junto con los métodos de pago y descuentos:
SELECT 
    pay.id AS payment_id, 
    pay.date_pay, 
    pay.totalPaid, 
    pm.name AS payment_method, 
    d.total AS discount_total
FROM 
    payment pay
LEFT JOIN 
    paymentMethods pm ON pay.idMethod = pm.id
LEFT JOIN 
    discount d ON pay.idDiscount = d.id;

#consulta 30 Obtener información de personas junto con su tipo de documento:
SELECT 
    p.id AS person_id, 
    p.name AS person_name, 
    p.lastName, 
    td.name AS document_type
FROM 
    people p
LEFT JOIN 
    type_document td ON p.idTypeDocument = td.id;

#consulta 31 Productos reservados y sus reservas:
SELECT reserves.id AS reserve_id, products.name AS product_name, reserveProducts.quantity
FROM reserveProducts
RIGHT JOIN reserves ON reserveProducts.idReserve = reserves.id
RIGHT JOIN products ON reserveProducts.idProduct = products.id;


#consulta 32 Listar todos los estados de reserva y las reservas correspondientes:
SELECT 
    s.id AS state_id, 
    s.name AS state_name, 
    r.time, 
    r.dateReserve
FROM 
    reserveStates s
RIGHT JOIN 
    reserves r ON s.id = r.idState;

#consulta 33 Mostrar todas las categorías de productos y los productos correspondientes:
SELECT 
    c.id AS category_id, 
    c.name AS category_name, 
    p.name AS product_name
FROM 
    productCategories c
RIGHT JOIN 
    products p ON c.id = p.idProductCategory;

#consulta 34 Listar todos los métodos de pago y los pagos realizados con esos métodos:
SELECT 
    pm.id AS method_id, 
    pm.name AS payment_method, 
    pay.totalPaid
FROM 
    paymentMethods pm
RIGHT JOIN 
    payment pay ON pm.id = pay.idMethod;

#consulta 35 Obtener descuentos aplicados a pagos:
SELECT payment.totalPaid, discount.total AS discount_value
FROM payment
RIGHT JOIN discount ON payment.idDiscount = discount.id;


#consulta 36  Listar todos los posibles combinaciones de usuarios y roles:
SELECT 
    u.name AS user_name, 
    r.name AS role_name
FROM 
    users u
CROSS JOIN 
    roles r;

#consulta 37  Obtener todas las combinaciones de tipos de documentos y personas:
SELECT 
    td.name AS document_type, 
    p.name AS person_name
FROM 
    type_document td
CROSS JOIN 
    people p;

#consulta 38 Mostrar todas las combinaciones de productos y categorías:
SELECT 
    p.name AS product_name, 
    c.name AS category_name
FROM 
    products p
CROSS JOIN 
    productCategories c;

#consulta 39 Listar todos los métodos de pago y las reservas:
SELECT 
    pm.name AS payment_method, 
    r.dateReserve
FROM 
    paymentMethods pm
CROSS JOIN 
    reserves r;

#consulta 40 Obtener todas las combinaciones de descuentos y pagos:
SELECT 
    d.total AS discount_total, 
    pay.totalPaid
FROM 
    discount d
CROSS JOIN 
    payment pay;
    
    
#subconsultas 1 Obtener los clientes y su nombre con promedio mayor a 80000 en alquilar las canchas con where

SELECT 
    people.name AS client_name,
    ROUND(
        (SELECT AVG(payment.totalPaid) 
         FROM payment 
         INNER JOIN reserves ON payment.idReserve = reserves.id
         WHERE reserves.idUser = people.id), 2) AS average_paid
FROM 
    people
INNER JOIN users ON people.idUser = users.id
INNER JOIN usersRoles ON users.id = usersRoles.idUser
INNER JOIN roles ON usersRoles.idRole = roles.id
INNER JOIN reserves ON people.id = reserves.idUser
INNER JOIN payment ON reserves.id = payment.idReserve
WHERE 
    roles.id = 3  -- Filtra por el rol 3 (clientes)
GROUP BY 
    people.id, people.name
HAVING 
    average_paid > 80000;
    
# 2 subconsulta where con clientes con 1 o más reservaciones
SELECT 
    people.name AS client_name
FROM 
    people
WHERE 
    (SELECT COUNT(*) 
     FROM reserves 
     WHERE reserves.idUser = people.id) >= 1;

# 3 subconsulta where dónde un producto sea usado por más 4 veces

SELECT 
    products.name AS product_name
FROM 
    products
WHERE 
    (SELECT SUM(reserveProducts.quantity) 
     FROM reserveProducts 
     WHERE reserveProducts.idProduct = products.id) > 4;


#1 subconsulta From Obtener la cantidad de reservas agrupadas por su estado.
SELECT 
    state_data.state_name,
    COUNT(state_data.reserve_id) AS total_reserves
FROM 
    (SELECT 
        reserves.id AS reserve_id,
        reserveStates.name AS state_name
     FROM 
        reserves
     INNER JOIN reserveStates ON reserves.idState = reserveStates.id) AS state_data
GROUP BY 
    state_data.state_name;
    
# 2 subconsulta From,Obtener la cantidad de reservas realizadas por cada cliente, agrupadas por el estado de la reserva.

SELECT 
    customer_data.client_name,
    reserveStates.name AS state_name,
    COUNT(customer_data.reserve_id) AS total_reserves
FROM 
    (SELECT 
        people.name AS client_name,
        reserves.id AS reserve_id,
        reserves.idState
     FROM 
        people
     INNER JOIN reserves ON people.id = reserves.idUser) AS customer_data
INNER JOIN reserveStates ON customer_data.idState = reserveStates.id
GROUP BY 
    customer_data.client_name, reserveStates.name;

#3 subconsulta From Obtener información sobre las reservas y el descuento aplicado.
SELECT 
    reserve_data.reserve_id,
    reserve_data.dateReserve,
    reserve_data.time,
    reserve_data.state_name,
    reserve_data.discount_amount
FROM 
    (SELECT 
        reserves.id AS reserve_id,
        reserves.dateReserve,
        reserves.time,
        reserveStates.name AS state_name,
        discount.total AS discount_amount
     FROM 
        reserves
     INNER JOIN reserveStates ON reserves.idState = reserveStates.id
     LEFT JOIN payment ON reserves.id = payment.idReserve
     LEFT JOIN discount ON payment.idDiscount = discount.id) AS reserve_data;

#1 subconsulta Select Obtener información sobre las reservas confirmadas y el descuento aplicado.
SELECT 
    reserves.id AS reserve_id,
    reserves.dateReserve,
    reserves.time,
    reserveStates.name AS state_name,
    (SELECT discount.total 
     FROM payment 
     LEFT JOIN discount ON payment.idDiscount = discount.id 
     WHERE payment.idReserve = reserves.id 
       AND payment.idReserve IN (SELECT id FROM reserves WHERE idState = 2) 
     ORDER BY payment.date_pay DESC 
     LIMIT 1) AS discount_amount
FROM 
    reserves
INNER JOIN reserveStates ON reserves.idState = reserveStates.id
WHERE reserves.idState = 2;  -- Filtrar las reservas confirmadas

#2 subconsulta Selec, Obtiene el total de reservas realizadas por cada usuario.
SELECT 
    users.id AS user_id,
    users.name,
    (SELECT COUNT(*) 
     FROM reserves 
     WHERE idUser = users.id) AS total_reservations
FROM 
    users;
    
    
#-----------------------------------------------------------------------------------------

#3 subconsulta select. los productos con sus precios originales y el precio final, siempre que haya un descuento aplicable
SELECT 
    reserves.id AS reserve_id,
    products.name AS product_name,
    products.price AS original_price,
    -- Cálculo del precio final basado en el descuento aplicado
    (products.price - 
     (products.price * 
      (SELECT SUM(discount.total) 
       FROM payment 
       LEFT JOIN discount ON payment.idDiscount = discount.id 
       WHERE payment.idReserve = reserves.id AND discount.total IS NOT NULL) / 100)) AS final_price
FROM 
    reserves
INNER JOIN reserveStates ON reserves.idState = reserveStates.id
INNER JOIN reserveProducts ON reserves.id = reserveProducts.idReserve
INNER JOIN products ON reserveProducts.idProduct = products.id
WHERE 
    reserveStates.id IN (2, 3)  -- Filtrar reservas confirmadas (2) o pendientes (3)
    AND EXISTS (
        SELECT 1
        FROM payment 
        LEFT JOIN discount ON payment.idDiscount = discount.id 
        WHERE payment.idReserve = reserves.id AND discount.total IS NOT NULL
    );

    
#subconsulta con IN Obtener personas que tienen reservas en un estado específico
SELECT p.name, p.lastName 
FROM people p 
WHERE p.id IN (
    SELECT r.idUser 
    FROM reserves r 
    WHERE r.idState IN (2) -- Supongamos que  2 son estados específicos
);

#subconsulta con exists. Listar reservas que tienen pagos asociados

SELECT 
    r.id AS reserve_id,
    r.dateReserve,
    u.name AS user_name,
    rs.name AS reserve_state,
    SUM(p.totalPaid) AS total_paid  -- Sumar los pagos asociados
FROM 
    reserves r
INNER JOIN 
    users u ON r.idUser = u.id  -- Unir con la tabla de usuarios
INNER JOIN 
    reserveStates rs ON r.idState = rs.id  -- Unir con la tabla de estados de reserva
LEFT JOIN 
    payment p ON p.idReserve = r.id  -- Unir con la tabla de pagos para sumar
WHERE 
     EXISTS (
        SELECT 1
        FROM payment p 
        WHERE p.idReserve = r.id AND p.totalPaid > 0  -- Asegurarte de que el total pagado sea mayor que 0
    )
GROUP BY r.id, r.dateReserve, u.name, rs.name  -- Agrupar para sumar los pagos
ORDER BY r.dateReserve DESC;  -- Ordenar por fecha de reserva más reciente

#subconsulta con any. clientes registrados con TI

SELECT name, document 
FROM people 
WHERE document > ANY (
    SELECT document 
    FROM people 
    WHERE idTypeDocument = 1
);

# subconsulta Any. Productos con menor precio que cancha de futbol 7
SELECT name 
FROM products 
WHERE price < ALL (
    SELECT price 
    FROM products 
    WHERE id = 2
);


#subconsulta Any o All. Listar reservas de usuarios que han realizado pagos mayores a un monto específico
SELECT r.id, r.dateReserve, p.name AS user_name
FROM reserves r
INNER JOIN people p ON r.idUser = p.id  -- Asegúrate de que la relación es correcta
WHERE EXISTS (
    SELECT 1 
    FROM payment pay 
    WHERE pay.idReserve = r.id AND pay.totalPaid > ANY (
        SELECT totalPaid 
        FROM payment 
        WHERE totalPaid <= 70000
    )
);















-- # CONCAT(table.atribute, ' ' , table.atribute) AS alias of the table --> Concat text string
-- # CONCAT_WS(' ', table.atribue, table.atribute) AS alias of the table
-- # LENGHT () --> Tamaño
-- # SUBSTRING(tabel.atribute,1,6) AS alias of the table --> to from to the character 1, to until the character 6
-- # Round(table.atribute, number) AS alias of the table --> Rounding the quantity of numbers with decimals
-- # ABS(table.atribute) AS alias of the table --> change el negative number for a positive number

-- # COUNT(table.atribute) AS alias --> Count how many register there is in a table
-- # SUM(table.atribute + table.atribute) AS alias --> Sum the value total of the tables 
-- # AVG(table.atribute) AS alias --> average of the values of the table
-- # MIN(table.atribute) AS alias --> Search the value min of the table
-- # MAX(table.atribute) AS alias --> Search the value max of the table

-- # GROUP BY table.atribute --> Group rows that have similars values
-- # ORDER BY table.atribute ASC or DESC--> Order the table of way ascendent or descendent 
-- # HAVING FUNCTION() --> Fitler groups after of the grouping with a condition

-- # ---------------------------------------------------

-- # Relations and Joins

-- # Inner Join: Only return the rows that have some coincidence


-- # 
