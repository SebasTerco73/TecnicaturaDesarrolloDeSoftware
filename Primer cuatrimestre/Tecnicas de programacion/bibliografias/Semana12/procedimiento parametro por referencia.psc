Funcion incremento (s por referencia )
	s = s + 1
	Escribir "Variable dentro del proceso: ", s
FinFuncion

// Se crea un procedimiento pasando la variable por referencia
// Al ser pasado el parámetro por referencia se crea un puntero a la variable
// Los cambios realizados dentro del procedimiento impactan en el valor de la variable en el programa principal 

Algoritmo procedimiento1
	definir a Como Entero
	a = 10
	Escribir "Valor de la variable antes de llamar al procedimiento: ",a
	incremento(a)
	Escribir "Valor de la variable después de llamar al procedimiento: ",a 
FinAlgoritmo
