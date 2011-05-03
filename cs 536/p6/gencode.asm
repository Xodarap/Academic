	.data
var_x:
	.space 4
var_y:
	.space 4
var_d:
	.space 8
var_b:
	.space 4
.L0:
	.asciiz "Expected output:\n22.5 55 65\n"
.L1:
	.asciiz " "
.L2:
	.asciiz " "
.L3:
	.asciiz "\n"
.L4:
	.asciiz "Expected output:\n6 7 8 9\n"
.L5:
	.asciiz " "
.L6:
	.asciiz "\n"
.L7:
	.asciiz "\nExpected output:\n6 5 4 3 2 1 0 -1\n"
.L8:
	.asciiz " "
.L9:
	.asciiz "\n"
.L10:
	.asciiz "\nExpected output:\n1 32 10 220 10 9 10\n"
.L11:
	.asciiz " "
.L12:
	.asciiz " "
.L13:
	.asciiz " "
.L14:
	.asciiz " "
.L15:
	.asciiz " "
.L16:
	.asciiz " "
.L17:
	.asciiz "\n"
.L18:
	.asciiz "\nExpected output:\n0 0 1 0 1 1\n"
.L19:
	.asciiz " "
.L20:
	.asciiz " "
.L21:
	.asciiz " "
.L22:
	.asciiz " "
.L23:
	.asciiz " "
.L24:
	.asciiz "\n"
.L25:
	.asciiz "\nExpected output:\n0 1 0 1 1\n"
.L26:
	.asciiz " "
.L27:
	.asciiz " "
.L28:
	.asciiz " "
.L29:
	.asciiz " "
.L30:
	.asciiz "\n"
.L31:
	.asciiz "\nExpected output:\n-50 3 2 1 0 -1 -2\n"
.L32:
	.asciiz " "
.L33:
	.asciiz " "
.L34:
	.asciiz "\n"
.L35:
	.asciiz "\nExpected output:\n-5 -4 -3 -2 -1\n"
.L36:
	.asciiz " "
.L37:
	.asciiz "ERROR\n"
.L38:
	.asciiz "\n"
.L39:
	.asciiz "\nExpected output:\n6.5 7.5 8.5 9.5\n"
.L40:
	.asciiz " "
.L41:
	.asciiz "\n"
.L42:
	.asciiz "\nExpected output:\n33 10.5 236.25 10.5\n"
.L43:
	.asciiz " "
.L44:
	.asciiz " "
.L45:
	.asciiz " "
.L46:
	.asciiz "\n"
.L47:
	.asciiz "\nExpected output:\n66 66\n"
.L48:
	.asciiz " "
.L49:
	.asciiz "\n"
.L50:
	.asciiz "\nExpected output:\n-50 3 2 1 0 -1 -2\n"
.L51:
	.asciiz " "
.L52:
	.asciiz " "
.L53:
	.asciiz "\n"
.L54:
	.asciiz "\nExpected output:\n-5 -4 -3 -2\n"
.L55:
	.asciiz " "
.L56:
	.asciiz "ERROR\n"
.L57:
	.asciiz "\n"
.L58:
	.asciiz "Expected output:\n56 66 55 65\n"
.L59:
	.asciiz " "
.L60:
	.asciiz " "
.L61:
	.asciiz " "
.L62:
	.asciiz "\n"
.L63:
	.asciiz "\ncalling f\n"
.L64:
	.asciiz "\ncalling g\n"
.L65:
	.asciiz "Expected output:\n55\n"
.L66:
	.asciiz "\n\n"
.L67:
	.asciiz "calling gg\n"
.L68:
	.asciiz "Expected output:\n45 22.5\n"
.L69:
	.asciiz " "
.L70:
	.asciiz "\n\n"
.L71:
	.asciiz "calling foo\n"
.L72:
	.asciiz "\ncalling bar\n"
.L73:
	.asciiz "\nExpected output:\n2 5 2 5 2\n"
.L74:
	.asciiz " "
.L75:
	.asciiz " "
.L76:
	.asciiz " "
.L77:
	.asciiz " "
.L78:
	.asciiz "\n"
	.text
	.globl	main
var_f:	nop	# function f
	# a, -12
	# c, -20
	# d, -24
	sw      $ra, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	sw      $fp, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	move    $fp, $sp	#init fp
	subu    $sp, $sp, 8	#allocate AR
	la      $a0, .L0	#printf("Expected output:\n22.5 55 65\n");

	li      $v0, 4
	syscall
	l.d     $f8, 12($fp)	#a(double; offset: -12)
	s.d     $f8, -4($sp)	#PUSH
	subu    $sp, $sp, 8
	l.d     $f12, 4($sp)	#POP
	addu    $sp, $sp, 8
	li      $v0, 3	#system call code for print_double
	syscall			#printf("%f");
	la      $a0, .L1	#printf(" ");

	li      $v0, 4
	syscall
	lw      $t8, 20($fp)	#c(int; offset: -20)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $a0, 4($sp)	#POP
	addu    $sp, $sp, 4
	li      $v0, 1	#system call code for print_int
	syscall			#printf("%d", c(int; offset: -20));

	la      $a0, .L2	#printf(" ");

	li      $v0, 4
	syscall
	lw      $t8, 24($fp)	#d(int; offset: -24)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $a0, 4($sp)	#POP
	addu    $sp, $sp, 4
	li      $v0, 1	#system call code for print_int
	syscall			#printf("%d", d(int; offset: -24));

	la      $a0, .L3	#printf("\n");

	li      $v0, 4
	syscall
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
var_g:	nop	# function g
	# x, -12
	sw      $ra, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	sw      $fp, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	move    $fp, $sp	#init fp
	subu    $sp, $sp, 8	#allocate AR
	lw      $t8, 12($fp)	#x(int; offset: -12)
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
	move    $sp, $fp
	lw      $fp, 4($sp)	#POP
	addu    $sp, $sp, 4
	lw      $ra, 4($sp)	#POP
	addu    $sp, $sp, 4
	jr      $ra
var_gg:	nop	# function gg
	# dd, -12
	sw      $ra, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	sw      $fp, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	move    $fp, $sp	#init fp
	subu    $sp, $sp, 8	#allocate AR
	l.d     $f8, var_d	#d(double; offset: -1)
	s.d     $f8, -4($sp)	#PUSH
	subu    $sp, $sp, 8
	l.d     $f8, 12($fp)	#dd(double; offset: -12)
	s.d     $f8, -4($sp)	#PUSH
	subu    $sp, $sp, 8
	l.d     $f10, 4($sp)	#POP
	addu    $sp, $sp, 8
	l.d     $f8, 4($sp)	#POP
	addu    $sp, $sp, 8
	add.d   $f8, $f8, $f10	#(d(double; offset: -1)+dd(double; offset: -12))
	s.d     $f8, -4($sp)	#PUSH
	subu    $sp, $sp, 8
	lw      $v0, 4($sp)	#POP
	addu    $sp, $sp, 4
	lw      $v1, 4($sp)	#POP
	addu    $sp, $sp, 4
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
var_foo:	nop	# function foo
	# a, 0
	# b, 4
	# c, 8
	# B, 12
	sw      $ra, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	sw      $fp, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	move    $fp, $sp	#init fp
	subu    $sp, $sp, 28	#allocate AR
	la      $a0, .L4	#printf("Expected output:\n6 7 8 9\n");

	li      $v0, 4
	syscall
	li      $t8, 6	#literal
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	sw      $t8, 0($fp)	#(a(int; offset: 0) = 6)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
.L79_while_start:	nop	# while
	lw      $t8, 0($fp)	#a(int; offset: 0)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	li      $t8, 10	#literal
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t9, 4($sp)	#POP
	addu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	sub     $t8, $t8, $t9	#(a(int; offset: 0)<10)
	slt     $t8, $t8, $zero
	sltu    $t8, $zero, $t8
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	beq     $t8, $zero, .L80_Done	#while
	lw      $t8, 0($fp)	#a(int; offset: 0)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $a0, 4($sp)	#POP
	addu    $sp, $sp, 4
	li      $v0, 1	#system call code for print_int
	syscall			#printf("%d", a(int; offset: 0));

	la      $a0, .L5	#printf(" ");

	li      $v0, 4
	syscall
	lw      $t8, 0($fp)
	addi    $t8, $t8, 1	#a(int; offset: 0)++;

	sw      $t8, 0($fp)
	j       .L79_while_start
