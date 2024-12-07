Use parcial2;
Select * from articulos;
Select * from fabricantes;
-- 1)
select nombre, precio from articulos order by nombre;
-- 2)
Select codigo, nombre, precio from articulos where precio between 60 and 120;
-- 3) 
select nombre, precio, precio*1.21 as "precio con iva" from articulos;
-- 4)
select fabricante,AVG(precio) as "precio promedio" from articulos where fabricante=2;
-- 5)
select a.codigo, a.nombre, a.precio, f.nombre as fabricante from articulos a Join fabricantes f on a.fabricante = f.codigo
order by f.nombre, a.nombre;
-- 6)
select f.nombre, avg(precio) as promedio from fabricantes f join articulos a on f.codigo=a.fabricante 
group by f.nombre order by promedio desc ; 
-- 7)
select f.nombre, avg(precio) as "precio promedio" from fabricantes f join articulos a on f.codigo=a.fabricante 
group by f.nombre having avg(precio)>=150;
-- 8)
SELECT f.nombre, (SELECT MAX(a.precio) FROM articulos a 
WHERE a.fabricante = f.codigo) AS max_precio FROM fabricantes f;
-- Correccion
select a.nombre as nombre_articulo, precio, f.nombre as nombre_fabricante
from articulos a inner join fabricantes f on (a.fabricante = f.codigo) 
where a.precio = (select max(a.precio) from articulos a where a.fabricante = f.codigo);
-- 9)
select f.nombre as "Fabricante sin articulos" from fabricantes f left join articulos a on f.codigo = a.fabricante 
where a.codigo is null;
-- 10) 
UPDATE articulos SET precio = precio*0.90 WHERE fabricante=3;
-- 11)
Delete from articulos where fabricante in (1,7);
-- 12)
Select nombre from fabricantes where nombre like "O%";
-- 13)
create view view_listado_completo as
select a.codigo, a.nombre articulo, a.precio, f.nombre fabricante FROM articulos a
JOIN fabricantes f ON a.fabricante = f.codigo;
SELECT * FROM view_listado_completo;
-- 14)
SELECT f.nombre fabricante, count(a.codigo) as "Cantidad de articulos" FROM fabricantes f
LEFT JOIN articulos a ON a.fabricante = f.codigo GROUP BY f.codigo order by count(a.codigo) desc;
-- Correccion
select f.nombre,count(1) as cantidad from articulos a 
inner join fabricantes f on (a.fabricante = f.codigo) 
group by f.nombre;
