	.data
.L0:
	.asciiz "x: "
.L1:
	.asciiz "\n"
.L2:
	.asciiz "d: "
.L3:
	.asciiz "\n"
	.text
	.globl	main
main:	nop	# function main
	# x, 0
	# d, 8
	sw      $ra, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	sw      $fp, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	move    $fp, $sp	#init fp
	subu    $sp, $sp, 20	#allocate AR
	li      $v0, 5
	syscall			#scanf("%d", &x(int; offset: 0));

	sw      $v0, 0($fp)
	la      $a0, .L0	#printf("x: ");

	li      $v0, 4
	syscall
	lw      $t8, 0($fp)	#x(int; offset: 0)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $a0, 4($sp)	#POP
	addu    $sp, $sp, 4
	li      $v0, 1	#system call code for print_int
	syscall			#printf("%d", x(int; offset: 0));

	la      $a0, .L1	#printf("\n");

	li      $v0, 4
	syscall
	li      $v0, 7
	syscall			#scanf("%f", &d(double; offset: 8));

	s.d     $f0, -8($fp)
	la      $a0, .L2	#printf("d: ");

	li      $v0, 4
	syscall
	l.d     $f8, -8($fp)	#d(double; offset: 8)
	s.d     $f8, -4($sp)	#PUSH
	subu    $sp, $sp, 8
	l.d     $f12, 4($sp)	#POP
	addu    $sp, $sp, 8
	li      $v0, 3	#system call code for print_double
	syscall			#printf("%f");
	la      $a0, .L3	#printf("\n");

	li      $v0, 4
	syscall
	addi    $2, $0, 10	#done
	syscall