.L80_Done:	nop	# end while
	la      $a0, .L6	#printf("\n");

	li      $v0, 4
	syscall
	la      $a0, .L7	#printf("\nExpected output:\n6 5 4 3 2 1 0 -1\n");

	li      $v0, 4
	syscall
	li      $t8, 6	#literal
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	sw      $t8, 0($fp)	#(a(int; offset: 0) = 6)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
.L81_while_start:	nop	# while
	lw      $t8, 0($fp)	#a(int; offset: 0)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	li      $t8, 1	#literal
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	li      $t9, -1
	mult    $t8, $t9	#(-1)
	mflo    $t8
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t9, 4($sp)	#POP
	addu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	sub     $t8, $t8, $t9	#(a(int; offset: 0)>=(-1))
	li      $t9, -1
	slt     $t8, $t9, $t8
	sltu    $t8, $zero, $t8
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	beq     $t8, $zero, .L82_Done	#while
	lw      $t8, 0($fp)	#a(int; offset: 0)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $a0, 4($sp)	#POP
	addu    $sp, $sp, 4
	li      $v0, 1	#system call code for print_int
	syscall			#printf("%d", a(int; offset: 0));

	la      $a0, .L8	#printf(" ");

	li      $v0, 4
	syscall
	lw      $t8, 0($fp)
	addi    $t8, $t8, -1	#a(int; offset: 0)--;

	sw      $t8, 0($fp)
	j       .L81_while_start
.L82_Done:	nop	# end while
	la      $a0, .L9	#printf("\n");

	li      $v0, 4
	syscall
	li      $t8, 10	#literal
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	sw      $t8, 0($fp)	#(a(int; offset: 0) = 10)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	la      $a0, .L10	#printf("\nExpected output:\n1 32 10 220 10 9 10\n");

	li      $v0, 4
	syscall
	li      $t8, 1	#literal
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	li      $t8, 3	#literal
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t9, 4($sp)	#POP
	addu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	sub     $t8, $t8, $t9	#(1<3)
	slt     $t8, $t8, $zero
	sltu    $t8, $zero, $t8
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	sw      $t8, -12($fp)	#(B(int; offset: 12) = (1<3))
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, -12($fp)	#B(int; offset: 12)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $a0, 4($sp)	#POP
	addu    $sp, $sp, 4
	li      $v0, 1	#system call code for print_int
	syscall			#printf("%d", B(int; offset: 12));

	la      $a0, .L11	#printf(" ");

	li      $v0, 4
	syscall
	li      $t8, 22	#literal
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	sw      $t8, -4($fp)	#(b(int; offset: 4) = 22)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, 0($fp)	#a(int; offset: 0)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, -4($fp)	#b(int; offset: 4)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t9, 4($sp)	#POP
	addu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	add     $t8, $t8, $t9	#(a(int; offset: 0)+b(int; offset: 4))
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	sw      $t8, 0($fp)	#(a(int; offset: 0) = (a(int; offset: 0)+b(int; offset: 4)))
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, 0($fp)	#a(int; offset: 0)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $a0, 4($sp)	#POP
	addu    $sp, $sp, 4
	li      $v0, 1	#system call code for print_int
	syscall			#printf("%d", a(int; offset: 0));

	la      $a0, .L12	#printf(" ");

	li      $v0, 4
	syscall
	lw      $t8, 0($fp)	#a(int; offset: 0)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, -4($fp)	#b(int; offset: 4)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t9, 4($sp)	#POP
	addu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	sub     $t8, $t8, $t9	#(a(int; offset: 0)-b(int; offset: 4))
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	sw      $t8, 0($fp)	#(a(int; offset: 0) = (a(int; offset: 0)-b(int; offset: 4)))
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, 0($fp)	#a(int; offset: 0)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $a0, 4($sp)	#POP
	addu    $sp, $sp, 4
	li      $v0, 1	#system call code for print_int
	syscall			#printf("%d", a(int; offset: 0));

	la      $a0, .L13	#printf(" ");

	li      $v0, 4
	syscall
	lw      $t8, 0($fp)	#a(int; offset: 0)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, -4($fp)	#b(int; offset: 4)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t9, 4($sp)	#POP
	addu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	mult    $t8, $t9	#(a(int; offset: 0)*b(int; offset: 4))
	mflo    $t8		#(a(int; offset: 0)*b(int; offset: 4))
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	sw      $t8, 0($fp)	#(a(int; offset: 0) = (a(int; offset: 0)*b(int; offset: 4)))
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, 0($fp)	#a(int; offset: 0)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $a0, 4($sp)	#POP
	addu    $sp, $sp, 4
	li      $v0, 1	#system call code for print_int
	syscall			#printf("%d", a(int; offset: 0));

	la      $a0, .L14	#printf(" ");

	li      $v0, 4
	syscall
	lw      $t8, 0($fp)	#a(int; offset: 0)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, -4($fp)	#b(int; offset: 4)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t9, 4($sp)	#POP
	addu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	div     $t8, $t9	#(a(int; offset: 0)/b(int; offset: 4))
	mflo    $t8		#(a(int; offset: 0)/b(int; offset: 4))
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	sw      $t8, 0($fp)	#(a(int; offset: 0) = (a(int; offset: 0)/b(int; offset: 4)))
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, 0($fp)	#a(int; offset: 0)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $a0, 4($sp)	#POP
	addu    $sp, $sp, 4
	li      $v0, 1	#system call code for print_int
	syscall			#printf("%d", a(int; offset: 0));

	la      $a0, .L15	#printf(" ");

	li      $v0, 4
	syscall
	lw      $t8, 0($fp)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	addi    $t8, $t8, -1	#(a(int; offset: 0)--)
	sw      $t8, 0($fp)
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	sw      $t8, -4($fp)	#(b(int; offset: 4) = (a(int; offset: 0)--))
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, 0($fp)	#a(int; offset: 0)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $a0, 4($sp)	#POP
	addu    $sp, $sp, 4
	li      $v0, 1	#system call code for print_int
	syscall			#printf("%d", a(int; offset: 0));

	la      $a0, .L16	#printf(" ");

	li      $v0, 4
	syscall
	lw      $t8, 0($fp)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	addi    $t8, $t8, 1	#(a(int; offset: 0)++)
	sw      $t8, 0($fp)
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	sw      $t8, -4($fp)	#(b(int; offset: 4) = (a(int; offset: 0)++))
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, 0($fp)	#a(int; offset: 0)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $a0, 4($sp)	#POP
	addu    $sp, $sp, 4
	li      $v0, 1	#system call code for print_int
	syscall			#printf("%d", a(int; offset: 0));

	la      $a0, .L17	#printf("\n");

	li      $v0, 4
	syscall
	li      $t8, 10	#literal
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	sw      $t8, 0($fp)	#(a(int; offset: 0) = 10)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	li      $t8, 22	#literal
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	sw      $t8, -4($fp)	#(b(int; offset: 4) = 22)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	la      $a0, .L18	#printf("\nExpected output:\n0 0 1 0 1 1\n");

	li      $v0, 4
	syscall
	li      $t8, 1	#literal
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	sw      $t8, -8($fp)	#(c(int; offset: 8) = 1)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, -8($fp)	#c(int; offset: 8)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	sltu    $t8, $zero, $t8
	beq     $t8, $zero, .L83	#(!c(int; offset: 8))
	li      $t8, 0
	j       .L84
.L83:	nop
	li      $t8, 1
