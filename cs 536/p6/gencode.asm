	.data
gi1:
	.space 4
gi2:
	.space 4
.L0:
	.asciiz "\nEnd  one()  simple\n"
.L1:
	.asciiz "\n"
.L2:
	.asciiz "\nEnd  one()  nested\n"
.L3:
	.asciiz "\nEnd  one()  if\n"
.L4:
	.asciiz "\nEnd  one()  else\n"
.L5:
	.asciiz "\nEnd  one()  while\n"
.L6:
	.asciiz "\nEnd  one()  call\n"
.L7:
	.asciiz "\nEnd  two(int li1, int li2)  simple\n"
.L8:
	.asciiz "\n"
.L9:
	.asciiz "\nEnd  two(int li1, int li2)  nested\n"
.L10:
	.asciiz "\nEnd  two(int li1, int li2)  if\n"
.L11:
	.asciiz "\nEnd  two(int li1, int li2)  else\n"
.L12:
	.asciiz "\nEnd  two(int li1, int li2)  while\n"
.L13:
	.asciiz "\nEnd  two(int li1, int li2)  call\n"
.L14:
	.asciiz "\nEnd  three(int li1, int li2)  simple\n"
.L15:
	.asciiz "\n"
.L16:
	.asciiz "\nEnd  three(int li1, int li2)  nested\n"
.L17:
	.asciiz "\nEnd  three(int li1, int li2)  if\n"
.L18:
	.asciiz "\nEnd  three(int li1, int li2)  else\n"
.L19:
	.asciiz "\nEnd  three(int li1, int li2)  while\n"
.L20:
	.asciiz "\nEnd  three(int li1, int li2)  call\n"
.L21:
	.asciiz "\nEnd  main()  simple\n"
.L22:
	.asciiz "\n"
.L23:
	.asciiz "\nEnd  main()  nested\n"
.L24:
	.asciiz "\nEnd  main()  if\n"
.L25:
	.asciiz "\nEnd  main()  else\n"
.L26:
	.asciiz "\nEnd  main()  while\n"
.L27:
	.asciiz "\nEnd  main()  call\n"
	.text
	.globl	main
one:	nop	# function one
	sw      $ra, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	sw      $fp, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	move    $fp, $sp	#init fp
	subu    $sp, $sp, 40	#allocate AR
	li      $t8, 3	#literal
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	sw      $t8, 0($fp)	#(li1(int; offset: 0) = 3)
	li      $t8, 4	#literal
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	sw      $t8, -4($fp)	#(li2(int; offset: 4) = 4)
	li      $t8, 1	#literal
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	sw      $t8, gi1	#(gi1(int; offset: -1) = 1)
	li      $t8, 2	#literal
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	sw      $t8, gi2	#(gi2(int; offset: -1) = 2)
	lw      $t8, 0($fp)	#li1(int; offset: 0)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, -4($fp)	#li2(int; offset: 4)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t9, 4($sp)	#POP
	addu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	add     $t8, $t8, $t9	#(li1(int; offset: 0)+li2(int; offset: 4))
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	sw      $t8, gi1	#(gi1(int; offset: -1) = (li1(int; offset: 0)+li2(int; offset: 4)))
	lw      $t8, gi1	#gi1(int; offset: -1)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $a0, 4($sp)	#POP
	addu    $sp, $sp, 4
	li      $v0, 1	#system call code for print_int
	syscall			#printf("%d", gi1(int; offset: -1));

	li      $t8, 1	#literal
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	sw      $t8, gi1	#(gi1(int; offset: -1) = 1)
	lw      $t8, gi2	#gi2(int; offset: -1)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, 0($fp)	#li1(int; offset: 0)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t9, 4($sp)	#POP
	addu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	sub     $t8, $t8, $t9	#(gi2(int; offset: -1)-li1(int; offset: 0))
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	sw      $t8, gi1	#(gi1(int; offset: -1) = (gi2(int; offset: -1)-li1(int; offset: 0)))
	lw      $t8, gi1	#gi1(int; offset: -1)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $a0, 4($sp)	#POP
	addu    $sp, $sp, 4
	li      $v0, 1	#system call code for print_int
	syscall			#printf("%d", gi1(int; offset: -1));

	li      $t8, 1	#literal
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	sw      $t8, gi1	#(gi1(int; offset: -1) = 1)
	lw      $t8, gi1	#gi1(int; offset: -1)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, -4($fp)	#li2(int; offset: 4)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t9, 4($sp)	#POP
	addu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	mult    $t8, $t9	#(gi1(int; offset: -1)*li2(int; offset: 4))
	mflo    $t8		#(gi1(int; offset: -1)*li2(int; offset: 4))
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	sw      $t8, gi1	#(gi1(int; offset: -1) = (gi1(int; offset: -1)*li2(int; offset: 4)))
	lw      $t8, gi1	#gi1(int; offset: -1)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $a0, 4($sp)	#POP
	addu    $sp, $sp, 4
	li      $v0, 1	#system call code for print_int
	syscall			#printf("%d", gi1(int; offset: -1));

	li      $t8, 1	#literal
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	sw      $t8, gi1	#(gi1(int; offset: -1) = 1)
	lw      $t8, gi2	#gi2(int; offset: -1)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, gi2	#gi2(int; offset: -1)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t9, 4($sp)	#POP
	addu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	mult    $t8, $t9	#(gi2(int; offset: -1)*gi2(int; offset: -1))
	mflo    $t8		#(gi2(int; offset: -1)*gi2(int; offset: -1))
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	sw      $t8, gi1	#(gi1(int; offset: -1) = (gi2(int; offset: -1)*gi2(int; offset: -1)))
	lw      $t8, gi1	#gi1(int; offset: -1)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $a0, 4($sp)	#POP
	addu    $sp, $sp, 4
	li      $v0, 1	#system call code for print_int
	syscall			#printf("%d", gi1(int; offset: -1));

	li      $t8, 1	#literal
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	sw      $t8, gi1	#(gi1(int; offset: -1) = 1)
	lw      $t8, gi1	#gi1(int; offset: -1)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	sltu    $t8, $zero, $t8
	beq     $t8, $zero, .L28	#(gi1(int; offset: -1)&&li1(int; offset: 0))
	lw      $t8, 0($fp)	#li1(int; offset: 0)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t9, 4($sp)	#POP
	addu    $sp, $sp, 4
	sltu    $t9, $zero, $t9
	beq     $t9, $zero, .L28
	li      $t8, 1
	j       .L29
.L28:	nop
	li      $t8, 0
.L29:	nop	# endand
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	sw      $t8, gi1	#(gi1(int; offset: -1) = (gi1(int; offset: -1)&&li1(int; offset: 0)))
	lw      $t8, gi1	#gi1(int; offset: -1)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $a0, 4($sp)	#POP
	addu    $sp, $sp, 4
	li      $v0, 1	#system call code for print_int
	syscall			#printf("%d", gi1(int; offset: -1));

	li      $t8, 1	#literal
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	sw      $t8, gi1	#(gi1(int; offset: -1) = 1)
	lw      $t8, 0($fp)	#li1(int; offset: 0)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	sltu    $t8, $zero, $t8
	bne     $t8, $zero, .L30	#(li1(int; offset: 0)||gi1(int; offset: -1))
	lw      $t8, gi1	#gi1(int; offset: -1)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t9, 4($sp)	#POP
	addu    $sp, $sp, 4
	sltu    $t9, $zero, $t9
	bne     $t9, $zero, .L30
	li      $t8, 0
	j       .L31
.L30:	nop
	li      $t8, 1
.L31:	nop	# endand
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	sw      $t8, gi1	#(gi1(int; offset: -1) = (li1(int; offset: 0)||gi1(int; offset: -1)))
	lw      $t8, gi1	#gi1(int; offset: -1)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $a0, 4($sp)	#POP
	addu    $sp, $sp, 4
	li      $v0, 1	#system call code for print_int
	syscall			#printf("%d", gi1(int; offset: -1));

	li      $t8, 1	#literal
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	sw      $t8, gi1	#(gi1(int; offset: -1) = 1)
	lw      $t8, -4($fp)	#li2(int; offset: 4)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, 0($fp)	#li1(int; offset: 0)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t9, 4($sp)	#POP
	addu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	sub     $t8, $t8, $t9	#(li2(int; offset: 4)==li1(int; offset: 0))
	sltu    $t8, $zero, $t8
	slti    $t8, $t8, 1
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	sw      $t8, gi1	#(gi1(int; offset: -1) = (li2(int; offset: 4)==li1(int; offset: 0)))
	lw      $t8, gi1	#gi1(int; offset: -1)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $a0, 4($sp)	#POP
	addu    $sp, $sp, 4
	li      $v0, 1	#system call code for print_int
	syscall			#printf("%d", gi1(int; offset: -1));

	li      $t8, 1	#literal
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	sw      $t8, gi1	#(gi1(int; offset: -1) = 1)
	lw      $t8, -4($fp)	#li2(int; offset: 4)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, gi1	#gi1(int; offset: -1)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t9, 4($sp)	#POP
	addu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	sub     $t8, $t8, $t9	#(li2(int; offset: 4)!=gi1(int; offset: -1))
	sltu    $t8, $zero, $t8
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	sw      $t8, gi1	#(gi1(int; offset: -1) = (li2(int; offset: 4)!=gi1(int; offset: -1)))
	lw      $t8, gi1	#gi1(int; offset: -1)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $a0, 4($sp)	#POP
	addu    $sp, $sp, 4
	li      $v0, 1	#system call code for print_int
	syscall			#printf("%d", gi1(int; offset: -1));

	li      $t8, 1	#literal
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	sw      $t8, gi1	#(gi1(int; offset: -1) = 1)
	lw      $t8, 0($fp)	#li1(int; offset: 0)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, gi1	#gi1(int; offset: -1)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t9, 4($sp)	#POP
	addu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	sub     $t8, $t8, $t9	#(li1(int; offset: 0)<gi1(int; offset: -1))
	slt     $t8, $t8, $zero
	sltu    $t8, $zero, $t8
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	sw      $t8, gi1	#(gi1(int; offset: -1) = (li1(int; offset: 0)<gi1(int; offset: -1)))
	lw      $t8, gi1	#gi1(int; offset: -1)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $a0, 4($sp)	#POP
	addu    $sp, $sp, 4
	li      $v0, 1	#system call code for print_int
	syscall			#printf("%d", gi1(int; offset: -1));

	li      $t8, 1	#literal
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	sw      $t8, gi1	#(gi1(int; offset: -1) = 1)
	lw      $t8, gi1	#gi1(int; offset: -1)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, gi1	#gi1(int; offset: -1)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t9, 4($sp)	#POP
	addu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	sub     $t8, $t8, $t9	#(gi1(int; offset: -1)>gi1(int; offset: -1))
	slt     $t8, $zero, $t8
	sltu    $t8, $zero, $t8
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	sw      $t8, gi1	#(gi1(int; offset: -1) = (gi1(int; offset: -1)>gi1(int; offset: -1)))
	lw      $t8, gi1	#gi1(int; offset: -1)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $a0, 4($sp)	#POP
	addu    $sp, $sp, 4
	li      $v0, 1	#system call code for print_int
	syscall			#printf("%d", gi1(int; offset: -1));

	li      $t8, 1	#literal
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	sw      $t8, gi1	#(gi1(int; offset: -1) = 1)
	lw      $t8, 0($fp)	#li1(int; offset: 0)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, gi2	#gi2(int; offset: -1)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t9, 4($sp)	#POP
	addu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	sub     $t8, $t8, $t9	#(li1(int; offset: 0)<=gi2(int; offset: -1))
	slti    $t8, $t8, 1
	sltu    $t8, $zero, $t8
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	sw      $t8, gi1	#(gi1(int; offset: -1) = (li1(int; offset: 0)<=gi2(int; offset: -1)))
	lw      $t8, gi1	#gi1(int; offset: -1)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $a0, 4($sp)	#POP
	addu    $sp, $sp, 4
	li      $v0, 1	#system call code for print_int
	syscall			#printf("%d", gi1(int; offset: -1));

	li      $t8, 1	#literal
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	sw      $t8, gi1	#(gi1(int; offset: -1) = 1)
	la      $a0, .L0	#printf("\nEnd  one()  simple\n");

	li      $v0, 4
	syscall
	lw      $t8, gi2	#gi2(int; offset: -1)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	sw      $t8, -4($fp)	#(li2(int; offset: 4) = gi2(int; offset: -1))
	lw      $t8, -4($fp)	#li2(int; offset: 4)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $a0, 4($sp)	#POP
	addu    $sp, $sp, 4
	li      $v0, 1	#system call code for print_int
	syscall			#printf("%d", li2(int; offset: 4));

	la      $a0, .L1	#printf("\n");

	li      $v0, 4
	syscall
	la      $a0, .L2	#printf("\nEnd  one()  nested\n");

	li      $v0, 4
	syscall
	lw      $t8, gi2	#gi2(int; offset: -1)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	beq     $t8, $zero, .L32	#if
	li      $t8, 1	#literal
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	sw      $t8, -8($fp)	#(k(int; offset: 8) = 1)
	li      $t8, 2	#literal
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	sw      $t8, -12($fp)	#(l(int; offset: 12) = 2)
	lw      $t8, gi2	#gi2(int; offset: -1)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $a0, 4($sp)	#POP
	addu    $sp, $sp, 4
	li      $v0, 1	#system call code for print_int
	syscall			#printf("%d", gi2(int; offset: -1));

	lw      $t8, gi2	#gi2(int; offset: -1)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	sw      $t8, -8($fp)	#(k(int; offset: 8) = gi2(int; offset: -1))
	lw      $t8, -8($fp)	#k(int; offset: 8)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $a0, 4($sp)	#POP
	addu    $sp, $sp, 4
	li      $v0, 1	#system call code for print_int
	syscall			#printf("%d", k(int; offset: 8));

	lw      $t8, 0($fp)	#li1(int; offset: 0)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	li      $t9, -1
	mult    $t8, $t9	#(-li1(int; offset: 0))
	mflo    $t8
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	li      $t9, -1
	mult    $t8, $t9	#(-(-li1(int; offset: 0)))
	mflo    $t8
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	sw      $t8, -12($fp)	#(l(int; offset: 12) = (-(-li1(int; offset: 0))))
	lw      $t8, -12($fp)	#l(int; offset: 12)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $a0, 4($sp)	#POP
	addu    $sp, $sp, 4
	li      $v0, 1	#system call code for print_int
	syscall			#printf("%d", l(int; offset: 12));

