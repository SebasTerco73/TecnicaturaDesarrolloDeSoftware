/* 1) El dueño del taller quiere saber cual es el monto total que cada cliente debe abonar al asistir al taller.
El informe debe mostrar nombre, apellido, teléfono y monto */
	SELECT c.Nombre, c.Apellido, c.tel, p.Monto FROM cliente c 
	Join vehiculo v ON c.codC = v.codC
	JOIN ficha f ON v.codVEH = f.codVEH
	JOIN presup p ON f.codF = p.codF;

-- 2) Tomando la consulta del punto 1, se pide mostrar al cliente o clientes que abona el monto menor.
	SELECT c.Nombre, c.Apellido, c.tel, p.Monto FROM cliente c 
	Join vehiculo v ON c.codC = v.codC
	JOIN ficha f ON v.codVEH = f.codVEH
	JOIN presup p ON f.codF = p.codF
    WHERE p.Monto = (SELECT MIN(p.Monto) FROM cliente c
    Join vehiculo v ON c.codC = v.codC
	JOIN ficha f ON v.codVEH = f.codVEH
	JOIN presup p ON f.codF = p.codF);
    
-- 3) Identificar cual o cuales fueron los mecánicos que diagnostican que realizaron  la mayor cantidad de revisiones.
    SELECT m.codMec, m.Nombre, m.Apellido, COUNT(fmd.codF) AS "Cantidad Revisiones" FROM mecanico m
    JOIN mecdiag mg ON m.codMec = mg.codMec JOIN fichamd fmd ON mg.codMD = fmd.codMD 
    WHERE m.repara = 0 GROUP BY m.codMec HAVING COUNT(fmd.codF) = (SELECT MAX(revisiones) FROM
    (SELECT COUNT(fmd.codF) revisiones  FROM mecanico m JOIN mecdiag md ON m.codMec = md.codMec
    JOIN fichamd fmd ON md.codMD = fmd.codMD WHERE m.repara = 0 GROUP BY m.codMec) maximoRevisiones);
    
-- 4) Mostrar los datos relevantes de los repuestos que fueron usados en todos los presupuestos.
	SELECT r.codRep, r.Nombre, r.stock, r.PP, r.precio, r.Unidad 
    FROM repuesto r	JOIN presurep pr ON r.codRep = pr.codRep 
    -- hasta aca muestra los repuestos usados al menos 1 vez
    /* agregando lo siguiente muestra los repuestos usados en TODOS los presupuestos ->
    ningun repuesto fue usado en todos los presupuestos*/
	GROUP BY r.codRep, r.Nombre, r.stock, r.PP, r.precio, r.Unidad
	HAVING COUNT(DISTINCT pr.Npresup) = (SELECT COUNT(DISTINCT NPresup) FROM presup);
    
/* 5) El dueño del taller debe comprar los repuestos y necesita un listado que muestre el nombre, la cantidad,
   el precio unitario y el total. El listado debe estar ordenado por nombre. */
   SELECT r.Nombre, pr.cant, r.Precio, (pr.cant * r.Precio) Total 
   FROM repuesto r JOIN presurep pr ON r.codRep = pr.codRep 
   ORDER BY r.Nombre;
   
   /* 6) Obtener un listado que muestre nombre, apellido del cliente y una columna con el llamada mensaje.
	Esa columna debe decir Sin vehículo registrado y Con vehículo registrado. 
    La lógica es la siguiente si el cliente no registro ningún vehículo o si el cliente registro por lo menos uno.*/
		SELECT c.Nombre, c.Apellido, IF (v.codVEH IS NULL, 'Sin vehículo registrado', 'Con vehículo registrado') AS Mensaje
        FROM cliente c LEFT JOIN vehiculo v ON c.codC = v.codC;
        
  /*  7) Mostrar en un listado los arreglos que usan por lo menos un repuesto cuyo precio unitario es menor que el promedio de precios de todos los repuestos.
      El  listado debe mostrar matricula del vehículo, teléfono del cliente, y el monto a abonar en concepto de repuestos. */
      SELECT v.Matricula, c.tel, SUM(r.precio * pr.cant) Monto FROM repuesto r
	  JOIN presurep pr ON r.codRep = pr.codRep JOIN presup p ON pr.NPresup = p.NPresup
	  JOIN ficha f ON p.codF = f.codF JOIN vehiculo v ON f.codVEH = v.codVEH
	  JOIN cliente c ON v.codC = c.codC WHERE r.precio < (SELECT AVG(precio) FROM repuesto)
	  GROUP BY v.Matricula, c.tel;
      
  -- 8) Mostrar los clientes registrados que aún no tienen ingreso en el taller para un diagnóstico.
	SELECT c.*
    FROM cliente c
    LEFT JOIN vehiculo v ON c.codC = v.codC
    LEFT JOIN ficha f ON v.codVEH = f.codVEH
    WHERE f.codF IS NULL;
  
