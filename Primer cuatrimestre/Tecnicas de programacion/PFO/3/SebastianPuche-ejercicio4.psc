Algoritmo ejercicio4
	Definir vectorMinutos, vectorSegundos, minutos, segundosTotal Como Real;
	Definir miembros, i Como Entero;
	miembros <- 12;
	Dimension vectorMinutos[miembros], vectorSegundos[miembros];
	segundosTotal <- 0;
	Para i <- 0 Hasta miembros-1 Hacer
		Escribir Sin Saltar "Cuantos minutos demoro el participante n° ", i+1, " ";
		leer minutos;
		vectorMinutos[i] = minutos;
		vectorSegundos[i] = minutos*60;
	FinPara
	
	Para i <- 0 Hasta miembros-1 Hacer
		Escribir "El participante n° ", i+1, " demoro ", vectorSegundos[i], " segundos";
		segundosTotal = segundosTotal+vectorSegundos[i];
	FinPara
	Escribir "Promedio entre todos los participantes: ", segundosTotal/miembros, " segundos"; 
FinAlgoritmo
