	Funcion cargar_vendedores (Vendedores)
		definir i Como Entero
		Para i = 0 hasta 4 Hacer
			Vendedores[0] = "Juan"
			Vendedores[1] = "Sandra"
			Vendedores[2] = "Claudia"
			Vendedores[3] = "Pedro"
			Vendedores[4] = "Leonardo"
		FinPara
	FinFuncion

	Funcion cargar_ventas(ventas)
		Definir i, j Como Entero
		Para i = 0 Hasta 4 Hacer
			Para j = 0 hasta 5 Hacer
				ventas[i,j]=aleatorio(1000,5000)
			FinPara
		FinPara
	FinFuncion

	Funcion ingresarNombre(nombre Por Referencia, vector)
		Definir i Como Entero;
		Definir bandera Como Logico;
		bandera = falso;
		Repetir
			Escribir Sin Saltar "Ingrese el nombre del vendedor del cual desea conocer el total sus ventas en el semestre (exit para salir)"
			leer nombre
			Para i=0 Hasta 4 Hacer
				Si Minusculas(nombre) = Minusculas(vector[i]) O Minusculas(nombre) = "exit" Entonces
					bandera = Verdadero
				FinSi
			FinPara
			Si bandera = falso Entonces
				Escribir "El nombre ingresado es incorrecto, pruebe de nuevo"
			FinSi
		Mientras Que bandera = falso
	FinFuncion

	Funcion ventas=DevolverVentasSemestral(nombre,vector,matrizVentas)
		Definir ventas,i,j Como Entero
		ventas=0
		Para i = 0 Hasta 4 Hacer
			Si Minusculas(nombre) = Minusculas(vector[i]) Entonces
				Para j = 0 hasta 5 Hacer
					ventas = ventas + matrizVentas[i,j]
				FinPara	
			FinSi
		FinPara
	FinFuncion

	Funcion mostrarDatos(vVendedores, mVentas)
		Definir i,j Como Entero
		Escribir "Vendedores:"
		Para i=0 Hasta 4 Hacer
			Escribir Sin Saltar vVendedores[i], ": "
			Para j=0 Hasta 5 Hacer
				Escribir Sin Saltar "[", mVentas[i,j], "] "
			FinPara
			Escribir ""
		FinPara
	FinFuncion

	Algoritmo Ventas_Mensuales
		definir Vendedores, nombre Como Caracter
		definir Ventas Como Real
		Dimension Vendedores(5)
		Dimension Ventas(5,6)
		cargar_vendedores(Vendedores)
		cargar_ventas(ventas)
		//-------------------------------------
		// Resolución del alumno
		
		mostrarDatos(Vendedores,Ventas)
		Repetir
			ingresarNombre(nombre,Vendedores)
			Si Minusculas(nombre) <> "exit" Entonces
				Escribir "Las ventas totales del semestre de ", nombre, " son $", DevolverVentasSemestral(nombre,Vendedores,Ventas)
				Escribir "Presione enter para continuar"
				Esperar Tecla
			FinSi
		Mientras Que Minusculas(nombre) <> "exit"
		
	FinAlgoritmo
