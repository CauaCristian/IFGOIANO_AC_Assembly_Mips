#1) 

#   $v0, $v1 registrador de controle( tudo que vai acontecer no processador passa por ele)
#   $a0, $a1 $a3 registrador que armazena a longo prazo 
#   $t0, $t1 $t3... registrador que armazena enquanto o sistema ta aberto
#   $f0, $f1 $f3... registrador que armazena ponto flutuante

#2)
 
#   inteiro = move $v0, $t0
#   decimal = mov.s $v0,$t0

#3)

#  add = soma inteiro
#  div = divide inteiro
#  mul = multiplica inteiro
#  div.s = divide float
#  mul.s = multiplica float
#  add.s = soma float

#4)

#beq = se for igual 
#bne = se for diferente
#blt = se for menor
#bgt = se for maior
#ble = se for menor ou igual
#bge = se for maior ou igual

#5)

#ler inteiro

.macro lerInteiro(%r)

	li $v0,5
	syscall 
	move %r,$v0
	
	
.end_macro 

#6)

#print inteiro

.macro printInt(%r)

	li $v0, 1
	la $a0,%r
	syscall 
	
.end_macro

#print float

.macro printFloat(%r)

	li $v0, 2
	la $f12,%r
	syscall 
	
.end_macro

#7)

#ler float

.macro lerFloat(%r)

	li $v0,6
	syscall
	mov.s %r,$f0
	 
.end_macro 

.macro printString(%r)
	.data
		msg: .asciiz %r
	.text
		li $v0, 4
		la $a0,msg
		syscall 
.end_macro 
	
.text
move $t0, $zero
loop:
	printString("digite 0 para sair do loop: ")
	lerInteiro($t1)
	beq $t1,$t0,exit
	j loop	
exit:
	li $v0,10
	syscall 



