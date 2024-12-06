use proyecto;

#--------------------------------------------- CONSULTAS ----------------------------------------

#consulta 1 Listar los usuarios junto con su rol correspondiente
SELECT p.name AS Usuario, r.name AS Rol
FROM people p
INNER JOIN usersRoles ur ON p.idUser = ur.idUser
INNER JOIN roles r ON ur.idRole = r.id;

#consulta 2 Listar las reservas realizadas por cada usuario, junto con el estado de la reserva
SELECT 
    p.name AS Usuario,
    r.id AS ReservaID,
    r.time AS HoraReserva,
    r.dateReserve AS FechaReserva,
    rs.name AS Estado
FROM 
    reserves r
INNER JOIN 
    users u ON r.idUser = u.id
INNER JOIN 
    people p ON u.id = p.idUser
INNER JOIN 
    reserveStates rs ON r.idState = rs.id;

#consulta 3 Consultar los productos reservados junto con los detalles de la reserva y el nombre del cliente
SELECT 
    p.name AS Cliente,
    r.id AS ReservaID,
    r.time AS HoraReserva,
    r.dateReserve AS FechaReserva,
    rp.quantity AS Cantidad,
    prod.name AS Producto,
    prod.price AS Precio
FROM 
    reserveProducts rp
INNER JOIN 
    reserves r ON rp.idReserve = r.id
INNER JOIN 
    users u ON r.idUser = u.id
INNER JOIN 
    people p ON u.id = p.idUser
INNER JOIN 
    products prod ON rp.idProduct = prod.id;

#consulta 4 Obtener el nombre de los clientes que han reservado productos específicos (Cancha de Fútbol 5 - Mini Estadio)
SELECT 
    p.name AS Cliente
FROM 
    reserveProducts rp
INNER JOIN 
    reserves r ON rp.idReserve = r.id
INNER JOIN 
    users u ON r.idUser = u.id
INNER JOIN 
    people p ON u.id = p.idUser
INNER JOIN 
    products prod ON rp.idProduct = prod.id
WHERE 
    prod.name = 'Cancha de Fútbol 5 - Mini Estadio';

#consulta 5 Ver los métodos de pago utilizados por los clientes en sus reservas
SELECT 
    p.name AS Cliente,
    pm.name AS MetodoPago
FROM 
    paymentTransactionInformation pt
INNER JOIN 
    reserves r ON pt.idCustomers = r.idUser
INNER JOIN 
    users u ON pt.idCustomers = u.id
INNER JOIN 
    people p ON u.id = p.idUser
INNER JOIN 
    paymentMethods pm ON pt.idPayMethods = pm.id;

# consulta 6 Mostrar todos los productos reservados por fecha de reserva
SELECT 
    p.name AS Producto,
    r.dateReserve AS FechaReserva,
    rp.quantity AS CantidadReservada
FROM 
    reserveProducts rp
INNER JOIN 
    reserves r ON rp.idReserve = r.id
INNER JOIN 
    products p ON rp.idProduct = p.id
ORDER BY 
    r.dateReserve;

#  consulta 7 Mostrar las reservas confirmadas con sus respectivas canchas
SELECT 
    r.id AS ReservaID,
    r.dateReserve AS FechaReserva,
    r.time AS HoraReserva,
    p.name AS Cancha,
    rs.name AS EstadoReserva
FROM 
    reserves r
INNER JOIN 
    reserveStates rs ON r.idState = rs.id
INNER JOIN 
    reserveProducts rp ON r.id = rp.idReserve
INNER JOIN 
    products p ON rp.idProduct = p.id
WHERE 
    rs.name = 'Confirmado'
ORDER BY 
    r.dateReserve, r.time;

# consulta 8 Listar los usuarios que han utilizado un descuento en sus pagos
SELECT 
    CONCAT(pe.name, ' ', pe.lastname) AS Cliente,
    d.total AS Descuento
FROM 
    payment p
INNER JOIN 
    paymentTransactionInformation pti ON p.idTransaction = pti.id
INNER JOIN 
    users u ON pti.idCustomers = u.id
INNER JOIN
    people pe ON u.id = pe.idUser
