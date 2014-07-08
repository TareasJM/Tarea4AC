.data
ingreso:
	.asciiz "Ingrese n: "

resultado:
	.asciiz "Psi: "

#input/output
.text
.globl main

fib:
	beq $a0, $zero, returnfib
	add $t0, $a0, -1
	add $t1, $a1, $a2
	move $a0, $t0
	move $a2, $a1
	move $a1, $t1
	j fib

returnfib:
	move $v0, $a1
	jr $ra

rec:
	bgt $s2, $a3, returnrec
	move $a0, $s2
	li $a1, 0
	li $a2, 1
	move $s3, $ra
	jal fib
	mtc1 $v0, $f2
	move $ra, $s3
	cvt.s.w $f2, $f2
	li.s $f4 1.0
	div.s $f8, $f4, $f2
	add.s $f10, $f10, $f8
	addi $s2, $s2, 1
	j rec

returnrec:
	jr $ra

main:
	la $a0, ingreso
	li $v0, 4
	syscall	

	li $v0, 5        
	syscall		

	move $a3, $v0
	li $t0, 1
	li.s $f10, 0.0
	li $s2, 1
	jal rec

	la $a0, resultado
	li $v0, 4
	syscall

	mov.s $f12, $f10

	li $v0, 2
	syscall

	li $v0,10
	syscall
