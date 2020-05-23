USE `Grupo-12-BDD-OO2-2020`;

-- PERSONAS:
INSERT INTO persona 
	(nombre, apellido, dni, fecha_nacimiento)
VALUES
	('Carlos', 'Carrizo', 10000001, '1990-01-01'),	-- Clientes (3)
	('Casimiro', 'Camaño', 10000002, '1990-01-01'),
	('Cecilia', 'Caballero', 10000003, '1990-01-01'),
	('Ernesto', 'Espinoza', 20000001, '1990-04-01'),	-- Empleados (6)
	('Edmundo', 'Escobar', 20000002, '1990-04-02'),
	('Ernestina', 'Epo', 20000003, '1990-04-03'),
	('Eriberto', 'Estrada', 20000004, '1990-04-04'),
	('Eduardo', 'Espejo', 20000005, '1990-04-05'),
	('Elisa', 'Estrada', 20000006, '1990-04-06'),
	('Gaston', 'Gimenez', 30000001, '1980-03-01'),	-- Gerentes (3)
	('Gabriel', 'Gimenez', 30000002, '1980-03-02'),
	('Graciela', 'Garcia', 30000003, '1980-03-03');

-- CLIENTES:
INSERT INTO cliente 
	(id_persona, email)
VALUES
	(1, 'cliente1@email.com'),
	(2, 'cliente2@email.com'),
	(3, 'cliente3@email.com');

-- LOCAL (Los gerente_legajo se definen luego de cargar empleados)
INSERT INTO locales
	(nombre_local, latitud, longitud, direccion, telefono)
VALUES 	
	('Local 1', -34.617046, -58.433942, "Av. Local 1", 41111111),
	('Local 2', -34.608982, -58.371930, "Av. Local 2", 42222222),
	('Local 3', -34.602662, -58.383379, "Av. Local 3", 43333333);

-- EMPLEADOS:
INSERT INTO empleado
	(id_persona, horario_desde, horario_hasta, sueldo_basico, id_local, tipo_gerente)
VALUES
	(4, '08:00:00', '16:00:00', 30000, 1, 0),	-- Empleados
	(5, '16:00:00', '20:00:00', 30000, 1, 0),
	(6, '08:00:00', '16:00:00', 30000, 2, 0),
	(7, '16:00:00', '20:00:00', 30000, 2, 0),
	(8, '08:00:00', '16:00:00', 30000, 3, 0),
	(9, '16:00:00', '20:00:00', 30000, 3, 0),
	(10, '10:00:00', '18:00:00', 80000, 1, 1),	-- Gerentes
	(11, '10:00:00', '18:00:00', 80000, 2, 1),
	(12, '10:00:00', '18:00:00', 80000, 3, 1);

-- Definir gerentes de locales
UPDATE locales SET gerente_legajo = 1 WHERE id_local = 1;
UPDATE locales SET gerente_legajo = 2 WHERE id_local = 2;
UPDATE locales SET gerente_legajo = 3 WHERE id_local = 3;

-- PRODUCTO
INSERT INTO producto
	(nombre, descripcion, precio, talle)
VALUES
	('producto uno', 'producto uno descripcion', 100, 1),	
	('producto dos', 'producto dos descripcion', 200, 2),
	('producto tres', 'producto tres descripcion', 300, 3),
	('producto cuatro', 'producto cuatro descripcion', 400, 1);
	
-- LOTE
INSERT INTO lote 
	(cantidad_inicial, cantidad_actual, fecha_ingreso, activo, id_producto, id_local)
VALUES
	(10, 8, '2020-01-01', 1, 1, 1),	
	(10, 5, '2020-01-01', 1, 2, 1),	
	(5, 5, '2020-01-01', 1, 1, 2),	
	(1, 1, '2020-01-01', 1, 1, 3),
	(10, 10, '2020-02-02', 1, 3, 1),	
	(12, 0, '2020-02-02', 0, 2, 3),	
	(5, 1, '2020-02-03', 1, 1, 2),	
	(1, 0, '2020-02-03', 0, 1, 3);	
	
