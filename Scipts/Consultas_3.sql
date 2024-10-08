use proyecto;
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















