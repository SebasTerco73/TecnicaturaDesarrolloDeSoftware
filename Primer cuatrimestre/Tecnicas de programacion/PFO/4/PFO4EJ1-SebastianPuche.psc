	Algoritmo PFO4EJ1
		Definir elementos Como Entero;
		Dimensionar elementos[5,10]
		llenarMatriz(elementos)
		Escribir "*****  Matriz sin ordenar  *****"
		mostrarMatriz(elementos)
		
		//Dejo la matriz ordenada completa, y por filas para repasar
		//ordenarMatrizCompleta(elementos)
		
		//Ordenamiento por Seleccion
		ordenarMatrizPorFilasPorSeleccion(elementos)
		
		//Ordenamiento Burbuja
		//ordenarMatrizPorFilasBurbuja(elementos)
		
		Escribir "*****  Matriz ordenada  *****"
		mostrarMatriz(elementos)
	FinAlgoritmo

	Funcion llenarMatriz (matriz)
		Definir i,j Como Entero
		Para i<-0 Hasta 4 Hacer
			Para j<-0 Hasta 9 Hacer
				matriz[i,j] = ALEATORIO(1,100) 
			FinPara
		FinPara
	FinFuncion

	Funcion mostrarMatriz (matriz)
		Definir i,j Como Entero
		Para i<-0 Hasta 4 Hacer
			Para j<-0 Hasta 9 Hacer
				Escribir Sin Saltar "[", matriz[i,j], "] "
			FinPara
			Escribir ""
		FinPara
		Escribir ""
	FinFuncion

// Matriz Ordenamiento completo
	Funcion ordenarMatrizCompleta(matriz)
		Definir vector Como entero
		Dimensionar vector[50]
		PasarAVector(matriz,vector)
		OrdenarVector(vector)
		PasarAMatriz(matriz,vector)
	FinFuncion

	Funcion pasarAVector (matriz,vector)
		Definir i,j,contador Como Entero
		contador = 0
		Para i<-0 Hasta 4 Hacer
			Para j<-0 Hasta 9 Hacer
				vector[contador] = matriz[i,j]
				contador = contador+1
			FinPara
		FinPara
	FinFuncion

	Funcion ordenarVector(vector) 
		Definir i,j,menor,posicion Como Entero
		Para i<-0 Hasta 48 Hacer
			menor = vector[i]
			Para j<-i+1 hasta 49 Hacer
				Si vector[j] < menor Entonces
					posicion = j
					menor = vector[j]
				FinSi
			FinPara
			Si menor <> vector[i] Entonces
				vector[posicion] = vector[i]
				vector[i] = menor
			FinSi
		FinPara
	FinFuncion

	Funcion pasarAMatriz (matriz,vector)
		Definir i,j,contador Como Entero
		contador = 0
		Para i<-0 Hasta 4 Hacer
			Para j<-0 Hasta 9 Hacer
				matriz[i,j] = vector[contador] 
				contador = contador+1
			FinPara
		FinPara
	FinFuncion

	// Ordenamiento burbuja
	Funcion ordenarMatrizPorFilasBurbuja(matriz)
		Definir i,j,k,aux Como Entero
		Para i = 0 Hasta 4 Hacer
			Para k = 0 Hasta 9 - 1 Hacer 
				Para j = 0 Hasta 9 - 1 - k Hacer 
					Si matriz[i,j] > matriz[i,j+1] Entonces
						aux = matriz[i,j]
						matriz[i,j] = matriz[i,j+1]
						matriz[i,j+1] = aux
					FinSi
				FinPara
			FinPara
		FinPara
	FinFuncion

// Ordenamiento Por seleccion
	Funcion ordenarMatrizPorFilasPorSeleccion(matriz)
		Definir i,j,k,min Como Entero
		Para i = 0 Hasta 4 Hacer
			Para j = 0 Hasta 8 Hacer 
				min = matriz[i,j]
				Para k = j+1 Hasta 9 Hacer 
					Si matriz[i,j] > matriz[i,k] Entonces
						min = matriz[i,j]
						matriz[i,j] = matriz[i,k]
						matriz[i,k] = min
					FinSi
				FinPara
			FinPara
		FinPara
	FinFuncion

	