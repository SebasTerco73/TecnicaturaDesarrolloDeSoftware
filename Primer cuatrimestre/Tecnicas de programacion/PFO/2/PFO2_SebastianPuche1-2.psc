Algoritmo PFO1
	
	Definir i, paginas, paginasMax,contadorPorEstante, contadorInfantil, contadorNovela, contadorHistoria, totalLibros Como Entero;
	Definir nombre, nombreMax, genero Como Caracter;
	paginasMax <- 0;
	nombreMax <- "";
	contadorInfantil <- 0;
	contadorNovela <- 0;
	contadorHistoria <- 0;
	contadorPorEstante <- 0;
	totalLibros <- 0;
	
	Para i=1 Hasta 5 Hacer
		Repetir
			Escribir Sin Saltar "Nombre del libro (Fin para terminar el estante ", i, "): ";
			leer nombre;
			Si Minusculas(nombre) <> "fin" Y nombre <> "" Entonces
				Repetir
					Escribir "De que genero es el libro?";
					Escribir "I (infantil)";
					Escribir "N (novela)";
					Escribir "H (historia)";
					Leer genero;
					Si	Minusculas(genero) <> 'i' Y Minusculas(genero) <> 'n'Y Minusculas(genero) <> 'h' Entonces
						Escribir "Ingrese un genero existente";
					FinSi
				Mientras Que (Minusculas(genero) <> 'i' Y Minusculas(genero) <> 'n'Y Minusculas(genero) <> 'h');
				
				// contador de libros por genero
				Si Minusculas(genero) = 'i' Entonces
					contadorInfantil = contadorInfantil +1;
				SiNo 
					Si Minusculas(genero) = 'n' Entonces
					contadorNovela = contadorNovela +1;
					SiNo
						contadorHistoria = contadorHistoria +1;
					FinSi
				FinSi
				
				Repetir
					Escribir Sin Saltar "Ingrese la cantidad de paginas que tiene el libro: ";
					leer paginas;
					Si (paginas < 1) Entonces
						Escribir "La cantidad de paginas del libro, debe ser mayor a 0";
					FinSi
				Mientras Que paginas < 1;
				// libro con mas pagina del estante
				Si (paginas > paginasMax) Entonces
					paginasMax = paginas;
					nombreMax = nombre;
				FinSi
				totalLibros = totalLibros +1;
			FinSi
			
		Mientras Que Minusculas(nombre) <> "fin"; 
		Si (paginasMax = 0) Entonces
			Escribir "No hay libros en este estante";
		SiNo
			Escribir "Estante numero ", i , ": El libro con mas paginas es ", nombreMax, " con ", paginasMax, " paginas.";
		FinSi
		//reinicio de valores para el siguiente estante
		paginasMax = 0;
		nombreMax = "";
	FinPara
	Escribir "Resumen........";
	Esperar 2 Segundos;
	Escribir "***** Libros por genero:*****";
	Escribir "Infantil: ", contadorInfantil;
	Escribir "Novela: ", contadorNovela;
	Escribir "Historia: ", contadorHistoria;
	
	Escribir "***** Promedio de libros por estante: ", totalLibros/5;
FinAlgoritmo
