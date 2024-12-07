-- MÁXIMO DOS LIBROS EN PRÉSTAMO POR USUARIO

DELIMITER //

CREATE OR REPLACE TRIGGER tMaximoDosLibros
BEFORE INSERT ON prestamos 
FOR EACH ROW
BEGIN
	DECLARE cantidad_prestamos INT;
	SELECT COUNT(*) INTO cantidad_prestamos
	FROM prestamos 
	WHERE id_Usuario = NEW.id_Usuario
		AND esDevuelto = 0;

	IF cantidad_prestamos > 2 THEN
		SIGNAL SQLSTATE '45000'
      SET MESSAGE_TEXT = 'Un usuario no puede tener más de dos libros en préstamo.';
   END IF;
END //

DELIMITER 
;

--  Inhabilitación de préstamos por impago por retraso

DELIMITER //

CREATE OR REPLACE TRIGGER tInhabilitacionPrestamos
BEFORE INSERT ON prestamos
FOR EACH ROW
BEGIN
	DECLARE multas_pendientes INT;
	SELECT COUNT(*) INTO multas_pendientes
	FROM multas
	WHERE id_Usuario = NEW.id_usuario
		AND multas.esPagada = 0;
		
	IF multas_pendientes > 0 THEN
		SIGNAL SQLSTATE '45000'
      SET MESSAGE_TEXT = 'Un usuario no puede tener más de dos libros en préstamo.';
   END IF;
END //

DELIMITER
;

-- Renovación limitada de préstamos

DELIMITER //

CREATE OR REPLACE TRIGGER tRenovacionLimitada
BEFORE INSERT ON prestamos
FOR EACH ROW
BEGIN
	DECLARE ultimaFechaDevolucion DATE;
	SELECT MAX(prestamos.fechaDevolucion) INTO fecha
	FROM prestamos
	WHERE id_Usuario = NEW.id_Usuario
		AND id_Libro = NEW.id_Libro
		AND esDevuelto = 1;
	IF ultimaFechaDevolucion = CURDATE() THEN
		SIGNAL SQLSTATE '45000'
      SET MESSAGE_TEXT = 'No puedes volver a tomar prestado el mismo libro';
   END IF;
		
END //

DELIMITER
;