.L84:	nop	# end not
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	sw      $t8, -8($fp)	#(c(int; offset: 8) = (!c(int; offset: 8)))
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, -8($fp)	#c(int; offset: 8)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $a0, 4($sp)	#POP
	addu    $sp, $sp, 4
	li      $v0, 1	#system call code for print_int
	syscall			#printf("%d", c(int; offset: 8));

	la      $a0, .L19	#printf(" ");

	li      $v0, 4
	syscall
	lw      $t8, -8($fp)	#c(int; offset: 8)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	sltu    $t8, $zero, $t8
	beq     $t8, $zero, .L85	#(c(int; offset: 8)&&1)
	li      $t8, 1	#literal
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t9, 4($sp)	#POP
	addu    $sp, $sp, 4
	sltu    $t9, $zero, $t9
	beq     $t9, $zero, .L85
	li      $t8, 1
	j       .L86
.L85:	nop
	li      $t8, 0
.L86:	nop	# endand
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	sw      $t8, -8($fp)	#(c(int; offset: 8) = (c(int; offset: 8)&&1))
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, -8($fp)	#c(int; offset: 8)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $a0, 4($sp)	#POP
	addu    $sp, $sp, 4
	li      $v0, 1	#system call code for print_int
	syscall			#printf("%d", c(int; offset: 8));

	la      $a0, .L20	#printf(" ");

	li      $v0, 4
	syscall
	li      $t8, 0	#literal
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	sltu    $t8, $zero, $t8
	bne     $t8, $zero, .L87	#(0||(!c(int; offset: 8)))
	lw      $t8, -8($fp)	#c(int; offset: 8)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	sltu    $t8, $zero, $t8
	beq     $t8, $zero, .L89	#(!c(int; offset: 8))
	li      $t8, 0
	j       .L90
.L89:	nop
	li      $t8, 1
.L90:	nop	# end not
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t9, 4($sp)	#POP
	addu    $sp, $sp, 4
	sltu    $t9, $zero, $t9
	bne     $t9, $zero, .L87
	li      $t8, 0
	j       .L88
.L87:	nop
	li      $t8, 1
.L88:	nop	# endand
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	sw      $t8, -8($fp)	#(c(int; offset: 8) = (0||(!c(int; offset: 8))))
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, -8($fp)	#c(int; offset: 8)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $a0, 4($sp)	#POP
	addu    $sp, $sp, 4
	li      $v0, 1	#system call code for print_int
	syscall			#printf("%d", c(int; offset: 8));

	la      $a0, .L21	#printf(" ");

	li      $v0, 4
	syscall
	lw      $t8, 0($fp)	#a(int; offset: 0)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, -4($fp)	#b(int; offset: 4)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t9, 4($sp)	#POP
	addu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	sub     $t8, $t8, $t9	#(a(int; offset: 0)==b(int; offset: 4))
	sltu    $t8, $zero, $t8
	slti    $t8, $t8, 1
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	sw      $t8, -8($fp)	#(c(int; offset: 8) = (a(int; offset: 0)==b(int; offset: 4)))
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, -8($fp)	#c(int; offset: 8)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $a0, 4($sp)	#POP
	addu    $sp, $sp, 4
	li      $v0, 1	#system call code for print_int
	syscall			#printf("%d", c(int; offset: 8));

	la      $a0, .L22	#printf(" ");

	li      $v0, 4
	syscall
	lw      $t8, 0($fp)	#a(int; offset: 0)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, -4($fp)	#b(int; offset: 4)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t9, 4($sp)	#POP
	addu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	sub     $t8, $t8, $t9	#(a(int; offset: 0)!=b(int; offset: 4))
	sltu    $t8, $zero, $t8
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	sw      $t8, -8($fp)	#(c(int; offset: 8) = (a(int; offset: 0)!=b(int; offset: 4)))
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, -8($fp)	#c(int; offset: 8)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $a0, 4($sp)	#POP
	addu    $sp, $sp, 4
	li      $v0, 1	#system call code for print_int
	syscall			#printf("%d", c(int; offset: 8));

	la      $a0, .L23	#printf(" ");

	li      $v0, 4
	syscall
	lw      $t8, 0($fp)	#a(int; offset: 0)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, -4($fp)	#b(int; offset: 4)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t9, 4($sp)	#POP
	addu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	sub     $t8, $t8, $t9	#(a(int; offset: 0)<b(int; offset: 4))
	slt     $t8, $t8, $zero
	sltu    $t8, $zero, $t8
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	sw      $t8, -8($fp)	#(c(int; offset: 8) = (a(int; offset: 0)<b(int; offset: 4)))
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, -8($fp)	#c(int; offset: 8)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $a0, 4($sp)	#POP
	addu    $sp, $sp, 4
	li      $v0, 1	#system call code for print_int
	syscall			#printf("%d", c(int; offset: 8));

	la      $a0, .L24	#printf("\n");

	li      $v0, 4
	syscall
	la      $a0, .L25	#printf("\nExpected output:\n0 1 0 1 1\n");

	li      $v0, 4
	syscall
	lw      $t8, 0($fp)	#a(int; offset: 0)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, -4($fp)	#b(int; offset: 4)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t9, 4($sp)	#POP
	addu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	sub     $t8, $t8, $t9	#(a(int; offset: 0)>b(int; offset: 4))
	slt     $t8, $zero, $t8
	sltu    $t8, $zero, $t8
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	sw      $t8, -8($fp)	#(c(int; offset: 8) = (a(int; offset: 0)>b(int; offset: 4)))
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, -8($fp)	#c(int; offset: 8)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $a0, 4($sp)	#POP
	addu    $sp, $sp, 4
	li      $v0, 1	#system call code for print_int
	syscall			#printf("%d", c(int; offset: 8));

	la      $a0, .L26	#printf(" ");

	li      $v0, 4
	syscall
	lw      $t8, 0($fp)	#a(int; offset: 0)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, -4($fp)	#b(int; offset: 4)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t9, 4($sp)	#POP
	addu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	sub     $t8, $t8, $t9	#(a(int; offset: 0)<=b(int; offset: 4))
	slti    $t8, $t8, 1
	sltu    $t8, $zero, $t8
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	sw      $t8, -8($fp)	#(c(int; offset: 8) = (a(int; offset: 0)<=b(int; offset: 4)))
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, -8($fp)	#c(int; offset: 8)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $a0, 4($sp)	#POP
	addu    $sp, $sp, 4
	li      $v0, 1	#system call code for print_int
	syscall			#printf("%d", c(int; offset: 8));

	la      $a0, .L27	#printf(" ");

	li      $v0, 4
	syscall
	lw      $t8, 0($fp)	#a(int; offset: 0)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, -4($fp)	#b(int; offset: 4)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t9, 4($sp)	#POP
	addu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	sub     $t8, $t8, $t9	#(a(int; offset: 0)>=b(int; offset: 4))
	li      $t9, -1
	slt     $t8, $t9, $t8
	sltu    $t8, $zero, $t8
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	sw      $t8, -8($fp)	#(c(int; offset: 8) = (a(int; offset: 0)>=b(int; offset: 4)))
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, -8($fp)	#c(int; offset: 8)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $a0, 4($sp)	#POP
	addu    $sp, $sp, 4
	li      $v0, 1	#system call code for print_int
	syscall			#printf("%d", c(int; offset: 8));

	la      $a0, .L28	#printf(" ");

	li      $v0, 4
	syscall
	lw      $t8, -4($fp)	#b(int; offset: 4)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, -4($fp)	#b(int; offset: 4)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t9, 4($sp)	#POP
	addu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	sub     $t8, $t8, $t9	#(b(int; offset: 4)<=b(int; offset: 4))
	slti    $t8, $t8, 1
	sltu    $t8, $zero, $t8
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $a0, 4($sp)	#POP
	addu    $sp, $sp, 4
	li      $v0, 1	#system call code for print_int
	syscall			#printf("%d", (b(int; offset: 4)<=b(int; offset: 4)));

	la      $a0, .L29	#printf(" ");

	li      $v0, 4
	syscall
	lw      $t8, -4($fp)	#b(int; offset: 4)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, -4($fp)	#b(int; offset: 4)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t9, 4($sp)	#POP
	addu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	sub     $t8, $t8, $t9	#(b(int; offset: 4)>=b(int; offset: 4))
	li      $t9, -1
	slt     $t8, $t9, $t8
	sltu    $t8, $zero, $t8
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $a0, 4($sp)	#POP
	addu    $sp, $sp, 4
	li      $v0, 1	#system call code for print_int
	syscall			#printf("%d", (b(int; offset: 4)>=b(int; offset: 4)));

	la      $a0, .L30	#printf("\n");

	li      $v0, 4
	syscall
	la      $a0, .L31	#printf("\nExpected output:\n-50 3 2 1 0 -1 -2\n");

	li      $v0, 4
	syscall
	li      $t8, 50	#literal
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	li      $t9, -1
	mult    $t8, $t9	#(-50)
	mflo    $t8
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	sw      $t8, 0($fp)	#(a(int; offset: 0) = (-50))
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, 0($fp)	#a(int; offset: 0)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $a0, 4($sp)	#POP
	addu    $sp, $sp, 4
	li      $v0, 1	#system call code for print_int
	syscall			#printf("%d", a(int; offset: 0));

	la      $a0, .L32	#printf(" ");

	li      $v0, 4
	syscall
	lw      $t8, 0($fp)	#a(int; offset: 0)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	li      $t8, 10	#literal
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t9, 4($sp)	#POP
	addu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	sub     $t8, $t8, $t9	#(a(int; offset: 0)<=10)
	slti    $t8, $t8, 1
	sltu    $t8, $zero, $t8
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	beq     $t8, $zero, .L91	#if
	li      $t8, 3	#literal
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	sw      $t8, -16($fp)	#(a(int; offset: 16) = 3)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
.L92_while_start:	nop	# while
	lw      $t8, -16($fp)	#a(int; offset: 16)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	li      $t8, 2	#literal
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	li      $t9, -1
	mult    $t8, $t9	#(-2)
	mflo    $t8
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t9, 4($sp)	#POP
	addu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	sub     $t8, $t8, $t9	#(a(int; offset: 16)>=(-2))
	li      $t9, -1
	slt     $t8, $t9, $t8
	sltu    $t8, $zero, $t8
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	beq     $t8, $zero, .L93_Done	#while
	lw      $t8, -16($fp)	#a(int; offset: 16)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $a0, 4($sp)	#POP
	addu    $sp, $sp, 4
	li      $v0, 1	#system call code for print_int
	syscall			#printf("%d", a(int; offset: 16));

	la      $a0, .L33	#printf(" ");

	li      $v0, 4
	syscall
	lw      $t8, -16($fp)	#a(int; offset: 16)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	li      $t8, 1	#literal
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t9, 4($sp)	#POP
	addu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	sub     $t8, $t8, $t9	#(a(int; offset: 16)-1)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	sw      $t8, -16($fp)	#(a(int; offset: 16) = (a(int; offset: 16)-1))
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	j       .L92_while_start
.L93_Done:	nop	# end while
.L91:	nop	# else
	la      $a0, .L34	#printf("\n");

	li      $v0, 4
	syscall
	la      $a0, .L35	#printf("\nExpected output:\n-5 -4 -3 -2 -1\n");

	li      $v0, 4
	syscall
	li      $t8, 1	#literal
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	li      $t8, 1	#literal
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t9, 4($sp)	#POP
	addu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	mult    $t8, $t9	#(1*1)
	mflo    $t8		#(1*1)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	li      $t9, -1
	mult    $t8, $t9	#(-(1*1))
	mflo    $t8
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	sw      $t8, -4($fp)	#(b(int; offset: 4) = (-(1*1)))
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, -4($fp)	#b(int; offset: 4)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	li      $t8, 1	#literal
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	li      $t9, -1
	mult    $t8, $t9	#(-1)
	mflo    $t8
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t9, 4($sp)	#POP
	addu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	sub     $t8, $t8, $t9	#(b(int; offset: 4)==(-1))
	sltu    $t8, $zero, $t8
	slti    $t8, $t8, 1
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	beq     $t8, $zero, .L94	#if
	li      $t8, 5	#literal
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	li      $t9, -1
	mult    $t8, $t9	#(-5)
	mflo    $t8
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	sw      $t8, var_x	#(x(int; offset: -1) = (-5))
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
.L96_while_start:	nop	# while
	lw      $t8, var_x	#x(int; offset: -1)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, -4($fp)	#b(int; offset: 4)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t9, 4($sp)	#POP
	addu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	sub     $t8, $t8, $t9	#(x(int; offset: -1)<=b(int; offset: 4))
	slti    $t8, $t8, 1
	sltu    $t8, $zero, $t8
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	beq     $t8, $zero, .L97_Done	#while
	lw      $t8, var_x	#x(int; offset: -1)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $a0, 4($sp)	#POP
	addu    $sp, $sp, 4
	li      $v0, 1	#system call code for print_int
	syscall			#printf("%d", x(int; offset: -1));

	la      $a0, .L36	#printf(" ");

	li      $v0, 4
	syscall
	lw      $t8, var_x	#x(int; offset: -1)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	li      $t8, 1	#literal
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t9, 4($sp)	#POP
	addu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	add     $t8, $t8, $t9	#(x(int; offset: -1)+1)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	sw      $t8, var_x	#(x(int; offset: -1) = (x(int; offset: -1)+1))
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	j       .L96_while_start
.L97_Done:	nop	# end while
	j       .L95