-- PEDIDO STOCK
INSERT INTO pedido_stock
	(cantidad, aceptado, solicitante_legajo, oferente_legajo, id_producto)
VALUES
	( 2, 1, 4, null, 1),
	( 5, 1, 4, null, 2);	

-- CHANGO
INSERT INTO chango 
	(id_local)
VALUES 
	(3),	
	(3);	
	
-- ITEM
INSERT INTO item 
	(cantidad, id_chango, id_producto)
VALUES
	(2, 1, 1),	
	(5, 2, 2);	
	
-- FACTURA
INSERT INTO factura 
	(fecha_factura, coste_total, id_local, empleado_legajo, nro_cliente, id_chango)
VALUES
	('2020-01-30', 200, 3, 8, 1, 1),
	('2020-01-31', 1000, 3, 9, 2, 2);

-- USUARIOS Y ROLES
INSERT INTO `user`
	(empleado_legajo, email, password, username)
VALUES 
	(1, 'empleado1@email.com', '$2a$04$sQsVRjZlaKTC93hXNbQN4.tN.Zv2MSiGQ7wgQLLz8dppeLW1bj7AK', 'empleado1'),
	(2, 'empleado2@email.com', '$2a$04$nH0668HrSZcgT00qbczC.Os0vT0DOLvcmmvDhrFDCt.DGByMGlv9C', 'empleado2'),
	(3, 'empleado3@email.com', '$2a$04$Co8Q8AadIEVDFdaDizjtsuHGGVFmWgIWK4cFK8MJOMjzV4C8ZFBam', 'empleado3'),
	(4, 'empleado4@email.com', '$2a$04$e9Gr0kj88by6p72LsdLw6Oj2yWSr8qQq6tqY6B3c55lQY9aiQVxaC', 'empleado4'),
	(5, 'empleado5@email.com', '$2a$04$xbQ5sosNfrtcrG6zMQnwRuNGNLyS9x1Fdo35xmuh63szoOFbGtjNC', 'empleado5'),
	(6, 'empleado6@email.com', '$2a$04$RDzik0PX9JzDyIV/T8I0aO9szIJ2pRGHT7YW9ReEb6QmiKrMQ7K/G', 'empleado6'),
	(7, 'gerente1@admin.com', '$2a$04$zZOGoK8FTWSWoIExeppysOQGN/12JBKVsfVORvdetGTWm/.UNn5li', 'gerente1'),
	(8, 'gerente2@admin.com', '$2a$04$qFAWDaf8.ktsAdEp2qHF.eZ31SGdSagROxQkeXjaRPaWJfffeVJ7y', 'gerente2'),
	(9, 'gerente3@admin.com', '$2a$04$9CW3bFRuXHd8OL5qszw0zejxAMYIYeCNzzXTKXudHVjceyKIxDuv2', 'gerente3');

INSERT INTO `role` (`descripcion`, `nombre`) VALUES ('ROLE_ADMIN', 'ADMIN');
INSERT INTO `role` (`descripcion`, `nombre`) VALUES ('ROLE_USER', 'USER');
INSERT INTO `role` (`descripcion`, `nombre`) VALUES ('ROLE_GERENTE', 'GERENTE');
INSERT INTO `role` (`descripcion`, `nombre`) VALUES ('ROLE_EMPLEADO', 'EMPLEADO');

INSERT INTO `user_roles` (`user_id`, `role_id`) VALUES ('1', '4');
INSERT INTO `user_roles` (`user_id`, `role_id`) VALUES ('2', '4');
INSERT INTO `user_roles` (`user_id`, `role_id`) VALUES ('3', '4');
INSERT INTO `user_roles` (`user_id`, `role_id`) VALUES ('4', '4');
INSERT INTO `user_roles` (`user_id`, `role_id`) VALUES ('5', '4');
INSERT INTO `user_roles` (`user_id`, `role_id`) VALUES ('6', '4');
INSERT INTO `user_roles` (`user_id`, `role_id`) VALUES ('7', '3');
INSERT INTO `user_roles` (`user_id`, `role_id`) VALUES ('8', '3');
INSERT INTO `user_roles` (`user_id`, `role_id`) VALUES ('9', '3');
