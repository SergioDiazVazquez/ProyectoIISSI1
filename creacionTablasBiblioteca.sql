-- Eliminación de tablas en el orden correcto para evitar conflictos por dependencias
DROP TABLE IF EXISTS Pagos;
DROP TABLE IF EXISTS Multas;
DROP TABLE IF EXISTS Prestamos;
DROP TABLE IF EXISTS LibroGeneros;
DROP TABLE IF EXISTS Reservas;
DROP TABLE IF EXISTS Libros;
DROP TABLE IF EXISTS Generos;
DROP TABLE IF EXISTS Usuarios;

CREATE TABLE Usuarios (
    id_Usuario INT PRIMARY KEY AUTO_INCREMENT,
    email VARCHAR(255) UNIQUE NOT NULL,
    contraseña VARCHAR(255) NOT NULL CHECK (CHAR_LENGTH(contraseña) >= 8),
    nombre VARCHAR(255) NOT NULL
);

CREATE TABLE Generos (
    id_Genero INT PRIMARY KEY AUTO_INCREMENT,
    tipoGenero VARCHAR(255) NOT NULL
);

CREATE TABLE Libros (
    id_Libro INT PRIMARY KEY AUTO_INCREMENT,
    titulo VARCHAR(255) NOT NULL,
    autor VARCHAR(255) NOT NULL,
    añoPublicación INT NOT NULL,
    estadoLibro ENUM('Prestado','Disponible','Reservado')
);

CREATE TABLE Reservas (
    id_Reserva INT PRIMARY KEY AUTO_INCREMENT,
    id_Usuario INT NOT NULL,
    id_Libro INT NOT NULL,
    fechaInicio DATE NOT NULL,
    fechaFin DATE NOT NULL,
    FOREIGN KEY (id_Usuario) REFERENCES Usuarios(id_Usuario),
    FOREIGN KEY (id_Libro) REFERENCES libros(id_Libro)
);

CREATE TABLE LibroGeneros (
    id_LibroGenero INT PRIMARY KEY AUTO_INCREMENT,
    id_Libro INT NOT NULL,
    id_Genero INT NOT NULL,
    FOREIGN KEY (id_Genero) REFERENCES Generos(id_Genero),
    FOREIGN KEY (id_Libro) REFERENCES Libros(id_Libro),
    UNIQUE(id_Genero, id_Libro)
);

CREATE TABLE Prestamos (
    id_Prestamo INT PRIMARY KEY AUTO_INCREMENT,
    id_Usuario INT NOT NULL,
    id_Libro INT NOT NULL,
    fechaPrestamo DATE NOT NULL,
    fechaDevolucion DATE NOT NULL,
    esDevuelto BOOL NOT NULL,
    FOREIGN KEY (id_Usuario) REFERENCES Usuarios(id_Usuario),
    FOREIGN KEY (id_Libro) REFERENCES Libros(id_Libro)
);

CREATE TABLE Multas (
    id_Multa INT PRIMARY KEY AUTO_INCREMENT,
    id_Usuario INT NOT NULL,
    monto FLOAT NOT NULL,
    fechaLimite DATE NOT NULL,
    esPagada BOOL NOT NULL,
    FOREIGN KEY (id_Usuario) REFERENCES Usuarios(id_Usuario)
);

CREATE TABLE Pagos (
    id_Pagos INT PRIMARY KEY AUTO_INCREMENT,
    id_Multa INT NOT NULL,
    importe FLOAT NOT NULL,
    fecha DATE,
    FOREIGN KEY (id_Multa) REFERENCES Multas(id_Multa)
);valoracionesvaloraciones