.L94:	nop	# else
	la      $a0, .L37	#printf("ERROR\n");

	li      $v0, 4
	syscall
.L95:	nop	# end if
	la      $a0, .L38	#printf("\n");

	li      $v0, 4
	syscall
	move    $sp, $fp
	lw      $fp, 4($sp)	#POP
	addu    $sp, $sp, 4
	lw      $ra, 4($sp)	#POP
	addu    $sp, $sp, 4
	jr      $ra
var_bar:	nop	# function bar
	# a, 4
	# b, 16
	# c, 24
	# B, 32
	# aa, 40
	# bb, 44
	sw      $ra, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	sw      $fp, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	move    $fp, $sp	#init fp
	subu    $sp, $sp, 52	#allocate AR
	la      $a0, .L39	#printf("\nExpected output:\n6.5 7.5 8.5 9.5\n");

	li      $v0, 4
	syscall
	li.d    $f8, 6.5	#6.5
	s.d     $f8, -4($sp)	#PUSH
	subu    $sp, $sp, 8
	l.d     $f8, 4($sp)	#POP
	addu    $sp, $sp, 8
	s.d     $f8, -4($fp)	#(a(double; offset: 4) = 6.5)
	s.d     $f8, -4($sp)	#PUSH
	subu    $sp, $sp, 8
	li      $t8, 6	#literal
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	sw      $t8, -40($fp)	#(aa(int; offset: 40) = 6)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
.L98_while_start:	nop	# while
	lw      $t8, -40($fp)	#aa(int; offset: 40)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	li      $t8, 10	#literal
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t9, 4($sp)	#POP
	addu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	sub     $t8, $t8, $t9	#(aa(int; offset: 40)<10)
	slt     $t8, $t8, $zero
	sltu    $t8, $zero, $t8
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	beq     $t8, $zero, .L99_Done	#while
	l.d     $f8, -4($fp)	#a(double; offset: 4)
	s.d     $f8, -4($sp)	#PUSH
	subu    $sp, $sp, 8
	l.d     $f12, 4($sp)	#POP
	addu    $sp, $sp, 8
	li      $v0, 3	#system call code for print_double
	syscall			#printf("%f");
	la      $a0, .L40	#printf(" ");

	li      $v0, 4
	syscall
	l.d     $f8, -4($fp)	#a(double; offset: 4)
	s.d     $f8, -4($sp)	#PUSH
	subu    $sp, $sp, 8
	li.d    $f8, 1.0	#1.0
	s.d     $f8, -4($sp)	#PUSH
	subu    $sp, $sp, 8
	l.d     $f10, 4($sp)	#POP
	addu    $sp, $sp, 8
	l.d     $f8, 4($sp)	#POP
	addu    $sp, $sp, 8
	add.d   $f8, $f8, $f10	#(a(double; offset: 4)+1.0)
	s.d     $f8, -4($sp)	#PUSH
	subu    $sp, $sp, 8
	l.d     $f8, 4($sp)	#POP
	addu    $sp, $sp, 8
	s.d     $f8, -4($fp)	#(a(double; offset: 4) = (a(double; offset: 4)+1.0))
	s.d     $f8, -4($sp)	#PUSH
	subu    $sp, $sp, 8
	lw      $t8, -40($fp)	#aa(int; offset: 40)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	li      $t8, 1	#literal
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t9, 4($sp)	#POP
	addu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	add     $t8, $t8, $t9	#(aa(int; offset: 40)+1)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	sw      $t8, -40($fp)	#(aa(int; offset: 40) = (aa(int; offset: 40)+1))
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	j       .L98_while_start
.L99_Done:	nop	# end while
	la      $a0, .L41	#printf("\n");

	li      $v0, 4
	syscall
	li.d    $f8, 10.5	#10.5
	s.d     $f8, -4($sp)	#PUSH
	subu    $sp, $sp, 8
	l.d     $f8, 4($sp)	#POP
	addu    $sp, $sp, 8
	s.d     $f8, -4($fp)	#(a(double; offset: 4) = 10.5)
	s.d     $f8, -4($sp)	#PUSH
	subu    $sp, $sp, 8
	la      $a0, .L42	#printf("\nExpected output:\n33 10.5 236.25 10.5\n");

	li      $v0, 4
	syscall
	li.d    $f8, 22.5	#22.5
	s.d     $f8, -4($sp)	#PUSH
	subu    $sp, $sp, 8
	l.d     $f8, 4($sp)	#POP
	addu    $sp, $sp, 8
	s.d     $f8, -16($fp)	#(b(double; offset: 16) = 22.5)
	s.d     $f8, -4($sp)	#PUSH
	subu    $sp, $sp, 8
	l.d     $f8, -4($fp)	#a(double; offset: 4)
	s.d     $f8, -4($sp)	#PUSH
	subu    $sp, $sp, 8
	l.d     $f8, -16($fp)	#b(double; offset: 16)
	s.d     $f8, -4($sp)	#PUSH
	subu    $sp, $sp, 8
	l.d     $f10, 4($sp)	#POP
	addu    $sp, $sp, 8
	l.d     $f8, 4($sp)	#POP
	addu    $sp, $sp, 8
	add.d   $f8, $f8, $f10	#(a(double; offset: 4)+b(double; offset: 16))
	s.d     $f8, -4($sp)	#PUSH
	subu    $sp, $sp, 8
	l.d     $f8, 4($sp)	#POP
	addu    $sp, $sp, 8
	s.d     $f8, -4($fp)	#(a(double; offset: 4) = (a(double; offset: 4)+b(double; offset: 16)))
	s.d     $f8, -4($sp)	#PUSH
	subu    $sp, $sp, 8
	l.d     $f8, -4($fp)	#a(double; offset: 4)
	s.d     $f8, -4($sp)	#PUSH
	subu    $sp, $sp, 8
	l.d     $f12, 4($sp)	#POP
	addu    $sp, $sp, 8
	li      $v0, 3	#system call code for print_double
	syscall			#printf("%f");
	la      $a0, .L43	#printf(" ");

	li      $v0, 4
	syscall
	l.d     $f8, -4($fp)	#a(double; offset: 4)
	s.d     $f8, -4($sp)	#PUSH
	subu    $sp, $sp, 8
	l.d     $f8, -16($fp)	#b(double; offset: 16)
	s.d     $f8, -4($sp)	#PUSH
	subu    $sp, $sp, 8
	l.d     $f10, 4($sp)	#POP
	addu    $sp, $sp, 8
	l.d     $f8, 4($sp)	#POP
	addu    $sp, $sp, 8
	sub.d   $f8, $f8, $f10	#(a(double; offset: 4)-b(double; offset: 16))
	s.d     $f8, -4($sp)	#PUSH
	subu    $sp, $sp, 8
	l.d     $f8, 4($sp)	#POP
	addu    $sp, $sp, 8
	s.d     $f8, -4($fp)	#(a(double; offset: 4) = (a(double; offset: 4)-b(double; offset: 16)))
	s.d     $f8, -4($sp)	#PUSH
	subu    $sp, $sp, 8
	l.d     $f8, -4($fp)	#a(double; offset: 4)
	s.d     $f8, -4($sp)	#PUSH
	subu    $sp, $sp, 8
	l.d     $f12, 4($sp)	#POP
	addu    $sp, $sp, 8
	li      $v0, 3	#system call code for print_double
	syscall			#printf("%f");
	la      $a0, .L44	#printf(" ");

	li      $v0, 4
	syscall
	l.d     $f8, -4($fp)	#a(double; offset: 4)
	s.d     $f8, -4($sp)	#PUSH
	subu    $sp, $sp, 8
	l.d     $f8, -16($fp)	#b(double; offset: 16)
	s.d     $f8, -4($sp)	#PUSH
	subu    $sp, $sp, 8
	l.d     $f10, 4($sp)	#POP
	addu    $sp, $sp, 8
	l.d     $f8, 4($sp)	#POP
	addu    $sp, $sp, 8
	mul.d   $f8, $f8, $f10	#(a(double; offset: 4)*b(double; offset: 16))
	s.d     $f8, -4($sp)	#PUSH
	subu    $sp, $sp, 8
	l.d     $f8, 4($sp)	#POP
	addu    $sp, $sp, 8
	s.d     $f8, -4($fp)	#(a(double; offset: 4) = (a(double; offset: 4)*b(double; offset: 16)))
	s.d     $f8, -4($sp)	#PUSH
	subu    $sp, $sp, 8
	l.d     $f8, -4($fp)	#a(double; offset: 4)
	s.d     $f8, -4($sp)	#PUSH
	subu    $sp, $sp, 8
	l.d     $f12, 4($sp)	#POP
	addu    $sp, $sp, 8
	li      $v0, 3	#system call code for print_double
	syscall			#printf("%f");
	la      $a0, .L45	#printf(" ");

	li      $v0, 4
	syscall
	l.d     $f8, -4($fp)	#a(double; offset: 4)
	s.d     $f8, -4($sp)	#PUSH
	subu    $sp, $sp, 8
	l.d     $f8, -16($fp)	#b(double; offset: 16)
	s.d     $f8, -4($sp)	#PUSH
	subu    $sp, $sp, 8
	l.d     $f10, 4($sp)	#POP
	addu    $sp, $sp, 8
	l.d     $f8, 4($sp)	#POP
	addu    $sp, $sp, 8
	div.d   $f8, $f8, $f10	#(a(double; offset: 4)/b(double; offset: 16))
	s.d     $f8, -4($sp)	#PUSH
	subu    $sp, $sp, 8
	l.d     $f8, 4($sp)	#POP
	addu    $sp, $sp, 8
	s.d     $f8, -4($fp)	#(a(double; offset: 4) = (a(double; offset: 4)/b(double; offset: 16)))
	s.d     $f8, -4($sp)	#PUSH
	subu    $sp, $sp, 8
	l.d     $f8, -4($fp)	#a(double; offset: 4)
	s.d     $f8, -4($sp)	#PUSH
	subu    $sp, $sp, 8
	l.d     $f12, 4($sp)	#POP
	addu    $sp, $sp, 8
	li      $v0, 3	#system call code for print_double
	syscall			#printf("%f");
	la      $a0, .L46	#printf("\n");

	li      $v0, 4
	syscall
	la      $a0, .L47	#printf("\nExpected output:\n66 66\n");

	li      $v0, 4
	syscall
	li.d    $f8, 66.0	#66.0
	s.d     $f8, -4($sp)	#PUSH
	subu    $sp, $sp, 8
	l.d     $f8, 4($sp)	#POP
	addu    $sp, $sp, 8
	s.d     $f8, -16($fp)	#(b(double; offset: 16) = 66.0)
	s.d     $f8, -4($sp)	#PUSH
	subu    $sp, $sp, 8
	l.d     $f8, 4($sp)	#POP
	addu    $sp, $sp, 8
	s.d     $f8, -4($fp)	#(a(double; offset: 4) = (b(double; offset: 16) = 66.0))
	s.d     $f8, -4($sp)	#PUSH
	subu    $sp, $sp, 8
	l.d     $f8, -4($fp)	#a(double; offset: 4)
	s.d     $f8, -4($sp)	#PUSH
	subu    $sp, $sp, 8
	l.d     $f12, 4($sp)	#POP
	addu    $sp, $sp, 8
	li      $v0, 3	#system call code for print_double
	syscall			#printf("%f");
	la      $a0, .L48	#printf(" ");

	li      $v0, 4
	syscall
	l.d     $f8, -16($fp)	#b(double; offset: 16)
	s.d     $f8, -4($sp)	#PUSH
	subu    $sp, $sp, 8
	l.d     $f12, 4($sp)	#POP
	addu    $sp, $sp, 8
	li      $v0, 3	#system call code for print_double
	syscall			#printf("%f");
	la      $a0, .L49	#printf("\n");

	li      $v0, 4
	syscall
	la      $a0, .L50	#printf("\nExpected output:\n-50 3 2 1 0 -1 -2\n");

	li      $v0, 4
	syscall
	li.d    $f8, 50.0	#50.0
	s.d     $f8, -4($sp)	#PUSH
	subu    $sp, $sp, 8
	l.d     $f8, 4($sp)	#POP
	addu    $sp, $sp, 8
	li.d    $f10, -1.0
	mul.d   $f8, $f8, $f10	#(-50.0)
	s.d     $f8, -4($sp)	#PUSH
	subu    $sp, $sp, 8
	l.d     $f8, 4($sp)	#POP
	addu    $sp, $sp, 8
	s.d     $f8, -4($fp)	#(a(double; offset: 4) = (-50.0))
	s.d     $f8, -4($sp)	#PUSH
	subu    $sp, $sp, 8
	li      $t8, 50	#literal
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	li      $t9, -1
	mult    $t8, $t9	#(-50)
	mflo    $t8
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	sw      $t8, -40($fp)	#(aa(int; offset: 40) = (-50))
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	l.d     $f8, -4($fp)	#a(double; offset: 4)
	s.d     $f8, -4($sp)	#PUSH
	subu    $sp, $sp, 8
	l.d     $f12, 4($sp)	#POP
	addu    $sp, $sp, 8
	li      $v0, 3	#system call code for print_double
	syscall			#printf("%f");
	la      $a0, .L51	#printf(" ");

	li      $v0, 4
	syscall
	lw      $t8, -40($fp)	#aa(int; offset: 40)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	li      $t8, 10	#literal
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t9, 4($sp)	#POP
	addu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	sub     $t8, $t8, $t9	#(aa(int; offset: 40)<=10)
	slti    $t8, $t8, 1
	sltu    $t8, $zero, $t8
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	beq     $t8, $zero, .L100	#if
	li.d    $f8, 3.0	#3.0
	s.d     $f8, -4($sp)	#PUSH
	subu    $sp, $sp, 8
	l.d     $f8, 4($sp)	#POP
	addu    $sp, $sp, 8
	s.d     $f8, -52($fp)	#(a(double; offset: 52) = 3.0)
	s.d     $f8, -4($sp)	#PUSH
	subu    $sp, $sp, 8
	li      $t8, 3	#literal
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	sw      $t8, -40($fp)	#(aa(int; offset: 40) = 3)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
.L101_while_start:	nop	# while
	lw      $t8, -40($fp)	#aa(int; offset: 40)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	li      $t8, 2	#literal
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	li      $t9, -1
	mult    $t8, $t9	#(-2)
	mflo    $t8
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t9, 4($sp)	#POP
	addu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	sub     $t8, $t8, $t9	#(aa(int; offset: 40)>=(-2))
	li      $t9, -1
	slt     $t8, $t9, $t8
	sltu    $t8, $zero, $t8
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	beq     $t8, $zero, .L102_Done	#while
	l.d     $f8, -52($fp)	#a(double; offset: 52)
	s.d     $f8, -4($sp)	#PUSH
	subu    $sp, $sp, 8
	l.d     $f12, 4($sp)	#POP
	addu    $sp, $sp, 8
	li      $v0, 3	#system call code for print_double
	syscall			#printf("%f");
	la      $a0, .L52	#printf(" ");

	li      $v0, 4
	syscall
	l.d     $f8, -52($fp)	#a(double; offset: 52)
	s.d     $f8, -4($sp)	#PUSH
	subu    $sp, $sp, 8
	li.d    $f8, 1.0	#1.0
	s.d     $f8, -4($sp)	#PUSH
	subu    $sp, $sp, 8
	l.d     $f10, 4($sp)	#POP
	addu    $sp, $sp, 8
	l.d     $f8, 4($sp)	#POP
	addu    $sp, $sp, 8
	sub.d   $f8, $f8, $f10	#(a(double; offset: 52)-1.0)
	s.d     $f8, -4($sp)	#PUSH
	subu    $sp, $sp, 8
	l.d     $f8, 4($sp)	#POP
	addu    $sp, $sp, 8
	s.d     $f8, -52($fp)	#(a(double; offset: 52) = (a(double; offset: 52)-1.0))
	s.d     $f8, -4($sp)	#PUSH
	subu    $sp, $sp, 8
	lw      $t8, -40($fp)	#aa(int; offset: 40)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	li      $t8, 1	#literal
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t9, 4($sp)	#POP
	addu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	sub     $t8, $t8, $t9	#(aa(int; offset: 40)-1)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	sw      $t8, -40($fp)	#(aa(int; offset: 40) = (aa(int; offset: 40)-1))
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	j       .L101_while_start
.L102_Done:	nop	# end while
.L100:	nop	# else
	la      $a0, .L53	#printf("\n");

	li      $v0, 4
	syscall
	la      $a0, .L54	#printf("\nExpected output:\n-5 -4 -3 -2\n");

	li      $v0, 4
	syscall
	li.d    $f8, 1.0	#1.0
	s.d     $f8, -4($sp)	#PUSH
	subu    $sp, $sp, 8
	li.d    $f8, 1.0	#1.0
	s.d     $f8, -4($sp)	#PUSH
	subu    $sp, $sp, 8
	l.d     $f10, 4($sp)	#POP
	addu    $sp, $sp, 8
	l.d     $f8, 4($sp)	#POP
	addu    $sp, $sp, 8
	mul.d   $f8, $f8, $f10	#(1.0*1.0)
	s.d     $f8, -4($sp)	#PUSH
	subu    $sp, $sp, 8
	l.d     $f8, 4($sp)	#POP
	addu    $sp, $sp, 8
	li.d    $f10, -1.0
	mul.d   $f8, $f8, $f10	#(-(1.0*1.0))
	s.d     $f8, -4($sp)	#PUSH
	subu    $sp, $sp, 8
	l.d     $f8, 4($sp)	#POP
	addu    $sp, $sp, 8
	s.d     $f8, -16($fp)	#(b(double; offset: 16) = (-(1.0*1.0)))
	s.d     $f8, -4($sp)	#PUSH
	subu    $sp, $sp, 8
	li      $t8, 1	#literal
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	li      $t8, 1	#literal
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t9, 4($sp)	#POP
	addu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	mult    $t8, $t9	#(1*1)
	mflo    $t8		#(1*1)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	li      $t9, -1
	mult    $t8, $t9	#(-(1*1))
	mflo    $t8
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	sw      $t8, -44($fp)	#(bb(int; offset: 44) = (-(1*1)))
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, -44($fp)	#bb(int; offset: 44)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	li      $t8, 1	#literal
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	li      $t9, -1
	mult    $t8, $t9	#(-1)
	mflo    $t8
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t9, 4($sp)	#POP
	addu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	sub     $t8, $t8, $t9	#(bb(int; offset: 44)==(-1))
	sltu    $t8, $zero, $t8
	slti    $t8, $t8, 1
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	beq     $t8, $zero, .L103	#if
	li.d    $f8, 5.0	#5.0
	s.d     $f8, -4($sp)	#PUSH
	subu    $sp, $sp, 8
	l.d     $f8, 4($sp)	#POP
	addu    $sp, $sp, 8
	li.d    $f10, -1.0
	mul.d   $f8, $f8, $f10	#(-5.0)
	s.d     $f8, -4($sp)	#PUSH
	subu    $sp, $sp, 8
	l.d     $f8, 4($sp)	#POP
	addu    $sp, $sp, 8
	s.d     $f8, -4($fp)	#(a(double; offset: 4) = (-5.0))
	s.d     $f8, -4($sp)	#PUSH
	subu    $sp, $sp, 8
	li      $t8, 5	#literal
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	li      $t9, -1
	mult    $t8, $t9	#(-5)
	mflo    $t8
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	sw      $t8, -40($fp)	#(aa(int; offset: 40) = (-5))
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
.L105_while_start:	nop	# while
	lw      $t8, -40($fp)	#aa(int; offset: 40)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, -44($fp)	#bb(int; offset: 44)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t9, 4($sp)	#POP
	addu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	sub     $t8, $t8, $t9	#(aa(int; offset: 40)<bb(int; offset: 44))
	slt     $t8, $t8, $zero
	sltu    $t8, $zero, $t8
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	beq     $t8, $zero, .L106_Done	#while
	l.d     $f8, -4($fp)	#a(double; offset: 4)
	s.d     $f8, -4($sp)	#PUSH
	subu    $sp, $sp, 8
	l.d     $f12, 4($sp)	#POP
	addu    $sp, $sp, 8
	li      $v0, 3	#system call code for print_double
	syscall			#printf("%f");
	la      $a0, .L55	#printf(" ");

	li      $v0, 4
	syscall
	l.d     $f8, -4($fp)	#a(double; offset: 4)
	s.d     $f8, -4($sp)	#PUSH
	subu    $sp, $sp, 8
	li.d    $f8, 1.0	#1.0
	s.d     $f8, -4($sp)	#PUSH
	subu    $sp, $sp, 8
	l.d     $f10, 4($sp)	#POP
	addu    $sp, $sp, 8
	l.d     $f8, 4($sp)	#POP
	addu    $sp, $sp, 8
	add.d   $f8, $f8, $f10	#(a(double; offset: 4)+1.0)
	s.d     $f8, -4($sp)	#PUSH
	subu    $sp, $sp, 8
	l.d     $f8, 4($sp)	#POP
	addu    $sp, $sp, 8
	s.d     $f8, -4($fp)	#(a(double; offset: 4) = (a(double; offset: 4)+1.0))
	s.d     $f8, -4($sp)	#PUSH
	subu    $sp, $sp, 8
	lw      $t8, -40($fp)	#aa(int; offset: 40)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	li      $t8, 1	#literal
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t9, 4($sp)	#POP
	addu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	add     $t8, $t8, $t9	#(aa(int; offset: 40)+1)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	sw      $t8, -40($fp)	#(aa(int; offset: 40) = (aa(int; offset: 40)+1))
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	j       .L105_while_start
.L106_Done:	nop	# end while
	j       .L104
