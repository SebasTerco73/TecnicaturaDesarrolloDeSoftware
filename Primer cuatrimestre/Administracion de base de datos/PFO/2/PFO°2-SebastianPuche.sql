-- 1) Mostrar los datos de los presupuestos cuyo monto es menor a $ 10000.
	SELECT * FROM presup WHERE Monto < 10000;
   
/* 2) Mostrar el cliente ingresado más joven considerando su documento
(del conjunto de datos ingresados).*/
	SELECT * FROM cliente ORDER BY DNI DESC LIMIT 1;
   
-- 3) Mostrar los repuestos que tengan la misma cantidad de stock que en el punto de pedido.
	SELECT * FROM repuesto WHERE stock = pp ;
   
-- 4) Mostrar los mecánicos cuyo apellido comience con la letra C.
	SELECT * FROM mecanico WHERE Apellido LIKE "C%";
   
-- 5) Mostrar nombre del repuesto junto al precio ordenado alfabéticamente.
	SELECT nombre, precio FROM repuesto ORDER BY nombre;
   
-- 6) Mostrar la cantidad de presupuestos realizados en el taller.
	SELECT COUNT(*) "Cantidad de Presupuestos" FROM presup;
  
-- 7) Mostrar por color cuantos  vehículos registrados hay.
	SELECT Color, COUNT(*) Cantidad FROM vehiculo GROUP BY Color ;

-- 8) Mostrar por código de ficha la cantidad de informes que tiene.
	SELECT ficha.codF, COUNT(fichamd.codF) "Cantidad de informes" FROM ficha
    LEFT JOIN fichamd ON ficha.codF=fichamd.codF GROUP BY ficha.codF;
    
-- 9) Listar ordenado por temática a los mecánicos que diagnostican (indicar nombre, apellido y temática).   
	SELECT nombre, apellido, tematica FROM mecanico JOIN mecdiag ON mecanico.codMec = mecdiag.codMec ORDER BY tematica;
    
-- 10) Mostrar los números de presupuesto que tengan al menos un repuesto cuyo precio oscile entre $ 1200 y $ 10000 inclusive.
	SELECT p.NPresup FROM presup p
	JOIN Presurep pr ON p.NPresup = pr.Npresup
	JOIN repuesto r ON pr.codRep = r.codRep
	WHERE r.precio BETWEEN 1200 AND 10000
	GROUP BY p.NPresup;
    
-- 11) Calcular el valor promedio del costo de los repuestos del taller. El título de la columna debe decir Precio Promedio
	SELECT ROUND(AVG(precio), 2) "Precio promedio" FROM repuesto;
    
-- 12) Mostrar los datos de los clientes que tienen más de un vehículo.
	SELECT c.* FROM cliente c 
    JOIN vehiculo v ON c.codC = v.codC
	GROUP BY c.codC	HAVING COUNT(v.codVEH) > 1;
    
-- 13) Identificar con nombre y apellido a los mecánicos que no hicieron ningún diagnóstico.
	 SELECT Nombre, Apellido FROM mecanico 
	 WHERE codMec NOT IN 
	 (SELECT codMec FROM mecdiag JOIN fichamd ON mecdiag.codMD=fichamd.codMD);
 
-- 14) Mostrar por vehículo el monto final que deben abonar en concepto de presupuesto.    
	SELECT v.*, SUM(p.Monto) Total FROM vehiculo v
	JOIN ficha f ON v.codVEH = f.codVEH
	JOIN presup p ON f.codF = p.codF
	GROUP BY v.codVEH;
