use proyecto;
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
('María Gómez', 'mariagomez@ejemplo.com', 'contraseña456'),
('Juan López', 'juanlopez@ejemplo.com', 'password789'),
('Ana Torres', 'anatorres@ejemplo.com', 'anaT_pass'),
('Pedro Sánchez', 'pedrosanchez@ejemplo.com', 'pedro_987'),
('Lucía Fernández', 'luciafernandez@ejemplo.com', 'luciaF_pass123'),
('Luis Martínez', 'luismartinez@ejemplo.com', 'luisM_secure'),
('Sofía Castro', 'sofiacastro@ejemplo.com', 'sofia_C123'),
('Miguel Reyes', 'miguelreyes@ejemplo.com', 'miguel_r_pass'),
('Elena Morales', 'elenamorales@ejemplo.com', 'elenaM_pass');

-- 4. Inserción en la tabla people (Personas asociadas a usuarios)
INSERT INTO people (`name`, lastName, phone, birthday, document, idTypeDocument, idUser) VALUES
('Carlos', 'Pérez', '3001234567', '2000-03-20', 1020304050, 1, 1),
('María', 'Gómez', '3109876543', '1999-08-15', 1122334455, 1, 2), -- María con CC
('Juan', 'López', '3204567890', '1998-12-10', 223344556, 1, 3), -- Juan con CC
('Ana', 'Torres', '3006543210', '2001-05-25', 334455667, 1, 4), -- Ana con CC
('Pedro', 'Sánchez', '3101122334', '1997-11-30', 445566788, 1, 5), -- Pedro con CC
('Lucía', 'Fernández', '3207788990', '1999-06-10', 556778899, 1, 6), -- Lucía con CC
('Luis', 'Martínez', '3009988776', '1995-09-12', 667789900, 1, 7), -- Luis con CC
('Sofía', 'Castro', '3107766554', '2002-07-18', 778990011, 1, 8), -- Sofía con CC
('Miguel', 'Reyes', '3203344556', '2000-01-22', 899001122, 1, 9), -- Miguel con CC
('Elena', 'Morales', '3005544332', '2001-03-05', 900112233, 1, 10); -- Elena con CC
-- 5. Inserción en la tabla usersRoles (Asignación de roles a usuarios)
INSERT INTO usersRoles (idUser, idRole) VALUES
(1, 2),  -- Carlos es Administrador
(2, 3),  -- María es Cliente
(3, 3),  -- Juan es Cliente
(4, 3),  -- Ana es Cliente
(5, 2),  -- Pedro es Administrador
(6, 3),  -- Lucía es Cliente
(7, 2),  -- Luis es Administrador
(8, 3),  -- Sofía es Cliente
(9, 3),  -- Miguel es Cliente
(10, 2);  -- Elena es Administradora

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
(2, '10:00:00', '2024-10-16', 2, 2, 2),  -- María reserva una cancha
(1, '09:00:00', '2024-10-17', 3, 3, 1),  -- Juan reserva
(3, '11:00:00', '2024-10-18', 4, 4, 2),  -- Ana reserva
(2, '12:00:00', '2024-10-19', 5, 5, 1),  -- Pedro reserva
(2, '13:00:00', '2024-10-20', 6, 6, 2),  -- Lucía reserva
(2, '14:00:00', '2024-10-21', 7, 7, 1),  -- Luis reserva
(2, '15:00:00', '2024-10-22', 8, 8, 2),  -- Sofía reserva
(2, '16:00:00', '2024-10-23', 9, 9, 1),  -- Miguel reserva
(1, '17:00:00', '2024-10-24', 10, 10, 2),  -- Elena reserva
(1, '08:00:00', '2024-10-25', 1, 2, 1),  -- Carlos reserva de nuevo
(2, '09:00:00', '2024-10-26', 2, 3, 2),  -- María reserva de nuevo
(3, '10:00:00', '2024-10-27', 3, 4, 1),  -- Juan reserva de nuevo
(2, '11:00:00', '2024-10-28', 4, 5, 2),  -- Ana reserva de nuevo
(2, '12:00:00', '2024-10-29', 5, 6, 1),  -- Pedro reserva de nuevo
(1, '13:00:00', '2024-10-30', 6, 7, 2),  -- Lucía reserva de nuevo
(1, '14:00:00', '2024-11-01', 7, 8, 1),  -- Luis reserva de nuevo
(1, '15:00:00', '2024-11-02', 8, 9, 2),  -- Sofía reserva de nuevo
(1, '16:00:00', '2024-11-03', 9, 10, 1),  -- Miguel reserva de nuevo
(2, '17:00:00', '2024-11-04', 10, 1, 2);  -- Elena reserva de nuevo

-- 10. Inserción en la tabla paymentMethods (Métodos de pago)
INSERT INTO paymentMethods (`name`) VALUES
('Tarjeta'),
('Efectivo'),
('Transferencia bancaria');

-- 11. Inserción en la tabla discount (Descuentos aplicados)
INSERT INTO discount (total) VALUES
(15), 
(100);

