-- BASE DE DATOS - FASTVITAE
DROP DATABASE IF EXISTS fastvitae;

CREATE DATABASE fastvitae;

USE fastvitae;

CREATE TABLE Usuario (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL,
    email VARCHAR(150) NOT NULL,
    contraseña VARCHAR(255) NOT NULL,
    rol ENUM('usuario','admin') DEFAULT 'usuario',
    fecha_registro TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE Plantilla (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL,
    descripcion TEXT,
    ruta_previsualizacion VARCHAR(255) NOT NULL
);

CREATE TABLE Perfiles (
    id INT PRIMARY KEY AUTO_INCREMENT,
    usuario_id INT NOT NULL,
    nombre_perfil VARCHAR(100) NOT NULL,
    educación TEXT,
    experiencia TEXT,
    habilidades TEXT,
    idiomas TEXT,
    proyectos TEXT,
    FOREIGN KEY (usuario_id) REFERENCES Usuario(id)
);

CREATE TABLE Curriculum (
    id INT PRIMARY KEY AUTO_INCREMENT,
    usuario_id INT NOT NULL,
    plantilla_id INT NOT NULL,
    perfil_id INT,
    puesto VARCHAR(100),
    nombre VARCHAR(100),
    apellidos VARCHAR(100),
    email VARCHAR(100),
    telefono INT,
    licencias_conducir VARCHAR(100),
    descripcion VARCHAR(100),
    fecha_creacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (usuario_id) REFERENCES Usuario(id),
    FOREIGN KEY (plantilla_id) REFERENCES Plantilla(id),
    FOREIGN KEY (perfil_id) REFERENCES Perfiles(id)
);

CREATE TABLE Trayectoria (
    id INT PRIMARY KEY AUTO_INCREMENT,
    curriculum_id INT NOT NULL,
    tipo ENUM('experiencia','educacion'),
    lugar VARCHAR(100) NOT NULL,
    ocupacion VARCHAR(100) NOT NULL,
    fecha_inicio TIMESTAMP,
    fecha_fin TIMESTAMP,
    descripcion TEXT,
    FOREIGN KEY (curriculum_id) REFERENCES Curriculum(id)
);

CREATE TABLE Complementos (
    id INT PRIMARY KEY AUTO_INCREMENT,
    curriculum_id INT NOT NULL,
    tipo ENUM('habilidad','idioma'),
    nombre TEXT NOT NULL,
    nivel INT(2),
    FOREIGN KEY (curriculum_id) REFERENCES Curriculum(id)
);
