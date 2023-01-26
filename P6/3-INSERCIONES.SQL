-----------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------
------------------------------------------------INSERCIONES------------------------------------------------------
------------------------------------------------INSERCIONES------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------

--diego
INSERT INTO cestado_ve(id_cestado_ve,estado_ve)
VALUES
(1,'cdmx'),
(2,'morelos'),
(3,'michoacan'),
(4,'hidalgo'),
(5,'tlaxcala'),
(6,'puebla'),
(7,'guerrero'),
(8,'oaxaca'),
(9,'queretaro'),
(10,'jalisco'),
(11,'colima'),
(12,'guanajuato'),
(13,'san luis potosi'),
(14,'zacatecas'),
(15,'aguascalientes'),
(16,'veracruz'),
(17,'durango'),
(18,'nayarit'),
(19,'tamaulipas'),
(20,'nuevo leon'),
(21,'coahuila'),
(22,'chihuahua'),
(23,'sonora'),
(24,'sinaloa'),
(25,'baja california'),
(26,'baja california sur'),
(27,'tabasco'),
(28,'chiapas'),
(29,'campeche'),
(30,'yucatan'),
(31,'quitana roo'),
(32,'tamaulipas');

-- Tabla cpuertas
INSERT INTO cpuertas(id_cpuertas,cant_puertas)VALUES (1,2);
INSERT INTO cpuertas(id_cpuertas,cant_puertas)VALUES (2,4);

-- Tabla ctransmision
INSERT INTO ctransmision(id_ctransmision,transmision)VALUES (1,'manual');
INSERT INTO ctransmision(id_ctransmision,transmision)VALUES (2,'estandar');
INSERT INTO ctransmision(id_ctransmision,transmision)VALUES (3,'dual');

-- Tabla canio
INSERT INTO canio(id_canio,anio)VALUES (1,2010);
INSERT INTO canio(id_canio,anio)VALUES (2,2011);
INSERT INTO canio(id_canio,anio)VALUES (3,2012);
INSERT INTO canio(id_canio,anio)VALUES (4,2013);
INSERT INTO canio(id_canio,anio)VALUES (5,2014);
INSERT INTO canio(id_canio,anio)VALUES (6,2015);
INSERT INTO canio(id_canio,anio)VALUES (7,2016);
INSERT INTO canio(id_canio,anio)VALUES (8,2017);
INSERT INTO canio(id_canio,anio)VALUES (9,2018);
INSERT INTO canio(id_canio,anio)VALUES (10,2019);
INSERT INTO canio(id_canio,anio)VALUES (11,2020);
INSERT INTO canio(id_canio,anio)VALUES (12,2021);
INSERT INTO canio(id_canio,anio)VALUES (13,2022);
INSERT INTO canio(id_canio,anio)VALUES (14,2023);
INSERT INTO canio(id_canio,anio)VALUES (15,2024);
INSERT INTO canio(id_canio,anio)VALUES (16,2026);
INSERT INTO canio(id_canio,anio)VALUES (17,2027);
INSERT INTO canio(id_canio,anio)VALUES (18,2028);
INSERT INTO canio(id_canio,anio)VALUES (19,2029);
INSERT INTO canio(id_canio,anio)VALUES (20,2030);

-- Tabla ccolor
INSERT INTO ccolor(id_color,color)VALUES (1,'rojo');
INSERT INTO ccolor(id_color,color)VALUES (2,'rosa');
INSERT INTO ccolor(id_color,color)VALUES (3,'verde');
INSERT INTO ccolor(id_color,color)VALUES (4,'negro');
INSERT INTO ccolor(id_color,color)VALUES (5,'blanco');
INSERT INTO ccolor(id_color,color)VALUES (6,'morado');
INSERT INTO ccolor(id_color,color)VALUES (7,'azul');
INSERT INTO ccolor(id_color,color)VALUES (8,'azul fuerte');
INSERT INTO ccolor(id_color,color)VALUES (9,'amarillo');
INSERT INTO ccolor(id_color,color)VALUES (10,'naranja');
INSERT INTO ccolor(id_color,color)VALUES (11,'plateado');
INSERT INTO ccolor(id_color,color)VALUES (12,'gris');
INSERT INTO ccolor(id_color,color)VALUES (13,'dorado');
INSERT INTO ccolor(id_color,color)VALUES (14,'cafe');

-- Tabla cstatus
INSERT INTO cstatus(id_cstatus,status)VALUES (1,'venta');
INSERT INTO cstatus(id_cstatus,status)VALUES (2,'vendido');
INSERT INTO cstatus(id_cstatus,status)VALUES (3,'reparacion');

-- Tabla cmotor
INSERT INTO cmotor(id_cmotor,motor)VALUES (1,'electrico');
INSERT INTO cmotor(id_cmotor,motor)VALUES (2,'hibrido');
INSERT INTO cmotor(id_cmotor,motor)VALUES (3,'combustion');

-- Tabla cmarca
INSERT INTO cmarca(id_cmarca,marca)VALUES (1,'acura');
INSERT INTO cmarca(id_cmarca,marca)VALUES (2,'audi');
INSERT INTO cmarca(id_cmarca,marca)VALUES (3,'buick');
INSERT INTO cmarca(id_cmarca,marca)VALUES (4,'dodge');
INSERT INTO cmarca(id_cmarca,marca)VALUES (5,'fiat');
INSERT INTO cmarca(id_cmarca,marca)VALUES (6,'chevrolet');
INSERT INTO cmarca(id_cmarca,marca)VALUES (7,'cupra');
INSERT INTO cmarca(id_cmarca,marca)VALUES (8,'ford');
INSERT INTO cmarca(id_cmarca,marca)VALUES (9,'gmc');
INSERT INTO cmarca(id_cmarca,marca)VALUES (10,'honda');
INSERT INTO cmarca(id_cmarca,marca)VALUES (11,'hyundai');
INSERT INTO cmarca(id_cmarca,marca)VALUES (12,'jeep');
INSERT INTO cmarca(id_cmarca,marca)VALUES (13,'kia');
INSERT INTO cmarca(id_cmarca,marca)VALUES (14,'mazda');
INSERT INTO cmarca(id_cmarca,marca)VALUES (15,'mg');
INSERT INTO cmarca(id_cmarca,marca)VALUES (16,'nissan');
INSERT INTO cmarca(id_cmarca,marca)VALUES (17,'peugeot');
INSERT INTO cmarca(id_cmarca,marca)VALUES (18,'renault');
INSERT INTO cmarca(id_cmarca,marca)VALUES (19,'seat');
INSERT INTO cmarca(id_cmarca,marca)VALUES (20,'suzuki');
INSERT INTO cmarca(id_cmarca,marca)VALUES (21,'tesla');
INSERT INTO cmarca(id_cmarca,marca)VALUES (22,'toyota');
INSERT INTO cmarca(id_cmarca,marca)VALUES (23,'volkswagen');
INSERT INTO cmarca(id_cmarca,marca)VALUES (24,'volvo');

-- Tabla ctipo
INSERT INTO ctipo(id_ctipo,tipo)VALUES (1,'hatchback');
INSERT INTO ctipo(id_ctipo,tipo)VALUES (2,'sedan');
INSERT INTO ctipo(id_ctipo,tipo)VALUES (3,'4x4');
INSERT INTO ctipo(id_ctipo,tipo)VALUES (4,'crossover');
INSERT INTO ctipo(id_ctipo,tipo)VALUES (5,'suv');
INSERT INTO ctipo(id_ctipo,tipo)VALUES (6,'pick-up');