.L32:	nop	# else
	la      $a0, .L3	#printf("\nEnd  one()  if\n");

	li      $v0, 4
	syscall
	lw      $t8, -4($fp)	#li2(int; offset: 4)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	sltu    $t8, $zero, $t8
	beq     $t8, $zero, .L33	#(!li2(int; offset: 4))
	li      $t8, 0
	j       .L34
.L33:	nop
	li      $t8, 1
.L34:	nop	# end not
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, -4($fp)	#li2(int; offset: 4)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t9, 4($sp)	#POP
	addu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	sub     $t8, $t8, $t9	#((!li2(int; offset: 4))-li2(int; offset: 4))
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, gi2	#gi2(int; offset: -1)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	sltu    $t8, $zero, $t8
	beq     $t8, $zero, .L35	#(!gi2(int; offset: -1))
	li      $t8, 0
	j       .L36
.L35:	nop
	li      $t8, 1
.L36:	nop	# end not
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	li      $t9, -1
	mult    $t8, $t9	#(-(!gi2(int; offset: -1)))
	mflo    $t8
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t9, 4($sp)	#POP
	addu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	sub     $t8, $t8, $t9	#(((!li2(int; offset: 4))-li2(int; offset: 4))==(-(!gi2(int; offset: -1))))
	sltu    $t8, $zero, $t8
	slti    $t8, $t8, 1
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	beq     $t8, $zero, .L37	#if
	li      $t8, 1	#literal
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	sw      $t8, -16($fp)	#(k(int; offset: 16) = 1)
	li      $t8, 2	#literal
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	sw      $t8, -20($fp)	#(l(int; offset: 20) = 2)
	lw      $t8, -4($fp)	#li2(int; offset: 4)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $a0, 4($sp)	#POP
	addu    $sp, $sp, 4
	li      $v0, 1	#system call code for print_int
	syscall			#printf("%d", li2(int; offset: 4));

	lw      $t8, -4($fp)	#li2(int; offset: 4)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	sltu    $t8, $zero, $t8
	beq     $t8, $zero, .L39	#(li2(int; offset: 4)&&li1(int; offset: 0))
	lw      $t8, 0($fp)	#li1(int; offset: 0)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t9, 4($sp)	#POP
	addu    $sp, $sp, 4
	sltu    $t9, $zero, $t9
	beq     $t9, $zero, .L39
	li      $t8, 1
	j       .L40
.L39:	nop
	li      $t8, 0
.L40:	nop	# endand
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	sltu    $t8, $zero, $t8
	beq     $t8, $zero, .L41	#(!(li2(int; offset: 4)&&li1(int; offset: 0)))
	li      $t8, 0
	j       .L42
.L41:	nop
	li      $t8, 1
.L42:	nop	# end not
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	sw      $t8, -16($fp)	#(k(int; offset: 16) = (!(li2(int; offset: 4)&&li1(int; offset: 0))))
	lw      $t8, -16($fp)	#k(int; offset: 16)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $a0, 4($sp)	#POP
	addu    $sp, $sp, 4
	li      $v0, 1	#system call code for print_int
	syscall			#printf("%d", k(int; offset: 16));

	lw      $t8, gi1	#gi1(int; offset: -1)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	sw      $t8, -20($fp)	#(l(int; offset: 20) = gi1(int; offset: -1))
	lw      $t8, -20($fp)	#l(int; offset: 20)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $a0, 4($sp)	#POP
	addu    $sp, $sp, 4
	li      $v0, 1	#system call code for print_int
	syscall			#printf("%d", l(int; offset: 20));

	j       .L38
.L37:	nop	# else
	li      $t8, 1	#literal
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	sw      $t8, -24($fp)	#(k(int; offset: 24) = 1)
	li      $t8, 2	#literal
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	sw      $t8, -28($fp)	#(l(int; offset: 28) = 2)
	lw      $t8, gi1	#gi1(int; offset: -1)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $a0, 4($sp)	#POP
	addu    $sp, $sp, 4
	li      $v0, 1	#system call code for print_int
	syscall			#printf("%d", gi1(int; offset: -1));

	lw      $t8, 0($fp)	#li1(int; offset: 0)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	sw      $t8, -24($fp)	#(k(int; offset: 24) = li1(int; offset: 0))
	lw      $t8, -24($fp)	#k(int; offset: 24)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $a0, 4($sp)	#POP
	addu    $sp, $sp, 4
	li      $v0, 1	#system call code for print_int
	syscall			#printf("%d", k(int; offset: 24));

	lw      $t8, -4($fp)	#li2(int; offset: 4)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	sw      $t8, -28($fp)	#(l(int; offset: 28) = li2(int; offset: 4))
	lw      $t8, -28($fp)	#l(int; offset: 28)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $a0, 4($sp)	#POP
	addu    $sp, $sp, 4
	li      $v0, 1	#system call code for print_int
	syscall			#printf("%d", l(int; offset: 28));

.L38:	nop	# end if
	la      $a0, .L4	#printf("\nEnd  one()  else\n");

	li      $v0, 4
	syscall
	li      $t8, 4	#literal
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	sw      $t8, 0($fp)	#(li1(int; offset: 0) = 4)
.L43:	nop	# while
	lw      $t8, 0($fp)	#li1(int; offset: 0)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	li      $t8, 0	#literal
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t9, 4($sp)	#POP
	addu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	sub     $t8, $t8, $t9	#(li1(int; offset: 0)>0)
	slt     $t8, $zero, $t8
	sltu    $t8, $zero, $t8
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	beq     $t8, $zero, .L44	#while
	li      $t8, 1	#literal
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	sw      $t8, -32($fp)	#(k(int; offset: 32) = 1)
	li      $t8, 2	#literal
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	sw      $t8, -36($fp)	#(l(int; offset: 36) = 2)
	lw      $t8, -4($fp)	#li2(int; offset: 4)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $a0, 4($sp)	#POP
	addu    $sp, $sp, 4
	li      $v0, 1	#system call code for print_int
	syscall			#printf("%d", li2(int; offset: 4));

	lw      $t8, -4($fp)	#li2(int; offset: 4)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, gi2	#gi2(int; offset: -1)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	sltu    $t8, $zero, $t8
	beq     $t8, $zero, .L45	#(gi2(int; offset: -1)&&(-li2(int; offset: 4)))
	lw      $t8, -4($fp)	#li2(int; offset: 4)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	li      $t9, -1
	mult    $t8, $t9	#(-li2(int; offset: 4))
	mflo    $t8
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t9, 4($sp)	#POP
	addu    $sp, $sp, 4
	sltu    $t9, $zero, $t9
	beq     $t9, $zero, .L45
	li      $t8, 1
	j       .L46
.L45:	nop
	li      $t8, 0
.L46:	nop	# endand
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t9, 4($sp)	#POP
	addu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	sub     $t8, $t8, $t9	#(li2(int; offset: 4)>(gi2(int; offset: -1)&&(-li2(int; offset: 4))))
	slt     $t8, $zero, $t8
	sltu    $t8, $zero, $t8
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	sw      $t8, -32($fp)	#(k(int; offset: 32) = (li2(int; offset: 4)>(gi2(int; offset: -1)&&(-li2(int; offset: 4)))))
	lw      $t8, -32($fp)	#k(int; offset: 32)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $a0, 4($sp)	#POP
	addu    $sp, $sp, 4
	li      $v0, 1	#system call code for print_int
	syscall			#printf("%d", k(int; offset: 32));

	lw      $t8, gi1	#gi1(int; offset: -1)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	sw      $t8, -36($fp)	#(l(int; offset: 36) = gi1(int; offset: -1))
	lw      $t8, -36($fp)	#l(int; offset: 36)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $a0, 4($sp)	#POP
	addu    $sp, $sp, 4
	li      $v0, 1	#system call code for print_int
	syscall			#printf("%d", l(int; offset: 36));

	lw      $t8, 0($fp)
	addi    $t8, $t8, -1	#li1(int; offset: 0)--;

	sw      $t8, 0($fp)
	j       .L43
.L44:	nop	# end while
	la      $a0, .L5	#printf("\nEnd  one()  while\n");

	li      $v0, 4
	syscall
	la      $a0, .L6	#printf("\nEnd  one()  call\n");

	li      $v0, 4
	syscall
	lw      $t8, gi1	#gi1(int; offset: -1)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	sltu    $t8, $zero, $t8
	beq     $t8, $zero, .L47	#(!gi1(int; offset: -1))
	li      $t8, 0
	j       .L48
.L47:	nop
	li      $t8, 1
.L48:	nop	# end not
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $v0, 4($sp)	#POP
	addu    $sp, $sp, 4
	move    $sp, $fp
	lw      $fp, 4($sp)	#POP
	addu    $sp, $sp, 4
	lw      $ra, 4($sp)	#POP
	addu    $sp, $sp, 4
	jr      $ra
