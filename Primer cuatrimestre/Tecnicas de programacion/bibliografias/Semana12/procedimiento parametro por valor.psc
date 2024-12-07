Funcion incremento (s)
	s = s + 1
	Escribir "Variable dentro del proceso: ", s
FinFuncion

// Se crea un procedimiento pasando la variable por valor
// Al ser pasado el parámetro por valor se realiza una "copia" de la misma y se trabaja sobre la variable en formma local
// Los cambios realizados dentro del procedimiento no impactan en el valor de la variable en el programa principal 

Algoritmo procedimiento1
	definir a Como Entero
	a = 10
	Escribir "Valor de la variable antes de llamar al procedimiento: ",a
	incremento(a)
	Escribir "Valor de la variable después de llamar al procedimiento: ",a 
FinAlgoritmo
