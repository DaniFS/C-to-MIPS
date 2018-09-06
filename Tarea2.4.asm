# Daniel Flores Sanchez
# ITESO. Arquitectura computacional

.text
	li $t0, 15 # a
	li $s0, 6 # b
	li $v0, 0 # Aqui se almacena el resultado
	li $v1, 0 # Variable temporal que pasa a ser t0
	jal division
	j exit
division:
	slt $t1, $s0, $t0 # Sinceramente, perdi la hilacion de que hacia esta linea y porque va primero s0 que t0. A prueba y error, vi que asi funcionaba
	beq $t1, $zero, else # si b>a devuelve un 0
	sub $t0, $t0, $s0 # se resta a-b
	addi $sp, $sp, -4 # Decrementa el SP y lo deja una posiciones mas abajo
	sw $ra, 0($sp) # Almacena el lugar previo
	jal division
	addi $v0, $v0, 1 # se pone en v0 lo que tenga v1 + 1
	lw $ra, 0($sp)
	addi $sp, $sp, 4
else:
	li $v1, 0 
	jr $ra
	
	
exit: