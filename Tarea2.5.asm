# Daniel Flores Sanchez
# ITESO. Arquitectura computacional

.data
	Array_test: .word 1,2,3,4,5,6
	
.text
	li $t0, 6 #tamanio del arreglo
	la $s0, Array_test #Comienzo de memoria del arreglo
	li $t1, 0 # i
	jal rec
	j exit
	
rec:
	slt $t2, $t1, $t0 #Lleva la cuenta de si i es menor que el tamanio.
	bne $t2, $zero, loop #Asi, si es menor que t0 ira a recursion
	lw $s3, 0($sp)
	lw $ra, 4($sp)
	add $v0, $v0, $s3
	addi $sp, $sp, 8
	jr $ra

loop:
	addi $sp, $sp, -8 #baja el stack pointer para poder almacenar el dato y el ra
	sw $ra 4($sp) #almacena el ra
	lw $t3 0($s0) #Primero carga del arreglo el dato
	sw $t3 0($sp) #y despues lo guarda en el stack
	addi $s0, $s0, 4 #pasa a la siguiente palabra del array
	addi $t1, $t1, 1 #incrementa la i
	j rec

exit:
	