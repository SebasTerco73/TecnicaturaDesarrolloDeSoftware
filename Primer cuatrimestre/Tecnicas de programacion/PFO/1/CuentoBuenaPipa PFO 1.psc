Algoritmo CuentoBuenaPipa
	Definir respuesta Como Caracter;
	Escribir Sin Saltar "Queres que te cuente el cuento de la buena pipa? ";	
	Leer respuesta;
	Mientras Minusculas(respuesta) <> "hechizo" Hacer
		Escribir Concatenar("Yo no te dije ", respuesta);
		Escribir "Yo te dije si queres que te cuente el cuento de la buena pipa?";
		leer respuesta;
	FinMientras
	Escribir "Finalizando .......... O NO?";
	Esperar 2 Segundos;
	
	Repetir
		Escribir Sin Saltar "Queres que te cuente el cuento de la buena pipa 2? ";	
		Leer respuesta;
		SI(Minusculas(respuesta) <> "magia" ) Entonces
			Escribir Concatenar("Yo no te dije ", respuesta);
			Escribir Sin Saltar "Yo te dije si... ";
		FinSi
	Mientras Que Minusculas(respuesta) <> "magia"   		
		Escribir "Finalizando ..........";
		Esperar 2 Segundos;
	
FinAlgoritmo