/* 9)  Obtener un listado ordenado por apellido de los mecánicos y el tipo. El tipo esta definido con el atributo repara.
       Para mostrar el listado se pide armar dos select y aplicar la función unión.  */
       SELECT Apellido, "No repara" Tipo FROM mecanico m WHERE repara = 0
       UNION 
       SELECT Apellido, "Repara" Tipo FROM mecanico m WHERE repara = 1
       ORDER BY Apellido;
			  
-- 10) Utilizando una de las combinaciones de join, mostrar los repuestos que no se mencionan en los presupuestos.			
	   SELECT r.* FROM repuesto r LEFT JOIN presurep pr ON r.codRep = pr.codRep
       WHERE pr.codRep IS NULL;
   
/* 11) Identificar por fecha cuántas fichas se confeccionaron y cuántos mecánicos diagnosticaron.
      Recordá que una ficha puede tener más de un diagnostico; por esa razón existe la tabla “fichamd”. */
      SELECT f.fecha, COUNT(DISTINCT f.codF) "Cantidad Fichas", COUNT(DISTINCT m.codMec) "Cantidad Mecanicos"
	  FROM ficha f JOIN fichamd fm ON f.codF = fm.codF JOIN mecdiag md ON fm.codMD = md.codMD
	  JOIN mecanico m ON md.codMec = m.codMec GROUP BY f.fecha;
      
      
 /* 12) Construir una consulta para cada combinación de join.
    Se debe redactar la consigna, identificar la combinación utilizada y proponer una alternativa de resolución. */
    
    -- INNER JOIN, Mostrar los mecanicos que tienen una tematica asignada
    SELECT * FROM mecanico m JOIN mecdiag md ON m.codMec = md.codMec ORDER BY Nombre;
    -- SOLUCION ALTERNATIVA SIN INNER JOIN
    SELECT * FROM mecanico m, mecdiag md WHERE m.codMec = md.codMec ORDER BY Nombre;
    
    -- LEFT JOIN, para mostrar los repuestos que aun no han sido requeridos
    SELECT r.* FROM repuesto r LEFT JOIN presurep pr ON r.codRep = pr.codRep WHERE pr.Npresup IS NULL;
    -- SOLUCION ALTERNATIVA SIN LEFT JOIN
    SELECT * FROM repuesto r WHERE r.codRep NOT IN (SELECT p.codRep FROM presurep p);
    
    -- RIGHT JOIN, Muestra los diagnosticos que no necesitan repuestos
    SELECT r.nombre Repuesto, p.DiagFinal, p.NPresup FROM repuesto r JOIN presurep pr ON r.codRep = pr.codRep
    RIGHT JOIN presup p ON pr.Npresup = p.NPresup WHERE r.codRep IS NULL;
    -- SOLUCION ALTERNATIVA SIN RIGHT JOIN
    SELECT NULL Repuesto, p.DiagFinal, p.NPresup FROM presup p WHERE p.NPresup NOT IN (SELECT pr.Npresup FROM presurep pr);
    