------------------------------------------------ ETAPA 2 ----------------------------------------------------
-- Tabla cmodelo
--ACURA
INSERT INTO cmodelo(id_cmodelo,modelo,id_cmarca,id_ctipo)VALUES (1,'tlx',1,2);
INSERT INTO cmodelo(id_cmodelo,modelo,id_cmarca,id_ctipo)VALUES (2,'rdx',1,5);
INSERT INTO cmodelo(id_cmodelo,modelo,id_cmarca,id_ctipo)VALUES (3,'mdx',1,5);
--AUDI
INSERT INTO cmodelo(id_cmodelo,modelo,id_cmarca,id_ctipo)VALUES (4,'a1',2,1);
INSERT INTO cmodelo(id_cmodelo,modelo,id_cmarca,id_ctipo)VALUES (5,'a3',2,2);
INSERT INTO cmodelo(id_cmodelo,modelo,id_cmarca,id_ctipo)VALUES (6,'a4',2,2);
INSERT INTO cmodelo(id_cmodelo,modelo,id_cmarca,id_ctipo)VALUES (7,'a5',2,2);
INSERT INTO cmodelo(id_cmodelo,modelo,id_cmarca,id_ctipo)VALUES (8,'a6',2,2);
INSERT INTO cmodelo(id_cmodelo,modelo,id_cmarca,id_ctipo)VALUES (9,'a7',2,2);
INSERT INTO cmodelo(id_cmodelo,modelo,id_cmarca,id_ctipo)VALUES (10,'a8',2,2);
INSERT INTO cmodelo(id_cmodelo,modelo,id_cmarca,id_ctipo)VALUES (11,'q2',2,4);
INSERT INTO cmodelo(id_cmodelo,modelo,id_cmarca,id_ctipo)VALUES (12,'q4',2,5);
INSERT INTO cmodelo(id_cmodelo,modelo,id_cmarca,id_ctipo)VALUES (13,'q5',2,5);
--BUICK
INSERT INTO cmodelo(id_cmodelo,modelo,id_cmarca,id_ctipo)VALUES (14,'encore',3,5);
INSERT INTO cmodelo(id_cmodelo,modelo,id_cmarca,id_ctipo)VALUES (15,'envision',3,5);
--DODGE
INSERT INTO cmodelo(id_cmodelo,modelo,id_cmarca,id_ctipo)VALUES (16,'atitud',4,2);
INSERT INTO cmodelo(id_cmodelo,modelo,id_cmarca,id_ctipo)VALUES (17,'challenger',4,2);
INSERT INTO cmodelo(id_cmodelo,modelo,id_cmarca,id_ctipo)VALUES (18,'durango',4,4);
INSERT INTO cmodelo(id_cmodelo,modelo,id_cmarca,id_ctipo)VALUES (19,'journey',4,5);
--FIAT
INSERT INTO cmodelo(id_cmodelo,modelo,id_cmarca,id_ctipo)VALUES (20,'mobi',5,1);
INSERT INTO cmodelo(id_cmodelo,modelo,id_cmarca,id_ctipo)VALUES (21,'argo',5,4);
--CHEVROLET
INSERT INTO cmodelo(id_cmodelo,modelo,id_cmarca,id_ctipo)VALUES (22,'aveo',5,2);
INSERT INTO cmodelo(id_cmodelo,modelo,id_cmarca,id_ctipo)VALUES (23,'onix',5,2);
INSERT INTO cmodelo(id_cmodelo,modelo,id_cmarca,id_ctipo)VALUES (24,'chavalier',5,2);
INSERT INTO cmodelo(id_cmodelo,modelo,id_cmarca,id_ctipo)VALUES (25,'groove',5,4);
INSERT INTO cmodelo(id_cmodelo,modelo,id_cmarca,id_ctipo)VALUES (26,'tracker',5,5);
INSERT INTO cmodelo(id_cmodelo,modelo,id_cmarca,id_ctipo)VALUES (27,'captiva',5,5);
INSERT INTO cmodelo(id_cmodelo,modelo,id_cmarca,id_ctipo)VALUES (28,'blazer',5,5);
INSERT INTO cmodelo(id_cmodelo,modelo,id_cmarca,id_ctipo)VALUES (29,'traverse',5,5);
--CUPRA
INSERT INTO cmodelo(id_cmodelo,modelo,id_cmarca,id_ctipo)VALUES (30,'leon',7,1);
INSERT INTO cmodelo(id_cmodelo,modelo,id_cmarca,id_ctipo)VALUES (31,'formentor',7,5);
INSERT INTO cmodelo(id_cmodelo,modelo,id_cmarca,id_ctipo)VALUES (32,'ateca',7,5);
--FORD
INSERT INTO cmodelo(id_cmodelo,modelo,id_cmarca,id_ctipo)VALUES (33,'mustang',8,2);
INSERT INTO cmodelo(id_cmodelo,modelo,id_cmarca,id_ctipo)VALUES (34,'bronco',8,3);
INSERT INTO cmodelo(id_cmodelo,modelo,id_cmarca,id_ctipo)VALUES (35,'edge',8,4);
INSERT INTO cmodelo(id_cmodelo,modelo,id_cmarca,id_ctipo)VALUES (36,'explorer',8,5);
INSERT INTO cmodelo(id_cmodelo,modelo,id_cmarca,id_ctipo)VALUES (37,'xpedition',8,5);
INSERT INTO cmodelo(id_cmodelo,modelo,id_cmarca,id_ctipo)VALUES (38,'scape',8,5);
INSERT INTO cmodelo(id_cmodelo,modelo,id_cmarca,id_ctipo)VALUES (39,'lobo',8,6);
INSERT INTO cmodelo(id_cmodelo,modelo,id_cmarca,id_ctipo)VALUES (40,'f-150',8,6);
INSERT INTO cmodelo(id_cmodelo,modelo,id_cmarca,id_ctipo)VALUES (41,'ranger',8,6);
INSERT INTO cmodelo(id_cmodelo,modelo,id_cmarca,id_ctipo)VALUES (42,'maverick',8,6);
-- GMC
INSERT INTO cmodelo(id_cmodelo,modelo,id_cmarca,id_ctipo)VALUES (43,'terrain',9,5);
INSERT INTO cmodelo(id_cmodelo,modelo,id_cmarca,id_ctipo)VALUES (44,'sierra',9,6);
--HONDA
INSERT INTO cmodelo(id_cmodelo,modelo,id_cmarca,id_ctipo)VALUES (45,'city',10,2);
INSERT INTO cmodelo(id_cmodelo,modelo,id_cmarca,id_ctipo)VALUES (46,'civic',10,2);
INSERT INTO cmodelo(id_cmodelo,modelo,id_cmarca,id_ctipo)VALUES (47,'insight',10,2);
INSERT INTO cmodelo(id_cmodelo,modelo,id_cmarca,id_ctipo)VALUES (48,'acord',10,2);
INSERT INTO cmodelo(id_cmodelo,modelo,id_cmarca,id_ctipo)VALUES (49,'hr-v',10,4);
INSERT INTO cmodelo(id_cmodelo,modelo,id_cmarca,id_ctipo)VALUES (50,'br-v',10,5);
INSERT INTO cmodelo(id_cmodelo,modelo,id_cmarca,id_ctipo)VALUES (51,'cr-v',10,5);
INSERT INTO cmodelo(id_cmodelo,modelo,id_cmarca,id_ctipo)VALUES (52,'pilot',10,5);
INSERT INTO cmodelo(id_cmodelo,modelo,id_cmarca,id_ctipo)VALUES (53,'odyssey',10,6);
--HYUNDAI
INSERT INTO cmodelo(id_cmodelo,modelo,id_cmarca,id_ctipo)VALUES (54,'i10',11,1);
INSERT INTO cmodelo(id_cmodelo,modelo,id_cmarca,id_ctipo)VALUES (55,'accent',11,1);
INSERT INTO cmodelo(id_cmodelo,modelo,id_cmarca,id_ctipo)VALUES (56,'elantra',11,2);
INSERT INTO cmodelo(id_cmodelo,modelo,id_cmarca,id_ctipo)VALUES (57,'ionic',11,2);
INSERT INTO cmodelo(id_cmodelo,modelo,id_cmarca,id_ctipo)VALUES (58,'creta',11,4);
INSERT INTO cmodelo(id_cmodelo,modelo,id_cmarca,id_ctipo)VALUES (59,'tucson',11,5);
INSERT INTO cmodelo(id_cmodelo,modelo,id_cmarca,id_ctipo)VALUES (60,'santa',11,5);
INSERT INTO cmodelo(id_cmodelo,modelo,id_cmarca,id_ctipo)VALUES (61,'palisade',11,5);
--JEEP
INSERT INTO cmodelo(id_cmodelo,modelo,id_cmarca,id_ctipo)VALUES (62,'wrangler',12,3);
INSERT INTO cmodelo(id_cmodelo,modelo,id_cmarca,id_ctipo)VALUES (63,'cherokee',12,5);
--KIA
INSERT INTO cmodelo(id_cmodelo,modelo,id_cmarca,id_ctipo)VALUES (64,'rio',13,1);
INSERT INTO cmodelo(id_cmodelo,modelo,id_cmarca,id_ctipo)VALUES (65,'forte',13,2);
INSERT INTO cmodelo(id_cmodelo,modelo,id_cmarca,id_ctipo)VALUES (66,'seltos',13,4);
INSERT INTO cmodelo(id_cmodelo,modelo,id_cmarca,id_ctipo)VALUES (67,'sorento',13,5);
--MAZDA
INSERT INTO cmodelo(id_cmodelo,modelo,id_cmarca,id_ctipo)VALUES (68,'2',14,1);
INSERT INTO cmodelo(id_cmodelo,modelo,id_cmarca,id_ctipo)VALUES (69,'3',14,2);
INSERT INTO cmodelo(id_cmodelo,modelo,id_cmarca,id_ctipo)VALUES (70,'cx-3',14,4);
INSERT INTO cmodelo(id_cmodelo,modelo,id_cmarca,id_ctipo)VALUES (71,'cx-30',14,5);
INSERT INTO cmodelo(id_cmodelo,modelo,id_cmarca,id_ctipo)VALUES (72,'cx-5',14,5);
INSERT INTO cmodelo(id_cmodelo,modelo,id_cmarca,id_ctipo)VALUES (73,'cx-9',14,5);
--MG
INSERT INTO cmodelo(id_cmodelo,modelo,id_cmarca,id_ctipo)VALUES (74,'mg',15,2);
INSERT INTO cmodelo(id_cmodelo,modelo,id_cmarca,id_ctipo)VALUES (75,'zs',15,5);
INSERT INTO cmodelo(id_cmodelo,modelo,id_cmarca,id_ctipo)VALUES (76,'hs',15,5);
INSERT INTO cmodelo(id_cmodelo,modelo,id_cmarca,id_ctipo)VALUES (77,'rx-5',15,5);
--NISSAN
INSERT INTO cmodelo(id_cmodelo,modelo,id_cmarca,id_ctipo)VALUES (78,'march',16,1);
INSERT INTO cmodelo(id_cmodelo,modelo,id_cmarca,id_ctipo)VALUES (79,'versa',16,2);
INSERT INTO cmodelo(id_cmodelo,modelo,id_cmarca,id_ctipo)VALUES (80,'altima',16,2);
INSERT INTO cmodelo(id_cmodelo,modelo,id_cmarca,id_ctipo)VALUES (81,'sentra',16,2);
INSERT INTO cmodelo(id_cmodelo,modelo,id_cmarca,id_ctipo)VALUES (82,'kicks',16,4);
INSERT INTO cmodelo(id_cmodelo,modelo,id_cmarca,id_ctipo)VALUES (83,'x-trail',16,5);
INSERT INTO cmodelo(id_cmodelo,modelo,id_cmarca,id_ctipo)VALUES (84,'frontier',16,6);
--PEUGEOT
INSERT INTO cmodelo(id_cmodelo,modelo,id_cmarca,id_ctipo)VALUES (85,'208',17,1);
INSERT INTO cmodelo(id_cmodelo,modelo,id_cmarca,id_ctipo)VALUES (86,'301',17,2);
INSERT INTO cmodelo(id_cmodelo,modelo,id_cmarca,id_ctipo)VALUES (87,'2008',17,5);
INSERT INTO cmodelo(id_cmodelo,modelo,id_cmarca,id_ctipo)VALUES (88,'3008',17,5);
INSERT INTO cmodelo(id_cmodelo,modelo,id_cmarca,id_ctipo)VALUES (89,'5008',17,5);
--RENAULT
INSERT INTO cmodelo(id_cmodelo,modelo,id_cmarca,id_ctipo)VALUES (90,'kwind',18,1);
INSERT INTO cmodelo(id_cmodelo,modelo,id_cmarca,id_ctipo)VALUES (91,'duster',18,4);
INSERT INTO cmodelo(id_cmodelo,modelo,id_cmarca,id_ctipo)VALUES (92,'stepway',18,4);
INSERT INTO cmodelo(id_cmodelo,modelo,id_cmarca,id_ctipo)VALUES (93,'captur',18,5);
INSERT INTO cmodelo(id_cmodelo,modelo,id_cmarca,id_ctipo)VALUES (94,'koleos',18,5);
INSERT INTO cmodelo(id_cmodelo,modelo,id_cmarca,id_ctipo)VALUES (95,'oroch',18,6);
--SEAT
INSERT INTO cmodelo(id_cmodelo,modelo,id_cmarca,id_ctipo)VALUES (96,'ibiza',19,1);
INSERT INTO cmodelo(id_cmodelo,modelo,id_cmarca,id_ctipo)VALUES (97,'leon',19,1);
INSERT INTO cmodelo(id_cmodelo,modelo,id_cmarca,id_ctipo)VALUES (98,'arona',19,4);
INSERT INTO cmodelo(id_cmodelo,modelo,id_cmarca,id_ctipo)VALUES (99,'ateca',19,5);
INSERT INTO cmodelo(id_cmodelo,modelo,id_cmarca,id_ctipo)VALUES (100,'tarraco',19,5);
--SUZIKI
INSERT INTO cmodelo(id_cmodelo,modelo,id_cmarca,id_ctipo)VALUES (101,'swift',20,1);
INSERT INTO cmodelo(id_cmodelo,modelo,id_cmarca,id_ctipo)VALUES (102,'ignis',20,1);
INSERT INTO cmodelo(id_cmodelo,modelo,id_cmarca,id_ctipo)VALUES (103,'ciaz',20,2);
INSERT INTO cmodelo(id_cmodelo,modelo,id_cmarca,id_ctipo)VALUES (104,'s-cross',20,4);
INSERT INTO cmodelo(id_cmodelo,modelo,id_cmarca,id_ctipo)VALUES (105,'baleno',20,5);
INSERT INTO cmodelo(id_cmodelo,modelo,id_cmarca,id_ctipo)VALUES (106,'etriga',20,5);
--TESLA
INSERT INTO cmodelo(id_cmodelo,modelo,id_cmarca,id_ctipo)VALUES (107,'s',21,2);
INSERT INTO cmodelo(id_cmodelo,modelo,id_cmarca,id_ctipo)VALUES (108,'3',21,2);
INSERT INTO cmodelo(id_cmodelo,modelo,id_cmarca,id_ctipo)VALUES (109,'x',21,4);
INSERT INTO cmodelo(id_cmodelo,modelo,id_cmarca,id_ctipo)VALUES (110,'y',21,5);
--TOYOTA
INSERT INTO cmodelo(id_cmodelo,modelo,id_cmarca,id_ctipo)VALUES (111,'yaris',22,1);
INSERT INTO cmodelo(id_cmodelo,modelo,id_cmarca,id_ctipo)VALUES (112,'raize',22,1);
INSERT INTO cmodelo(id_cmodelo,modelo,id_cmarca,id_ctipo)VALUES (113,'corolla',22,2);
INSERT INTO cmodelo(id_cmodelo,modelo,id_cmarca,id_ctipo)VALUES (114,'carmy',22,2);
INSERT INTO cmodelo(id_cmodelo,modelo,id_cmarca,id_ctipo)VALUES (115,'prius',22,2);
INSERT INTO cmodelo(id_cmodelo,modelo,id_cmarca,id_ctipo)VALUES (116,'cross',22,4);
INSERT INTO cmodelo(id_cmodelo,modelo,id_cmarca,id_ctipo)VALUES (117,'rav4',22,5);
INSERT INTO cmodelo(id_cmodelo,modelo,id_cmarca,id_ctipo)VALUES (118,'sienna',22,5);
INSERT INTO cmodelo(id_cmodelo,modelo,id_cmarca,id_ctipo)VALUES (119,'highlander',22,5);
INSERT INTO cmodelo(id_cmodelo,modelo,id_cmarca,id_ctipo)VALUES (120,'avanza',22,5);
--VW
INSERT INTO cmodelo(id_cmodelo,modelo,id_cmarca,id_ctipo)VALUES (121,'polo',23,1);
INSERT INTO cmodelo(id_cmodelo,modelo,id_cmarca,id_ctipo)VALUES (122,'gol',23,1);
INSERT INTO cmodelo(id_cmodelo,modelo,id_cmarca,id_ctipo)VALUES (123,'jetta',23,2);
INSERT INTO cmodelo(id_cmodelo,modelo,id_cmarca,id_ctipo)VALUES (124,'vento',23,2);
INSERT INTO cmodelo(id_cmodelo,modelo,id_cmarca,id_ctipo)VALUES (125,'vitrus',23,2);
INSERT INTO cmodelo(id_cmodelo,modelo,id_cmarca,id_ctipo)VALUES (126,'t-cross',23,4);
INSERT INTO cmodelo(id_cmodelo,modelo,id_cmarca,id_ctipo)VALUES (127,'tiguan',23,5);
INSERT INTO cmodelo(id_cmodelo,modelo,id_cmarca,id_ctipo)VALUES (128,'teramont',23,5);
INSERT INTO cmodelo(id_cmodelo,modelo,id_cmarca,id_ctipo)VALUES (129,'amarok',23,5);
INSERT INTO cmodelo(id_cmodelo,modelo,id_cmarca,id_ctipo)VALUES (130,'saveiro',23,6);
--VOLVO
INSERT INTO cmodelo(id_cmodelo,modelo,id_cmarca,id_ctipo)VALUES (131,'s60',24,1);
INSERT INTO cmodelo(id_cmodelo,modelo,id_cmarca,id_ctipo)VALUES (132,'xc40',24,4);
INSERT INTO cmodelo(id_cmodelo,modelo,id_cmarca,id_ctipo)VALUES (133,'xc60',24,5);
INSERT INTO cmodelo(id_cmodelo,modelo,id_cmarca,id_ctipo)VALUES (134,'xc90',24,5);

