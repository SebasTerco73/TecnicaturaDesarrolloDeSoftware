 Algoritmo ejercicios1Y2
	Definir vectorValores, cantidadValores,i, valorActual, valorMax, celdaMax Como Entero;
	cantidadValores <- 15;
	valorMax <- 0;
	Dimension vectorValores[cantidadValores];
	Para i=0 Hasta cantidadValores-1 Hacer
		Escribir Sin Saltar "Ingrese el valor entero n°", i+1, ": ";
		leer valorActual;
		vectorValores[i]=valorActual;
	FinPara
	Para i=0 Hasta cantidadValores-1 Hacer
		Si vectorValores[i] > valorMax Entonces
			valorMax=vectorValores[i];
			celdaMax=i+1;
		FinSi
	FinPara
	Escribir "El valor maximo ingresado es ", valorMax, " y se encuentra en la celda n°", celdaMax;
FinAlgoritmo

