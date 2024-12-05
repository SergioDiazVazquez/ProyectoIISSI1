-- Insertar datos en la tabla Usuarios
INSERT INTO Usuarios (email, contraseña, nombre) VALUES
('sergio@gmail.com', 'sergio123', 'Sergio'),
('ricardo@gmail.com', 'ricardo123', 'Ricky'),
('enrique@gmail.com', 'enrreservasique123', 'Enrique'),
('guillermo@hotmail.com', 'guillermorexulon123', 'Guille');


-- Insertar datos en la tabla Generos
INSERT INTO Generos (tipoGenero) VALUES
('Drama'),
('Fantasía'),
('Ficción'),
('Terror'),
('Comedia');

-- Insertar datos en la tabla Libros
INSERT INTO Libros (titulo, autor, añoPublicación, estadoLibro) VALUES
('El Principito', 'Antoine de Saint-Exupéry', 1943, 'Prestado'),
('El señor de los anillos', 'J.R.R.Tolkien', 1954, 'Reservado'),
('El lobo estepario', 'Hermann Hesse', 1927, 'Disponible'),
('It', 'Stephen King', 1986, 'Reservado');

-- Insertar datos en la tabla Reservas
INSERT INTO Reservas (id_Usuario, id_Libro, fechaInicio, fechaFin) VALUES
(1, 4, '2024-11-28', '2024-12-01'),
(2, 2, '2024-10-17', '2024-10-20');

-- Insertar datos en la tabla LibroGeneros
INSERT INTO LibroGeneros (id_Libro, id_Genero) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4);

-- Insertar datos en la tabla Prestamos
INSERT INTO Prestamos (id_Usuario, id_Libro, fechaPrestamo, fechaDevolucion, esDevuelto) VALUES
(3, 1, '2024-11-28', '2025-01-28', 0),
(2, 4, '2023-09-18', '2023-12-18', 1),
(1, 2, '2022-01-03', '2022-03-01', 1);

-- Insertar datos en la tabla Multas
INSERT INTO multas (id_Usuario, Monto, fechaLimite, esPagada) VALUES
(2, 15, ' 2023-12-02', 1);


-- Insertar datos en la tabla Multas
INSERT INTO Pagos (id_Multa, importe, fecha) VALUES
(1, 15.00, ' 2023-12-01');



