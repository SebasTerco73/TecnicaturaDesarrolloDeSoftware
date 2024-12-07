Algoritmo ejercicio5
	Definir letra, vectorPalindromo  Como Caracter;
	Definir i, longitudPalabra Como Entero;
	Definir finalizado, esPalindromo Como Logico;
	Dimension vectorPalindromo[20];
	letra <- "";
	finalizado <- Falso;
	esPalindromo <- Verdadero;
	longitudPalabra <- 20;
	Escribir "Ingrese un palíndromo de maximo 20 caracteres"; 
	Para i <- 0 Hasta 19 Hacer
		Si finalizado = Verdadero Entonces
			vectorPalindromo[i] = "";
		SiNo
			Repetir
				Escribir Sin Saltar "Ingrese la letra n° ", i+1, " del palíndromo (deje en blanco para finalizar) ";
				leer letra;
				Si Longitud(letra) > 1 Entonces
					Escribir "ingrese solo una letra";
				FinSi
			Mientras Que Longitud(letra) > 1
			Si Longitud(letra) = 1 Entonces
				vectorPalindromo[i] = letra;
			SiNo
				vectorPalindromo[i] = "";
				finalizado = Verdadero;
				longitudPalabra = i; 
			FinSi
		FinSi
	FinPara
	
	Para i <- 0 Hasta longitudPalabra-1 Hacer
		Escribir "Posicion ", i+1, ": ", vectorPalindromo[i], " = ", vectorPalindromo[longitudPalabra-1-i];

			Si vectorPalindromo[i] <> vectorPalindromo[longitudPalabra-1-i] Entonces
				esPalindromo = Falso;
			FinSi
	FinPara
	Si esPalindromo Entonces
		Escribir "Es un Palíndromo";
	SiNo
		Escribir "NO es un Palíndromo";
	FinSi
FinAlgoritmo