two:	nop	# function two
	sw      $ra, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	sw      $fp, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	move    $fp, $sp	#init fp
	subu    $sp, $sp, 40	#allocate AR
	li      $t8, 1	#literal
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	sw      $t8, gi1	#(gi1(int; offset: -1) = 1)
	li      $t8, 2	#literal
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	sw      $t8, gi2	#(gi2(int; offset: -1) = 2)
	lw      $t8, gi1	#gi1(int; offset: -1)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, -4($fp)	#li2(int; offset: 4)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t9, 4($sp)	#POP
	addu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	add     $t8, $t8, $t9	#(gi1(int; offset: -1)+li2(int; offset: 4))
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	sw      $t8, gi1	#(gi1(int; offset: -1) = (gi1(int; offset: -1)+li2(int; offset: 4)))
	lw      $t8, gi1	#gi1(int; offset: -1)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $a0, 4($sp)	#POP
	addu    $sp, $sp, 4
	li      $v0, 1	#system call code for print_int
	syscall			#printf("%d", gi1(int; offset: -1));

	li      $t8, 1	#literal
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	sw      $t8, gi1	#(gi1(int; offset: -1) = 1)
	lw      $t8, gi1	#gi1(int; offset: -1)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, -4($fp)	#li2(int; offset: 4)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t9, 4($sp)	#POP
	addu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	sub     $t8, $t8, $t9	#(gi1(int; offset: -1)-li2(int; offset: 4))
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	sw      $t8, gi1	#(gi1(int; offset: -1) = (gi1(int; offset: -1)-li2(int; offset: 4)))
	lw      $t8, gi1	#gi1(int; offset: -1)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $a0, 4($sp)	#POP
	addu    $sp, $sp, 4
	li      $v0, 1	#system call code for print_int
	syscall			#printf("%d", gi1(int; offset: -1));

	li      $t8, 1	#literal
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	sw      $t8, gi1	#(gi1(int; offset: -1) = 1)
	lw      $t8, gi2	#gi2(int; offset: -1)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, gi2	#gi2(int; offset: -1)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t9, 4($sp)	#POP
	addu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	mult    $t8, $t9	#(gi2(int; offset: -1)*gi2(int; offset: -1))
	mflo    $t8		#(gi2(int; offset: -1)*gi2(int; offset: -1))
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	sw      $t8, gi1	#(gi1(int; offset: -1) = (gi2(int; offset: -1)*gi2(int; offset: -1)))
	lw      $t8, gi1	#gi1(int; offset: -1)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $a0, 4($sp)	#POP
	addu    $sp, $sp, 4
	li      $v0, 1	#system call code for print_int
	syscall			#printf("%d", gi1(int; offset: -1));

	li      $t8, 1	#literal
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	sw      $t8, gi1	#(gi1(int; offset: -1) = 1)
	lw      $t8, -4($fp)	#li2(int; offset: 4)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, gi2	#gi2(int; offset: -1)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t9, 4($sp)	#POP
	addu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	mult    $t8, $t9	#(li2(int; offset: 4)*gi2(int; offset: -1))
	mflo    $t8		#(li2(int; offset: 4)*gi2(int; offset: -1))
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	sw      $t8, gi1	#(gi1(int; offset: -1) = (li2(int; offset: 4)*gi2(int; offset: -1)))
	lw      $t8, gi1	#gi1(int; offset: -1)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $a0, 4($sp)	#POP
	addu    $sp, $sp, 4
	li      $v0, 1	#system call code for print_int
	syscall			#printf("%d", gi1(int; offset: -1));

	li      $t8, 1	#literal
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	sw      $t8, gi1	#(gi1(int; offset: -1) = 1)
	lw      $t8, -4($fp)	#li2(int; offset: 4)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	sltu    $t8, $zero, $t8
	beq     $t8, $zero, .L49	#(li2(int; offset: 4)&&li2(int; offset: 4))
	lw      $t8, -4($fp)	#li2(int; offset: 4)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t9, 4($sp)	#POP
	addu    $sp, $sp, 4
	sltu    $t9, $zero, $t9
	beq     $t9, $zero, .L49
	li      $t8, 1
	j       .L50
.L49:	nop
	li      $t8, 0
.L50:	nop	# endand
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	sw      $t8, gi1	#(gi1(int; offset: -1) = (li2(int; offset: 4)&&li2(int; offset: 4)))
	lw      $t8, gi1	#gi1(int; offset: -1)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $a0, 4($sp)	#POP
	addu    $sp, $sp, 4
	li      $v0, 1	#system call code for print_int
	syscall			#printf("%d", gi1(int; offset: -1));

	li      $t8, 1	#literal
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	sw      $t8, gi1	#(gi1(int; offset: -1) = 1)
	lw      $t8, gi2	#gi2(int; offset: -1)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	sltu    $t8, $zero, $t8
	bne     $t8, $zero, .L51	#(gi2(int; offset: -1)||gi2(int; offset: -1))
	lw      $t8, gi2	#gi2(int; offset: -1)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t9, 4($sp)	#POP
	addu    $sp, $sp, 4
	sltu    $t9, $zero, $t9
	bne     $t9, $zero, .L51
	li      $t8, 0
	j       .L52
.L51:	nop
	li      $t8, 1
.L52:	nop	# endand
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	sw      $t8, gi1	#(gi1(int; offset: -1) = (gi2(int; offset: -1)||gi2(int; offset: -1)))
	lw      $t8, gi1	#gi1(int; offset: -1)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $a0, 4($sp)	#POP
	addu    $sp, $sp, 4
	li      $v0, 1	#system call code for print_int
	syscall			#printf("%d", gi1(int; offset: -1));

	li      $t8, 1	#literal
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	sw      $t8, gi1	#(gi1(int; offset: -1) = 1)
	lw      $t8, 0($fp)	#li1(int; offset: 0)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, 0($fp)	#li1(int; offset: 0)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t9, 4($sp)	#POP
	addu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	sub     $t8, $t8, $t9	#(li1(int; offset: 0)==li1(int; offset: 0))
	sltu    $t8, $zero, $t8
	slti    $t8, $t8, 1
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	sw      $t8, gi1	#(gi1(int; offset: -1) = (li1(int; offset: 0)==li1(int; offset: 0)))
	lw      $t8, gi1	#gi1(int; offset: -1)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $a0, 4($sp)	#POP
	addu    $sp, $sp, 4
	li      $v0, 1	#system call code for print_int
	syscall			#printf("%d", gi1(int; offset: -1));

	li      $t8, 1	#literal
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	sw      $t8, gi1	#(gi1(int; offset: -1) = 1)
	lw      $t8, 0($fp)	#li1(int; offset: 0)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, 0($fp)	#li1(int; offset: 0)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t9, 4($sp)	#POP
	addu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	sub     $t8, $t8, $t9	#(li1(int; offset: 0)!=li1(int; offset: 0))
	sltu    $t8, $zero, $t8
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	sw      $t8, gi1	#(gi1(int; offset: -1) = (li1(int; offset: 0)!=li1(int; offset: 0)))
	lw      $t8, gi1	#gi1(int; offset: -1)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $a0, 4($sp)	#POP
	addu    $sp, $sp, 4
	li      $v0, 1	#system call code for print_int
	syscall			#printf("%d", gi1(int; offset: -1));

	li      $t8, 1	#literal
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	sw      $t8, gi1	#(gi1(int; offset: -1) = 1)
	lw      $t8, gi2	#gi2(int; offset: -1)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, gi2	#gi2(int; offset: -1)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t9, 4($sp)	#POP
	addu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	sub     $t8, $t8, $t9	#(gi2(int; offset: -1)<gi2(int; offset: -1))
	slt     $t8, $t8, $zero
	sltu    $t8, $zero, $t8
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	sw      $t8, gi1	#(gi1(int; offset: -1) = (gi2(int; offset: -1)<gi2(int; offset: -1)))
	lw      $t8, gi1	#gi1(int; offset: -1)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $a0, 4($sp)	#POP
	addu    $sp, $sp, 4
	li      $v0, 1	#system call code for print_int
	syscall			#printf("%d", gi1(int; offset: -1));

	li      $t8, 1	#literal
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	sw      $t8, gi1	#(gi1(int; offset: -1) = 1)
	lw      $t8, gi1	#gi1(int; offset: -1)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, 0($fp)	#li1(int; offset: 0)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t9, 4($sp)	#POP
	addu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	sub     $t8, $t8, $t9	#(gi1(int; offset: -1)>li1(int; offset: 0))
	slt     $t8, $zero, $t8
	sltu    $t8, $zero, $t8
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	sw      $t8, gi1	#(gi1(int; offset: -1) = (gi1(int; offset: -1)>li1(int; offset: 0)))
	lw      $t8, gi1	#gi1(int; offset: -1)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $a0, 4($sp)	#POP
	addu    $sp, $sp, 4
	li      $v0, 1	#system call code for print_int
	syscall			#printf("%d", gi1(int; offset: -1));

	li      $t8, 1	#literal
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	sw      $t8, gi1	#(gi1(int; offset: -1) = 1)
	lw      $t8, -4($fp)	#li2(int; offset: 4)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, gi1	#gi1(int; offset: -1)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t9, 4($sp)	#POP
	addu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	sub     $t8, $t8, $t9	#(li2(int; offset: 4)<=gi1(int; offset: -1))
	slti    $t8, $t8, 1
	sltu    $t8, $zero, $t8
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	sw      $t8, gi1	#(gi1(int; offset: -1) = (li2(int; offset: 4)<=gi1(int; offset: -1)))
	lw      $t8, gi1	#gi1(int; offset: -1)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $a0, 4($sp)	#POP
	addu    $sp, $sp, 4
	li      $v0, 1	#system call code for print_int
	syscall			#printf("%d", gi1(int; offset: -1));

	li      $t8, 1	#literal
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	sw      $t8, gi1	#(gi1(int; offset: -1) = 1)
	la      $a0, .L7	#printf("\nEnd  two(int li1, int li2)  simple\n");

	li      $v0, 4
	syscall
	lw      $t8, gi1	#gi1(int; offset: -1)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, -4($fp)	#li2(int; offset: 4)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, gi2	#gi2(int; offset: -1)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t9, 4($sp)	#POP
	addu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	sub     $t8, $t8, $t9	#(li2(int; offset: 4)>gi2(int; offset: -1))
	slt     $t8, $zero, $t8
	sltu    $t8, $zero, $t8
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	sltu    $t8, $zero, $t8
	bne     $t8, $zero, .L53	#((li2(int; offset: 4)>gi2(int; offset: -1))||(gi2(int; offset: -1)>gi2(int; offset: -1)))
	lw      $t8, gi2	#gi2(int; offset: -1)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, gi2	#gi2(int; offset: -1)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t9, 4($sp)	#POP
	addu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	sub     $t8, $t8, $t9	#(gi2(int; offset: -1)>gi2(int; offset: -1))
	slt     $t8, $zero, $t8
	sltu    $t8, $zero, $t8
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t9, 4($sp)	#POP
	addu    $sp, $sp, 4
	sltu    $t9, $zero, $t9
	bne     $t9, $zero, .L53
	li      $t8, 0
	j       .L54
.L53:	nop
	li      $t8, 1
.L54:	nop	# endand
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t9, 4($sp)	#POP
	addu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	sub     $t8, $t8, $t9	#(gi1(int; offset: -1)!=((li2(int; offset: 4)>gi2(int; offset: -1))||(gi2(int; offset: -1)>gi2(int; offset: -1))))
	sltu    $t8, $zero, $t8
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	sw      $t8, gi1	#(gi1(int; offset: -1) = (gi1(int; offset: -1)!=((li2(int; offset: 4)>gi2(int; offset: -1))||(gi2(int; offset: -1)>gi2(int; offset: -1)))))
	lw      $t8, gi1	#gi1(int; offset: -1)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $a0, 4($sp)	#POP
	addu    $sp, $sp, 4
	li      $v0, 1	#system call code for print_int
	syscall			#printf("%d", gi1(int; offset: -1));

	la      $a0, .L8	#printf("\n");

	li      $v0, 4
	syscall
	la      $a0, .L9	#printf("\nEnd  two(int li1, int li2)  nested\n");

	li      $v0, 4
	syscall
	lw      $t8, -4($fp)	#li2(int; offset: 4)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	sltu    $t8, $zero, $t8
	beq     $t8, $zero, .L55	#(!li2(int; offset: 4))
	li      $t8, 0
	j       .L56
.L55:	nop
	li      $t8, 1
.L56:	nop	# end not
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	beq     $t8, $zero, .L57	#if
	li      $t8, 1	#literal
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	sw      $t8, -8($fp)	#(k(int; offset: 8) = 1)
	li      $t8, 2	#literal
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	sw      $t8, -12($fp)	#(l(int; offset: 12) = 2)
	lw      $t8, gi2	#gi2(int; offset: -1)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $a0, 4($sp)	#POP
	addu    $sp, $sp, 4
	li      $v0, 1	#system call code for print_int
	syscall			#printf("%d", gi2(int; offset: -1));

	lw      $t8, gi2	#gi2(int; offset: -1)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	li      $t9, -1
	mult    $t8, $t9	#(-gi2(int; offset: -1))
	mflo    $t8
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, -4($fp)	#li2(int; offset: 4)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t9, 4($sp)	#POP
	addu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	sub     $t8, $t8, $t9	#((-gi2(int; offset: -1))>li2(int; offset: 4))
	slt     $t8, $zero, $t8
	sltu    $t8, $zero, $t8
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	li      $t9, -1
	mult    $t8, $t9	#(-((-gi2(int; offset: -1))>li2(int; offset: 4)))
	mflo    $t8
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	sw      $t8, -8($fp)	#(k(int; offset: 8) = (-((-gi2(int; offset: -1))>li2(int; offset: 4))))
	lw      $t8, -8($fp)	#k(int; offset: 8)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $a0, 4($sp)	#POP
	addu    $sp, $sp, 4
	li      $v0, 1	#system call code for print_int
	syscall			#printf("%d", k(int; offset: 8));

	lw      $t8, 0($fp)	#li1(int; offset: 0)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	sltu    $t8, $zero, $t8
	beq     $t8, $zero, .L60	#(!li1(int; offset: 0))
	li      $t8, 0
	j       .L61
.L60:	nop
	li      $t8, 1
