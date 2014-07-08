.data
ingreso:
	.asciiz "Ingrese n: "

resultado:
	.asciiz "fibonacci: "

#input/output
.text
.globl main

fib:
	beq $a0, $zero, endfib
	add $t0, $a0, -1
	add $t1, $a1, $a2
	move $a0, $t0
	move $a2, $a1
	move $a1, $t1
	j fib

endfib:
	move $v0, $a1
	jr $ra

main:
	la $a0, ingreso
	li $v0, 4				
	syscall					

	li $v0,5                
	syscall					

	move $a0, $v0
	li $a1, 0
	li $a2, 1
	jal fib 

	move $t0, $v0

	la $a0, resultado
	li $v0, 4
	syscall

	move $a0, $t0
	li $v0, 1
	syscall

	li $v0,10
	syscall
