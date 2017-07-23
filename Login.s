# Assembly Login
# Autor: Xavi Bel
# Date: 23/07/2017


.data

	Message1:
		.ascii "Welcome: " #9

	Message2:
		.ascii "You can not enter.\n" #19

	Message3:
		.ascii "Congratulations :)\n" #19

	User:
		.ascii "Revil\n" #6

	Password:
		.ascii "R3v1l8" #6

.text

	.globl _start

	_start:

	nop

	# Write syscall - Welcome
	movl $4, %eax
	movl $1, %ebx
	movl $Message1, %ecx
	movl $9, %edx
	int $0x80

	# Write syscall - User
	movl $4, %eax
	movl $1, %ebx
	movl $User, %ecx
	movl $6, %edx
	int $0x80

	# Conditional
	movl $10, %eax
	# Delete this to gain access
	#xorl %eax, %eax
	jz LoginOK

	LoginKO:	
		# Write syscall - Not enter
		movl $4, %eax
		movl $1, %ebx
		movl $Message2, %ecx
		movl $19, %edx
		int $0x80
	
	Exit:
		# Exit syscall
		movl $1, %eax
		movl $0, %ebx
		int $0x80
	
	LoginOK:
		# Write syscall - Enter
		movl $4, %eax
		movl $1, %ebx
		movl $Message3, %ecx
		movl $19, %edx
		int $0x80
		Call Exit

