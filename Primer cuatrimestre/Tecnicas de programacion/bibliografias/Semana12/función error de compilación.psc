Funcion suma=incremento (s)
	definir suma como entero
	suma = s + 1
	Escribir "Variable dentro del proceso: ", s
FinFuncion

// Se crea una función 
// El algoritmo da error de compilación dado que una función debe ser invocada en una asignación o en una salida de datos

Algoritmo procedimiento1
	definir a Como Entero
	a = 10
	Escribir "Valor de la variable antes de llamar al procedimiento: ",a
	incremento(a)
	Escribir "Resultado de la función ",a 
FinAlgoritmo