--Tabla cforma_pago
INSERT INTO cforma_pago (id_cf_pago,forma_pago)
VALUES
  (1,'Efectivo'),
  (2,'Tarjeta_Credito'),
  (3,'Transferencia');

--Tabla cstatus_pago
INSERT INTO cstatus_pago (id_cst_pago,status_pago)
VALUES
  (1,'saldada'),
  (2,'en curso'),
  (3,'mora');

--Tabla ctemporalidad
INSERT INTO ctemporalidad (id_temporalidad,tiempo)
VALUES
  (1, '3 meses'),
  (2, '6 meses'),
  (3, '9 meses'),
  (4, '12 meses'),
  (5, '15 meses'),
  (6, '18 meses'),
  (7, '21 meses'),
  (8, '24 meses'),
  (9, '27 meses'),
  (10, '30 meses'),
  (11, '33 meses'),
  (12, '36 meses'),
  (13, '39 meses'),
  (14, '42 meses'),
  (15, '45 meses'),
  (16, '48 meses');

--Tabla cstatus_deuda
INSERT INTO cstatus_deuda (id_cst_deuda,st_deuda)
VALUES
  (1,'saldada'),
  (2,'en curso'),
  (3,'mora');

--Tabla cforma_compra
INSERT INTO cforma_compra (id_cforma_compra,forma_compra)
VALUES
  (1,'Efectivo'),
  (2,'Tarjeta_Credito'),
  (3,'Transferencia');

