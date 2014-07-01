	.file	"fibonacci.c"
	.text
	.globl	fibonacciRec
	.type	fibonacciRec, @function
fibonacciRec:
.LFB0:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movl	%edi, -4(%rbp)
	movl	%esi, -8(%rbp)
	movl	%edx, -12(%rbp)
	cmpl	$0, -4(%rbp)
	jg	.L2
	movl	-8(%rbp), %eax
	movl	-12(%rbp), %edx
	addl	%edx, %eax
	jmp	.L3
.L2:
	movl	-8(%rbp), %eax
	movl	-12(%rbp), %edx
	leal	(%rdx,%rax), %esi
	movl	-4(%rbp), %eax
	leal	-1(%rax), %ecx
	movl	-8(%rbp), %eax
	movl	%eax, %edx
	movl	%ecx, %edi
	call	fibonacciRec
.L3:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	fibonacciRec, .-fibonacciRec
	.globl	fibonacci
	.type	fibonacci, @function
fibonacci:
.LFB1:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movl	%edi, -4(%rbp)
	cmpl	$0, -4(%rbp)
	jne	.L5
	movl	$0, %eax
	jmp	.L6
.L5:
	cmpl	$1, -4(%rbp)
	jne	.L7
	movl	$1, %eax
	jmp	.L6
.L7:
	movl	-4(%rbp), %eax
	subl	$2, %eax
	movl	$0, %edx
	movl	$1, %esi
	movl	%eax, %edi
	call	fibonacciRec
.L6:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1:
	.size	fibonacci, .-fibonacci
	.section	.rodata
.LC0:
	.string	"ingrese n: "
.LC1:
	.string	"%d"
.LC2:
	.string	"%d\n"
	.text
	.globl	main
	.type	main, @function
main:
.LFB2:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movl	%edi, -20(%rbp)
	movq	%rsi, -32(%rbp)
	movl	$.LC0, %edi
	movl	$0, %eax
	call	printf
	leaq	-4(%rbp), %rax
	movq	%rax, %rsi
	movl	$.LC1, %edi
	movl	$0, %eax
	call	__isoc99_scanf
	movl	-4(%rbp), %eax
	movl	%eax, %edi
	call	fibonacci
	movl	%eax, -4(%rbp)
	movl	-4(%rbp), %eax
	movl	%eax, %esi
	movl	$.LC2, %edi
	movl	$0, %eax
	call	printf
	movl	$0, %eax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE2:
	.size	main, .-main
	.ident	"GCC: (Ubuntu 4.8.2-19ubuntu1) 4.8.2"
	.section	.note.GNU-stack,"",@progbits
