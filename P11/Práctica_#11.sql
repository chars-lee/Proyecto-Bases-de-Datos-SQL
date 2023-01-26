------------------------------------------------------ Práctica #11 --------------------------------------------------------
------------------------------------------------------- Equipo 10 ----------------------------------------------------------
----------------------------------------------- PROCEDIMIENTOS ALACENADOS --------------------------------------------------

-- 1 ### 
-- Actualizar el precio de venta una vez se determine el mismo, con el objetivo de tener en claro
-- plusvalia que se obtendra a la hora de vender, y ademas regresar la tabla vehiculo, con no_serie
-- y precio_ven, con el objetivo de verificar que ya esta actualizado el precio
CREATE OR REPLACE FUNCTION fnc_actualizacion_precios(
pno_seire VARCHAR(17),
pprecio_ven INTEGER
)
RETURNS  TABLE (ono_serie VARCHAR(17), oprecio_ven INTEGER)
AS
$$
DECLARE vno_serie VARCHAR(17);
--        vp_ven INTEGER;
BEGIN
    vno_serie = pno_seire ;
    UPDATE vehiculo SET precio_ven = pprecio_ven WHERE no_serie = vno_serie ;
    RETURN QUERY ( SELECT no_serie, precio_ven
			   	   FROM vehiculo
				   WHERE no_serie = vno_serie );
END;
$$
LANGUAGE 'plpgsql' VOLATILE;

  -- checamos nuestra tabla vehiculo para verificar que hasta este punto 
  -- nuestro vehiculo con no_serie "9ieqr58twek360755" en el puesto 
  -- 18 tiene precio_ven NULL
  SELECT no_serie, precio_com,precio_ven
  FROM vehiculo
  ORDER BY no_serie asc;
  -- Ejecutamos nuestra función
  SELECT *
  FROM fnc_actualizacion_precios('6anyr14mscs262114',1234567)

-- 2 ### 
--Crear una función que pueda actualizar modelos descontinuados y en su lugar, reemplazarlos con un modelo nuevo, 
--debiendo agregar el id del carro descontinuado, así como el nombre, la marca, y el tipo del auto cono modelo nuevo.

CREATE OR REPLACE FUNCTION fnc_actualizar_modelo
(id_modelo_viejo integer,
modelo_nuevo VARCHAR(20),
marca_auto VARCHAR(20),
tipo_auto VARCHAR(15))
RETURNS VARCHAR (20)
AS
$$
DECLARE estatus_insercion VARCHAR(30);
BEGIN
IF((SELECT COUNT(*)
    FROM cmodelo
    WHERE modelo=modelo_nuevo)=0)
THEN
    UPDATE cmodelo
SET modelo=modelo_nuevo, id_cmarca=(SELECT id_cmarca
FROM cmarca
WHERE marca=marca_auto), id_ctipo=(SELECT id_ctipo
FROM ctipo
WHERE tipo=tipo_auto)
WHERE id_cmodelo=id_modelo_viejo;
estatus_insercion = 'Se_agregó_el_modelo';
    ELSE
estatus_insercion = 'Ya_existe_el_modelo';
END IF;
RETURN estatus_insercion;
END;
$$
LANGUAGE 'plpgsql';

SELECT * FROM
fnc_actualizar_modelo(25,'12 HP','fiat','suv');

-- 3 ### 
-- SP que actualiza la deuda de un cliente, si hay una registrada
CREATE OR REPLACE FUNCTION fnc__actualizar_deuda_vehiculo
(id_deuda_actual integer,
f_ini_pa DATE,
f_fin_pa DATE,
deuda_actualizada numeric,
tasa_i numeric,
id_temporalidad_actual integer,
id_estado_deuda_actual integer,
id_forma_compra integer)
RETURNS VARCHAR(30)
AS
$$
DECLARE estado_insercion VARCHAR(30);
BEGIN
IF((SELECT COUNT(*)
    FROM deuda
    WHERE valor_deuda=deuda_actualizada)=0)
THEN UPDATE deuda
SET valor_deuda=deuda_actualizada,
    id_cst_deuda=(SELECT id_cst_deuda
    FROM cstatus_deuda
WHERE deuda.id_cst_deuda=id_estado_deuda_actual),
    id_cforma_compra=(SELECT id_cforma_compra
    FROM cforma_compra
WHERE id_cforma_compra= id_forma_compra), id_deuda=(SELECT id_deuda
    FROM deuda
WHERE id_deuda= id_deuda_actual),f_ini_pago=(SELECT f_ini_pago
    FROM deuda
WHERE f_ini_pago= f_ini_pa),
  f_fin_pago=(SELECT f_fin_pago
    FROM deuda
WHERE f_fin_pago= f_fin_pa),
   tasa_interes=(SELECT tasa_interes
    FROM deuda
WHERE tasa_interes= tasa_i),
id_temporalidad=(SELECT id_temporalidad
    FROM deuda
WHERE id_temporalidad= id_temporalidad_actual);
estado_insercion = 'Se_actualizo_deuda';
ELSE
estado_insercion = 'Ya_existe_deuda';
end if;
RETURN estado_insercion;
END;
    $$
