# Daniel Flores Sanchez
# ITESO. Arquitectura computacional

.data
	Vector_1: .word 1,2,3,4,5,6,7,8,9
	Vector_2: .word -1,2,-3,4,-5,6,-7,8,-9
	
.text
	la $s1, Vector_1
	la $s2, Vector_2
	li $t0, 0 # Navegador i
	li $s0, 0 # Resultado
	li $t1, 0 # Limpia el registro t1
	
while:
	slti $t1, $t0, 8 # Cuenta progresiva que cuenta hasta nueve, como el ejemplo de C
	beq $t1, $zero, exit # si dicha cuenta llega a cero, se acaba el programa
	sll $t1, $t0, 2 # Hace que el offset avance hasta la siguiente palabra
	add $t2, $t1, $s2 # Almacena en t2 la direccion con offset del vector 2
	add $t1, $t1, $s1 # Almacena en t1 la direccion con offset del vector 1	
	jal ProductFunction # LLama a la funcion de multiplicacion
	addi $t0, $t0, 1 # Incrementa la variable i
	j while
	
ProductFunction:
	lw $t3, 0($t1) # Carga en t3 lo que contiene la direccion indicada en t1
	lw $t4, 0($t2) # Carga en t4 lo que contiene la direccion indicada en t2
	mult $t3, $t4 # Multiplica los numeros recien extraidos
	mfhi $s3
	mflo $s4
	add $s0, $s3, $s4 # Estableciendo el resultado en s0
	jr $ra # Regresa al ciclo principal
exit: