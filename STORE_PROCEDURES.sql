-- PENALIZACIÓN POR RETRASO

DELIMITER //
CREATE OR REPLACE PROCEDURE pInsertarMulta (m INT, u INT, monto INT,f DATE, p BOOL)
BEGIN
	DECLARE fecha DATE;
	SELECT fechaDevolucion 
	FROM prestamos
	WHERE id_Usuario = u ;
	IF fecha < CURDATE() THEN
		SET p = 0;
		INSERT INTO multas (id_Usuario, Monto, fechaLimite, esPagada)
		VALUES(m, u, monto, f, p);
	END IF;
END //
DELIMITER ;