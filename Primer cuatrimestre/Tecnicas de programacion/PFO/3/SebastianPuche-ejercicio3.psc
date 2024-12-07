Algoritmo ejercicio3
	Definir vectorPesos,vectorDinero, peso, dinero, total Como Real;
	Definir cantPaquetes, i Como Entero;
	cantPaquetes <- 20;
	total <- 0;
	Dimension vectorPesos[cantPaquetes];
	Dimension vectorDinero[cantPaquetes];
	
	Para i<-0 Hasta cantPaquetes-1 Hacer
		Escribir Sin Saltar "Cuanto pesa el paquete n°", i+1," (en kg)?"; 
		leer peso;
		vectorPesos[i]=peso;
	FinPara
	
	Para i<-0 Hasta cantPaquetes-1 Hacer
		Si vectorPesos[i] < 2 Entonces
			vectorDinero[i]=500.50*vectorPesos[i];
		SiNo
			vectorDinero[i]=400*vectorPesos[i];
		FinSi
		Escribir "Paquete n° ", i+1, ": $", vectorDinero[i];
		total = total + vectorDinero[i];
	FinPara
	Escribir "Precio Total: $", total; 
	
	
	
FinAlgoritmo

