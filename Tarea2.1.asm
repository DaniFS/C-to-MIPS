#Daniel Flores Sanchez
#ITESO. Arquitectura computacional.

.text
	li $s0, 0 # Variable que selecciona la operacion a ejecutar
	li $s1, 5 # Inicializacion de los valores con los que se calculara todo
	li $s2, 3
	li $s3, 0 # Variable que almacena el resultado
	li $t1, 1 # Aqui se alamacenan los valores con los que se comparara la entrada en s0
	li $t2, 2
	li $t3, 3

	beq $s0, $t1, Add # s0 es comparada para ver si tiene dentro un 1 para irse a sumar,
	beq $s0, $t2, Sub # un 2 para restarse,
	beq $s0, $t3, Mul # o un 3 para multiplicarse.
	j ABW		  # Si no tiene ninguno de esos, cae en el default y se va a And Bit Wise
Add:
	add $s3, $s1, $s2
	j exit		 # Al igual que en C, cuando se completa la operacion, el programa se detiene
Sub:
	sub $s3, $s1, $s2
	j exit
Mul:
	mult $s1, $s2 # Ya que la multiplicacion alamacena el resultado en alguna clase de registro
	mfhi $t4      # Se usa Move From High y
	mflo $t5      # Move From Low para ponerlos a nuestro alcance y poder sumarlos
	add $s3, $t4, $t5 # Asi quesa el valor completo
	j exit
	
ABW:
	and $s3, $s1, $s2
	j exit
exit: