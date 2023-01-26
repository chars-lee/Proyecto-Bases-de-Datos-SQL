--###############################################################################################################################
---------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------- FUNCIONES ----------------------------------------------------------- 
---------------------------------------------------------------------------------------------------------------------------------
--###############################################################################################################################



------- #####  FUNCION QUE DEVUELVE UN VALOR ############################################################################################################
-- Mostrar el valor de la deuda acumulada por año
CREATE FUNCTION fnc_valordeuda(
paño       NUMERIC
)
RETURNS DECIMAL
AS
$$

DECLARE vresultado DECIMAL;

BEGIN
IF paño = 2021 THEN
    vresultado = (SELECT SUM(valor_deuda) FROM deuda WHERE EXTRACT(YEAR FROM f_ini_pago) = 2021);
    ELSE IF paño = 2022 THEN
        vresultado = (SELECT SUM(valor_deuda) FROM deuda WHERE EXTRACT(YEAR FROM f_ini_pago) = 2022);
        ELSE vresultado = 0;
    end if;
    end if;
   RETURN vresultado;
END;

$$
LANGUAGE 'plpgsql' VOLATILE;

SELECT * FROM fnc_valordeuda(2021);
SELECT * FROM fnc_valordeuda(2022);
------- #####  FUNCION QUE DEVUELVE UNA TABLA ###########################################################################################################
-- Deacuerdo a la marca,el intervalo en meses (del mes1 al mes2) y año especificado que ingrese el usuario, se mostrara a los vehiculos vendidos en ese intervalo de
-- tiempo de la marca especificada, mostrando no_serie, placas, marca, modelo, precio de venta y la suma total del precio de venta de todos los
-- vehiculos mostrados
CREATE OR REPLACE FUNCTION fnc_vehi_ven_por_marca_y_cuatri(
pmarca VARCHAR(17),
pmes1 INTEGER,
pmes2 INTEGER,
panio INTEGER
) ---,v v.precio_ven,SUM(v.precio_ven) OVER() suma_total_deudas
RETURNS  TABLE (ofe_venta_vehi DATE, ono_seire VARCHAR(17), oplacas VARCHAR(10),omarca VARCHAR(10), omodelo VARCHAR(20),oprecio_ven INTEGER, osuma_total_deudas BIGINT)
AS
$$
DECLARE vmarca VARCHAR(17);
        vmes1 INTEGER;
        vmes2 INTEGER;
        vanio INTEGER;
BEGIN
    vmarca = pmarca;
    vmes1 = pmes1;
    vmes2 = pmes2;
    vanio = panio;
    RETURN QUERY ( SELECT v.fe_venta_vehi,v.no_serie,v.placas, cmarca.marca, c.modelo, v.precio_ven,SUM(v.precio_ven) OVER() suma_total_deudas
                   FROM cmarca JOIN cmodelo c on cmarca.id_cmarca = c.id_cmarca
                               JOIN vehiculo v on c.id_cmodelo = v.modelo
                  WHERE cmarca.marca = vmarca AND (DATE_PART('MONTH', CAST( v.fe_venta_vehi AS DATE)) BETWEEN vmes1 AND vmes2 ) AND v.status = 2
                                              AND DATE_PART('YEAR', CAST( v.fe_venta_vehi AS DATE)) = vanio
                  ORDER BY v.fe_venta_vehi );
END;
$$
LANGUAGE 'plpgsql' VOLATILE;


    ---- vehiculos vendidos de la marca honda en el primer trimestre del 2022
         SELECT *
         FROM fnc_vehi_ven_por_marca_y_cuatri('honda',1,3,2022);


------- #####  FUNCION QUE REALIZA UNA UNA ACCION #######################################################################################################
-- Debido a que el proceso para determinar el precio del vehiculo pueden cambiar constantemente gracias
-- a las reparaciones que se le pueden ir haciendo. Se creara una función que inserte en la tabla
-- vehiculo_ajustes el nuevo ajuste y ademas sumarle el precio al costo del vehiculo

CREATE OR REPLACE FUNCTION fnc_ajuste_ve_act_costo_ve(
pid_vehiculo      INTEGER,
pid_ajuste        INTEGER,
pcosto            NUMERIC
)
RETURNS  TABLE (oid_vehiculo INTEGER, oprecio_com INTEGER, oid_ajuste INTEGER, ocosto NUMERIC)
AS
$$
DECLARE vid_ve_aj  INTEGER;
        vid_vehiculo  INTEGER;
		vid_ajuste INTEGER;
        vcosto     NUMERIC;

BEGIN
vid_ve_aj = ((SELECT MAX(id_vehiculo_ajustes) FROM vehiculo_ajustes) + 1 );
vid_vehiculo = pid_vehiculo;
vid_ajuste = pid_ajuste;
vcosto = pcosto;

     INSERT INTO vehiculo_ajustes (id_vehiculo_ajustes,id_vehiculo,id_ajuste,costo)
                 VALUES(vid_ve_aj , vid_vehiculo, vid_ajuste, vcosto);

     UPDATE vehiculo SET precio_com = precio_com + CAST(vcosto AS INTEGER)
	 WHERE id_vehiculo = vid_vehiculo ;

     RETURN QUERY ( SELECT vehiculo.id_vehiculo, vehiculo.precio_com, vehiculo_ajustes.id_ajuste,
				           vehiculo_ajustes.costo
			   	    FROM vehiculo_ajustes JOIN vehiculo ON vehiculo_ajustes.id_vehiculo = vehiculo.id_vehiculo
				    WHERE vehiculo.id_vehiculo = vid_vehiculo
				    ORDER BY vehiculo_ajustes.id_vehiculo_ajustes DESC
				    LIMIT 1);
END;
$$
LANGUAGE 'plpgsql' VOLATILE;



SELECT *
FROM fnc_ajuste_ve_act_costo_ve(900,6,1000)