--Tabla cestado
INSERT INTO cestado VALUES
(1,'cdmx'),
(2,'morelos'),
(3,'michoacan'),
(4,'hidalgo'),
(5,'tlaxcala'),
(6,'puebla'),
(7,'guerrero'),
(8,'oaxaca'),
(9,'queretaro'),
(10,'jalisco'),
(11,'colima'),
(12,'guanajuato'),
(13,'san luis potosi'),
(14,'zacatecas'),
(15,'aguascalientes'),
(16,'veracruz'),
(17,'durango'),
(18,'nayarit'),
(19,'tamaulipas'),
(20,'nuevo leon'),
(21,'coahuila'),
(22,'chihuahua'),
(23,'sonora'),
(24,'sinaloa'),
(25,'baja california'),
(26,'baja california sur'),
(27,'tabasco'),
(28,'chiapas'),
(29,'campeche'),
(30,'yucatan'),
(31,'quitana roo'),
(32,'tamaulipas');

--Tabla casistencia
INSERT  INTO casistencia(id_casis, asistencia) VALUES
(1, 'pendiente'),
(2, 'asistencia'),
(3, 'inasistencia');

--Tabla cgenero
insert into cgenero (id_cgenero, genero) values (1, 'M');
insert into cgenero (id_cgenero, genero) values (2, 'F');

--Tabla ccliente
insert into ccliente (id_ccliente, tipo_cliente) values (1, 'vendedor');
insert into ccliente (id_ccliente, tipo_cliente) values (2, 'comprador');

--Tabla ajustes
INSERT INTO ajustes(id_ajuste,ajuste)VALUES
(1,'aceite'),
(2,'filtro de aceite'),
(3,'aceite'),
(4,'filtro antipolen'),
(5,'filtro de aire'),
(6,'filtro de combustible'),
(7,'pastillas de freno'),
(8,'anticongelate'),
(9,'relleno de niveles'),
(10,'liquido de frenos'),
(11,'Balatas'),
(12,'alineacion'),
(13,'afinación'),
(14,'balanceo'),
(15,'pintura'),
(16,'hojalateria');

