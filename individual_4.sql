/* 	Desarrollo preguntas
	¿Qué DDL?
El lenguaje de definición de datos (en inglés Data Definition Language, o DDL), es el que se encarga de la modificación de la estructura de 
los objetos de la base de datos. Incluye órdenes para modificar, borrar o definir las tablas en las que se almacenan las bases de datos.
	¿Cuándo se puede anular una acción DDL?
Se debe tener en cuenta que ninguna instrucción DDL puede ser anulada por una instrucción ROLLBACK por lo que hay que tener mucha precaución a 
la hora de utilizarlas. Es decir, las instrucciones DDL generan acciones que no se pueden deshacer. Salvo que se disponga de alguna copia de 
seguridad o de otros elementos de recuperación.
	¿Cuando se utilizan comillas dobles en la creación de una tabla?
En la creación de tablas, en el caso de que el nombre tenga espacios en blanco o caracteres nacionales (permitido solo en algunas bases de datos), 
entonces se suele entrecomillar con comillas dobles. En el estándar SQL se pueden utilizar comillas dobles al poner el nombre de la tabla a fin de 
hacerla sensible a las mayúsculas (se diferenciará entre “FACTURAS” y “Facturas”).
*/
CREATE DATABASE actividad;
USE actividad;
CREATE TABLE usuarios (
id_usuario INT AUTO_INCREMENT PRIMARY KEY, 
nombre VARCHAR(20),
apellido VARCHAR(20),
contrasena VARCHAR(10),
zona_horaria VARCHAR(15) DEFAULT '-03:00',
genero VARCHAR(1),
telefono VARCHAR(15)
);
-- delimitador para registrar hora con determinada zona horaria en tabla ultimo_ingreo (es necesario crear la tabla y luego ejecutar el trigger)
DELIMITER //
CREATE TRIGGER set_ult_ingreso_default
BEFORE INSERT ON ultimo_ingreso
FOR EACH ROW
BEGIN
    SET NEW.ult_ingreso = CONVERT_TZ(NOW(), '+00:00', '-03:00');
END//
DELIMITER ;
CREATE TABLE ultimo_ingreso (
id_ingreso VARCHAR(15) PRIMARY KEY,
id_usuario INT, 
ult_ingreso TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario)
);
CREATE TABLE cantidad_visitas (
id_usuario INT PRIMARY KEY,
visitas INT,
FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario)
);
INSERT INTO usuarios (nombre, apellido, contrasena, genero, telefono)
VALUES 
('Juan', 'Perez', '123456', 'M', '123456789'),
('María', 'González', 'abcdef', 'F', '987654321'),
('Pedro', 'Rodríguez', 'qwerty', 'M', '555555555'),
('Ana', 'Martínez', 'abc123', 'F', '111111111'),
('Carlos', 'López', 'password', 'M', '222222222'),
('Laura', 'Díaz', 'secret', 'F', '333333333'),
('Luis', 'Sánchez', 'p@ssw0rd', 'M', '444444444'),
('Sofía', 'Hernández', 'admin', 'F', '666666666');
INSERT INTO ultimo_ingreso (id_ingreso, id_usuario)
VALUES 
('1', 1),
('2', 2),
('3', 3),
('4', 4),
('5', 5),
('6', 6),
('7', 7),
('8', 8);
INSERT INTO cantidad_visitas (id_usuario, visitas)
VALUES 
(1, 10),
(2, 20),
(3, 30),
(4, 40),
(5, 50),
(6, 60),
(7, 70),
(8, 80);
-- verificar registros en tablas
SELECT * FROM usuarios;
SELECT * FROM ultimo_ingreso;
SELECT * FROM cantidad_visitas;
SHOW TRIGGERS;
-- borrar una de las tablas
DROP TABLE cantidad_visitas;





