#numero 1: elabora em assembly mips, um programa que o usuario informa a operação 
#(soma, subtração, multiplicação,numero ao quadrado) com entrada de pontos flutuantes. 
#devera ser apresentado em primeiro momento o primeiro valor da operação, 
#no segundo momento a operação, no terceiro momento o segundo valor da operação

.macro printString(%str)

	.data
		msg: .asciiz %str
	.text
		li $v0,4
		la $a0,msg
		syscall 
		
.end_macro

.macro printFloat(%float)

		mov.s $f12,%float
		li $v0,2
		syscall 
		
.end_macro

.macro lerFloat()

	li $v0,6
	syscall
	
.end_macro

.macro lerInt()
 
 	li $v0,5
 	syscall 
 
.end_macro 	 

.macro encerrar()

	li $v0,10
	syscall
	
.end_macro 

.macro moverFloatPara(%local)

	mov.s %local,$f0
	
.end_macro 

.macro moverIntPara(%local)

	move %local,$v0
	 
.end_macro 

.macro somar(%valor1,%valor2)

	add.s $f3,%valor1,%valor2
	
.end_macro

.macro subtrair(%valor1,%valor2)

	sub.s $f3,%valor1,%valor2
	
.end_macro

.macro multiplicar(%valor1,%valor2)

	mul.s $f3,%valor1,%valor2
	
.end_macro

.macro elevar(%valor)

	mul.s $f3,%valor,%valor
	
.end_macro

.macro dividir(%valor1,%valor2)

	div.s $f3,%valor1,%valor2
	
.end_macro 

.text
	printString("digite o primeiro valor: ")
	lerFloat()#guarda em f0
	moverFloatPara($f1) #pega de f0 e move para o local desejado
	printString("1 = soma")
	printString("\n")
	printString("2 = subtração")
	printString("\n")
	printString("3 = multiplicação")
	printString("\n")
	printString("4 = divisao")
	printString("\n")
	printString("5 = ao quadrado")
	printString("\n")
	printString("digite uma operação: ")
	lerInt()#guarda em a0
	moverIntPara($a1)#pega de a0 e move para o local desejado
	printString("digite o segundo valor: ")
	lerFloat()#guarda em f0
	moverFloatPara($f2)#pega de f0 e move para o local desejado
	
	beq $a1,1,soma
	j dois
	soma:
		somar($f1,$f2)#pega o resultado e atribui a $f3
		printString("resultado e: ")
		printFloat($f3)#pega $f3 joga para $f12 e printa o $f12
		printString("\n")
		j final
		
	dois:
	beq $a1,2,subtracao
	j tres
	subtracao:
		subtrair($f1,$f2)#pega o resultado e atribui a $f3
		printString("resultado e: ")
		printFloat($f3)#pega $f3 joga para $f12 e printa o $f12
		printString("\n")
		j final
	tres:
	beq $a1,3,multiplicacao
	j quatro
	multiplicacao:
		multiplicar($f1,$f2)#pega o resultado e atribui a $f3
		printString("resultado e: ")
		printFloat($f3)#pega $f3 joga para $f12 e printa o $f12
		printString("\n")
		j final
	quatro:
	beq $a1,4,divisao
	j cinco
	divisao:
		dividir($f1,$f2)#pega o resultado e atribui a $f3
		printString("resultado e: ")
		printFloat($f3)#pega $f3 joga para $f12 e printa o $f12
		printString("\n")
		j final
	cinco:
	beq $a1,5,elevado
	j erro
	elevado:
		elevar($f1)#pega o resultado e atribui a $f3
		printString("resultado do primeiro valor e: ")
		printFloat($f3)#pega $f3 joga para $f12 e printa o $f12
		printString("\n")
		elevar($f2)#pega o resultado e atribui a $f3
		printString("resultado do segundo valor e: ")
		printFloat($f3)#pega $f3 joga para $f12 e printa o $f12
		printString("\n")
		j final
	erro:
		printString("operação inexistente")
		encerrar()
	final:
		printString("FIM")
		encerrar()
	
	
	
	
	