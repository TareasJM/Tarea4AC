	.file	"ANSICinversoFib.c"
	.text
	.globl	inversoFibRec
	.type	inversoFibRec, @function
inversoFibRec:
.LFB0:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movl	%edi, -4(%rbp)
	movss	%xmm0, -8(%rbp)
	movss	%xmm1, -12(%rbp)
	movss	%xmm2, -16(%rbp)
	movss	-12(%rbp), %xmm0
	addss	-8(%rbp), %xmm0
	movss	.LC0(%rip), %xmm1
	divss	%xmm0, %xmm1
	movaps	%xmm1, %xmm0
	movss	-16(%rbp), %xmm1
	addss	%xmm1, %xmm0
	movss	%xmm0, -16(%rbp)
	cmpl	$0, -4(%rbp)
	jg	.L2
	movl	-16(%rbp), %eax
	jmp	.L3
.L2:
	movss	-12(%rbp), %xmm0
	addss	-8(%rbp), %xmm0
	movl	-4(%rbp), %eax
	leal	-1(%rax), %ecx
	movl	-16(%rbp), %edx
	movl	-8(%rbp), %eax
	movl	%edx, -20(%rbp)
	movss	-20(%rbp), %xmm2
	movl	%eax, -20(%rbp)
	movss	-20(%rbp), %xmm1
	movl	%ecx, %edi
	call	inversoFibRec
	movss	%xmm0, -20(%rbp)
	movl	-20(%rbp), %eax
.L3:
	movl	%eax, -20(%rbp)
	movss	-20(%rbp), %xmm0
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	inversoFibRec, .-inversoFibRec
	.globl	inversoFib
	.type	inversoFib, @function
inversoFib:
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
	movl	.LC1(%rip), %eax
	jmp	.L6
.L5:
	cmpl	$1, -4(%rbp)
	jne	.L7
	movl	.LC0(%rip), %eax
	jmp	.L6
.L7:
	movl	-4(%rbp), %eax
	subl	$2, %eax
	movss	.LC0(%rip), %xmm2
	xorps	%xmm1, %xmm1
	movss	.LC0(%rip), %xmm0
	movl	%eax, %edi
	call	inversoFibRec
	movss	%xmm0, -8(%rbp)
	movl	-8(%rbp), %eax
.L6:
	movl	%eax, -8(%rbp)
	movss	-8(%rbp), %xmm0
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1:
	.size	inversoFib, .-inversoFib
	.section	.rodata
.LC2:
	.string	"ingrese n: "
.LC3:
	.string	"%d"
.LC4:
	.string	"%f\n"
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
	movl	$.LC2, %edi
	movl	$0, %eax
	call	printf
	leaq	-8(%rbp), %rax
	movq	%rax, %rsi
	movl	$.LC3, %edi
	movl	$0, %eax
	call	__isoc99_scanf
	movl	-8(%rbp), %eax
	movl	%eax, %edi
	call	inversoFib
	movss	%xmm0, -24(%rbp)
	movl	-24(%rbp), %eax
	movl	%eax, -4(%rbp)
	movss	-4(%rbp), %xmm0
	cvtps2pd	%xmm0, %xmm0
	movl	$.LC4, %edi
	movl	$1, %eax
	call	printf
	movl	$0, %eax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE2:
	.size	main, .-main
	.section	.rodata
	.align 4
.LC0:
	.long	1065353216
	.align 4
.LC1:
	.long	0
	.ident	"GCC: (Ubuntu 4.8.2-19ubuntu1) 4.8.2"
	.section	.note.GNU-stack,"",@progbits
