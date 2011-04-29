	.data
	.text
	.globl	main
foo:	nop	# function foo
	sw      $ra, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	sw      $fp, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	move    $fp, $sp	#init fp
	subu    $sp, $sp, 4	#allocate AR
	li      $t8, 123	#123.0
	mtc1    $t8, $f8
	l.d     $f8, 4($sp)	#POP
	addu    $sp, $sp, 8
	s.d     $f8, 16($fp)	#(d(double; offset: -16) = 123.0)
	move    $sp, $fp
	lw      $fp, 4($sp)	#POP
	addu    $sp, $sp, 4
	lw      $ra, 4($sp)	#POP
	addu    $sp, $sp, 4
	jr      $ra
	move    $sp, $fp
	lw      $fp, 4($sp)	#POP
	addu    $sp, $sp, 4
	lw      $ra, 4($sp)	#POP
	addu    $sp, $sp, 4
	jr      $ra
main:	nop	# function main
	sw      $ra, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	sw      $fp, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	move    $fp, $sp	#init fp
	subu    $sp, $sp, 28	#allocate AR
	li      $t8, 4456	#4456.387
	mtc1    $t8, $f8
	l.d     $f8, 4($sp)	#POP
	addu    $sp, $sp, 8
	s.d     $f8, -28($fp)	#(e(double; offset: 28) = 4456.387)
	li      $t8, 2	#2.1
	mtc1    $t8, $f8
	jal     foo		#foo(double->void; offset: -1)(2.1)
	l.d     $f8, -28($fp)	#e(double; offset: 28)
	s.d     $f8, -4($sp)	#PUSH
	subu    $sp, $sp, 8
	l.d     $f12, 4($sp)	#POP
	addu    $sp, $sp, 8
	li      $v0, 3	#system call code for print_double
	syscall			#printf("%f");
	move    $sp, $fp
	lw      $fp, 4($sp)	#POP
	addu    $sp, $sp, 4
	lw      $ra, 4($sp)	#POP
	addu    $sp, $sp, 4
	jr      $ra
	addi    $2, $0, 10	#done
	syscall
