USE `Grupo-12-BDD-OO2-2020`;

-- PERSONAS:
INSERT INTO persona 
	(nombre, apellido, dni, fecha_nacimiento)
VALUES
	('Carlos', 'Carrizo', 10000001, '1990-04-30'),	-- Clientes (6)
	('Casimiro', 'Camaño', 10000002, '1990-10-26'),
	('Cecilia', 'Caballero', 10000003, '1990-06-07'),
    ('Cornelio', 'Saavedra', 10000004, '1988-03-15'),
    ('Cervantes', 'Saavedra', 10000005, '1992-12-24'),
    ('Humberto', 'Primo', 10000006, '1993-08-13'),
	('Ernesto', 'Espinoza', 20000001, '1990-04-01'),	-- Empleados (6)
	('Edmundo', 'Escobar', 20000002, '1990-04-02'),
	('Ernestina', 'Epo', 20000003, '1990-04-03'),
	('Eriberto', 'Estrada', 20000004, '1990-04-04'),
	('Eduardo', 'Espejo', 20000005, '1990-04-05'),
	('Elisa', 'Estrada', 20000006, '1990-04-06'),
	('Gaston', 'Gimenez', 30000001, '1980-03-01'),	-- Gerentes (6)
	('Gabriel', 'Gimenez', 30000002, '1980-03-02'),
	('Angela', 'Merkel', 30000003, '1980-03-03'),
    ('Luis', 'Suarez', 30000004, '1977-01-25'),
    ('Manuel', 'Lopez', 30000005, '1983-09-18'),
    ('Gustavo', 'Micheti', 30000006, '1978-05-17'),
    ('Vladimir', 'Putin', 40000001, '1970-07-04'); -- Admin

-- CLIENTES:
INSERT INTO cliente 
	(id_persona, email)
VALUES
	(1, 'cliente1@email.com'),
	(2, 'cliente2@email.com'),
	(3, 'cliente3@email.com'),
    (4, 'cliente4@email.com'),
    (5, 'cliente5@email.com'),
    (6, 'cliente6@email.com');


-- LOCAL (Los gerente_legajo se definen luego de cargar empleados)
INSERT INTO locales
	(nombre_local, latitud, longitud, direccion, telefono)
VALUES 	
	('Local 1', -34.617046, -58.433942, "Av. Local 1", 41111111),
	('Local 2', -34.608982, -58.371930, "Av. Local 2", 42222222),
	('Local 3', -34.602662, -58.383379, "Av. Local 3", 43333333),
    ('Local 4', 12.562462, 20.383379, "Av. Local 4", 44444444),
    ('Local 5', 80.715684, 51.759913, "Av. Local 5", 45555555),
    ('Local 6', 17.567432, 71.875617, "Av. Local 6", 46666666);


-- EMPLEADOS:
INSERT INTO empleado
	(id_persona, horario_desde, horario_hasta, sueldo_basico, id_local, tipo_gerente)
VALUES
	(7, '08:00:00', '16:00:00', 30000, 1, 0),	-- Empleados (legajo 1)
	(8, '16:00:00', '20:00:00', 30000, 2, 0),
	(9, '08:00:00', '16:00:00', 30000, 3, 0),
	(10, '16:00:00', '20:00:00', 30000, 4, 0),
	(11, '08:00:00', '16:00:00', 30000, 5, 0),
	(12, '16:00:00', '20:00:00', 30000, 6, 0),
	(13, '10:00:00', '18:00:00', 80000, 1, 1),	-- Gerentes (legajo 7)
	(14, '10:00:00', '18:00:00', 80000, 2, 1),
	(15, '10:00:00', '18:00:00', 80000, 3, 1),
    (16, '10:00:00', '18:00:00', 80000, 4, 1),
    (17, '10:00:00', '18:00:00', 80000, 5, 1),
    (18, '10:00:00', '18:00:00', 80000, 6, 1),
    (19, '10:00:00', '18:00:00', 150000, 1, 0);

-- Definir gerentes de locales
UPDATE locales SET gerente_legajo = 1 WHERE id_local = 1;
UPDATE locales SET gerente_legajo = 2 WHERE id_local = 2;
UPDATE locales SET gerente_legajo = 3 WHERE id_local = 3;
UPDATE locales SET gerente_legajo = 4 WHERE id_local = 4;
UPDATE locales SET gerente_legajo = 5 WHERE id_local = 5;
UPDATE locales SET gerente_legajo = 6 WHERE id_local = 6;

-- PRODUCTO
INSERT INTO producto
	(nombre, descripcion, precio, talle)
VALUES
	('producto uno', 'producto uno descripcion', 100, 1),	
	('producto dos', 'producto dos descripcion', 200, 2),
	('producto tres', 'producto tres descripcion', 300, 3),
	('producto cuatro', 'producto cuatro descripcion', 400, 1),
    	('producto cinco', 'producto cinco descripcion', 500, 4),	
	('producto seis', 'producto seis descripcion', 600, 3),
	('producto siete', 'producto siete descripcion', 700, 1),
	('producto ocho', 'producto ocho descripcion', 800, 2),
	('producto nueve', 'producto nueve descripcion', 10, 1),
	('producto diez', 'producto diez descripcion', 300, 2),
	('producto once', 'producto once descripcion', 1000, 3),
	('producto doce', 'producto doce descripcion', 450, 2),
	('producto trece', 'producto trece descripcion', 100, 4),
	('producto catorce', 'producto catorce descripcion', 600, 2);
	
    
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
	(1, 0, '2020-02-03', 0, 1, 3),
    	(7, 5, '2020-02-04', 1, 3, 1),	
	(8, 4, '2020-02-04', 1, 2, 3),	
	(15, 6, '2020-02-05', 1, 1, 2),	
	(3, 0, '2020-02-05', 0, 1, 3),
	(20, 20, '2020-03-05', 1, 4, 1),
	(20, 20, '2020-03-06', 1, 5, 1),
	(20, 20, '2020-03-06', 1, 6, 1),	
	(20, 20, '2020-06-07', 1, 7, 1),	
	(20, 20, '2020-06-07', 1, 8, 1),	
	(20, 20, '2020-06-07', 1, 9, 1),	
	(20, 18, '2020-04-08', 1, 6, 2),
	(20, 20, '2020-05-08', 1, 2, 4),	
	(20, 20, '2020-05-08', 1, 1, 4);
	
