Algoritmo PFO3RegistrarAlumnos
	Definir alumno, nombre Como Caracter;
	Definir indice, i, edad, mayorEdad Como Entero;
	Dimension alumno[20,2];
	indice = 0;
	mayorEdad = 0;
	
	Repetir
		Escribir Sin Saltar "Ingrese el nombre del alumno ", indice+1, " (* para finalizar): ";
		leer nombre;
		Si (nombre <> "*") Entonces
			Escribir "ingrese la edad de ", nombre, ": ";
			leer edad;
			Si edad > mayorEdad Entonces
				mayorEdad = edad;
			FinSi
			alumno[indice,0] = nombre;
			alumno[indice,1] = ConvertirATexto(edad);
			indice = indice + 1;
		FinSi
	Mientras Que nombre <> "*" Y indice < 20;
	
	Escribir "En el curso hay ", indice , " alumnos";
	Si indice > 0 Entonces
		Escribir "La siguientes alumnos son los mas grandes con ", mayorEdad, " años";
		Para i = 0 Hasta indice-1 Hacer
			Si ConvertirANumero(alumno[i,1]) = mayorEdad Entonces
				Escribir alumno[i,0];
			FinSi
		FinPara
	FinSi
	
FinAlgoritmo