.L61:	nop	# end not
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	sltu    $t8, $zero, $t8
	beq     $t8, $zero, .L58	#((!li1(int; offset: 0))&&(li1(int; offset: 0)<=li1(int; offset: 0)))
	lw      $t8, 0($fp)	#li1(int; offset: 0)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, 0($fp)	#li1(int; offset: 0)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t9, 4($sp)	#POP
	addu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	sub     $t8, $t8, $t9	#(li1(int; offset: 0)<=li1(int; offset: 0))
	slti    $t8, $t8, 1
	sltu    $t8, $zero, $t8
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t9, 4($sp)	#POP
	addu    $sp, $sp, 4
	sltu    $t9, $zero, $t9
	beq     $t9, $zero, .L58
	li      $t8, 1
	j       .L59
.L58:	nop
	li      $t8, 0
.L59:	nop	# endand
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	sltu    $t8, $zero, $t8
	beq     $t8, $zero, .L62	#(!((!li1(int; offset: 0))&&(li1(int; offset: 0)<=li1(int; offset: 0))))
	li      $t8, 0
	j       .L63
.L62:	nop
	li      $t8, 1
.L63:	nop	# end not
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	sw      $t8, -12($fp)	#(l(int; offset: 12) = (!((!li1(int; offset: 0))&&(li1(int; offset: 0)<=li1(int; offset: 0)))))
	lw      $t8, -12($fp)	#l(int; offset: 12)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $a0, 4($sp)	#POP
	addu    $sp, $sp, 4
	li      $v0, 1	#system call code for print_int
	syscall			#printf("%d", l(int; offset: 12));

.L57:	nop	# else
	la      $a0, .L10	#printf("\nEnd  two(int li1, int li2)  if\n");

	li      $v0, 4
	syscall
	lw      $t8, 0($fp)	#li1(int; offset: 0)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	beq     $t8, $zero, .L64	#if
	li      $t8, 1	#literal
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	sw      $t8, -16($fp)	#(k(int; offset: 16) = 1)
	li      $t8, 2	#literal
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	sw      $t8, -20($fp)	#(l(int; offset: 20) = 2)
	lw      $t8, gi2	#gi2(int; offset: -1)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $a0, 4($sp)	#POP
	addu    $sp, $sp, 4
	li      $v0, 1	#system call code for print_int
	syscall			#printf("%d", gi2(int; offset: -1));

	lw      $t8, -4($fp)	#li2(int; offset: 4)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	sltu    $t8, $zero, $t8
	beq     $t8, $zero, .L66	#(!li2(int; offset: 4))
	li      $t8, 0
	j       .L67
.L66:	nop
	li      $t8, 1
.L67:	nop	# end not
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	sw      $t8, -16($fp)	#(k(int; offset: 16) = (!li2(int; offset: 4)))
	lw      $t8, -16($fp)	#k(int; offset: 16)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $a0, 4($sp)	#POP
	addu    $sp, $sp, 4
	li      $v0, 1	#system call code for print_int
	syscall			#printf("%d", k(int; offset: 16));

	lw      $t8, 0($fp)	#li1(int; offset: 0)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, gi1	#gi1(int; offset: -1)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, gi2	#gi2(int; offset: -1)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t9, 4($sp)	#POP
	addu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	sub     $t8, $t8, $t9	#(gi1(int; offset: -1)<gi2(int; offset: -1))
	slt     $t8, $t8, $zero
	sltu    $t8, $zero, $t8
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t9, 4($sp)	#POP
	addu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	sub     $t8, $t8, $t9	#(li1(int; offset: 0)>=(gi1(int; offset: -1)<gi2(int; offset: -1)))
	li      $t9, -1
	slt     $t8, $t9, $t8
	sltu    $t8, $zero, $t8
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	li      $t9, -1
	mult    $t8, $t9	#(-(li1(int; offset: 0)>=(gi1(int; offset: -1)<gi2(int; offset: -1))))
	mflo    $t8
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	sw      $t8, -20($fp)	#(l(int; offset: 20) = (-(li1(int; offset: 0)>=(gi1(int; offset: -1)<gi2(int; offset: -1)))))
	lw      $t8, -20($fp)	#l(int; offset: 20)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $a0, 4($sp)	#POP
	addu    $sp, $sp, 4
	li      $v0, 1	#system call code for print_int
	syscall			#printf("%d", l(int; offset: 20));

	j       .L65
.L64:	nop	# else
	li      $t8, 1	#literal
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	sw      $t8, -24($fp)	#(k(int; offset: 24) = 1)
	li      $t8, 2	#literal
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	sw      $t8, -28($fp)	#(l(int; offset: 28) = 2)
	lw      $t8, gi2	#gi2(int; offset: -1)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $a0, 4($sp)	#POP
	addu    $sp, $sp, 4
	li      $v0, 1	#system call code for print_int
	syscall			#printf("%d", gi2(int; offset: -1));

	lw      $t8, gi1	#gi1(int; offset: -1)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	sw      $t8, -24($fp)	#(k(int; offset: 24) = gi1(int; offset: -1))
	lw      $t8, -24($fp)	#k(int; offset: 24)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $a0, 4($sp)	#POP
	addu    $sp, $sp, 4
	li      $v0, 1	#system call code for print_int
	syscall			#printf("%d", k(int; offset: 24));

	lw      $t8, 0($fp)	#li1(int; offset: 0)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	li      $t9, -1
	mult    $t8, $t9	#(-li1(int; offset: 0))
	mflo    $t8
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	sw      $t8, -28($fp)	#(l(int; offset: 28) = (-li1(int; offset: 0)))
	lw      $t8, -28($fp)	#l(int; offset: 28)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $a0, 4($sp)	#POP
	addu    $sp, $sp, 4
	li      $v0, 1	#system call code for print_int
	syscall			#printf("%d", l(int; offset: 28));

.L65:	nop	# end if
	la      $a0, .L11	#printf("\nEnd  two(int li1, int li2)  else\n");

	li      $v0, 4
	syscall
	li      $t8, 66	#literal
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	sw      $t8, 0($fp)	#(li1(int; offset: 0) = 66)
.L68:	nop	# while
	lw      $t8, 0($fp)	#li1(int; offset: 0)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	li      $t8, 0	#literal
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t9, 4($sp)	#POP
	addu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	sub     $t8, $t8, $t9	#(li1(int; offset: 0)>0)
	slt     $t8, $zero, $t8
	sltu    $t8, $zero, $t8
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	beq     $t8, $zero, .L69	#while
	li      $t8, 1	#literal
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	sw      $t8, -32($fp)	#(k(int; offset: 32) = 1)
	li      $t8, 2	#literal
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	sw      $t8, -36($fp)	#(l(int; offset: 36) = 2)
	lw      $t8, -4($fp)	#li2(int; offset: 4)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $a0, 4($sp)	#POP
	addu    $sp, $sp, 4
	li      $v0, 1	#system call code for print_int
	syscall			#printf("%d", li2(int; offset: 4));

	lw      $t8, 0($fp)	#li1(int; offset: 0)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	sw      $t8, -32($fp)	#(k(int; offset: 32) = li1(int; offset: 0))
	lw      $t8, -32($fp)	#k(int; offset: 32)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $a0, 4($sp)	#POP
	addu    $sp, $sp, 4
	li      $v0, 1	#system call code for print_int
	syscall			#printf("%d", k(int; offset: 32));

	lw      $t8, -4($fp)	#li2(int; offset: 4)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, gi2	#gi2(int; offset: -1)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t9, 4($sp)	#POP
	addu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	sub     $t8, $t8, $t9	#(li2(int; offset: 4)>=gi2(int; offset: -1))
	li      $t9, -1
	slt     $t8, $t9, $t8
	sltu    $t8, $zero, $t8
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	li      $t9, -1
	mult    $t8, $t9	#(-(li2(int; offset: 4)>=gi2(int; offset: -1)))
	mflo    $t8
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, gi1	#gi1(int; offset: -1)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t9, 4($sp)	#POP
	addu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	sub     $t8, $t8, $t9	#((-(li2(int; offset: 4)>=gi2(int; offset: -1)))<=gi1(int; offset: -1))
	slti    $t8, $t8, 1
	sltu    $t8, $zero, $t8
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	sw      $t8, -36($fp)	#(l(int; offset: 36) = ((-(li2(int; offset: 4)>=gi2(int; offset: -1)))<=gi1(int; offset: -1)))
	lw      $t8, -36($fp)	#l(int; offset: 36)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $a0, 4($sp)	#POP
	addu    $sp, $sp, 4
	li      $v0, 1	#system call code for print_int
	syscall			#printf("%d", l(int; offset: 36));

	lw      $t8, 0($fp)
	addi    $t8, $t8, -1	#li1(int; offset: 0)--;

	sw      $t8, 0($fp)
	j       .L68
.L69:	nop	# end while
	la      $a0, .L12	#printf("\nEnd  two(int li1, int li2)  while\n");

	li      $v0, 4
	syscall
	jal     one		#one(->int; offset: -1)()
	sw      $v0, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	sw      $t8, 0($fp)	#(li1(int; offset: 0) = one(->int; offset: -1)())
	lw      $t8, 0($fp)	#li1(int; offset: 0)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $a0, 4($sp)	#POP
	addu    $sp, $sp, 4
	li      $v0, 1	#system call code for print_int
	syscall			#printf("%d", li1(int; offset: 0));

	jal     one		#one(->int; offset: -1)()
	sw      $v0, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	sw      $t8, 0($fp)	#(li1(int; offset: 0) = one(->int; offset: -1)())
	lw      $t8, 0($fp)	#li1(int; offset: 0)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $a0, 4($sp)	#POP
	addu    $sp, $sp, 4
	li      $v0, 1	#system call code for print_int
	syscall			#printf("%d", li1(int; offset: 0));

	jal     one		#one(->int; offset: -1)()
	sw      $v0, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	sw      $t8, 0($fp)	#(li1(int; offset: 0) = one(->int; offset: -1)())
	lw      $t8, 0($fp)	#li1(int; offset: 0)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $a0, 4($sp)	#POP
	addu    $sp, $sp, 4
	li      $v0, 1	#system call code for print_int
	syscall			#printf("%d", li1(int; offset: 0));

	jal     one		#one(->int; offset: -1)()
	sw      $v0, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	sw      $t8, 0($fp)	#(li1(int; offset: 0) = one(->int; offset: -1)())
	lw      $t8, 0($fp)	#li1(int; offset: 0)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $a0, 4($sp)	#POP
	addu    $sp, $sp, 4
	li      $v0, 1	#system call code for print_int
	syscall			#printf("%d", li1(int; offset: 0));

	la      $a0, .L13	#printf("\nEnd  two(int li1, int li2)  call\n");

	li      $v0, 4
	syscall
	lw      $t8, 0($fp)	#li1(int; offset: 0)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	sltu    $t8, $zero, $t8
	beq     $t8, $zero, .L70	#(!li1(int; offset: 0))
	li      $t8, 0
	j       .L71
.L70:	nop
	li      $t8, 1
.L71:	nop	# end not
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $v0, 4($sp)	#POP
	addu    $sp, $sp, 4
	move    $sp, $fp
	lw      $fp, 4($sp)	#POP
	addu    $sp, $sp, 4
	lw      $ra, 4($sp)	#POP
	addu    $sp, $sp, 4
	jr      $ra