.L103:	nop	# else
	la      $a0, .L56	#printf("ERROR\n");

	li      $v0, 4
	syscall
.L104:	nop	# end if
	la      $a0, .L57	#printf("\n");

	li      $v0, 4
	syscall
	move    $sp, $fp
	lw      $fp, 4($sp)	#POP
	addu    $sp, $sp, 4
	lw      $ra, 4($sp)	#POP
	addu    $sp, $sp, 4
	jr      $ra
main:	nop	# function main
	# myd, 4
	sw      $ra, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	sw      $fp, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	move    $fp, $sp	#init fp
	subu    $sp, $sp, 16	#allocate AR
	li.d    $f8, 22.5	#22.5
	s.d     $f8, -4($sp)	#PUSH
	subu    $sp, $sp, 8
	l.d     $f8, 4($sp)	#POP
	addu    $sp, $sp, 8
	s.d     $f8, var_d	#(d(double; offset: -1) = 22.5)
	s.d     $f8, -4($sp)	#PUSH
	subu    $sp, $sp, 8
	li      $t8, 55	#literal
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	sw      $t8, var_x	#(x(int; offset: -1) = 55)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	li      $t8, 65	#literal
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	sw      $t8, var_y	#(y(int; offset: -1) = 65)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	la      $a0, .L58	#printf("Expected output:\n56 66 55 65\n");

	li      $v0, 4
	syscall
	lw      $t8, var_x
	addi    $t8, $t8, 1	#++x(int; offset: -1);

	sw      $t8, var_x
	lw      $t8, var_y
	addi    $t8, $t8, 1	#++y(int; offset: -1);

	sw      $t8, var_y
	lw      $t8, var_x	#x(int; offset: -1)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $a0, 4($sp)	#POP
	addu    $sp, $sp, 4
	li      $v0, 1	#system call code for print_int
	syscall			#printf("%d", x(int; offset: -1));

	la      $a0, .L59	#printf(" ");

	li      $v0, 4
	syscall
	lw      $t8, var_y	#y(int; offset: -1)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $a0, 4($sp)	#POP
	addu    $sp, $sp, 4
	li      $v0, 1	#system call code for print_int
	syscall			#printf("%d", y(int; offset: -1));

	la      $a0, .L60	#printf(" ");

	li      $v0, 4
	syscall
	lw      $t8, var_x
	addi    $t8, $t8, -1	#--x(int; offset: -1);

	sw      $t8, var_x
	lw      $t8, var_y
	addi    $t8, $t8, -1	#--y(int; offset: -1);

	sw      $t8, var_y
	lw      $t8, var_x	#x(int; offset: -1)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $a0, 4($sp)	#POP
	addu    $sp, $sp, 4
	li      $v0, 1	#system call code for print_int
	syscall			#printf("%d", x(int; offset: -1));

	la      $a0, .L61	#printf(" ");

	li      $v0, 4
	syscall
	lw      $t8, var_y	#y(int; offset: -1)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $a0, 4($sp)	#POP
	addu    $sp, $sp, 4
	li      $v0, 1	#system call code for print_int
	syscall			#printf("%d", y(int; offset: -1));

	la      $a0, .L62	#printf("\n");

	li      $v0, 4
	syscall
	la      $a0, .L63	#printf("\ncalling f\n");

	li      $v0, 4
	syscall
	subu    $sp, $sp, 8	#pad
	lw      $t8, var_y	#y(int; offset: -1)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, var_x	#x(int; offset: -1)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	l.d     $f8, var_d	#d(double; offset: -1)
	s.d     $f8, -4($sp)	#PUSH
	subu    $sp, $sp, 8
	jal     var_f		#f(double,int,int->void; offset: -1)(d(double; offset: -1), x(int; offset: -1), y(int; offset: -1))
	la      $a0, .L64	#printf("\ncalling g\n");

	li      $v0, 4
	syscall
	lw      $t8, var_x	#x(int; offset: -1)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	jal     var_g		#g(int->int; offset: -1)(x(int; offset: -1))
	sw      $v0, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	sw      $t8, var_x	#(x(int; offset: -1) = g(int->int; offset: -1)(x(int; offset: -1)))
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	la      $a0, .L65	#printf("Expected output:\n55\n");

	li      $v0, 4
	syscall
	lw      $t8, var_x	#x(int; offset: -1)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $a0, 4($sp)	#POP
	addu    $sp, $sp, 4
	li      $v0, 1	#system call code for print_int
	syscall			#printf("%d", x(int; offset: -1));

	la      $a0, .L66	#printf("\n\n");

	li      $v0, 4
	syscall
	la      $a0, .L67	#printf("calling gg\n");

	li      $v0, 4
	syscall
	l.d     $f8, var_d	#d(double; offset: -1)
	s.d     $f8, -4($sp)	#PUSH
	subu    $sp, $sp, 8
	jal     var_gg		#gg(double->double; offset: -1)(d(double; offset: -1))
	sw      $v1, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	sw      $v0, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	l.d     $f8, 4($sp)	#POP
	addu    $sp, $sp, 8
	s.d     $f8, -4($fp)	#(myd(double; offset: 4) = gg(double->double; offset: -1)(d(double; offset: -1)))
	s.d     $f8, -4($sp)	#PUSH
	subu    $sp, $sp, 8
	la      $a0, .L68	#printf("Expected output:\n45 22.5\n");

	li      $v0, 4
	syscall
	l.d     $f8, -4($fp)	#myd(double; offset: 4)
	s.d     $f8, -4($sp)	#PUSH
	subu    $sp, $sp, 8
	l.d     $f12, 4($sp)	#POP
	addu    $sp, $sp, 8
	li      $v0, 3	#system call code for print_double
	syscall			#printf("%f");
	la      $a0, .L69	#printf(" ");

	li      $v0, 4
	syscall
	l.d     $f8, var_d	#d(double; offset: -1)
	s.d     $f8, -4($sp)	#PUSH
	subu    $sp, $sp, 8
	l.d     $f12, 4($sp)	#POP
	addu    $sp, $sp, 8
	li      $v0, 3	#system call code for print_double
	syscall			#printf("%f");
	la      $a0, .L70	#printf("\n\n");

	li      $v0, 4
	syscall
	la      $a0, .L71	#printf("calling foo\n");

	li      $v0, 4
	syscall
	subu    $sp, $sp, 8	#pad
	jal     var_foo		#foo(->void; offset: -1)()
	la      $a0, .L72	#printf("\ncalling bar\n");

	li      $v0, 4
	syscall
	subu    $sp, $sp, 8	#pad
	jal     var_bar		#bar(->void; offset: -1)()
	la      $a0, .L73	#printf("\nExpected output:\n2 5 2 5 2\n");

	li      $v0, 4
	syscall
	li      $t8, 1	#literal
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	sw      $t8, var_b	#(b(int; offset: -1) = 1)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	li      $t8, 2	#literal
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	sw      $t8, var_x	#(x(int; offset: -1) = 2)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, var_b	#b(int; offset: -1)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	sltu    $t8, $zero, $t8
	bne     $t8, $zero, .L107	#(b(int; offset: -1)||(x(int; offset: -1) = 5))
	li      $t8, 5	#literal
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	sw      $t8, var_x	#(x(int; offset: -1) = 5)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t9, 4($sp)	#POP
	addu    $sp, $sp, 4
	sltu    $t9, $zero, $t9
	bne     $t9, $zero, .L107
	li      $t8, 0
	j       .L108
