-- Crear un usuario en la base de datos
 CREATE USER 'EstebanPantoja'@'localhost' IDENTIFIED BY '1006431158';
CREATE USER 'NicolasSalas'@'localhost' IDENTIFIED BY '1030080259';
		-- Crear un rol de solo lectura
 CREATE ROLE 'Lector';
		-- Crear un rol de administrador
CREATE ROLE 'Admin';

		-- Asignar el rol de solo lectura al usuario cliente_lector
GRANT 'Lector' TO 'Nicolas Salas'@'localhost';

		-- Asignar el rol de administrador al usuario admin_user
 GRANT 'Admin' TO 'Esteban Pantoja'@'localhost';

		-- Asignar permisos de lectura (SELECT) al rol 'Lector' sobre la tabla 'users'
GRANT SELECT ON users TO 'Lector';
		-- Asignar permisos completos al rol 'admin' sobre la tabla 'users'
GRANT SELECT, INSERT, UPDATE, DELETE ON users TO 'Admin';