LANGUAGE 'plpgsql';

SELECT * FROM fnc__actualizar_deuda_vehiculo(15, '2022-04-13','2022-03-15', 1, 2, 15, 1, 1);

-- 4 ### 
CREATE OR REPLACE FUNCTION SP_inserta_datos_nuevo_cliente
(nombre VARCHAR(50),
ap_paterno VARCHAR(50),
ap_materno VARCHAR(50),
telefono VARCHAR(20),
correo VARCHAR(40),
rfc VARCHAR(20),
nacimiento INTEGER)

RETURNS VARCHAR(30)
AS
$$
    DECLARE id_cliente_calculado INTEGER;
    DECLARE estatus_insercion VARCHAR(25);
    BEGIN
    IF ((SELECT COUNT(*)
        FROM persona
        WHERE nombres = nombre
        AND a_paterno = ap_paterno
        AND a_materno = ap_materno) = 0)
        THEN
        id_cliente_calculado = CASE
            WHEN ((SELECT MAX(id_persona)
            FROM persona) IS NOT NULL)
            THEN (SELECT MAX(id_persona)
            FROM persona) + 1
            ELSE 1
            END;
        INSERT INTO persona VALUES (nombre, ap_paterno, ap_materno, telefono, correo,
                                    rfc, nacimiento);
        estatus_insercion = 'insercion_exitosa';
        ELSE
        estatus_insercion = 'la_persona_ya_existe';
        END IF;
    RETURN estatus_insercion;
    END;
$$

LANGUAGE 'plpgsql';

--  5### 
-- Debido a que el proceso para determinar el precio del vehiculo pueden cambiar constantemente gracias 
-- a las reparaciones que se le pueden ir haciendo. Se creara una función que inserte en la tabla 
-- vehiculo_ajustes el nuevo ajuste y ademas sumarle el precio al costo del vehiculo
--
CREATE OR REPLACE FUNCTION fnc_ajuste_ve_act_costo_ve(
pno_serie         VARCHAR(17),
pid_ajuste        INTEGER,
pcosto            NUMERIC
)
RETURNS  TABLE (ono_serie VARCHAR(17), oprecio_ven INTEGER, oid_ajuste INTEGER, ocosto NUMERIC)
AS
$$
DECLARE vid_ve_aj  INTEGER;
        vno_serie  VARCHAR(17);
		vid_ajuste INTEGER;
        vcosto     NUMERIC;

BEGIN
vid_ve_aj = ((SELECT MAX(id_vehiculo_ajustes) FROM vehiculo_ajustes) + 1 );
vno_serie = pno_serie;
vid_ajuste = pid_ajuste;
vcosto = pcosto;

     INSERT INTO vehiculo_ajustes (id_vehiculo_ajustes,no_serie,id_ajuste,costo)
                 VALUES(vid_ve_aj , vno_serie, vid_ajuste, vcosto);

     UPDATE vehiculo SET precio_com = precio_com + CAST(vcosto AS INTEGER) 
	 WHERE no_serie = vno_serie ;
	 
     RETURN QUERY ( SELECT vehiculo.no_serie, vehiculo.precio_com, vehiculo_ajustes.id_ajuste,
				           vehiculo_ajustes.costo
			   	    FROM vehiculo_ajustes JOIN vehiculo ON vehiculo_ajustes.no_serie = vehiculo.no_serie
				    WHERE vehiculo.no_serie = vno_serie 
				    ORDER BY vehiculo_ajustes.id_vehiculo_ajustes DESC
				    LIMIT 1);
END;
$$
LANGUAGE 'plpgsql' VOLATILE;

   ------- "0ckma24abpd411748"   --- precio_com = 537290 (la primera tupla)
   SELECT no_serie, precio_com
   FROM vehiculo
   ORDER BY no_serie asc;
   ----- tabla vehiculo_ajustes
   SELECT *
   FROM vehiculo_ajustes
   ORDER BY id_vehiculo_ajustes DESC;




SELECT *
FROM fnc_ajuste_ve_act_costo_ve('0ckma24abpd411748',3,10)