--Tabla vehiculo
INSERT INTO vehiculo(no_serie,placas,precio_com,precio_ven,km,fe_venta_vehi,fe_compra_vehi,puertas,transmision,estado_ve ,motor,modelo,anio,color,status)
VALUES
  ('1quhb63rpbf841293','TGN-69-22',278779,NULL,158028,NULL,'2022/04/07',1,2,1,2,122,6,8,2),
  ('2ldja54kiju106918','NMU-47-03',1091845,NULL,78821,NULL,'2022/03/26',2,1,18,2,13,8,8,2),
  ('4eglx51tidx410873','OJI-22-05',363098,NULL,53520,NULL,'2022/02/03',2,2,7,3,62,13,7,2),
  ('8bpzx29mmhg472488','PTG-40-62',1527676,NULL,85592,NULL,'2022/02/11',2,2,26,3,37,1,13,2),
  ('1kcmr92dkuh957461','YLP-17-16',992409,1558520,64544,'2022/03/07','2022/02/27',1,1,1,1,111,12,5,1),
  ('7pujb52ckyt187143','GUG-75-67',480150,NULL,167354,NULL,'2022/02/06',2,2,12,1,30,9,11,2),
  ('7dlth75fpif818482','HPV-78-25',1320455,NULL,37767,NULL,'2022/02/26',1,3,20,3,75,4,6,2),
  ('4yrrm86sidl143922','VOT-16-51',250690,731841,55504,'2022/02/27','2022/02/09',2,1,13,1,50,3,8,1),
  ('5lyyv66left046373','GSN-28-28',1272894,NULL,127945,NULL,'2022/03/19',2,3,5,2,45,13,11,3),
  ('7luot78urhj636781','FVD-50-85',1286019,1228453,129409,'2022/03/03','2022/01/16',2,2,15,3,93,9,4,1),
  ('9ieqr58twek360755','CHA-50-79',709449,NULL,25236,NULL,'2022/04/18',1,2,5,3,118,10,1,2),
  ('6anyr14mscs262114','RNC-17-86',1036656,NULL,95474,NULL,'2021/12/18',2,2,20,3,80,1,7,2),
  ('3crid74pvxi362803','MWR-22-56',700393,386892,138775,'2022/01/26','2022/01/18',2,2,8,3,94,9,4,1),
  ('3krdt28vgft163635','KCD-30-08',499900,NULL,33182,NULL,'2022/02/20',2,2,17,3,55,7,5,2),
  ('8uale26omjh398662','HFJ-69-47',619822,940794,137944,'2022/02/17','2022/04/16',1,2,22,2,25,1,11,1),
  ('7esdo28vfkx483549','WLV-36-51',1007446,NULL,69531,NULL,'2021/12/09',1,2,9,2,98,10,5,2),
  ('0ckma24abpd411748','JKK-55-28',537219,118800,125991,'2022/01/03','2022/01/29',1,2,14,2,48,12,10,1),
  ('7yusa67omdm910531','LNG-95-74',1016339,NULL,39647,NULL,'2022/02/21',2,3,10,3,108,4,12,3),
  ('6gmss82vift354444','KDF-32-39',902533,NULL,123777,NULL,'2022/01/22',1,3,31,1,21,9,2,2),
  ('3gork88bhud827433','CPM-78-10',1525640,NULL,165018,NULL,'2022/01/30',1,1,5,3,104,3,13,2);

-- Tabla vehiculo_ajustes
INSERT INTO vehiculo_ajustes (id_vehiculo_ajustes,no_serie,id_ajuste,costo)
VALUES
(1,'1quhb63rpbf841293',15,7532),
(2,'1quhb63rpbf841293',16,2400),
(3,'1quhb63rpbf841293',4,470),
(4,'1quhb63rpbf841293',9,120),
(5,'1quhb63rpbf841293',3,325),
(6,'3krdt28vgft163635',1,230),
(7,'3krdt28vgft163635',16,6594),
(8,'1DWOC10FUQU752855',1,230),
(9,'1DWOC10FUQU752855',7,847),
(10,'7luot78urhj636781',1,394),
(11,'7luot78urhj636781',1,623),
(12,'7luot78urhj636781',3,654),
(13,'2ldja54kiju106918',1,610),
(14,'4eglx51tidx410873',11,2540),
(15,'4eglx51tidx410873',1,120),
(16,'4eglx51tidx410873',2,310);

--Tabla cmunicipio
INSERT INTO cmunicipio VALUES
(1,'alvaro obregon'),
(2,'azcapotzalco'),
(3,'benito juarez'),
(4,'coyoacan'),
(5,'cuajimalpa'),
(6,'cuauhtemoc'),
(7,'gustavo a. madero'),
(8,'iztacalco'),
(9,'iztapalapa'),
(10,'magdalena contreras'),
(11,'miguel hidalgo'),
(12,'milpa alta'),
(13,'tlahuac'),
(14,'tlalpan'),
(15,'venustiano carranza'),
(16,'xochimilco');

--Tabla cno_extend
INSERT INTO cno_exten(id_cno_ex, no_ext) VALUES
(1, 58),
(2, 54),
(3, 54),
(4, 55),
(5, 75),
(6, 72),
(7, 81),
(8, 42),
(9, 35),
(10, 28),
(11, 18),
(12, 24),
(13, 85),
(14, 52),
(15, 18);

--Tabla carea
insert into carea (id_carea, area, id_cno_ex) values (1, 'marketing', 1);
insert into carea (id_carea, area, id_cno_ex) values (2, 'ventas', 2);
insert into carea (id_carea, area, id_cno_ex) values (3, 'compras', 3);
insert into carea (id_carea, area, id_cno_ex) values (4, 'recursos humanos', 4);
insert into carea (id_carea, area, id_cno_ex) values (5, 'finanzas y contabilidad', 5);
insert into carea (id_carea, area, id_cno_ex) values (6, 'mecanica', 6);

--Tabla crol
insert into crol (id_crol,rol,sueldo) values (1,'vendedor','10500');
insert into crol (id_crol,rol,sueldo) values (2,'mecanico','10000');
insert into crol (id_crol,rol,sueldo) values (3,'director en finanzas','30000');
insert into crol (id_crol,rol,sueldo) values (4,'contador','13000');
insert into crol (id_crol,rol,sueldo) values (5,'asesor de ventas','10000');
insert into crol (id_crol,rol,sueldo) values (6,'director marketing','25000');
insert into crol (id_crol,rol,sueldo) values (7,'administrador','8000');
insert into crol (id_crol,rol,sueldo) values (8,'recepcionista','7000');

--Tabla chorario
insert into chorario (id_chorario,horario) values (001, 'matutino');
insert into chorario (id_chorario,horario) values (002, 'vespertino');

