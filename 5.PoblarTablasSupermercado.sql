/*
SQLyog Ultimate
MySQL - 8.0.23 : Database - CristianAyala_Supermercado_10092021
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
USE `CristianAyala_Supermercado_10092021`;

/*Data for the table `producto` */

insert  into `producto`(`codigoBarras`,`nombre`,`precioBase`) values ('ABC123','lapicero bic',200),('ABC124','portaminas',300),('ABC125','borrador',100);


/*Data for the table `Departamento` */

insert  into `Departamento`(`idDepartamento`,`nombre`) values (1,'Amazonas'),(2,'Antioquia'),(3,'Arauca'),(4,'Atlántico'),(5,'Bogotá'),(6,'Bolívar'),(7,'Boyacá'),(8,'Caldas'),(9,'Caquetá'),(10,'Casanare'),(11,'Cauca'),(12,'Cesar'),(13,'Chocó'),(14,'Córdoba'),(15,'Cundinamarca'),(16,'Guainía'),(17,'Guaviare'),(18,'Huila'),(19,'La Guajira'),(20,'Magdalena'),(21,'Meta'),(22,'Nariño'),(23,'Norte de Santander'),(24,'Putumayo'),(25,'Quindío'),(26,'Risaralda'),(27,'San Andrés y Providencia'),(28,'Santander'),(29,'Sucre'),(30,'Tolima'),(31,'Valle del Cauca'),(32,'Vaupés'),(33,'Vichada');


/*Data for the table `Ciudad` */

insert  into `Ciudad`(`idCiudad`,`nombre`,`idDepartamento`) values (1,'Caucasia',2),(2,'Medellin',2),(3,'Yarumal',2);

/*Data for the table `Persona` */

insert  into `Persona`(`idPersona`,`nombres`,`apellidos`,`idCiudad`) values (1,'CRISTIAN DAVID','AYALA PULGARIN',2),(2,'IVAN','ARROYAVE',2),(3,'MELISA','MORALES',2);



/*Data for the table `TipoDocumento` */

insert  into `TipoDocumento`(`abreviatura`,`nombre`) values ('CC','cedula de ciudadania'),('CE','cedula de extranjeria'),('PP','pasaporte'),('RC','registrocivil'),('TI','tarjeta de identidad');

/*Data for the table `Documento` */

insert  into `Documento`(`idNumeroDocumento`,`numeroDocumento`,`abreviatura`,`idPersona`) values (1,1038120364,'CC',1),(2,1038120364,'RC',1),(3,107585221,'CC',3);




/*Data for the table `Domicilio` */

insert  into `Domicilio`(`idDomicilio`,`direccionDomicilio`) values (1,'cra 12 #12-58'),(2,'cra 6 #18-52'),(3,'calle 22 #10-80');

/*Data for the table `DomiciliosPersona` */

insert  into `DomiciliosPersona`(`idPersona`,`idDomicilio`) values (1,1),(1,2),(3,2),(3,3);

/*Data for the table `Email` */

insert  into `Email`(`email`,`Persona_idPersona`) values ('cristian.ayala@gmail.com.co',1),('cristian.ayalap92@gmail.com',1),('ivan.arroyave@sofka.com.co',2),('melissa@gmail.com',3);

/*Data for the table `Telefono` */

insert  into `Telefono`(`idNumero`,`numero`) values (1,'3226817028'),(2,'3122458937'),(3,'3108991003');

/*Data for the table `TelefonosPersona` */

insert  into `TelefonosPersona`(`idPersona`,`idNumero`) values (1,1),(2,1),(1,2),(2,2),(1,3);


/*Data for the table `Usuario` */

insert  into `Usuario`(`usuario`,`contraseña`,`idNumeroDocumento`) values ('cayala','123321',1),('cayala2','123321',1),('mel42','123321',3);

/*Data for the table `Ventas` */

insert  into `Ventas`(`idVenta`,`usuario`,`idNumeroDocumento`,`fecha`,`total`) values (1,'cayala',1,'2021-09-24',1000);

/*Data for the table `DetalleVentas` */

insert  into `DetalleVentas`(`idVenta`,`codigoBarras`,`precioVenta`,`cantidad`) values (1,'ABC123',200,2),(1,'ABC124',100,3),(1,'ABC125',500,1);



/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
