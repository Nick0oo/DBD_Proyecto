-- 1. Inserción en la tabla type_document (Tipos de documentos)
INSERT INTO type_document (`name`) VALUES
('CC'),  -- Cédula de Ciudadanía
('TI');  -- Tarjeta de Identidad

-- 2. Inserción en la tabla roles (Roles de usuarios)
INSERT INTO roles (`name`) VALUES
('Administrador'),
('Empleado'),
('Cliente');

-- 3. Inserción en la tabla users (Usuarios)
INSERT INTO users (`name`, email, `password`) VALUES
('Carlos Pérez', 'carlosperez@ejemplo.com', 'clave123'),
('María Gómez', 'mariagomez@ejemplo.com', 'contraseña456');

-- 4. Inserción en la tabla people (Personas asociadas a usuarios)
INSERT INTO people (`name`, lastName, phone, birthday, document, idTypeDocument, idUser) VALUES
('Carlos', 'Pérez', '3001234567', '2000-03-20', 1020304050, 1, 1), -- Usuario Carlos con CC
('María', 'Gómez', '3109876543', '1999-08-15', 1122334455, 1, 2); -- Usuario María con CC

-- 5. Inserción en la tabla usersRoles (Asignación de roles a usuarios)
INSERT INTO usersRoles (idPeople, idRole) VALUES
(1, 2),  -- Carlos es Administrador
(2, 3);  -- María es Cliente

-- 6. Inserción en la tabla productCategories (Categorías de productos)
INSERT INTO productCategories (`name`) VALUES
('Cancha Futbol'),
('Cancha Voley');

-- 7. Inserción en la tabla products (Productos)
INSERT INTO products (`name`, details, price, idProductCategory) VALUES
('Cancha futbol 5', 'cancha futbol 5 duracion de 1 hora y tamaño x-y', 75000, 1),
('Cancha futbol 7', 'cancha futbol 7 duracion de 1 hora y tamaño x-y', 90000, 1),
('Cancha VoleyBall', 'cancha voleyball con superficie de arena, duracion de 1 hora ', 60000, 2);

-- 8. Inserción en la tabla reserveStates (Estados de reserva)
INSERT INTO reserveStates (`name`) VALUES
('Pendiente'),
('Confirmada'),
('Cancelada');

-- 9. Inserción en la tabla reserves (Reservas de canchas o instalaciones)
INSERT INTO reserves (idState, `time`, dateReserve, idUser, created_by, updated_by) VALUES
(1, '08:00:00', '2024-10-15', 1, 1, 1),  -- Carlos reserva una cancha
(2, '10:00:00', '2024-10-16', 2, 2, 2);  -- María reserva una cancha

-- 10. Inserción en la tabla paymentMethods (Métodos de pago)
INSERT INTO paymentMethods (`name`) VALUES
('Tarjeta'),
('Efectivo'),
('nequi');

-- 11. Inserción en la tabla discount (Descuentos aplicados)
INSERT INTO discount (total) VALUES
(15), 
(100);

-- 12. Inserción en la tabla payment (Pagos realizados)
INSERT INTO payment (idmethod, date_pay, totalPaid, idDiscount, idReserve, created_by, updated_by) VALUES
(1, '2024-10-15', 76500, 1, 1, 1, 1),  -- Carlos paga con tarjeta y obtiene un descuento
(2, '2024-10-16', 60000, NULL, 2, 2, 2); -- María paga en efectivo sin descuento

-- 13. Inserción en la tabla reserveProducts (Productos adquiridos junto a la reserva)
INSERT INTO reserveProducts (idReserve, idProduct, quantity) VALUES
(1, 1, 2), 
(2, 3, 1); 
