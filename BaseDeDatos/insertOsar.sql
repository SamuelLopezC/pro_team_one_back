
INSERT INTO osar.Usuario(idUsuario, nombreCompleto, tipoPersona, edad, email, password, tipoUsuario)
VALUES
('01','Elias Flores Vazquez', 'Persona física', '25', 'eliasfv25@gmail.com','12345678', 'inversor'),
('02','Samuel López Cabrera', 'Persona moral', '18', 'samuellopez.dev@gmail.com','12345678', 'founding'),
('03','Miriam Diego', 'Persona física', '25', 'miriam23@gmail.com','12345678', 'inversor'),
('04','Samuel Martinez ', 'Persona moral', '18', 'samuelmartinez.dev@gmail.com','12345678', 'founding');

INSERT INTO osar.Founding(idUsuario)
SELECT idUsuario From osar.Usuario where tipoUsuario = 'founding';

INSERT INTO osar.Inversor(idUsuario)
SELECT idUsuario From osar.Usuario where tipoUsuario = 'inversor';

INSERT INTO osar.Proyecto (idProyecto, name, fechaInicio, fechaTermino, Descripcion, Estatus, precioInversion,totalCorazones, totalParticipantes,idUsuario,tipoFounding)
VALUES
('1' , 'Salvando a Rufino', '2022-08-26', '2022-09-26', 'Salvemos a rufino del maltrato de su dueño.', 'Activo', '100000',' 0', '0', '2', 'Monetario'),
('2','Adopta', '2022-08-26', '2022-09-26', 'Buscamos a personas que nos apoyen con donativos o adoptando perritos y gatitos. Si requires más información sigue nuesta pagina de facebook "Adóptame México"
', 'Activo', '20000', '0', '0', '2', 'Monetario'),
('3','Reciclando Residuos', '2022-08-26', '2022-09-26', 'Se parte de el cambio ecológico para una mejor ciudad, si quieres ser parte de esta campaña deveras presentarte con ropa comoda, bolsas de basura y una gran actitud, te esperamos en estación hidalgo.', 'Activo', '10000', '0', '0', '4', 'Monetario'),
('4','Ecológica Maya', '2022-08-26', '2022-09-26', 'Estamos buscando apoyo voluntario, para limpiar las areas verdes que lo necesiten, si estas dispuesto a ayudar comunicate al 5504157600', 'Activo', '10000', '0', '0', '4', 'Monetario');

INSERT INTO osar.Proyecto_has_Inversor(idProyectoInversion, Inversor_idUsuario,  Proyecto_idProyecto,totalInvertido, totalTiempo, totalConocimientos, tipoInversion)
VALUES
('1','1','1','5000','0','0','Monetario'),
('2','1','2','5000','0','0','Monetario'),
('3','1','3','5000','0','0','Monetario'),
('4','1','4','5000','0','0','Monetario'),
('5','3','1','5000','0','0','Monetario'),
('6','3','2','5000','0','0','Monetario'),
('7','3','3','5000','0','0','Monetario'),
('8','3','4','5000','0','0','Monetario');

SHOW DATABASES;
USE osar; 
SHOW TABLES;

SELECT * FROM osar.Usuario;

SELECT * FROM osar.Founding;
SELECT * FROM osar.Inversor;
SELECT * FROM osar.Proyecto;
SELECT * FROM osar.Proyecto WHERE idUsuario = 2;
SELECT * FROM osar.Proyecto_has_Inversor;
SELECT * FROM osar.Proyecto_has_Inversor WHERE inversor_idUsuario= 1 order by idProyectoInversion; 
  
DELETE  FROM osar.Usuario WHERE idUsuario =1;
DELETE  FROM osar.Founding WHERE idUsuario =2;
DELETE  FROM osar.Inversor WHERE idUsuario =1;