INNER JOIN 
    discount d ON p.idDiscount = d.id
WHERE 
    p.idDiscount IS NOT NULL; 

# consulta 9 Ver los detalles de los pagos realizados, incluyendo descuentos y métodos de pago
SELECT 
    pti.id AS ID_Transaccion,
    CONCAT(pe.name, ' ', pe.lastname) AS Cliente,
    p.totalPay AS Total_Pagado,
    d.total AS Descuento_Aplicado,
    pm.name AS Metodo_Pago,
    sp.name AS Estado_Pago
FROM 
    payment p
INNER JOIN 
    paymentTransactionInformation pti ON p.idTransaction = pti.id
INNER JOIN 
    users u ON pti.idCustomers = u.id
INNER JOIN
    people pe ON u.id = pe.idUser
LEFT JOIN 
    discount d ON p.idDiscount = d.id
INNER JOIN 
    paymentMethods pm ON pti.idPayMethods = pm.id
INNER JOIN 
    statusPayment sp ON pti.idStatus = sp.id
ORDER BY 
    pti.id;

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
SELECT 
    p.name AS Cancha,
    SUM(rp.quantity) AS Horas_Reservadas
FROM 
    reserveProducts rp
INNER JOIN 
    reserves r ON rp.idReserve = r.id
INNER JOIN 
    products p ON rp.idProduct = p.id
WHERE 
    p.name LIKE '%Cancha%'
GROUP BY 
    p.name;

# consulta 13 Listar los métodos de pago utilizados para las reservas confirmadas
SELECT 
    r.id AS Reserva,
    pm.name AS Metodo_Pago
FROM 
    reserves r
INNER JOIN 
    paymentTransactionInformation pti ON r.idUser = pti.idCustomers
INNER JOIN 
    paymentMethods pm ON pti.idPayMethods = pm.id
INNER JOIN 
    reserveStates rs ON r.idState = rs.id
WHERE 
    rs.name = 'Confirmado';

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
SELECT 
    r.dateReserve AS Fecha_Reserva,
    SUM(p.totalPay) AS Ingresos_Totales
FROM 
    reserves r
INNER JOIN 
    paymentTransactionInformation pti ON r.idUser = pti.idCustomers
INNER JOIN 
    payment p ON pti.id = p.idTransaction
GROUP BY 
    r.dateReserve;

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
SELECT 
    pm.name AS Metodo_Pago,
    ROUND(AVG(p.totalPay), 2) AS Promedio_Pago
FROM 
    payment p
INNER JOIN 
    paymentTransactionInformation pti ON p.idTransaction = pti.id
INNER JOIN 
    paymentMethods pm ON pti.idPayMethods = pm.id
GROUP BY 
    pm.name;

# consulta 20 Ver las reservas que incluyen descuentos mayores a un valor específico 15
SELECT 
    r.id AS Reserva_ID,
    p.totalPay AS Pago_Total,
    d.total AS Descuento_Aplicado
FROM 
    reserves r
INNER JOIN 
    paymentTransactionInformation pti ON r.idUser = pti.idCustomers
INNER JOIN 
    payment p ON pti.id = p.idTransaction
INNER JOIN 
    discount d ON p.idDiscount = d.id
WHERE 
    d.total > 15;

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
WHERE p.name = 'Sofía';

# consulta 23 Métodos de pago más usados
SELECT 
    pm.name AS Metodo_Pago,
    COUNT(pti.idPayMethods) AS Cantidad_Usos
FROM 
    paymentTransactionInformation pti
INNER JOIN 
    paymentMethods pm ON pti.idPayMethods = pm.id
GROUP BY 
    pm.name
ORDER BY 
    Cantidad_Usos DESC;

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
    p.name AS Usuario,
    r.name AS Rol
FROM 
    users u
LEFT JOIN 
    usersRoles ur ON u.id = ur.idUser
INNER JOIN 
	people p ON u.id  = p.idUser
LEFT JOIN 
    roles r ON ur.idRole = r.id
ORDER BY Rol ASC;

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
    p.id AS PagoID,
    pm.name AS MetodoPago,
    d.total AS Descuento,
    p.totalPay AS TotalPago