--Tabla domicilio
INSERT INTO domicilio(id_domicilio, calle, colonia, num_int, num_ext, cp, id_cmunicipio) VALUES
(1, 'av. toluca', 'olivar de los padres', 's/n', '212', '01780', 1),
(2, 'av. centenario', 'mina los coyotes', '1002', 's/n', '01619', 1),
(3, 'patricio sanz', 'col del valle centro', '1342', 's/n', '03100', 3),
(4, 'cjon. capulin', 'cuajimalpa', '10', 's/n', '05000', 5),
(5, 'c. ilama', 'pedregal de santo domingo', '233', 's/n', '04369', 4),
(6, 'tomas vazquez', 'san pedro iztacalco', '87', 's/n', '08220', 8),
(7, 'calle estrella mz 3 lote', 'el rodeo', 's/n', '43', '09860', 9),
(8, 'clavel', 'san jeronimo lidice', '18', 's/n', '10200', 10),
(9, 'heroe de nacozari', 'penitenciaria', '46', 's/n', '15350', 15),
(10, 'grañ anaya', 'presidentes de mexico', '21', 's/n', '09740', 9),
(11, 'chalcas', 'tezozmoc', '18', 's/n', '02459', 2),
(12, 'lago mask', 'anahuac', 's/n', '183', '11320', 11),
(13, 'cjon de las cruces', 'san jeronimo lidice', '67', 's/n', '10200', 10),
(14, 'cerro macuiltepec', 'campestre churubusco', '440', 's/n', '04200', 4),
(15, 'jacobo de lieja', 'agricola metropolitana', '24', '001', '03280', 13),
(16, '2a cda. de castorena', 'cuajimalpa', '283', 's/n', '05000', 5),
(17, 'primer cto. centenario', 'valentin gomez farias', '126', 's/n', '01640', 1),
(18, 'azcapotzalco la villa', 'popular heroes de churubusco', 's/n', '1257', '07300', 7),
(19, 'emperadores aztecas', 'san pedro iztacalco', '76', 's/n', '08220', 8),
(20, 'cerro libertad', 'campestre churubusco', '402', 's/n', '04200', 4),
(21, 'miguel dominguez', 'penitenciaria', '001', '007', '15350', 15),
(22, 'calle michoacan', 'villa milpa alta', '27', 's/n', '12000', 12),
(23, 'yukaltepec sur', 'cuchilla de padierna', '23', 's/n', '14220', 14),
(24, 'aguascalientes nte', 'villa milpa alta', '2', 's/n', '12000', 12),
(25, 'nicolas champion', 'miguel hidalgo', '143', 's/n', '13200', 13),
(26, 'av. rtno. ii', 'rinconada del sur', '36', 's/n', '16059', 16),
(27, 'av. rtno. ii', 'rinconada del sur', '187', 's/n', '16050', 16),
(28, 'republica de uruguay', 'centro', '5', '71', '06000', 6),
(29, 'c. 2', 'lomas de puerta grande', '69a', 's/n', '01630', 1),
(30, 'sinaloa', 'valentin gomez farias', '113', 's/n', '01569', 1);

--Tabla persona
insert into persona (id_persona, nombres, a_paterno, a_materno, telefono, correo, rfc, f_nacimiento, id_cgenero, id_domicilio) values (1, 'jo ann', 'scohier', 'mucklestone', '8722165204', 'jmucklestone0@amazon.com', 'ejng5485737k0', '1991-11-13', 2, 1);
insert into persona (id_persona, nombres, a_paterno, a_materno, telefono, correo, rfc, f_nacimiento, id_cgenero, id_domicilio) values (2, 'esdras', 'hadigate', 'jobson', '4886762488', 'ejobson1@phpbb.com', 'ahgf4467432d4', '1992-04-20', 2, 2);
insert into persona (id_persona, nombres, a_paterno, a_materno, telefono, correo, rfc, f_nacimiento, id_cgenero, id_domicilio) values (3, 'spense', 'brandone', 'noweak', '5684410946', 'snoweak2@whitehouse.gov', 'brux0449492a6', '1999-06-07', 1, 3);
insert into persona (id_persona, nombres, a_paterno, a_materno, telefono, correo, rfc, f_nacimiento, id_cgenero, id_domicilio) values (4, 'kristine', 'aish', 'wheeler', '6568953177', 'kwheeler3@patch.com', 'wxor8440164h4', '1993-10-03', 2, 4);
insert into persona (id_persona, nombres, a_paterno, a_materno, telefono, correo, rfc, f_nacimiento, id_cgenero, id_domicilio) values (5, 'karil', 'milstead', 'jeenes', '1059948025', 'kjeenes4@shutterfly.com', 'dury0289939p3', '1995-10-15', 2, 5);
insert into persona (id_persona, nombres, a_paterno, a_materno, telefono, correo, rfc, f_nacimiento, id_cgenero, id_domicilio) values (6, 'christy', 'mote', 'rembrandt', '2069858495', 'crembrandt5@livejournal.com', 'kiim3706294s0', '1992-12-25', 2, 6);
insert into persona (id_persona, nombres, a_paterno, a_materno, telefono, correo, rfc, f_nacimiento, id_cgenero, id_domicilio) values (7, 'karyl', 'robic', 'mackay', '3169504704', 'kmackay6@eventbrite.com', 'idxa7647744g0', '1999-01-04', 1, 7);
insert into persona (id_persona, nombres, a_paterno, a_materno, telefono, correo, rfc, f_nacimiento, id_cgenero, id_domicilio) values (8, 'viviene', 'issakov', 'pitherick', '4018452529', 'vpitherick7@domainmarket.com', 'bnzn9361248m2', '1995-10-08', 1, 8);
insert into persona (id_persona, nombres, a_paterno, a_materno, telefono, correo, rfc, f_nacimiento, id_cgenero, id_domicilio) values (9, 'melody', 'mallard', 'ackery', '8662291855', 'mackery8@examiner.com', 'heok1342777e8', '1992-02-08', 1, 9);
insert into persona (id_persona, nombres, a_paterno, a_materno, telefono, correo, rfc, f_nacimiento, id_cgenero, id_domicilio) values (10, 'eleonora', 'maple', 'putton', '1683387488', 'eputton9@hugedomains.com', 'dxrb4725517j7', '1999-06-09', 2, 10);
insert into persona (id_persona, nombres, a_paterno, a_materno, telefono, correo, rfc, f_nacimiento, id_cgenero, id_domicilio) values (11, 'ardelle', 'cellier', 'dargie', '3281927409', 'adargiea@domainmarket.com', 'tqmk5619234s3', '1999-11-02', 2, 11);
insert into persona (id_persona, nombres, a_paterno, a_materno, telefono, correo, rfc, f_nacimiento, id_cgenero, id_domicilio) values (12, 'allister', 'de pietri', 'chatelot', '8577890753', 'achatelotb@upenn.edu', 'dkfp6421735s0', '1992-07-11', 2, 12);
insert into persona (id_persona, nombres, a_paterno, a_materno, telefono, correo, rfc, f_nacimiento, id_cgenero, id_domicilio) values (13, 'dedra', 'tackle', 'frudd', '6195298911', 'dfruddc@chronoengine.com', 'fwbk0178208a2', '1994-04-30', 1, 13);
insert into persona (id_persona, nombres, a_paterno, a_materno, telefono, correo, rfc, f_nacimiento, id_cgenero, id_domicilio) values (14, 'brodie', 'riding', 'sheldrick', '1083970406', 'bsheldrickd@foxnews.com', 'kscr1867257s8', '1997-07-29', 2, 14);
insert into persona (id_persona, nombres, a_paterno, a_materno, telefono, correo, rfc, f_nacimiento, id_cgenero, id_domicilio) values (15, 'jewelle', 'waldock', 'baus', '1558956885', 'jbause@vimeo.com', 'pcwn7740875x6', '1990-03-31', 1, 15);
insert into persona (id_persona, nombres, a_paterno, a_materno, telefono, correo, rfc, f_nacimiento, id_cgenero, id_domicilio) values (16, 'ann', 'lording', 'ricco', '7774163323', 'ariccof@1688.com', 'jrsa4562692s9', '1999-07-19', 2, 16);
insert into persona (id_persona, nombres, a_paterno, a_materno, telefono, correo, rfc, f_nacimiento, id_cgenero, id_domicilio) values (17, 'lewie', 'langman', 'woodhouse', '1935425743', 'lwoodhouseg@flickr.com', 'mubs5891385h7', '1991-12-22', 2, 17);
insert into persona (id_persona, nombres, a_paterno, a_materno, telefono, correo, rfc, f_nacimiento, id_cgenero, id_domicilio) values (18, 'donia', 'barstock', 'pinchbeck', '8199351262', 'dpinchbeckh@stumbleupon.com', 'pgoq6275185f6', '1998-06-21', 2, 18);
insert into persona (id_persona, nombres, a_paterno, a_materno, telefono, correo, rfc, f_nacimiento, id_cgenero, id_domicilio) values (19, 'delcine', 'lyenyng', 'shevels', '9157886545', 'dshevelsi@stanford.edu', 'ldaq4065383p8', '1992-01-30', 2, 19);
insert into persona (id_persona, nombres, a_paterno, a_materno, telefono, correo, rfc, f_nacimiento, id_cgenero, id_domicilio) values (20, 'dur', 'pontain', 'grinyakin', '6422481388', 'dgrinyakinj@printfriendly.com', 'euef6856861o3', '1997-12-24', 2, 20);
insert into persona (id_persona, nombres, a_paterno, a_materno, telefono, correo, rfc, f_nacimiento, id_cgenero, id_domicilio) values (21, 'blithe', 'sheer', 'smorfit', '7315595735', 'bsmorfitk@boston.com', 'ceko5376920l4', '1990-04-06', 2, 21);
insert into persona (id_persona, nombres, a_paterno, a_materno, telefono, correo, rfc, f_nacimiento, id_cgenero, id_domicilio) values (22, 'wallie', 'soonhouse', 'serrels', '6645185362', 'wserrelsl@arizona.edu', 'yyor9413397o5', '1996-08-16', 1, 22);
insert into persona (id_persona, nombres, a_paterno, a_materno, telefono, correo, rfc, f_nacimiento, id_cgenero, id_domicilio) values (23, 'nerte', 'gopsall', 'caraher', '6361627484', 'ncaraherm@cnet.com', 'tacb8346895u4', '1993-05-02', 1, 23);
insert into persona (id_persona, nombres, a_paterno, a_materno, telefono, correo, rfc, f_nacimiento, id_cgenero, id_domicilio) values (24, 'bobbe', 'stokell', 'epps', '2469867925', 'beppsn@bigcartel.com', 'kssq9685917u1', '1994-03-15', 2, 24);
insert into persona (id_persona, nombres, a_paterno, a_materno, telefono, correo, rfc, f_nacimiento, id_cgenero, id_domicilio) values (25, 'raye', 'oboy', 'hallad', '5774151369', 'rhallado@shutterfly.com', 'cppv0809335h2', '1998-09-01', 1, 25);
insert into persona (id_persona, nombres, a_paterno, a_materno, telefono, correo, rfc, f_nacimiento, id_cgenero, id_domicilio) values (26, 'james', 'yanyushkin', 'rowbottam', '2536333762', 'jrowbottamp@yolasite.com', 'hima5494000q1', '1990-12-23', 1, 26);
insert into persona (id_persona, nombres, a_paterno, a_materno, telefono, correo, rfc, f_nacimiento, id_cgenero, id_domicilio) values (27, 'leona', 'causon', 'bellay', '8851040735', 'lbellayq@geocities.jp', 'qnmi1852134y0', '1999-01-15', 2, 27);
insert into persona (id_persona, nombres, a_paterno, a_materno, telefono, correo, rfc, f_nacimiento, id_cgenero, id_domicilio) values (28, 'jo-anne', 'tolson', 'ertelt', '8152787626', 'jerteltr@diigo.com', 'olpz5660598v3', '1997-08-30', 2, 28);
insert into persona (id_persona, nombres, a_paterno, a_materno, telefono, correo, rfc, f_nacimiento, id_cgenero, id_domicilio) values (29, 'kaylyn', 'doerffer', 'denniss', '6989944676', 'kdennisss@paypal.com', 'tdfy9966154h0', '1997-02-02', 2, 29);
insert into persona (id_persona, nombres, a_paterno, a_materno, telefono, correo, rfc, f_nacimiento, id_cgenero, id_domicilio) values (30, 'novelia', 'lafaye', 'hoovart', '5725593698', 'nhoovartt@chron.com', 'ynpv4662697w0', '1991-09-12', 1, 30);

