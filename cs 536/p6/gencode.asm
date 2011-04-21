	.data
intVar:
	.space 4
dblVar:
	.space 8
	.text
	.globl	main
main:	nop	# function main
	li      $t8, 1	#literal
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	sw      $t8, intVar	#(intVar(int) = 1)
	lw      $t8, intVar	#intVar(int)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	li      $t8, 1	#literal
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t9, 4($sp)	#POP
	addu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	add     $t8, $t8, $t9	#(intVar(int)+1)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $a0, 4($sp)	#POP
	addu    $sp, $sp, 4
	li      $v0, 1	#system call code for print_int
	syscall			#printf("%d");