three:	nop	# function three
	sw      $ra, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	sw      $fp, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	move    $fp, $sp	#init fp
	subu    $sp, $sp, 40	#allocate AR
	li      $t8, 1	#literal
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	sw      $t8, gi1	#(gi1(int; offset: -1) = 1)
	li      $t8, 2	#literal
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	sw      $t8, gi2	#(gi2(int; offset: -1) = 2)
	lw      $t8, 0($fp)	#li1(int; offset: 0)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, -4($fp)	#li2(int; offset: 4)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t9, 4($sp)	#POP
	addu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	add     $t8, $t8, $t9	#(li1(int; offset: 0)+li2(int; offset: 4))
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	sw      $t8, gi1	#(gi1(int; offset: -1) = (li1(int; offset: 0)+li2(int; offset: 4)))
	lw      $t8, gi1	#gi1(int; offset: -1)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $a0, 4($sp)	#POP
	addu    $sp, $sp, 4
	li      $v0, 1	#system call code for print_int
	syscall			#printf("%d", gi1(int; offset: -1));

	li      $t8, 1	#literal
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	sw      $t8, gi1	#(gi1(int; offset: -1) = 1)
	lw      $t8, gi2	#gi2(int; offset: -1)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, gi1	#gi1(int; offset: -1)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t9, 4($sp)	#POP
	addu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	sub     $t8, $t8, $t9	#(gi2(int; offset: -1)-gi1(int; offset: -1))
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	sw      $t8, gi1	#(gi1(int; offset: -1) = (gi2(int; offset: -1)-gi1(int; offset: -1)))
	lw      $t8, gi1	#gi1(int; offset: -1)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $a0, 4($sp)	#POP
	addu    $sp, $sp, 4
	li      $v0, 1	#system call code for print_int
	syscall			#printf("%d", gi1(int; offset: -1));

	li      $t8, 1	#literal
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	sw      $t8, gi1	#(gi1(int; offset: -1) = 1)
	lw      $t8, 0($fp)	#li1(int; offset: 0)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, 0($fp)	#li1(int; offset: 0)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t9, 4($sp)	#POP
	addu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	mult    $t8, $t9	#(li1(int; offset: 0)*li1(int; offset: 0))
	mflo    $t8		#(li1(int; offset: 0)*li1(int; offset: 0))
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	sw      $t8, gi1	#(gi1(int; offset: -1) = (li1(int; offset: 0)*li1(int; offset: 0)))
	lw      $t8, gi1	#gi1(int; offset: -1)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $a0, 4($sp)	#POP
	addu    $sp, $sp, 4
	li      $v0, 1	#system call code for print_int
	syscall			#printf("%d", gi1(int; offset: -1));

	li      $t8, 1	#literal
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	sw      $t8, gi1	#(gi1(int; offset: -1) = 1)
	lw      $t8, gi2	#gi2(int; offset: -1)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, gi1	#gi1(int; offset: -1)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t9, 4($sp)	#POP
	addu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	mult    $t8, $t9	#(gi2(int; offset: -1)*gi1(int; offset: -1))
	mflo    $t8		#(gi2(int; offset: -1)*gi1(int; offset: -1))
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	sw      $t8, gi1	#(gi1(int; offset: -1) = (gi2(int; offset: -1)*gi1(int; offset: -1)))
	lw      $t8, gi1	#gi1(int; offset: -1)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $a0, 4($sp)	#POP
	addu    $sp, $sp, 4
	li      $v0, 1	#system call code for print_int
	syscall			#printf("%d", gi1(int; offset: -1));

	li      $t8, 1	#literal
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	sw      $t8, gi1	#(gi1(int; offset: -1) = 1)
	lw      $t8, gi1	#gi1(int; offset: -1)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	sltu    $t8, $zero, $t8
	beq     $t8, $zero, .L72	#(gi1(int; offset: -1)&&gi1(int; offset: -1))
	lw      $t8, gi1	#gi1(int; offset: -1)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t9, 4($sp)	#POP
	addu    $sp, $sp, 4
	sltu    $t9, $zero, $t9
	beq     $t9, $zero, .L72
	li      $t8, 1
	j       .L73
.L72:	nop
	li      $t8, 0
.L73:	nop	# endand
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	sw      $t8, gi1	#(gi1(int; offset: -1) = (gi1(int; offset: -1)&&gi1(int; offset: -1)))
	lw      $t8, gi1	#gi1(int; offset: -1)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $a0, 4($sp)	#POP
	addu    $sp, $sp, 4
	li      $v0, 1	#system call code for print_int
	syscall			#printf("%d", gi1(int; offset: -1));

	li      $t8, 1	#literal
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	sw      $t8, gi1	#(gi1(int; offset: -1) = 1)
	lw      $t8, 0($fp)	#li1(int; offset: 0)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	sltu    $t8, $zero, $t8
	bne     $t8, $zero, .L74	#(li1(int; offset: 0)||gi2(int; offset: -1))
	lw      $t8, gi2	#gi2(int; offset: -1)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t9, 4($sp)	#POP
	addu    $sp, $sp, 4
	sltu    $t9, $zero, $t9
	bne     $t9, $zero, .L74
	li      $t8, 0
	j       .L75
.L74:	nop
	li      $t8, 1
.L75:	nop	# endand
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	sw      $t8, gi1	#(gi1(int; offset: -1) = (li1(int; offset: 0)||gi2(int; offset: -1)))
	lw      $t8, gi1	#gi1(int; offset: -1)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $a0, 4($sp)	#POP
	addu    $sp, $sp, 4
	li      $v0, 1	#system call code for print_int
	syscall			#printf("%d", gi1(int; offset: -1));

	li      $t8, 1	#literal
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	sw      $t8, gi1	#(gi1(int; offset: -1) = 1)
	lw      $t8, 0($fp)	#li1(int; offset: 0)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, gi1	#gi1(int; offset: -1)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t9, 4($sp)	#POP
	addu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	sub     $t8, $t8, $t9	#(li1(int; offset: 0)==gi1(int; offset: -1))
	sltu    $t8, $zero, $t8
	slti    $t8, $t8, 1
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	sw      $t8, gi1	#(gi1(int; offset: -1) = (li1(int; offset: 0)==gi1(int; offset: -1)))
	lw      $t8, gi1	#gi1(int; offset: -1)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $a0, 4($sp)	#POP
	addu    $sp, $sp, 4
	li      $v0, 1	#system call code for print_int
	syscall			#printf("%d", gi1(int; offset: -1));

	li      $t8, 1	#literal
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	sw      $t8, gi1	#(gi1(int; offset: -1) = 1)
	lw      $t8, 0($fp)	#li1(int; offset: 0)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, -4($fp)	#li2(int; offset: 4)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t9, 4($sp)	#POP
	addu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	sub     $t8, $t8, $t9	#(li1(int; offset: 0)!=li2(int; offset: 4))
	sltu    $t8, $zero, $t8
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	sw      $t8, gi1	#(gi1(int; offset: -1) = (li1(int; offset: 0)!=li2(int; offset: 4)))
	lw      $t8, gi1	#gi1(int; offset: -1)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $a0, 4($sp)	#POP
	addu    $sp, $sp, 4
	li      $v0, 1	#system call code for print_int
	syscall			#printf("%d", gi1(int; offset: -1));

	li      $t8, 1	#literal
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	sw      $t8, gi1	#(gi1(int; offset: -1) = 1)
	lw      $t8, -4($fp)	#li2(int; offset: 4)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, gi2	#gi2(int; offset: -1)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t9, 4($sp)	#POP
	addu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	sub     $t8, $t8, $t9	#(li2(int; offset: 4)<gi2(int; offset: -1))
	slt     $t8, $t8, $zero
	sltu    $t8, $zero, $t8
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	sw      $t8, gi1	#(gi1(int; offset: -1) = (li2(int; offset: 4)<gi2(int; offset: -1)))
	lw      $t8, gi1	#gi1(int; offset: -1)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $a0, 4($sp)	#POP
	addu    $sp, $sp, 4
	li      $v0, 1	#system call code for print_int
	syscall			#printf("%d", gi1(int; offset: -1));

	li      $t8, 1	#literal
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	sw      $t8, gi1	#(gi1(int; offset: -1) = 1)
	lw      $t8, gi1	#gi1(int; offset: -1)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, gi2	#gi2(int; offset: -1)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t9, 4($sp)	#POP
	addu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	sub     $t8, $t8, $t9	#(gi1(int; offset: -1)>gi2(int; offset: -1))
	slt     $t8, $zero, $t8
	sltu    $t8, $zero, $t8
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	sw      $t8, gi1	#(gi1(int; offset: -1) = (gi1(int; offset: -1)>gi2(int; offset: -1)))
	lw      $t8, gi1	#gi1(int; offset: -1)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $a0, 4($sp)	#POP
	addu    $sp, $sp, 4
	li      $v0, 1	#system call code for print_int
	syscall			#printf("%d", gi1(int; offset: -1));

	li      $t8, 1	#literal
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	sw      $t8, gi1	#(gi1(int; offset: -1) = 1)
	lw      $t8, 0($fp)	#li1(int; offset: 0)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, 0($fp)	#li1(int; offset: 0)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t9, 4($sp)	#POP
	addu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	sub     $t8, $t8, $t9	#(li1(int; offset: 0)<=li1(int; offset: 0))
	slti    $t8, $t8, 1
	sltu    $t8, $zero, $t8
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	sw      $t8, gi1	#(gi1(int; offset: -1) = (li1(int; offset: 0)<=li1(int; offset: 0)))
	lw      $t8, gi1	#gi1(int; offset: -1)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $a0, 4($sp)	#POP
	addu    $sp, $sp, 4
	li      $v0, 1	#system call code for print_int
	syscall			#printf("%d", gi1(int; offset: -1));

	li      $t8, 1	#literal
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	sw      $t8, gi1	#(gi1(int; offset: -1) = 1)
	la      $a0, .L14	#printf("\nEnd  three(int li1, int li2)  simple\n");

	li      $v0, 4
	syscall
	lw      $t8, 0($fp)	#li1(int; offset: 0)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	sltu    $t8, $zero, $t8
	beq     $t8, $zero, .L76	#(li1(int; offset: 0)&&gi2(int; offset: -1))
	lw      $t8, gi2	#gi2(int; offset: -1)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t9, 4($sp)	#POP
	addu    $sp, $sp, 4
	sltu    $t9, $zero, $t9
	beq     $t9, $zero, .L76
	li      $t8, 1
	j       .L77
.L76:	nop
	li      $t8, 0
.L77:	nop	# endand
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	sw      $t8, gi2	#(gi2(int; offset: -1) = (li1(int; offset: 0)&&gi2(int; offset: -1)))
	lw      $t8, gi2	#gi2(int; offset: -1)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $a0, 4($sp)	#POP
	addu    $sp, $sp, 4
	li      $v0, 1	#system call code for print_int
	syscall			#printf("%d", gi2(int; offset: -1));

	la      $a0, .L15	#printf("\n");

	li      $v0, 4
	syscall
	la      $a0, .L16	#printf("\nEnd  three(int li1, int li2)  nested\n");

	li      $v0, 4
	syscall
	lw      $t8, -4($fp)	#li2(int; offset: 4)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, gi2	#gi2(int; offset: -1)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t9, 4($sp)	#POP
	addu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	sub     $t8, $t8, $t9	#(li2(int; offset: 4)!=gi2(int; offset: -1))
	sltu    $t8, $zero, $t8
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, gi2	#gi2(int; offset: -1)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	sltu    $t8, $zero, $t8
	beq     $t8, $zero, .L78	#(!gi2(int; offset: -1))
	li      $t8, 0
	j       .L79
.L78:	nop
	li      $t8, 1
.L79:	nop	# end not
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t9, 4($sp)	#POP
	addu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	sub     $t8, $t8, $t9	#((li2(int; offset: 4)!=gi2(int; offset: -1))>=(!gi2(int; offset: -1)))
	li      $t9, -1
	slt     $t8, $t9, $t8
	sltu    $t8, $zero, $t8
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, gi1	#gi1(int; offset: -1)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, gi2	#gi2(int; offset: -1)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	sltu    $t8, $zero, $t8
	beq     $t8, $zero, .L80	#(!gi2(int; offset: -1))
	li      $t8, 0
	j       .L81
.L80:	nop
	li      $t8, 1
.L81:	nop	# end not
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t9, 4($sp)	#POP
	addu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	mult    $t8, $t9	#(gi1(int; offset: -1)*(!gi2(int; offset: -1)))
	mflo    $t8		#(gi1(int; offset: -1)*(!gi2(int; offset: -1)))
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t9, 4($sp)	#POP
	addu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	sub     $t8, $t8, $t9	#(((li2(int; offset: 4)!=gi2(int; offset: -1))>=(!gi2(int; offset: -1)))==(gi1(int; offset: -1)*(!gi2(int; offset: -1))))
	sltu    $t8, $zero, $t8
	slti    $t8, $t8, 1
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	beq     $t8, $zero, .L82	#if
	li      $t8, 1	#literal
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	sw      $t8, -8($fp)	#(k(int; offset: 8) = 1)
	li      $t8, 2	#literal
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	sw      $t8, -12($fp)	#(l(int; offset: 12) = 2)
	lw      $t8, gi1	#gi1(int; offset: -1)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $a0, 4($sp)	#POP
	addu    $sp, $sp, 4
	li      $v0, 1	#system call code for print_int
	syscall			#printf("%d", gi1(int; offset: -1));

	lw      $t8, -4($fp)	#li2(int; offset: 4)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	sw      $t8, -8($fp)	#(k(int; offset: 8) = li2(int; offset: 4))
	lw      $t8, -8($fp)	#k(int; offset: 8)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $a0, 4($sp)	#POP
	addu    $sp, $sp, 4
	li      $v0, 1	#system call code for print_int
	syscall			#printf("%d", k(int; offset: 8));

	lw      $t8, gi1	#gi1(int; offset: -1)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	sltu    $t8, $zero, $t8
	beq     $t8, $zero, .L83	#(!gi1(int; offset: -1))
	li      $t8, 0
	j       .L84