FROM 
    payment p
LEFT JOIN 
    discount d ON p.idDiscount = d.id
LEFT JOIN 
    paymentTransactionInformation pti ON p.idTransaction = pti.id
LEFT JOIN 
    paymentMethods pm ON pti.idPayMethods = pm.id;

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
    rs.name AS EstadoReserva,
    r.id AS ReservaID,
    r.time AS HoraReserva,
    r.dateReserve AS FechaReserva
FROM 
    reserveStates rs
RIGHT JOIN 
    reserves r ON rs.id = r.idState;

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
    pay.totalPay AS total_paid
FROM 
    paymentMethods pm
RIGHT JOIN 
    paymentTransactionInformation pti ON pm.id = pti.idPayMethods
RIGHT JOIN 
    payment pay ON pti.id = pay.idTransaction;

#consulta 35 Obtener descuentos aplicados a pagos:
SELECT 
    pay.id AS payment_id,
    pay.totalPay AS total_paid,
    d.total AS discount_amount
FROM 
    payment pay
RIGHT JOIN 
    discount d ON pay.idDiscount = d.id;

#consulta 36  Listar todos los posibles combinaciones de usuarios y roles:
SELECT 
    u.id AS user_id,
    p.name AS user_name,
    r.id AS role_id,
    r.name AS role_name
FROM 
    users u
INNER JOIN
	people p ON u.id = p.idUser
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
    pay.totalPay
FROM 
    discount d
CROSS JOIN 
    payment pay;
    
#--------------------------------------------- SUBCONSULTAS ----------------------------------------

#subconsultas 1 Obtener los clientes y su nombre con promedio mayor a 80 en alquilar las canchas 
SELECT 
    people.name AS client_name,
    ROUND(
        (SELECT AVG(payment.totalPay) 
         FROM payment 
         INNER JOIN paymentTransactionInformation pti ON payment.idTransaction = pti.id
         INNER JOIN reserves r ON pti.idCustomers = r.idUser
         WHERE r.idUser = people.id
        ), 2) AS average_paid
FROM 
    people
INNER JOIN users ON people.idUser = users.id
INNER JOIN usersRoles ON users.id = usersRoles.idUser
INNER JOIN roles ON usersRoles.idRole = roles.id
WHERE 
    roles.id = 1  -- Filtra por el rol 1 (clientes)
GROUP BY 
    people.id, people.name
HAVING 
    average_paid > 80;

# 2 subconsulta where con clientes con 2 o más reservaciones
SELECT 
    people.name AS client_name
FROM 
    people
WHERE 
    (SELECT COUNT(*) 
     FROM reserves 
     WHERE reserves.idUser = people.id) >= 2;

# 3 subconsulta where dónde un producto sea usado por más 1 veces
SELECT 
    products.name AS product_name
FROM 
    products
WHERE 
    (SELECT SUM(reserveProducts.quantity) 
     FROM reserveProducts 
     WHERE reserveProducts.idProduct = products.id) > 1;

#4 subconsulta From Obtener la cantidad de reservas agrupadas por su estado.
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
    
#5 subconsulta From,Obtener la cantidad de reservas realizadas por cada cliente, agrupadas por el estado de la reserva.
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

#6 subconsulta From Obtener información sobre las reservas y el descuento aplicado.
SELECT 
    reserve_data.reserve_id,
    reserve_data.dateReserve,
    reserve_data.time,
    reserve_data.state_name,
    reserve_data.discount_amount
FROM 
    (SELECT 
        r.id AS reserve_id,
        r.dateReserve,
        r.time,
        rs.name AS state_name,
        d.total AS discount_amount
     FROM 
        reserves r
     INNER JOIN reserveStates rs ON r.idState = rs.id
     LEFT JOIN paymentTransactionInformation pti ON r.id = pti.idCustomers
     LEFT JOIN payment p ON pti.id = p.idTransaction
     LEFT JOIN discount d ON p.idDiscount = d.id
    ) AS reserve_data;


