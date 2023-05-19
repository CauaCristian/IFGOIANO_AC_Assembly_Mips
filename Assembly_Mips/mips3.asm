#e informado pelo usuario 3 idades. devera informar se as 3 idades sao igauis, se duas das idades sao iguais, ou se todas as idades sao diferentes
.data
msg: .asciiz "informe uma idade"
igual3: .asciiz "as 3 idades são iguais"
igual2: .asciiz "duas idades são iguais"
igual0: .asciiz "nem uma das idades são iguais"
.text
li $v0, 4
la $a0, msg
syscall
li, $v0,5
syscall
move $s0,$v0 

li $v0, 4
la $a0, msg
syscall
li, $v0,5
syscall
move $s1,$v0 

li $v0, 4
la $a0, msg
syscall
li, $v0,5
syscall
move $s2,$v0

beq $s0,$s1,igual2
j jump
	igual2:
		beq $s1,$s2,igual3
		j jump
	
		
		
jump:		
beq $s1,$s2,igual2
j jump
	igual2:
		beq $s0,$s2,igual3
		j jump:
	
jump:
beq $s0,$s2,igual2
j jump
	igual2:
		beq $s1,$s2,igual3
		j jump:
	


 	
	
igual3:
	li $v0, 4
	la $a0, igual3
	syscall		