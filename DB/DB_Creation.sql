-- Crea la base de datos
CREATE DATABASE gestion_tareas;

-- Selecciona la base de datos
USE gestion_tareas;

-- Crea la tabla "usuarios"
CREATE TABLE usuarios (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(255) NOT NULL,
  email VARCHAR(255) NOT NULL UNIQUE,
  contraseña VARCHAR(255) NOT NULL
);

-- Crea la tabla "tareas"
CREATE TABLE tareas (
  id INT AUTO_INCREMENT PRIMARY KEY,
  titulo VARCHAR(255) NOT NULL,
  descripcion TEXT,
  completada BOOLEAN DEFAULT false,
  fecha_creacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  id_usuario INT,
  FOREIGN KEY (id_usuario) REFERENCES usuarios(id)
);

-- Crea la tabla "categorias"
CREATE TABLE categorias (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(255) NOT NULL
);

-- Crea la tabla "tareas_categorias"
CREATE TABLE tareas_categorias (
  id_tarea INT,
  id_categoria INT,
  PRIMARY KEY (id_tarea, id_categoria),
  FOREIGN KEY (id_tarea) REFERENCES tareas(id),
  FOREIGN KEY (id_categoria) REFERENCES categorias(id)
);

-- Crea la tabla "comentarios"
CREATE TABLE comentarios (
  id INT AUTO_INCREMENT PRIMARY KEY,
  contenido TEXT NOT NULL,
  fecha_creacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  id_tarea INT,
  id_usuario INT,
  FOREIGN KEY (id_tarea) REFERENCES tareas(id),
  FOREIGN KEY (id_usuario) REFERENCES usuarios(id)
);

-- Crea la tabla "archivos_adjuntos"
CREATE TABLE archivos_adjuntos (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nombre_archivo VARCHAR(255) NOT NULL,
  ruta_archivo VARCHAR(255) NOT NULL,
  id_tarea INT,
  FOREIGN KEY (id_tarea) REFERENCES tareas(id)
);