.L83:	nop
	li      $t8, 1
.L84:	nop	# end not
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	sw      $t8, -12($fp)	#(l(int; offset: 12) = (!gi1(int; offset: -1)))
	lw      $t8, -12($fp)	#l(int; offset: 12)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $a0, 4($sp)	#POP
	addu    $sp, $sp, 4
	li      $v0, 1	#system call code for print_int
	syscall			#printf("%d", l(int; offset: 12));

.L82:	nop	# else
	la      $a0, .L17	#printf("\nEnd  three(int li1, int li2)  if\n");

	li      $v0, 4
	syscall
	lw      $t8, gi2	#gi2(int; offset: -1)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, 0($fp)	#li1(int; offset: 0)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, gi2	#gi2(int; offset: -1)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t9, 4($sp)	#POP
	addu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	sub     $t8, $t8, $t9	#(li1(int; offset: 0)!=gi2(int; offset: -1))
	sltu    $t8, $zero, $t8
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t9, 4($sp)	#POP
	addu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	mult    $t8, $t9	#(gi2(int; offset: -1)*(li1(int; offset: 0)!=gi2(int; offset: -1)))
	mflo    $t8		#(gi2(int; offset: -1)*(li1(int; offset: 0)!=gi2(int; offset: -1)))
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	li      $t9, -1
	mult    $t8, $t9	#(-(gi2(int; offset: -1)*(li1(int; offset: 0)!=gi2(int; offset: -1))))
	mflo    $t8
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	beq     $t8, $zero, .L85	#if
	li      $t8, 1	#literal
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	sw      $t8, -16($fp)	#(k(int; offset: 16) = 1)
	li      $t8, 2	#literal
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	sw      $t8, -20($fp)	#(l(int; offset: 20) = 2)
	lw      $t8, -4($fp)	#li2(int; offset: 4)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $a0, 4($sp)	#POP
	addu    $sp, $sp, 4
	li      $v0, 1	#system call code for print_int
	syscall			#printf("%d", li2(int; offset: 4));

	lw      $t8, 0($fp)	#li1(int; offset: 0)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	sw      $t8, -16($fp)	#(k(int; offset: 16) = li1(int; offset: 0))
	lw      $t8, -16($fp)	#k(int; offset: 16)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $a0, 4($sp)	#POP
	addu    $sp, $sp, 4
	li      $v0, 1	#system call code for print_int
	syscall			#printf("%d", k(int; offset: 16));

	lw      $t8, gi1	#gi1(int; offset: -1)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, gi2	#gi2(int; offset: -1)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t9, 4($sp)	#POP
	addu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	sub     $t8, $t8, $t9	#(gi1(int; offset: -1)-gi2(int; offset: -1))
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, gi2	#gi2(int; offset: -1)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t9, 4($sp)	#POP
	addu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	sub     $t8, $t8, $t9	#((gi1(int; offset: -1)-gi2(int; offset: -1))!=gi2(int; offset: -1))
	sltu    $t8, $zero, $t8
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	sltu    $t8, $zero, $t8
	beq     $t8, $zero, .L87	#(!((gi1(int; offset: -1)-gi2(int; offset: -1))!=gi2(int; offset: -1)))
	li      $t8, 0
	j       .L88
.L87:	nop
	li      $t8, 1
.L88:	nop	# end not
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	sw      $t8, -20($fp)	#(l(int; offset: 20) = (!((gi1(int; offset: -1)-gi2(int; offset: -1))!=gi2(int; offset: -1))))
	lw      $t8, -20($fp)	#l(int; offset: 20)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $a0, 4($sp)	#POP
	addu    $sp, $sp, 4
	li      $v0, 1	#system call code for print_int
	syscall			#printf("%d", l(int; offset: 20));

	j       .L86
.L85:	nop	# else
	li      $t8, 1	#literal
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	sw      $t8, -24($fp)	#(k(int; offset: 24) = 1)
	li      $t8, 2	#literal
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	sw      $t8, -28($fp)	#(l(int; offset: 28) = 2)
	lw      $t8, gi1	#gi1(int; offset: -1)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $a0, 4($sp)	#POP
	addu    $sp, $sp, 4
	li      $v0, 1	#system call code for print_int
	syscall			#printf("%d", gi1(int; offset: -1));

	lw      $t8, gi1	#gi1(int; offset: -1)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, gi2	#gi2(int; offset: -1)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t9, 4($sp)	#POP
	addu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	sub     $t8, $t8, $t9	#(gi1(int; offset: -1)!=gi2(int; offset: -1))
	sltu    $t8, $zero, $t8
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	sltu    $t8, $zero, $t8
	beq     $t8, $zero, .L89	#(!(gi1(int; offset: -1)!=gi2(int; offset: -1)))
	li      $t8, 0
	j       .L90
.L89:	nop
	li      $t8, 1
.L90:	nop	# end not
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, 0($fp)	#li1(int; offset: 0)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t9, 4($sp)	#POP
	addu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	sub     $t8, $t8, $t9	#((!(gi1(int; offset: -1)!=gi2(int; offset: -1)))!=li1(int; offset: 0))
	sltu    $t8, $zero, $t8
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	sw      $t8, -24($fp)	#(k(int; offset: 24) = ((!(gi1(int; offset: -1)!=gi2(int; offset: -1)))!=li1(int; offset: 0)))
	lw      $t8, -24($fp)	#k(int; offset: 24)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $a0, 4($sp)	#POP
	addu    $sp, $sp, 4
	li      $v0, 1	#system call code for print_int
	syscall			#printf("%d", k(int; offset: 24));

	lw      $t8, 0($fp)	#li1(int; offset: 0)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, -4($fp)	#li2(int; offset: 4)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, gi2	#gi2(int; offset: -1)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t9, 4($sp)	#POP
	addu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	sub     $t8, $t8, $t9	#(li2(int; offset: 4)-gi2(int; offset: -1))
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, -4($fp)	#li2(int; offset: 4)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	li      $t9, -1
	mult    $t8, $t9	#(-li2(int; offset: 4))
	mflo    $t8
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t9, 4($sp)	#POP
	addu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	sub     $t8, $t8, $t9	#((li2(int; offset: 4)-gi2(int; offset: -1))!=(-li2(int; offset: 4)))
	sltu    $t8, $zero, $t8
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t9, 4($sp)	#POP
	addu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	mult    $t8, $t9	#(li1(int; offset: 0)*((li2(int; offset: 4)-gi2(int; offset: -1))!=(-li2(int; offset: 4))))
	mflo    $t8		#(li1(int; offset: 0)*((li2(int; offset: 4)-gi2(int; offset: -1))!=(-li2(int; offset: 4))))
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	sw      $t8, -28($fp)	#(l(int; offset: 28) = (li1(int; offset: 0)*((li2(int; offset: 4)-gi2(int; offset: -1))!=(-li2(int; offset: 4)))))
	lw      $t8, -28($fp)	#l(int; offset: 28)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $a0, 4($sp)	#POP
	addu    $sp, $sp, 4
	li      $v0, 1	#system call code for print_int
	syscall			#printf("%d", l(int; offset: 28));

.L86:	nop	# end if
	la      $a0, .L18	#printf("\nEnd  three(int li1, int li2)  else\n");

	li      $v0, 4
	syscall
	li      $t8, 57	#literal
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	sw      $t8, 0($fp)	#(li1(int; offset: 0) = 57)
.L91:	nop	# while
	lw      $t8, 0($fp)	#li1(int; offset: 0)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	li      $t8, 0	#literal
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t9, 4($sp)	#POP
	addu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	sub     $t8, $t8, $t9	#(li1(int; offset: 0)>0)
	slt     $t8, $zero, $t8
	sltu    $t8, $zero, $t8
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	beq     $t8, $zero, .L92	#while
	li      $t8, 1	#literal
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	sw      $t8, -32($fp)	#(k(int; offset: 32) = 1)
	li      $t8, 2	#literal
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	sw      $t8, -36($fp)	#(l(int; offset: 36) = 2)
	lw      $t8, 0($fp)	#li1(int; offset: 0)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $a0, 4($sp)	#POP
	addu    $sp, $sp, 4
	li      $v0, 1	#system call code for print_int
	syscall			#printf("%d", li1(int; offset: 0));

	lw      $t8, gi1	#gi1(int; offset: -1)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	sw      $t8, -32($fp)	#(k(int; offset: 32) = gi1(int; offset: -1))
	lw      $t8, -32($fp)	#k(int; offset: 32)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $a0, 4($sp)	#POP
	addu    $sp, $sp, 4
	li      $v0, 1	#system call code for print_int
	syscall			#printf("%d", k(int; offset: 32));

	lw      $t8, 0($fp)	#li1(int; offset: 0)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	sw      $t8, -36($fp)	#(l(int; offset: 36) = li1(int; offset: 0))
	lw      $t8, -36($fp)	#l(int; offset: 36)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $a0, 4($sp)	#POP
	addu    $sp, $sp, 4
	li      $v0, 1	#system call code for print_int
	syscall			#printf("%d", l(int; offset: 36));

	lw      $t8, 0($fp)
	addi    $t8, $t8, -1	#li1(int; offset: 0)--;

	sw      $t8, 0($fp)
	j       .L91
.L92:	nop	# end while
	la      $a0, .L19	#printf("\nEnd  three(int li1, int li2)  while\n");

	li      $v0, 4
	syscall
	jal     one		#one(->int; offset: -1)()
	sw      $v0, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	sw      $t8, 0($fp)	#(li1(int; offset: 0) = one(->int; offset: -1)())
	lw      $t8, 0($fp)	#li1(int; offset: 0)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $a0, 4($sp)	#POP
	addu    $sp, $sp, 4
	li      $v0, 1	#system call code for print_int
	syscall			#printf("%d", li1(int; offset: 0));

	jal     two		#two(int,int->int; offset: -1)(li1(int; offset: 0), li2(int; offset: 4))
	sw      $v0, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	sw      $t8, 0($fp)	#(li1(int; offset: 0) = two(int,int->int; offset: -1)(li1(int; offset: 0), li2(int; offset: 4)))
	lw      $t8, 0($fp)	#li1(int; offset: 0)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $a0, 4($sp)	#POP
	addu    $sp, $sp, 4
	li      $v0, 1	#system call code for print_int
	syscall			#printf("%d", li1(int; offset: 0));

	jal     one		#one(->int; offset: -1)()
	sw      $v0, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	sw      $t8, 0($fp)	#(li1(int; offset: 0) = one(->int; offset: -1)())
	lw      $t8, 0($fp)	#li1(int; offset: 0)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $a0, 4($sp)	#POP
	addu    $sp, $sp, 4
	li      $v0, 1	#system call code for print_int
	syscall			#printf("%d", li1(int; offset: 0));

	jal     one		#one(->int; offset: -1)()
	sw      $v0, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	sw      $t8, 0($fp)	#(li1(int; offset: 0) = one(->int; offset: -1)())
	lw      $t8, 0($fp)	#li1(int; offset: 0)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $a0, 4($sp)	#POP
	addu    $sp, $sp, 4
	li      $v0, 1	#system call code for print_int
	syscall			#printf("%d", li1(int; offset: 0));

	la      $a0, .L20	#printf("\nEnd  three(int li1, int li2)  call\n");

	li      $v0, 4
	syscall
	lw      $t8, gi2	#gi2(int; offset: -1)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $v0, 4($sp)	#POP
	addu    $sp, $sp, 4
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
	subu    $sp, $sp, 40	#allocate AR
	li      $t8, 3	#literal
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	sw      $t8, 0($fp)	#(li1(int; offset: 0) = 3)
	li      $t8, 4	#literal
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	sw      $t8, -4($fp)	#(li2(int; offset: 4) = 4)
	li      $t8, 1	#literal
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	sw      $t8, gi1	#(gi1(int; offset: -1) = 1)
	li      $t8, 2	#literal
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	sw      $t8, gi2	#(gi2(int; offset: -1) = 2)
	lw      $t8, gi1	#gi1(int; offset: -1)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, -4($fp)	#li2(int; offset: 4)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t9, 4($sp)	#POP
	addu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	add     $t8, $t8, $t9	#(gi1(int; offset: -1)+li2(int; offset: 4))
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	sw      $t8, gi1	#(gi1(int; offset: -1) = (gi1(int; offset: -1)+li2(int; offset: 4)))
	lw      $t8, gi1	#gi1(int; offset: -1)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $a0, 4($sp)	#POP
	addu    $sp, $sp, 4
	li      $v0, 1	#system call code for print_int
	syscall			#printf("%d", gi1(int; offset: -1));

	li      $t8, 1	#literal
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	sw      $t8, gi1	#(gi1(int; offset: -1) = 1)
	lw      $t8, -4($fp)	#li2(int; offset: 4)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, -4($fp)	#li2(int; offset: 4)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t9, 4($sp)	#POP
	addu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	sub     $t8, $t8, $t9	#(li2(int; offset: 4)-li2(int; offset: 4))
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	sw      $t8, gi1	#(gi1(int; offset: -1) = (li2(int; offset: 4)-li2(int; offset: 4)))
	lw      $t8, gi1	#gi1(int; offset: -1)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $a0, 4($sp)	#POP
	addu    $sp, $sp, 4
	li      $v0, 1	#system call code for print_int
	syscall			#printf("%d", gi1(int; offset: -1));

	li      $t8, 1	#literal
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	sw      $t8, gi1	#(gi1(int; offset: -1) = 1)
	lw      $t8, 0($fp)	#li1(int; offset: 0)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, -4($fp)	#li2(int; offset: 4)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t9, 4($sp)	#POP
	addu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	mult    $t8, $t9	#(li1(int; offset: 0)*li2(int; offset: 4))
	mflo    $t8		#(li1(int; offset: 0)*li2(int; offset: 4))
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	sw      $t8, gi1	#(gi1(int; offset: -1) = (li1(int; offset: 0)*li2(int; offset: 4)))
	lw      $t8, gi1	#gi1(int; offset: -1)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $a0, 4($sp)	#POP
	addu    $sp, $sp, 4
	li      $v0, 1	#system call code for print_int
	syscall			#printf("%d", gi1(int; offset: -1));

	li      $t8, 1	#literal
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	sw      $t8, gi1	#(gi1(int; offset: -1) = 1)
	lw      $t8, gi1	#gi1(int; offset: -1)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, 0($fp)	#li1(int; offset: 0)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t9, 4($sp)	#POP
	addu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	mult    $t8, $t9	#(gi1(int; offset: -1)*li1(int; offset: 0))
	mflo    $t8		#(gi1(int; offset: -1)*li1(int; offset: 0))
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	sw      $t8, gi1	#(gi1(int; offset: -1) = (gi1(int; offset: -1)*li1(int; offset: 0)))
	lw      $t8, gi1	#gi1(int; offset: -1)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $a0, 4($sp)	#POP
	addu    $sp, $sp, 4
	li      $v0, 1	#system call code for print_int
	syscall			#printf("%d", gi1(int; offset: -1));

	li      $t8, 1	#literal
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	sw      $t8, gi1	#(gi1(int; offset: -1) = 1)
	lw      $t8, gi1	#gi1(int; offset: -1)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	sltu    $t8, $zero, $t8
	beq     $t8, $zero, .L93	#(gi1(int; offset: -1)&&li2(int; offset: 4))
	lw      $t8, -4($fp)	#li2(int; offset: 4)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t9, 4($sp)	#POP
	addu    $sp, $sp, 4
	sltu    $t9, $zero, $t9
	beq     $t9, $zero, .L93
	li      $t8, 1
	j       .L94
