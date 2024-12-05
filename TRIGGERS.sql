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

-- TIEMPO MÁXIMO 60 DÍAS DE PRÉSTAMO DE UN LIBRO

DELIMITER //
CREATE OR REPLACE TRIGGER tMaximo60diasPrestamo
BEFORE INSERT ON prestamos
FOR EACH ROW

BEGIN
	IF DATEDIFF(NEW.fechaDevolucion, NEW.fechaPrestamo) > 60 THEN
	    SIGNAL SQLSTATE '45000'
	    SET MESSAGE_TEXT = 'Un libro solo puede estar prestado hasta 60 días';
   END IF;
END //

-- TIEMPO MÁXIMO 15 DÍAS DE PAGAR LA MULTA

DELIMITER //
CREATE OR REPLACE TRIGGER tMaximo15diasMulta
BEFORE INSERT ON multas
FOR EACH ROW
BEGIN




DELIMITER ;