-- PEDIDO STOCK
INSERT INTO pedido_stock
	(cantidad, aceptado, solicitante_id, oferente_id, id_producto)
VALUES
	( 2, 0, 7, null, 1),
	( 5, 0, 7, null, 2),
	( 7, 0, 8, null, 7),
    ( 3, 0, 10, null, 5);


-- CHANGO
INSERT INTO chango 
	(id_local)
VALUES 
	(1),	-- local1
	(1),	-- chango 2
	(1),	
	(1),
	(2),	-- local2
	(2),
     (2),
     (2),
     (3);	-- local 3
	
-- ITEM
INSERT INTO item 
	(cantidad, id_chango, id_producto)
VALUES
	(2, 1, 1),
	(5, 1, 2),
	(3, 3, 3),
    	(3, 3, 2),
	(2, 4, 4),
    	(2, 5, 1),
    	(2, 6, 1),
    	(2, 7, 2),
    	(2, 8, 2),
    	(2, 9, 9);

-- PARA LA FACTURA DE DOS PAGINAS
INSERT INTO item 
	(cantidad, id_chango, id_producto)
VALUES
	(2, 2, 1),
	(5, 2, 2),
	(5, 2, 3),
	(3, 2, 4),
    	(3, 2, 5),
	(2, 2, 6),
	(5, 2, 7),
	(5, 2, 8),
	(3, 2, 9),
    	(3, 2, 10),
	(2, 2, 11),
	(5, 2, 12),
	(5, 2, 13),
	(3, 2, 14);
    
-- FACTURA
INSERT INTO factura 
	(fechahora_factura, coste_total, id_local, empleado_legajo, nro_cliente, id_chango)
VALUES
	('2020-05-30 13:01:00', 2200, 1, 1, 1, 1),
	('2020-06-17 13:02:00', 21580, 1, 1, 2, 2),
    ('2020-06-17 13:03:00', 800, 1, 7, 3, 3),
	('2020-06-17 13:04:00', 1500, 1, 7, 4, 4), 
    ('2020-06-17 13:05:00', 200, 2, 2, 5, 5),
	('2020-06-17 13:06:00', 200, 2, 2, 6, 6),
    ('2020-05-27 13:07:00', 400, 2, 8, 1, 7),
    ('2020-05-26 13:08:00', 400, 2, 8, 2, 8),
    ('2020-06-1 13:09:00', 20, 3, 3, 3, 9);

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
	(9, 'gerente3@admin.com', '$2a$04$9CW3bFRuXHd8OL5qszw0zejxAMYIYeCNzzXTKXudHVjceyKIxDuv2', 'gerente3'),
    (10, 'gerente4@admin.com', '$2a$08$BFQ5a8SinZUvyDIAEAKlWezbn51SM1UmuVsXpphQIEIL/8rwBrINK', 'gerente4'),
    (11, 'gerente5@admin.com', '$2a$08$ICxjiMaKObhnfHUUEKsIwOBd0dDJV6t9SmoOBE56aTAdpkY/nLPIW', 'gerente5'),
    (12, 'gerente6@admin.com', '$2a$08$8cSy/583wKmwkJadGlFU7uVZIEXLQoJQFubzj3QJdCQ5w4hZeK9hu', 'gerente6'),
    (13, 'admin1@admin.com', '$2a$08$y6ZQjforP7FE5jngr7Y2jOtBwIEYjd/qZmI7m.WoiY4nKb1TEHy3a', 'admin1');
    

INSERT INTO `user_role` (user_id, role) VALUES ('1', 'EMPLEADO');
INSERT INTO `user_role` (user_id, role) VALUES ('2', 'EMPLEADO');
INSERT INTO `user_role` (user_id, role) VALUES ('3', 'EMPLEADO');
INSERT INTO `user_role` (user_id, role) VALUES ('4', 'EMPLEADO');
INSERT INTO `user_role` (user_id, role) VALUES ('5', 'EMPLEADO');
INSERT INTO `user_role` (user_id, role) VALUES ('6', 'EMPLEADO');
INSERT INTO `user_role` (user_id, role) VALUES ('7', 'GERENTE');
INSERT INTO `user_role` (user_id, role) VALUES ('8', 'GERENTE');
INSERT INTO `user_role` (user_id, role) VALUES ('9', 'GERENTE');
INSERT INTO `user_role` (user_id, role) VALUES ('10', 'GERENTE');
INSERT INTO `user_role` (user_id, role) VALUES ('11', 'GERENTE');
INSERT INTO `user_role` (user_id, role) VALUES ('12', 'GERENTE');
INSERT INTO `user_role` (user_id, role) VALUES ('13', 'ADMIN');