--Tabla cliente
insert into cliente (id_cliente,id_persona) values (1,16);
insert into cliente (id_cliente,id_persona) values (2,17);
insert into cliente (id_cliente,id_persona) values (3,18);
insert into cliente (id_cliente,id_persona) values (4,19);
insert into cliente (id_cliente,id_persona) values (5,20);
insert into cliente (id_cliente,id_persona) values (6,21);
insert into cliente (id_cliente,id_persona) values (7,22);
insert into cliente (id_cliente,id_persona) values (8,23);
insert into cliente (id_cliente,id_persona) values (9,24);
insert into cliente (id_cliente,id_persona) values (10,25);
insert into cliente (id_cliente,id_persona) values (11,26);
insert into cliente (id_cliente,id_persona) values (12,27);
insert into cliente (id_cliente,id_persona) values (13,28);
insert into cliente (id_cliente,id_persona) values (14,29);
insert into cliente (id_cliente,id_persona) values (15,30);

--Tabla tipo_cliente
insert into tipo_cliente (id_tp_cliente,id_ccliente, id_cliente) values (1,1, 1);
insert into tipo_cliente (id_tp_cliente,id_ccliente, id_cliente) values (2,2, 2);
insert into tipo_cliente (id_tp_cliente,id_ccliente, id_cliente) values (3,2, 3);
insert into tipo_cliente (id_tp_cliente,id_ccliente, id_cliente) values (4,2, 4);
insert into tipo_cliente (id_tp_cliente,id_ccliente, id_cliente) values (5,1, 5);
insert into tipo_cliente (id_tp_cliente,id_ccliente, id_cliente) values (6,1, 6);
insert into tipo_cliente (id_tp_cliente,id_ccliente, id_cliente) values (7,2, 7);
insert into tipo_cliente (id_tp_cliente,id_ccliente, id_cliente) values (8,2, 8);
insert into tipo_cliente (id_tp_cliente,id_ccliente, id_cliente) values (9,1, 9);
insert into tipo_cliente (id_tp_cliente,id_ccliente, id_cliente) values (10,2, 10);
insert into tipo_cliente (id_tp_cliente,id_ccliente, id_cliente) values (11,1, 11);
insert into tipo_cliente (id_tp_cliente,id_ccliente, id_cliente) values (12,2, 12);
insert into tipo_cliente (id_tp_cliente,id_ccliente, id_cliente) values (13,1, 13);
insert into tipo_cliente (id_tp_cliente,id_ccliente, id_cliente) values (14,1, 14);
insert into tipo_cliente (id_tp_cliente,id_ccliente, id_cliente) values (15,1, 15);