.L107:	nop
	li      $t8, 1
.L108:	nop	# endand
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	beq     $t8, $zero, .L109	#if
	lw      $t8, var_x	#x(int; offset: -1)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $a0, 4($sp)	#POP
	addu    $sp, $sp, 4
	li      $v0, 1	#system call code for print_int
	syscall			#printf("%d", x(int; offset: -1));

	la      $a0, .L74	#printf(" ");

	li      $v0, 4
	syscall
.L109:	nop	# else
	li      $t8, 2	#literal
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	sw      $t8, var_x	#(x(int; offset: -1) = 2)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	li      $t8, 5	#literal
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	sw      $t8, var_x	#(x(int; offset: -1) = 5)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	sltu    $t8, $zero, $t8
	bne     $t8, $zero, .L110	#((x(int; offset: -1) = 5)||(b(int; offset: -1) = 2))
	li      $t8, 2	#literal
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	sw      $t8, var_b	#(b(int; offset: -1) = 2)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t9, 4($sp)	#POP
	addu    $sp, $sp, 4
	sltu    $t9, $zero, $t9
	bne     $t9, $zero, .L110
	li      $t8, 0
	j       .L111
.L110:	nop
	li      $t8, 1
.L111:	nop	# endand
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	beq     $t8, $zero, .L112	#if
	lw      $t8, var_x	#x(int; offset: -1)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $a0, 4($sp)	#POP
	addu    $sp, $sp, 4
	li      $v0, 1	#system call code for print_int
	syscall			#printf("%d", x(int; offset: -1));

	la      $a0, .L75	#printf(" ");

	li      $v0, 4
	syscall
