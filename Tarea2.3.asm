# Daniel Flores Sanchez
# ITESO. Arquitectura computacional

.text
	li $s0, 2 # Base
	li $t0, 2 # Exponente
	li $v0, 1 # Aqui se almacena el resultado
	slti $k0, $t0, 1 # Si el exponente es cero, devuelve un 1 (estado default de v0)
	bne $k0, $zero, else
	jal potencia
	j exit
else:
	j exit
	
potencia:
	slti $t1, $t0, 1 # Si t0 no ha disminuido hasta llegar a 0, se va al loop
	beq $t1, $zero, loop
	jr $ra # Una vez que se hayan almacenado en el stack todas las iteraciones necesarias, pasa del jal potencia
	
loop: 
	addi $sp, $sp, -4 # Decrementa el SP y lo deja dos posicione smas abajo
	sw $ra, 0($sp) # Almacena el lugar previo
	addi $t0, $t0, -1 # Disminuye el exponente
	jal potencia
	lw $ra, 0($sp) # Carga la locacion de la ultima posicion
	mult $v0, $s0 # Se multiplica el resultado por la base  (tantas veces como lo dicte las iteraciones, dictadas a su vez por el exponente)
	mfhi $t1
	mflo $t2
	add $v0, $t1, $t2 # Se suma y se pone en v0 para poder repetir el ciclo
	addi $sp, $sp, 4 # Se aumenta el stack para poder sacar el ra que sigue
	jr $ra
	
exit:
	