#7 subconsulta Select Obtener información sobre las reservas confirmadas y el descuento aplicado.
SELECT 
    r.id AS reserve_id,
    r.dateReserve,
    r.time,
    rs.name AS state_name,
    (SELECT d.total 
     FROM payment p
     LEFT JOIN discount d ON p.idDiscount = d.id 
     WHERE p.idTransaction IN 
         (SELECT pti.id 
          FROM paymentTransactionInformation pti 
          WHERE pti.idCustomers = r.idUser)
       AND p.idTransaction IN (SELECT pti.id FROM paymentTransactionInformation pti 
			WHERE pti.idCustomers = r.idUser)
     ORDER BY p.createdAt DESC 
     LIMIT 1) AS discount_amount
FROM 
    reserves r
INNER JOIN reserveStates rs ON r.idState = rs.id
WHERE r.idState = 2;

#8 subconsulta Selec, Obtiene el total de reservas realizadas por cada usuario.
SELECT 
    users.id AS user_id,
    people.name,
    (SELECT COUNT(*) 
     FROM reserves 
     WHERE idUser = users.id) AS total_reservations
FROM 
    users
INNER JOIN people ON users.id = people.idUser;

#9 subconsulta select. los productos reservados con sus precios originales y el precio final, 
# siempre que haya un descuento aplicable
SELECT 
    reserves.id AS reserve_id,
    products.name AS product_name,
    products.price AS original_price,
    (products.price - IFNULL(SUM(discount.total), 0)) AS final_price
FROM 
    reserves
INNER JOIN reserveProducts ON reserves.id = reserveProducts.idReserve
INNER JOIN products ON reserveProducts.idProduct = products.id
LEFT JOIN payment ON payment.idTransaction = reserves.id
LEFT JOIN discount ON payment.idDiscount = discount.id
WHERE 
    reserves.idState IN (1, 2)
GROUP BY 
    reserves.id, products.name, products.price
ORDER BY 
	reserves.id;

#10 subconsulta con IN Obtener personas que tienen reservas en un estado específico
SELECT p.name, p.lastName 
FROM people p 
WHERE p.id IN (
    SELECT r.idUser 
    FROM reserves r 
    WHERE r.idState IN (2) 
);

#11 subconsulta con exists. Listar reservas que tienen pagos asociados
SELECT 
    r.id AS reserve_id,
    r.dateReserve,
    p.name AS user_name, 
    rs.name AS reserve_state,
    SUM(pmt.totalPay) AS total_paid 
FROM 
    reserves r
INNER JOIN 
    people p ON r.idUser = p.idUser  
INNER JOIN 
    reserveStates rs ON r.idState = rs.id 
LEFT JOIN 
    paymentTransactionInformation pti ON pti.idCustomers = r.idUser  
LEFT JOIN 
    payment pmt ON pmt.idTransaction = pti.id  
WHERE 
    EXISTS (
        SELECT 1
        FROM payment pmt 
        WHERE pmt.idTransaction = pti.id AND pmt.totalPay > 0  
    )
GROUP BY r.id, r.dateReserve, p.name, rs.name  
ORDER BY r.dateReserve DESC;  

#12 Obtener Personas con un Documento Mayor que Cualquier Documento de un Usuario Específico
SELECT name, document 
FROM people 
WHERE document > ANY (
    SELECT document 
    FROM people 
    WHERE idUser = 2
);

#13 subconsulta Any. Productos con menor precio que cancha de futbol 7
SELECT name 
FROM products 
WHERE price < ALL (
    SELECT price 
    FROM products 
    WHERE id = 2
);

#14 subconsulta Any. Listar reservas de usuarios que han realizado pagos mayores a un monto  70
SELECT 
    r.id AS reserve_id,
    r.dateReserve,
    p.name AS user_name,
    rs.name AS reserve_state
FROM 
    reserves r
INNER JOIN 
    people p ON r.idUser = p.idUser  
INNER JOIN 
    reserveStates rs ON r.idState = rs.id  
WHERE 
    r.idUser = ANY (
        SELECT 
            pti.idCustomers
        FROM 
            paymentTransactionInformation pti
        INNER JOIN 
            payment pmt ON pti.id = pmt.idTransaction  
        WHERE 
            pmt.totalPay > 70  
    )
ORDER BY 
    r.dateReserve DESC;  



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