.L93:	nop
	li      $t8, 0
.L94:	nop	# endand
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	sw      $t8, gi1	#(gi1(int; offset: -1) = (gi1(int; offset: -1)&&li2(int; offset: 4)))
	lw      $t8, gi1	#gi1(int; offset: -1)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $a0, 4($sp)	#POP
	addu    $sp, $sp, 4
	li      $v0, 1	#system call code for print_int
	syscall			#printf("%d", gi1(int; offset: -1));

	li      $t8, 1	#literal
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	sw      $t8, gi1	#(gi1(int; offset: -1) = 1)
	lw      $t8, gi2	#gi2(int; offset: -1)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	sltu    $t8, $zero, $t8
	bne     $t8, $zero, .L95	#(gi2(int; offset: -1)||li1(int; offset: 0))
	lw      $t8, 0($fp)	#li1(int; offset: 0)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t9, 4($sp)	#POP
	addu    $sp, $sp, 4
	sltu    $t9, $zero, $t9
	bne     $t9, $zero, .L95
	li      $t8, 0
	j       .L96
.L95:	nop
	li      $t8, 1
.L96:	nop	# endand
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	sw      $t8, gi1	#(gi1(int; offset: -1) = (gi2(int; offset: -1)||li1(int; offset: 0)))
	lw      $t8, gi1	#gi1(int; offset: -1)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $a0, 4($sp)	#POP
	addu    $sp, $sp, 4
	li      $v0, 1	#system call code for print_int
	syscall			#printf("%d", gi1(int; offset: -1));

	li      $t8, 1	#literal
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	sw      $t8, gi1	#(gi1(int; offset: -1) = 1)
	lw      $t8, gi2	#gi2(int; offset: -1)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, gi1	#gi1(int; offset: -1)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t9, 4($sp)	#POP
	addu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	sub     $t8, $t8, $t9	#(gi2(int; offset: -1)==gi1(int; offset: -1))
	sltu    $t8, $zero, $t8
	slti    $t8, $t8, 1
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	sw      $t8, gi1	#(gi1(int; offset: -1) = (gi2(int; offset: -1)==gi1(int; offset: -1)))
	lw      $t8, gi1	#gi1(int; offset: -1)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $a0, 4($sp)	#POP
	addu    $sp, $sp, 4
	li      $v0, 1	#system call code for print_int
	syscall			#printf("%d", gi1(int; offset: -1));

	li      $t8, 1	#literal
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	sw      $t8, gi1	#(gi1(int; offset: -1) = 1)
	lw      $t8, gi2	#gi2(int; offset: -1)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, 0($fp)	#li1(int; offset: 0)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t9, 4($sp)	#POP
	addu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	sub     $t8, $t8, $t9	#(gi2(int; offset: -1)!=li1(int; offset: 0))
	sltu    $t8, $zero, $t8
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	sw      $t8, gi1	#(gi1(int; offset: -1) = (gi2(int; offset: -1)!=li1(int; offset: 0)))
	lw      $t8, gi1	#gi1(int; offset: -1)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $a0, 4($sp)	#POP
	addu    $sp, $sp, 4
	li      $v0, 1	#system call code for print_int
	syscall			#printf("%d", gi1(int; offset: -1));

	li      $t8, 1	#literal
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	sw      $t8, gi1	#(gi1(int; offset: -1) = 1)
	lw      $t8, 0($fp)	#li1(int; offset: 0)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, gi2	#gi2(int; offset: -1)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t9, 4($sp)	#POP
	addu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	sub     $t8, $t8, $t9	#(li1(int; offset: 0)<gi2(int; offset: -1))
	slt     $t8, $t8, $zero
	sltu    $t8, $zero, $t8
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	sw      $t8, gi1	#(gi1(int; offset: -1) = (li1(int; offset: 0)<gi2(int; offset: -1)))
	lw      $t8, gi1	#gi1(int; offset: -1)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $a0, 4($sp)	#POP
	addu    $sp, $sp, 4
	li      $v0, 1	#system call code for print_int
	syscall			#printf("%d", gi1(int; offset: -1));

	li      $t8, 1	#literal
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	sw      $t8, gi1	#(gi1(int; offset: -1) = 1)
	lw      $t8, gi1	#gi1(int; offset: -1)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, -4($fp)	#li2(int; offset: 4)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t9, 4($sp)	#POP
	addu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	sub     $t8, $t8, $t9	#(gi1(int; offset: -1)>li2(int; offset: 4))
	slt     $t8, $zero, $t8
	sltu    $t8, $zero, $t8
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	sw      $t8, gi1	#(gi1(int; offset: -1) = (gi1(int; offset: -1)>li2(int; offset: 4)))
	lw      $t8, gi1	#gi1(int; offset: -1)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $a0, 4($sp)	#POP
	addu    $sp, $sp, 4
	li      $v0, 1	#system call code for print_int
	syscall			#printf("%d", gi1(int; offset: -1));

	li      $t8, 1	#literal
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	sw      $t8, gi1	#(gi1(int; offset: -1) = 1)
	lw      $t8, 0($fp)	#li1(int; offset: 0)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, gi1	#gi1(int; offset: -1)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t9, 4($sp)	#POP
	addu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	sub     $t8, $t8, $t9	#(li1(int; offset: 0)<=gi1(int; offset: -1))
	slti    $t8, $t8, 1
	sltu    $t8, $zero, $t8
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	sw      $t8, gi1	#(gi1(int; offset: -1) = (li1(int; offset: 0)<=gi1(int; offset: -1)))
	lw      $t8, gi1	#gi1(int; offset: -1)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $a0, 4($sp)	#POP
	addu    $sp, $sp, 4
	li      $v0, 1	#system call code for print_int
	syscall			#printf("%d", gi1(int; offset: -1));

	li      $t8, 1	#literal
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	sw      $t8, gi1	#(gi1(int; offset: -1) = 1)
	la      $a0, .L21	#printf("\nEnd  main()  simple\n");

	li      $v0, 4
	syscall
	lw      $t8, gi2	#gi2(int; offset: -1)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, -4($fp)	#li2(int; offset: 4)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t9, 4($sp)	#POP
	addu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	add     $t8, $t8, $t9	#(gi2(int; offset: -1)+li2(int; offset: 4))
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, gi2	#gi2(int; offset: -1)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, -4($fp)	#li2(int; offset: 4)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t9, 4($sp)	#POP
	addu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	sub     $t8, $t8, $t9	#(gi2(int; offset: -1)<li2(int; offset: 4))
	slt     $t8, $t8, $zero
	sltu    $t8, $zero, $t8
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t9, 4($sp)	#POP
	addu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	mult    $t8, $t9	#((gi2(int; offset: -1)+li2(int; offset: 4))*(gi2(int; offset: -1)<li2(int; offset: 4)))
	mflo    $t8		#((gi2(int; offset: -1)+li2(int; offset: 4))*(gi2(int; offset: -1)<li2(int; offset: 4)))
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, -4($fp)	#li2(int; offset: 4)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, gi1	#gi1(int; offset: -1)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t9, 4($sp)	#POP
	addu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	mult    $t8, $t9	#(li2(int; offset: 4)*gi1(int; offset: -1))
	mflo    $t8		#(li2(int; offset: 4)*gi1(int; offset: -1))
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	sltu    $t8, $zero, $t8
	beq     $t8, $zero, .L97	#(!(li2(int; offset: 4)*gi1(int; offset: -1)))
	li      $t8, 0
	j       .L98
.L97:	nop
	li      $t8, 1
.L98:	nop	# end not
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t9, 4($sp)	#POP
	addu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	add     $t8, $t8, $t9	#(((gi2(int; offset: -1)+li2(int; offset: 4))*(gi2(int; offset: -1)<li2(int; offset: 4)))+(!(li2(int; offset: 4)*gi1(int; offset: -1))))
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	sw      $t8, gi1	#(gi1(int; offset: -1) = (((gi2(int; offset: -1)+li2(int; offset: 4))*(gi2(int; offset: -1)<li2(int; offset: 4)))+(!(li2(int; offset: 4)*gi1(int; offset: -1)))))
	lw      $t8, gi1	#gi1(int; offset: -1)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $a0, 4($sp)	#POP
	addu    $sp, $sp, 4
	li      $v0, 1	#system call code for print_int
	syscall			#printf("%d", gi1(int; offset: -1));

	la      $a0, .L22	#printf("\n");

	li      $v0, 4
	syscall
	la      $a0, .L23	#printf("\nEnd  main()  nested\n");

	li      $v0, 4
	syscall
	lw      $t8, gi1	#gi1(int; offset: -1)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, gi2	#gi2(int; offset: -1)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t9, 4($sp)	#POP
	addu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	sub     $t8, $t8, $t9	#(gi1(int; offset: -1)>=gi2(int; offset: -1))
	li      $t9, -1
	slt     $t8, $t9, $t8
	sltu    $t8, $zero, $t8
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	sltu    $t8, $zero, $t8
	beq     $t8, $zero, .L99	#(!(gi1(int; offset: -1)>=gi2(int; offset: -1)))
	li      $t8, 0
	j       .L100
.L99:	nop
	li      $t8, 1
