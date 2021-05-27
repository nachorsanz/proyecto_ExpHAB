


CREATE TABLE IF NOT EXISTS users(
	id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(30) NOT NULL UNIQUE,
    pwd VARCHAR(75) NOT NULL,
    email VARCHAR(75) NOT NULL UNIQUE,
    rol ENUM( 'regular', 'admin') NOT NULL,
    dni VARCHAR(15) NOT NULL UNIQUE,
    ccc VARCHAR(40) NOT NULL,
    direccion VARCHAR(50) NOT NULL,
    telefono VARCHAR(20) NOT NULL,
	nombre VARCHAR(30) NOT NULL,
    apellidos VARCHAR(50) NOT NULL,
    cp VARCHAR(20));

CREATE TABLE IF NOT EXISTS experiences(
	id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    descripcion TEXT NOT NULL ,
    nombre VARCHAR(30) NOT NULL,
    ciudad VARCHAR(30) NOT NULL,
    precio DECIMAL(5 , 2) NOT NULL,
	categorias VARCHAR(25) NOT NULL,
    num_participantes INT NOT NULL,
    disponibilidad ENUM('Si','No') NOT NULL,
	fecha_inicio DATE NOT NULL,
    fecha_fin DATE NOT NULL);


CREATE TABLE IF NOT EXISTS reservas(
	id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    cantidad TINYINT NOT NULL,
    fecha_reserva DATE NOT NULL,
    fecha_compra TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    precio_total DECIMAL(5,2) NOT NULL,
    estado ENUM('pendiente','finalizado') NOT NULL,
    id_experience INT UNSIGNED,
    FOREIGN KEY (id_experience) REFERENCES experiences (id) ON DELETE CASCADE ON UPDATE CASCADE);


CREATE TABLE IF NOT EXISTS usuarios_reservas(
	PRIMARY KEY (id_user , id_reserva),
    valoracion TINYINT,
	id_user INT UNSIGNED,
    FOREIGN KEY (id_user) REFERENCES users (id) ON DELETE CASCADE ON UPDATE CASCADE,
     id_reserva INT UNSIGNED,
    FOREIGN KEY (id_reserva) REFERENCES reservas (id) ON DELETE CASCADE ON UPDATE CASCADE);

   

CREATE TABLE IF NOT EXISTS comentarios(
	id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    comentario TEXT,
    fecha_coment TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
     id_reserva INT UNSIGNED,
    FOREIGN KEY (id_reserva) REFERENCES reservas (id) ON DELETE CASCADE ON UPDATE CASCADE);    

CREATE TABLE IF NOT EXISTS fotos(
	id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
	alt VARCHAR(50),
    url VARCHAR(200),
	id_experience INT UNSIGNED,
    FOREIGN KEY (id_experience) REFERENCES experiences (id) ON DELETE CASCADE ON UPDATE CASCADE);    
