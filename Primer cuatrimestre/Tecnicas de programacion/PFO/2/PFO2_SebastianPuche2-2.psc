Algoritmo PFO_Problema2
	Definir numeroActual, contadorNivel, numeroSiguiente,respuesta, cantidadNiveles Como Entero;
	Definir correcto Como Logico;
	Definir seguirJugando Como Caracter;
	cantidadNiveles <- 10;
	
	Repetir
		correcto <- Verdadero;
		contadorNivel <- 1;
		numeroActual <- azar(109)+1;
		seguirJugando <- "";
		Limpiar Pantalla;
		Escribir "**** Bienvenidos al juego *****";
		Escribir "Objetivo: Adivinar si el siguiente numero es menor, mayor o igual al numero actual";
		Escribir "Hay ", cantidadNiveles, " niveles a vencer para ganar el juego";
		Escribir "Pulse una tecla para empezar a jugar";
		Esperar Tecla;
		Repetir
			Escribir "Nivel ", contadorNivel, ": El siguiente numero es menor, mayor o igual a ** ", numeroActual, " **?";
			Escribir "1- Mayor";
			Escribir "2- Menor";
			Escribir "3- Igual";
			numeroSiguiente <- azar(109)+1;
			Leer respuesta;
			Segun respuesta Hacer
				1:
					Si numeroSiguiente > numeroActual Entonces
						Escribir "Correcto el numero siguiente era ",numeroSiguiente, " ( ",numeroSiguiente, " > ", numeroActual, " )";
						contadorNivel <- contadorNivel +1;
						numeroActual <- numeroSiguiente;	
						
						SiNo si numeroSiguiente < numeroActual Entonces
								Escribir "Error el numero siguiente era ",numeroSiguiente, " ( ",numeroSiguiente, " < ", numeroActual, " )";
								correcto <- Falso;
								
						SiNo
							Escribir  "Error el numero siguiente era ",numeroSiguiente, " ( ",numeroSiguiente, " = ", numeroActual, " )";
							correcto <- Falso;
						FinSi
					FinSi
				2:
					Si numeroSiguiente < numeroActual Entonces
						Escribir "Correcto el numero siguiente era ",numeroSiguiente, " ( ",numeroSiguiente, " < ", numeroActual, " )";
						contadorNivel <- contadorNivel +1;
						numeroActual <- numeroSiguiente;	
						
						SiNo si numeroSiguiente > numeroActual Entonces
							Escribir  "Error el numero siguiente era ",numeroSiguiente, " ( ",numeroSiguiente, " > ", numeroActual, " )";
							correcto <- Falso;
							
						SiNo
							Escribir  "Error el numero siguiente era ",numeroSiguiente, " ( ",numeroSiguiente, " = ", numeroActual, " )";
							correcto <- Falso;
						FinSi	
					FinSi
				3:
					Si numeroSiguiente == numeroActual Entonces
						Escribir "Correcto el numero siguiente era ",numeroSiguiente, " ( ",numeroSiguiente, " = ", numeroActual, " )";
						contadorNivel <- contadorNivel +1;
						numeroActual <- numeroSiguiente;	
						
						SiNo si numeroSiguiente > numeroActual Entonces
							Escribir  "Error el numero siguiente era ",numeroSiguiente, " ( ",numeroSiguiente, " > ", numeroActual, " )";
							correcto <- Falso;
							
						SiNo
							Escribir  "Error el numero siguiente era ",numeroSiguiente, " ( ",numeroSiguiente, " < ", numeroActual, " )";
							correcto <- Falso;
						FinSi	
					FinSi
				De Otro Modo:
					Escribir "Opcion incorrecta, pruebe nuevamente.";	
			FinSegun
			si (correcto == Verdadero) Y (contadorNivel <= cantidadNiveles) Y (respuesta >=1 Y respuesta <=3) Entonces
				Escribir "Avanzas al siguiente nivel.";
				Escribir "Pulse una tecla para continuar";
				Esperar Tecla;
			FinSi
		Mientras Que (correcto == Verdadero) Y (contadorNivel <= cantidadNiveles);
		
		Si	correcto == Falso Entonces
			Escribir "Perdiste en el nivel: ", contadorNivel;
		SiNo
			Escribir "Felicitaciones, lograste vencer los ", cantidadNiveles, " niveles";
		FinSi
		
		Repetir
			Escribir Sin Saltar "Desea volver a jugar s/n? ";
			Leer seguirJugando;
			si	(Minusculas(seguirJugando) <> "s") Y (Minusculas(seguirJugando) <> "n") Y (Minusculas(seguirJugando) <> "si") Y (Minusculas(seguirJugando) <> "no")  Entonces
				Escribir "Ingrese si o no";
			FinSi
		Mientras Que (Minusculas(seguirJugando) <> "s") Y (Minusculas(seguirJugando) <> "n") Y (Minusculas(seguirJugando) <> "si") Y (Minusculas(seguirJugando) <> "no") 
	Mientras Que Minusculas(seguirJugando) = "s" O (Minusculas(seguirJugando) = "si");
FinAlgoritmo