.L100:	nop	# end not
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	li      $t9, -1
	mult    $t8, $t9	#(-(!(gi1(int; offset: -1)>=gi2(int; offset: -1))))
	mflo    $t8
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	beq     $t8, $zero, .L101	#if
	li      $t8, 1	#literal
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	sw      $t8, -8($fp)	#(k(int; offset: 8) = 1)
	li      $t8, 2	#literal
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	sw      $t8, -12($fp)	#(l(int; offset: 12) = 2)
	lw      $t8, gi2	#gi2(int; offset: -1)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $a0, 4($sp)	#POP
	addu    $sp, $sp, 4
	li      $v0, 1	#system call code for print_int
	syscall			#printf("%d", gi2(int; offset: -1));

	lw      $t8, -4($fp)	#li2(int; offset: 4)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	sw      $t8, -8($fp)	#(k(int; offset: 8) = li2(int; offset: 4))
	lw      $t8, -8($fp)	#k(int; offset: 8)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $a0, 4($sp)	#POP
	addu    $sp, $sp, 4
	li      $v0, 1	#system call code for print_int
	syscall			#printf("%d", k(int; offset: 8));

	lw      $t8, gi1	#gi1(int; offset: -1)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	sw      $t8, -12($fp)	#(l(int; offset: 12) = gi1(int; offset: -1))
	lw      $t8, -12($fp)	#l(int; offset: 12)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $a0, 4($sp)	#POP
	addu    $sp, $sp, 4
	li      $v0, 1	#system call code for print_int
	syscall			#printf("%d", l(int; offset: 12));

.L101:	nop	# else
	la      $a0, .L24	#printf("\nEnd  main()  if\n");

	li      $v0, 4
	syscall
	lw      $t8, gi2	#gi2(int; offset: -1)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, 0($fp)	#li1(int; offset: 0)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t9, 4($sp)	#POP
	addu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	sub     $t8, $t8, $t9	#(gi2(int; offset: -1)-li1(int; offset: 0))
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	li      $t9, -1
	mult    $t8, $t9	#(-(gi2(int; offset: -1)-li1(int; offset: 0)))
	mflo    $t8
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	sltu    $t8, $zero, $t8
	bne     $t8, $zero, .L102	#((-(gi2(int; offset: -1)-li1(int; offset: 0)))||gi1(int; offset: -1))
	lw      $t8, gi1	#gi1(int; offset: -1)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t9, 4($sp)	#POP
	addu    $sp, $sp, 4
	sltu    $t9, $zero, $t9
	bne     $t9, $zero, .L102
	li      $t8, 0
	j       .L103
.L102:	nop
	li      $t8, 1
.L103:	nop	# endand
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	beq     $t8, $zero, .L104	#if
	li      $t8, 1	#literal
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	sw      $t8, -16($fp)	#(k(int; offset: 16) = 1)
	li      $t8, 2	#literal
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	sw      $t8, -20($fp)	#(l(int; offset: 20) = 2)
	lw      $t8, gi2	#gi2(int; offset: -1)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $a0, 4($sp)	#POP
	addu    $sp, $sp, 4
	li      $v0, 1	#system call code for print_int
	syscall			#printf("%d", gi2(int; offset: -1));

	lw      $t8, 0($fp)	#li1(int; offset: 0)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	sw      $t8, -16($fp)	#(k(int; offset: 16) = li1(int; offset: 0))
	lw      $t8, -16($fp)	#k(int; offset: 16)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $a0, 4($sp)	#POP
	addu    $sp, $sp, 4
	li      $v0, 1	#system call code for print_int
	syscall			#printf("%d", k(int; offset: 16));

	lw      $t8, -4($fp)	#li2(int; offset: 4)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	sw      $t8, -20($fp)	#(l(int; offset: 20) = li2(int; offset: 4))
	lw      $t8, -20($fp)	#l(int; offset: 20)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $a0, 4($sp)	#POP
	addu    $sp, $sp, 4
	li      $v0, 1	#system call code for print_int
	syscall			#printf("%d", l(int; offset: 20));

	j       .L105
.L104:	nop	# else
	li      $t8, 1	#literal
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	sw      $t8, -24($fp)	#(k(int; offset: 24) = 1)
	li      $t8, 2	#literal
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	sw      $t8, -28($fp)	#(l(int; offset: 28) = 2)
	lw      $t8, -4($fp)	#li2(int; offset: 4)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $a0, 4($sp)	#POP
	addu    $sp, $sp, 4
	li      $v0, 1	#system call code for print_int
	syscall			#printf("%d", li2(int; offset: 4));

	lw      $t8, gi2	#gi2(int; offset: -1)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, gi2	#gi2(int; offset: -1)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t9, 4($sp)	#POP
	addu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	mult    $t8, $t9	#(gi2(int; offset: -1)*gi2(int; offset: -1))
	mflo    $t8		#(gi2(int; offset: -1)*gi2(int; offset: -1))
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	li      $t9, -1
	mult    $t8, $t9	#(-(gi2(int; offset: -1)*gi2(int; offset: -1)))
	mflo    $t8
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, gi2	#gi2(int; offset: -1)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	sltu    $t8, $zero, $t8
	beq     $t8, $zero, .L106	#(!gi2(int; offset: -1))
	li      $t8, 0
	j       .L107
.L106:	nop
	li      $t8, 1
.L107:	nop	# end not
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, gi2	#gi2(int; offset: -1)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t9, 4($sp)	#POP
	addu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	sub     $t8, $t8, $t9	#((!gi2(int; offset: -1))-gi2(int; offset: -1))
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t9, 4($sp)	#POP
	addu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	sub     $t8, $t8, $t9	#((-(gi2(int; offset: -1)*gi2(int; offset: -1)))>((!gi2(int; offset: -1))-gi2(int; offset: -1)))
	slt     $t8, $zero, $t8
	sltu    $t8, $zero, $t8
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	sw      $t8, -24($fp)	#(k(int; offset: 24) = ((-(gi2(int; offset: -1)*gi2(int; offset: -1)))>((!gi2(int; offset: -1))-gi2(int; offset: -1))))
	lw      $t8, -24($fp)	#k(int; offset: 24)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $a0, 4($sp)	#POP
	addu    $sp, $sp, 4
	li      $v0, 1	#system call code for print_int
	syscall			#printf("%d", k(int; offset: 24));

	lw      $t8, 0($fp)	#li1(int; offset: 0)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	sw      $t8, -28($fp)	#(l(int; offset: 28) = li1(int; offset: 0))
	lw      $t8, -28($fp)	#l(int; offset: 28)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $a0, 4($sp)	#POP
	addu    $sp, $sp, 4
	li      $v0, 1	#system call code for print_int
	syscall			#printf("%d", l(int; offset: 28));

.L105:	nop	# end if
	la      $a0, .L25	#printf("\nEnd  main()  else\n");

	li      $v0, 4
	syscall
	li      $t8, 70	#literal
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	sw      $t8, 0($fp)	#(li1(int; offset: 0) = 70)
.L108:	nop	# while
	lw      $t8, 0($fp)	#li1(int; offset: 0)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	li      $t8, 0	#literal
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t9, 4($sp)	#POP
	addu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	sub     $t8, $t8, $t9	#(li1(int; offset: 0)>0)
	slt     $t8, $zero, $t8
	sltu    $t8, $zero, $t8
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	beq     $t8, $zero, .L109	#while
	li      $t8, 1	#literal
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	sw      $t8, -32($fp)	#(k(int; offset: 32) = 1)
	li      $t8, 2	#literal
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	sw      $t8, -36($fp)	#(l(int; offset: 36) = 2)
	lw      $t8, gi2	#gi2(int; offset: -1)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $a0, 4($sp)	#POP
	addu    $sp, $sp, 4
	li      $v0, 1	#system call code for print_int
	syscall			#printf("%d", gi2(int; offset: -1));

	lw      $t8, gi2	#gi2(int; offset: -1)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	sltu    $t8, $zero, $t8
	beq     $t8, $zero, .L110	#(!gi2(int; offset: -1))
	li      $t8, 0
	j       .L111
.L110:	nop
	li      $t8, 1
.L111:	nop	# end not
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, 0($fp)	#li1(int; offset: 0)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, 0($fp)	#li1(int; offset: 0)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t9, 4($sp)	#POP
	addu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	mult    $t8, $t9	#(li1(int; offset: 0)*li1(int; offset: 0))
	mflo    $t8		#(li1(int; offset: 0)*li1(int; offset: 0))
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t9, 4($sp)	#POP
	addu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	sub     $t8, $t8, $t9	#((!gi2(int; offset: -1))-(li1(int; offset: 0)*li1(int; offset: 0)))
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, gi1	#gi1(int; offset: -1)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	li      $t9, -1
	mult    $t8, $t9	#(-gi1(int; offset: -1))
	mflo    $t8
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t9, 4($sp)	#POP
	addu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	mult    $t8, $t9	#(((!gi2(int; offset: -1))-(li1(int; offset: 0)*li1(int; offset: 0)))*(-gi1(int; offset: -1)))
	mflo    $t8		#(((!gi2(int; offset: -1))-(li1(int; offset: 0)*li1(int; offset: 0)))*(-gi1(int; offset: -1)))
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	sw      $t8, -32($fp)	#(k(int; offset: 32) = (((!gi2(int; offset: -1))-(li1(int; offset: 0)*li1(int; offset: 0)))*(-gi1(int; offset: -1))))
	lw      $t8, -32($fp)	#k(int; offset: 32)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $a0, 4($sp)	#POP
	addu    $sp, $sp, 4
	li      $v0, 1	#system call code for print_int
	syscall			#printf("%d", k(int; offset: 32));

	lw      $t8, 0($fp)	#li1(int; offset: 0)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	sltu    $t8, $zero, $t8
	beq     $t8, $zero, .L112	#(!li1(int; offset: 0))
	li      $t8, 0
	j       .L113
.L112:	nop
	li      $t8, 1
.L113:	nop	# end not
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	sw      $t8, -36($fp)	#(l(int; offset: 36) = (!li1(int; offset: 0)))
	lw      $t8, -36($fp)	#l(int; offset: 36)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $a0, 4($sp)	#POP
	addu    $sp, $sp, 4
	li      $v0, 1	#system call code for print_int
	syscall			#printf("%d", l(int; offset: 36));

	lw      $t8, 0($fp)
	addi    $t8, $t8, -1	#li1(int; offset: 0)--;

	sw      $t8, 0($fp)
	j       .L108
.L109:	nop	# end while
	la      $a0, .L26	#printf("\nEnd  main()  while\n");

	li      $v0, 4
	syscall
	jal     three		#three(int,int->int; offset: -1)(li1(int; offset: 0), li2(int; offset: 4))
	sw      $v0, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	sw      $t8, 0($fp)	#(li1(int; offset: 0) = three(int,int->int; offset: -1)(li1(int; offset: 0), li2(int; offset: 4)))
	lw      $t8, 0($fp)	#li1(int; offset: 0)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $a0, 4($sp)	#POP
	addu    $sp, $sp, 4
	li      $v0, 1	#system call code for print_int
	syscall			#printf("%d", li1(int; offset: 0));

	jal     three		#three(int,int->int; offset: -1)(li1(int; offset: 0), li2(int; offset: 4))
	sw      $v0, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	sw      $t8, 0($fp)	#(li1(int; offset: 0) = three(int,int->int; offset: -1)(li1(int; offset: 0), li2(int; offset: 4)))
	lw      $t8, 0($fp)	#li1(int; offset: 0)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $a0, 4($sp)	#POP
	addu    $sp, $sp, 4
	li      $v0, 1	#system call code for print_int
	syscall			#printf("%d", li1(int; offset: 0));

	jal     two		#two(int,int->int; offset: -1)(li1(int; offset: 0), li2(int; offset: 4))
	sw      $v0, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	sw      $t8, 0($fp)	#(li1(int; offset: 0) = two(int,int->int; offset: -1)(li1(int; offset: 0), li2(int; offset: 4)))
	lw      $t8, 0($fp)	#li1(int; offset: 0)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $a0, 4($sp)	#POP
	addu    $sp, $sp, 4
	li      $v0, 1	#system call code for print_int
	syscall			#printf("%d", li1(int; offset: 0));

	jal     three		#three(int,int->int; offset: -1)(li1(int; offset: 0), li2(int; offset: 4))
	sw      $v0, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	sw      $t8, 0($fp)	#(li1(int; offset: 0) = three(int,int->int; offset: -1)(li1(int; offset: 0), li2(int; offset: 4)))
	lw      $t8, 0($fp)	#li1(int; offset: 0)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $a0, 4($sp)	#POP
	addu    $sp, $sp, 4
	li      $v0, 1	#system call code for print_int
	syscall			#printf("%d", li1(int; offset: 0));

	la      $a0, .L27	#printf("\nEnd  main()  call\n");

	li      $v0, 4
	syscall
	addi    $2, $0, 10	#done
	syscall
