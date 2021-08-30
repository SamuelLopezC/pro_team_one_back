
INSERT INTO osar.usuario(nombrecompleto, tipopersona, edad, email, password, tipousuario)
VALUES
('Elias Flores Vazquez', 'Persona física', '25', 'eliasfv25@gmail.com','12345678', 'inversor'),
('Samuel López Cabrera', 'Persona moral', '18', 'samuellopez.dev@gmail.com','12345678', 'founding'),
('Miriam Diego', 'Persona física', '25', 'miriam23@gmail.com','12345678', 'inversor'),
('Samuel Martinez ', 'Persona moral', '18', 'samuelmartinez.dev@gmail.com','12345678', 'founding');

INSERT INTO osar.founding(idusuario)
SELECT idusuario From osar.usuario where tipousuario = 'founding';

INSERT INTO osar.inversor(idusuario)
SELECT idusuario From osar.usuario where tipousuario = 'inversor';

INSERT INTO osar.proyecto (name, fechainicio, fechatermino, descripcion, estatus, precioinversion,totalcorazones, totalparticipantes,idusuario,tipofounding)
VALUES
('Salvando a Rufino', '2022-08-26', '2022-09-26', 'Salvemos a rufino del maltrato de su dueño.', 'Activo', '100000',' 0', '0', '2', 'Monetario'),
('Adopta', '2022-08-26', '2022-09-26', 'Buscamos a personas que nos apoyen con donativos o adoptando perritos y gatitos. Si requires más información sigue nuesta pagina de facebook "Adóptame México"
', 'Activo', '20000', '0', '0', '2', 'Monetario'),
('Reciclando Residuos', '2022-08-26', '2022-09-26', 'Se parte de el cambio ecológico para una mejor ciudad, si quieres ser parte de esta campaña deveras presentarte con ropa comoda, bolsas de basura y una gran actitud, te esperamos en estación hidalgo.', 'Activo', '10000', '0', '0', '4', 'Monetario'),
('Ecológica Maya', '2022-08-26', '2022-09-26', 'Estamos buscando apoyo voluntario, para limpiar las areas verdes que lo necesiten, si estas dispuesto a ayudar comunicate al 5504157600', 'Activo', '10000', '0', '0', '4', 'Monetario');

INSERT INTO osar.proyecto_has_Inversor (inversoridusuario,  proyectoidproyecto,totalinvertido, totaltiempo, totalconocimientos, tipoinversion)
VALUES
('1','1','5000','0','0','Monetario'),
('1','2','5000','0','0','Monetario'),
('1','3','5000','0','0','Monetario'),
('1','4','5000','0','0','Monetario'),
('3','1','5000','0','0','Monetario'),
('3','2','5000','0','0','Monetario'),
('3','3','5000','0','0','Monetario'),
('3','4','5000','0','0','Monetario');

SHOW DATABASES;
USE osar; 
SHOW TABLES;

SELECT * FROM osar.usuario;

SELECT * FROM osar.founding;
SELECT * FROM osar.inversor;
SELECT * FROM osar.proyecto;
SELECT * FROM osar.proyecto WHERE idusuario = 2;
SELECT * FROM osar.proyecto_has_Inversor;
SELECT * FROM osar.proyecto WHERE inversoridusuario= 1 order by idproyectoinversion; 

DELETE  FROM osar.usuario WHERE idusuario =1;
DELETE  FROM osar.founding WHERE idusuario =2;
DELETE  FROM osar.inversor WHERE idusuario =1;
