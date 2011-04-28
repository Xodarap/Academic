	.data
	.text
	.globl	main
main:	nop	# function main
	sw      $ra, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	sw      $fp, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	move    $fp, $sp	#init fp
	subu    $sp, $sp, 8	#allocate AR
	li.d    $f8, 3.14	#3.14
	s.d     $f8, -4($sp)	#PUSH
	subu    $sp, $sp, 8
	l.d     $f8, 4($sp)	#POP
	addu    $sp, $sp, 8
	s.s     $f8, 0($fp)	#(d(double; offset: 0) = 3.14)
	l.d     $f8, 0($fp)	#d(double; offset: 0)
	s.d     $f8, -4($sp)	#PUSH
	subu    $sp, $sp, 8
	l.d     $f12, 4($sp)	#POP
	addu    $sp, $sp, 8
	li      $v0, 3	#system call code for print_double
	syscall			#printf("%f");
	addi    $2, $0, 10	#done
	syscall