.L112:	nop	# else
	li      $t8, 1	#literal
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	sw      $t8, var_b	#(b(int; offset: -1) = 1)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	li      $t8, 2	#literal
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	sw      $t8, var_x	#(x(int; offset: -1) = 2)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, var_b	#b(int; offset: -1)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	sltu    $t8, $zero, $t8
	beq     $t8, $zero, .L115	#(!b(int; offset: -1))
	li      $t8, 0
	j       .L116
.L115:	nop
	li      $t8, 1
.L116:	nop	# end not
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	sltu    $t8, $zero, $t8
	beq     $t8, $zero, .L113	#((!b(int; offset: -1))&&(x(int; offset: -1) = 5))
	li      $t8, 5	#literal
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	sw      $t8, var_x	#(x(int; offset: -1) = 5)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t9, 4($sp)	#POP
	addu    $sp, $sp, 4
	sltu    $t9, $zero, $t9
	beq     $t9, $zero, .L113
	li      $t8, 1
	j       .L114
.L113:	nop
	li      $t8, 0
.L114:	nop	# endand
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	beq     $t8, $zero, .L117	#if
	j       .L118
.L117:	nop	# else
	lw      $t8, var_x	#x(int; offset: -1)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $a0, 4($sp)	#POP
	addu    $sp, $sp, 4
	li      $v0, 1	#system call code for print_int
	syscall			#printf("%d", x(int; offset: -1));

	la      $a0, .L76	#printf(" ");

	li      $v0, 4
	syscall