-- 12. Inserción en la tabla payment (Pagos realizados)
INSERT INTO payment (idmethod, date_pay, totalPaid, idDiscount, idReserve, created_by, updated_by) VALUES
(1, '2024-10-15', 75000, 1, 1, 1, 1),  -- Carlos paga con tarjeta y obtiene un descuento por la cancha de fútbol 5
(2, '2024-10-16', 60000, NULL, 2, 2, 2),  -- María paga en efectivo sin descuento por la cancha de voleibol
(1, '2024-10-17', 75000, 1, 3, 3, 3),  -- Juan paga con tarjeta y obtiene un descuento por la cancha de fútbol 5
(2, '2024-10-18', 60000, NULL, 4, 4, 4),  -- Ana paga en efectivo sin descuento por la cancha de voleibol
(3, '2024-10-19', 90000, 2, 5, 5, 5),  -- Pedro paga por transferencia bancaria con un descuento por la cancha de fútbol 7
(1, '2024-10-20', 75000, 1, 6, 6, 6),  -- Lucía paga con tarjeta y obtiene un descuento por la cancha de fútbol 5
(2, '2024-10-21', 60000, NULL, 7, 7, 7),  -- Luis paga en efectivo sin descuento por la cancha de voleibol
(3, '2024-10-22', 85000, 1, 8, 8, 8),  -- Sofía paga por transferencia bancaria con descuento por la cancha de fútbol 7
(1, '2024-10-23', 75000, 1, 9, 9, 9),  -- Miguel paga con tarjeta y obtiene un descuento por la cancha de fútbol 5
(2, '2024-10-24', 60000, NULL, 10, 10, 10),  -- Elena paga en efectivo sin descuento por la cancha de voleibol
(1, '2024-10-25', 75000, 1, 1, 1, 1),  -- Carlos paga nuevamente con tarjeta y obtiene descuento por la cancha de fútbol 5
(2, '2024-10-26', 60000, NULL, 2, 2, 2),  -- María paga de nuevo en efectivo sin descuento por la cancha de voleibol
(1, '2024-10-27', 75000, 1, 3, 3, 3),  -- Juan paga con tarjeta y obtiene descuento por la cancha de fútbol 5
(2, '2024-10-28', 60000, NULL, 4, 4, 4),  -- Ana paga en efectivo sin descuento por la cancha de voleibol
(3, '2024-10-29', 90000, 2, 5, 5, 5),  -- Pedro paga por transferencia con descuento por la cancha de fútbol 7
(1, '2024-10-30', 75000, 1, 6, 6, 6),  -- Lucía paga con tarjeta y obtiene descuento por la cancha de fútbol 5
(2, '2024-11-01', 60000, NULL, 7, 7, 7),  -- Luis paga en efectivo sin descuento por la cancha de voleibol
(3, '2024-11-02', 85000, 1, 8, 8, 8),  -- Sofía paga por transferencia con descuento por la cancha de fútbol 7
(1, '2024-11-03', 78000, 1, 19, 9, 9),  -- Miguel paga con tarjeta y obtiene descuento por la cancha de fútbol 5 (ajustado)
(2, '2024-11-04', 70000, NULL, 20, 10, 10);  -- Elena paga en efectivo sin descuento por la cancha de fútbol 7 (ajustado)

-- 13. Inserción en la tabla reserveProducts (Productos adquiridos junto a la reserva)
INSERT INTO reserveProducts (idReserve, idProduct, quantity) VALUES
(1, 1, 2),  -- Reserva 1: 2 Canchas de Fútbol 5
(2, 3, 1),  -- Reserva 2: 1 Cancha de Voleibol
(3, 1, 1),  -- Reserva 3: 1 Cancha de Fútbol 5
(4, 2, 1),  -- Reserva 4: 1 Cancha de Fútbol 7
(5, 1, 1),  -- Reserva 5: 1 Cancha de Fútbol 5
(6, 2, 2),  -- Reserva 6: 2 Canchas de Fútbol 7
(7, 3, 1),  -- Reserva 7: 1 Cancha de Voleibol
(8, 1, 1),  -- Reserva 8: 1 Cancha de Fútbol 5
(9, 2, 1),  -- Reserva 9: 1 Cancha de Fútbol 7
(10, 3, 1), -- Reserva 10: 1 Cancha de Voleibol
(11, 1, 2), -- Reserva 11: 2 Canchas de Fútbol 5
(12, 2, 1), -- Reserva 12: 1 Cancha de Fútbol 7
(13, 1, 1), -- Reserva 13: 1 Cancha de Fútbol 5
(14, 3, 1), -- Reserva 14: 1 Cancha de Voleibol
(15, 2, 2), -- Reserva 15: 2 Canchas de Fútbol 7
(16, 1, 1), -- Reserva 16: 1 Cancha de Fútbol 5
(17, 2, 1), -- Reserva 17: 1 Cancha de Fútbol 7
(18, 3, 1), -- Reserva 18: 1 Cancha de Voleibol
(19, 1, 1), -- Reserva 19: 1 Cancha de Fútbol 5
(20, 2, 1); -- Reserva 20: 1 Cancha de Fútbol 7