--Tabla empleados
insert into empleados (id_empleado,fecha_i,fecha_f,nss,id_carea,id_crol,id_chorario,id_persona)
VALUES (1,'Aug 19, 2021', NULL,546097348624,1,1,1,1);
insert into empleados (id_empleado,fecha_i,fecha_f,nss,id_carea,id_crol,id_chorario,id_persona)
VALUES(2,'Jul 1, 2021',NULL,546097348969,2,2,2,2);
insert into empleados (id_empleado,fecha_i,fecha_f,nss,id_carea,id_crol,id_chorario,id_persona)
VALUES (3,'Jan 3, 2022',NULL,546097349314,3,3,1,3);
insert into empleados (id_empleado,fecha_i,fecha_f,nss,id_carea,id_crol,id_chorario,id_persona)
VALUES(4,'Nov 29, 2021',NULL,546097349659,4,4,2,4);
insert into empleados (id_empleado,fecha_i,fecha_f,nss,id_carea,id_crol,id_chorario,id_persona)
VALUES(5,'Jul 25, 2021','Feb 20, 2022',546097350004,5,5,1,5);
insert into empleados (id_empleado,fecha_i,fecha_f,nss,id_carea,id_crol,id_chorario,id_persona)
VALUES (6,'Apr 17, 2022',NULL,546097350349,6,6,1,6);
insert into empleados (id_empleado,fecha_i,fecha_f,nss,id_carea,id_crol,id_chorario,id_persona)
VALUES (7,'Jan 16, 2022','Aug 23, 2021',546097350694,6,7,1,7);
insert into empleados (id_empleado,fecha_i,fecha_f,nss,id_carea,id_crol,id_chorario,id_persona)
VALUES (8,'Jul 29, 2021',NULL,546097351039,1,8,2,8);
insert into empleados (id_empleado,fecha_i,fecha_f,nss,id_carea,id_crol,id_chorario,id_persona)
VALUES (9,'Feb 5, 2022',NULL,546097351384,2,1,1,9);
insert into empleados (id_empleado,fecha_i,fecha_f,nss,id_carea,id_crol,id_chorario,id_persona)
VALUES (10,'Nov 18, 2021',NULL,546097351729,3,2,2,10);
insert into empleados (id_empleado,fecha_i,fecha_f,nss,id_carea,id_crol,id_chorario,id_persona)
VALUES (11,'Nov 12, 2021','Apr 3, 2022',546097352074,4,3,1,11);
insert into empleados (id_empleado,fecha_i,fecha_f,nss,id_carea,id_crol,id_chorario,id_persona)
VALUES (12,'Oct 28, 2021',NULL,546097352419,5,4,2,12);
insert into empleados (id_empleado,fecha_i,fecha_f,nss,id_carea,id_crol,id_chorario,id_persona)
VALUES (13,'Feb 22, 2022',NULL,546097352764,6,5,1,13);
insert into empleados (id_empleado,fecha_i,fecha_f,nss,id_carea,id_crol,id_chorario,id_persona)
VALUES (14,'Apr 20, 2022','Nov 26, 2021',546097353109,6,6,1,14);
insert into empleados (id_empleado,fecha_i,fecha_f,nss,id_carea,id_crol,id_chorario,id_persona)
VALUES (15,'Jul 25, 2021',NULL,546097353454,5,7,2,15);

--Tabla cita
INSERT INTO cita(fecha, hora, id_casis, id_tp_cliente) VALUES
('2022/02/02', '10:30:00', 2, 4),
('2021/01/12', '09:30:00', 2, 2),
('2021/12/12', '09:00:00', 3, 15),
('2022/09/02', '12:30:00', 2, 3),
('2022/05/04', '16:30:00', 2, 5),
('2022/03/04', '08:30:00', 2, 7),
('2021/04/12', '10:30:00', 2, 10),
('2022/07/03', '10:00:00', 2, 1),
('2022/08/01', '11:30:00', 3, 8),
('2022/03/02', '08:30:00', 3, 11),
('2022/05/01', '10:00:00', 2, 13),
('2022/05/02', '13:00:00', 2, 14),
('2022/07/03', '17:30:00', 3, 12),
('2022/04/02', '18:00:00', 3, 6),
('2021/10/12', '10:30:00', 2, 9),
('2022/05/07', '18:00:00', 1, 15),
('2022/06/05', '18:00:00', 1, 8),
('2022/01/06', '18:00:00', 1, 11);

--Tabla deuda
INSERT INTO deuda (id_deuda,f_ini_pago,f_fin_pago,valor_deuda,tasa_interes,id_temporalidad,id_cst_deuda,id_cforma_compra)
VALUES
  (1,'2022-02-06','2022-01-19',1,2,1,1,1),
  (2,'2022-04-10','2022-03-14',10,2,2,2,2),
  (3,'2022-03-10','2022-02-09',1,1,3,3,3),
  (4,'2022-04-01','2022-01-18',7,2,4,2,1),
  (5,'2022-04-17','2022-04-14',2,1,5,1,3),
  (6,'2022-03-30','2022-03-23',7,2,6,2,3),
  (7,'2022-02-08','2022-02-01',3,1,7,1,2),
  (8,'2022-03-09','2022-01-31',3,2,8,2,3),
  (9,'2022-01-20','2022-04-05',3,1,9,2,3),
  (10,'2022-03-20','2022-02-03',6,2,10,3,1),
  (11,'2022-04-16','2022-03-06',5,1,11,3,2),
  (12,'2022-01-14','2022-01-26',2,1,12,2,3),
  (13,'2022-02-19','2022-02-12',7,1,13,3,3),
  (14,'2022-02-02','2022-04-17',1,2,14,1,2),
  (15,'2022-04-13','2022-03-15',2,2,15,1,1);

--Tabla contrato_compra
INSERT INTO contrato_compra (id_cont_com,fecha_pago,fecha_emi_com,id_cf_pago,id_cst_pago,id_cliente,no_serie,id_empleado)
VALUES
  (1,'2022-04-13','2022-03-18',1,1,1,'1quhb63rpbf841293',1),
  (2,'2022-01-18','2022-04-19',2,2,2,'2ldja54kiju106918',2),
  (3,'2022-03-18','2022-01-18',3,3,3,'4eglx51tidx410873',3),
  (4,'2022-03-12','2022-04-06',1,1,4,'8bpzx29mmhg472488',4),
  (5,'2022-04-10','2022-03-23',2,2,5,'1kcmr92dkuh957461',5),
  (6,'2022-03-30','2022-04-07',3,3,6,'7pujb52ckyt187143',6),
  (7,'2022-01-29','2022-03-23',1,1,7,'7dlth75fpif818482',7),
  (8,'2022-01-02','2022-01-07',2,2,8,'4yrrm86sidl143922',8),
  (9,'2022-02-14','2022-01-03',3,3,9,'5lyyv66left046373',9),
  (10,'2022-03-15','2022-03-13',1,1,10,'7luot78urhj636781',10),
  (11,'2022-01-07','2022-01-05',2,2,11,'9ieqr58twek360755',11),
  (12,'2022-02-17','2022-01-13',3,3,12,'6anyr14mscs262114',12),
  (13,'2022-01-31','2022-02-03',1,1,13,'3crid74pvxi362803',13),
  (14,'2022-01-22','2022-02-19',2,2,14,'3krdt28vgft163635',14),
  (15,'2022-02-06','2022-01-14',3,3,15,'8uale26omjh398662',15);

--Tabla contrato_venta
INSERT INTO contrato_venta (id_cont_venta,fecha_emi_com,id_deuda,no_serie,id_empleado,id_cliente)
VALUES
  (1,'2022-04-03',1,'1quhb63rpbf841293',1,1),
  (2,'2022-01-21',2,'2ldja54kiju106918',2,2),
  (3,'2022-02-12',3,'4eglx51tidx410873',3,3),
  (4,'2022-04-14',4,'8bpzx29mmhg472488',4,4),
  (5,'2022-02-17',5,'1kcmr92dkuh957461',5,5),
  (6,'2022-01-30',6,'7pujb52ckyt187143',6,6),
  (7,'2022-02-24',7,'7dlth75fpif818482',7,7),
  (8,'2022-03-27',8,'4yrrm86sidl143922',8,8),
  (9,'2022-02-08',9,'5lyyv66left046373',9,9),
  (10,'2022-01-31',10,'7luot78urhj636781',10,10),
  (11,'2022-02-06',11,'9ieqr58twek360755',11,11),
  (12,'2022-02-28',12,'6anyr14mscs262114',12,12),
  (13,'2022-01-21',13,'3crid74pvxi362803',13,13),
  (14,'2022-03-21',14,'3krdt28vgft163635',14,14),
  (15,'2022-03-24',15,'8uale26omjh398662',15,15);

--Tabla factura
INSERT INTO factura (id_factura,id_cont_venta)
VALUES
  (1,1),
  (2,2),
  (3,3),
  (4,4),
  (5,5),
  (6,6),
  (7,7),
  (8,8),
  (9,9),
  (10,10),
  (11,11),
  (12,12),
  (13,13),
  (14,14),
  (15,15);

-----------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------