.L118:	nop	# end if
	li      $t8, 0	#literal
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	sw      $t8, var_b	#(b(int; offset: -1) = 0)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	li      $t8, 2	#literal
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	sw      $t8, var_x	#(x(int; offset: -1) = 2)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	li      $t8, 5	#literal
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	sw      $t8, var_x	#(x(int; offset: -1) = 5)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	sltu    $t8, $zero, $t8
	beq     $t8, $zero, .L119	#((x(int; offset: -1) = 5)&&(b(int; offset: -1) = 2))
	li      $t8, 2	#literal
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t8, 4($sp)	#POP
	addu    $sp, $sp, 4
	sw      $t8, var_b	#(b(int; offset: -1) = 2)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $t9, 4($sp)	#POP
	addu    $sp, $sp, 4
	sltu    $t9, $zero, $t9
	beq     $t9, $zero, .L119
	li      $t8, 1
	j       .L120
.L119:	nop
	li      $t8, 0
.L120:	nop	# endand
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	beq     $t8, $zero, .L121	#if
	lw      $t8, var_x	#x(int; offset: -1)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $a0, 4($sp)	#POP
	addu    $sp, $sp, 4
	li      $v0, 1	#system call code for print_int
	syscall			#printf("%d", x(int; offset: -1));

	la      $a0, .L77	#printf(" ");

	li      $v0, 4
	syscall
	lw      $t8, var_b	#b(int; offset: -1)
	sw      $t8, 0($sp)	#PUSH
	subu    $sp, $sp, 4
	lw      $a0, 4($sp)	#POP
	addu    $sp, $sp, 4
	li      $v0, 1	#system call code for print_int
	syscall			#printf("%d", b(int; offset: -1));

	la      $a0, .L78	#printf("\n");

	li      $v0, 4
	syscall
.L121:	nop	# else
	addi    $2, $0, 10	#done
	syscall
