USE vestuario;

/* 1) Cree un procedimiento almacenado llamado "pa_traje_prenda" que seleccione el codigo, nombre del traje,
 codigo de la prenda, nombre de la prenda y el stock de aquellas prendas que tengan un stock superior o igual
 al enviado como parámetro. Ejecute el procedimiento creado anteriormente */
DROP PROCEDURE IF EXISTS pa_traje_prenda;
DELIMITER //
CREATE PROCEDURE pa_traje_prenda (in stockMinimo int)
BEGIN 
SELECT t.idtraje, t.nombre, p.codprenda, p.nombre, p.stock FROM traje t 
JOIN trapre tp ON t.idtraje = tp.codTraje  
JOIN prenda p ON tp.codPrenda = p.codprenda
WHERE (p.stock >= stockMinimo);
END //

DELIMITER ;
call pa_traje_prenda(10);

/* 2) Cree un procedimiento almacenado llamado "pa_prendas_actualizar_stock", este procedimiento debera tener dos parametros, 
el primero se pasara el codigo de la prenda y en el segundo el nuevo valor del stock. 
El prodecimiento debera actualizar la prenda con el nuevo valor de stock informado */
DROP PROCEDURE IF EXISTS pa_prendas_actualizar_stock;
DELIMITER //
CREATE PROCEDURE pa_prendas_actualizar_stock (in codigoPrenda int, in nuevoStock int)
BEGIN
UPDATE prenda SET stock = nuevoStock
WHERE codprenda = codigoPrenda;
END //

DELIMITER ;
call pa_prendas_actualizar_stock(2125,25);

/* 3) Cree un procedimiento almacenado llamado "pa_obra" al cual le enviamos el codigo de una obra y que nos retorne
 la cantidad de trajes que tiene esa obra en un parametro de salida. Ejecute el procedimiento creado anteriormente. */
DROP PROCEDURE IF EXISTS pa_obra;
DELIMITER //
CREATE PROCEDURE pa_obra (in codigoObra int, out cantTrajes int)
BEGIN
SELECT COUNT(*) INTO cantTrajes 
FROM obratraje
WHERE idObra = codigoObra;
END //

DELIMITER ;
SET @cantidad_trajes = 0;
CALL pa_obra(8862, @cantidad_trajes);
SELECT @cantidad_trajes AS Cantidad_de_Trajes;

/* 4) Implementar una funcion que llamada f_codificado que recibe el nombre de la obra y que nos retorne el nombre de la obra codificado
 con *** al final. (Resolver utilizando alguna herramienta de IA y copiar las respuestas obtenidas hasta su resolución)
 Ejemplo recibe El hombre del maletin y debe devolver El hombre del male***
 Ejecute la funcion  */
DROP FUNCTION IF EXISTS f_codificado;
DELIMITER //
CREATE FUNCTION f_codificado(nombre_obra VARCHAR(45))
RETURNS VARCHAR(45)
DETERMINISTIC -- la función siempre produce el mismo resultado para los mismos parámetros, lo que le permite optimizar su uso.
BEGIN
    DECLARE nombre_codificado VARCHAR(45);
    -- Verificar que el nombre de la obra tenga al menos 3 caracteres
    IF LENGTH(nombre_obra) > 3 THEN
        SET nombre_codificado = CONCAT(LEFT(nombre_obra, LENGTH(nombre_obra) - 3), '***');
    ELSE
        -- Si el nombre de la obra tiene 3 caracteres o menos, retorna solo asteriscos
        SET nombre_codificado = '***';
    END IF;
    RETURN nombre_codificado;
END //
DELIMITER ;
SELECT f_codificado('Practica Formativa') AS Nombre_Codificado;

/* 5) Crear una “VISTA", que le permita visualizar cada obra, con el traje y la cantidad de prendas que contiene */
CREATE OR REPLACE VIEW vista_obra_traje_prendas AS
SELECT o.nombre Obra, t.nombre Traje, COUNT(tp.codPrenda) Prendas  FROM obra o 
JOIN obratraje ot ON o.idobra = ot.idobra
JOIN traje t ON ot.idtraje = t.idtraje
JOIN traPre tp ON t.idtraje = tp.codTraje
GROUP BY o.idObra, t.idtraje;

SELECT * FROM vista_obra_traje_prendas;