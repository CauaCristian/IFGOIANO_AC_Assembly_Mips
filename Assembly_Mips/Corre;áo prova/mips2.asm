.macro printInt() #cria função macro 
	li $v0,1 #armazena macro
	syscall #finaliza ate ponto
.end_macro # finaliza a macro
.macro print(%r) #cria macro para printa uma string
	.data 
		msg: .asciiz %r # declarar variavel texto
	.text 
		li $v0,4 #para adicinar printString
		la $a0,msg #adicionar variavel msg
		syscall #finalizar ate ponto
.end_macro # finaliza macro
.macro lerInt()
	li $v0,5 #para amazenar codigo 5
	syscall # finalizar
.end_macro  # finaliza macro
.macro lerOP(%r) #ler função %r dentro macro
	li $v0,5 #para amazenar codigo 5
	syscall #finalizar
	move %r,$v0 #mover variavel $v0
.end_macro #finalizar macro
.text
	print("digite a quantidade inicial do estoque")
	lerOP($t9)
	loop: #cria variavel loop
		beq $t9,0,finalizar
		print("1 = inserir\n") #adicionar valor no print
		print("2 = remover item\n") #adicionar valor no print
		print("3 = consultar\n") #adicionar valor no print
		print("4 = sair\n") #adicionar valor no print
		lerOP($t1) #colocar valor$t1
		beq $t1,1,um #para ver maior $t1
		j teste2 #pular valor direto teste2
		um:
			print("digite q quantidade que quer inserir\n") #adicionar valor no print
			lerInt()
			add $t9,$t9,$v0 # adicionar valor$t9 e soma valor $t9 armazena $v0
		teste2: #criar teste2
		beq $t1,2,dois #soma valor $t1 e vai para 2
		j teste3 # pula teste 3
		dois:
			print("digite q quantidade que quer inserir\n") #adicionar valor no print
			lerInt()
			sub $t9,$t9,$v0 #subtrai valor $t9 menos valor $t9 guarda valor $v0
		teste3:
		beq $t1,3,tres #soma valor $t1
		j teste4 # pula para teste 4
		tres:
			print("seu estoque de balão tem ") #adicionar valor no print
			move $a0,$t9
			printInt()
			print(" exemplares \n") #adicionar valor no print
		teste4: 
		beq $t1,4,quatro #soma valor $t1 para valor 4
		j loop #volta la inicio valor loop
		quatro:
			li $v0,10 #termina proograma
		finalizar:
			print("finalizar compra")