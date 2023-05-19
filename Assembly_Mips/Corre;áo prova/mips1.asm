.macro lerInt(%r) #ler dentro .macro
	li $v0,5  #codigo 5 guarda dentro macro
	syscall #finaliza processo 
	move %r,$v0 #%r move para dentro macro
.end_macro  #finaliza macro
.macro print(%r) #coloca conteudo dentro macro
	.data 
		msg: .asciiz %r 
	.text #digitar texto
	li $v0,4 #codigo 4 maior ou igual
	la $a0,msg #mover mensagem
	syscall #finalizar programa
.end_macro #finalizar macro

.text #digitar texto
	print("Digite o ano que vc nasceu \n") #mostrar valor
	lerInt($t2)#lendo o ano e guardando em $t2
	print("Digite o ano atual \n") #mostrar valor
	lerInt($t3) #lendo para armazenar $t3
	sub $t1,$t3,$t2 #armazenando $t1 e subtraido $t2 e $t3
	bge $t1,18,maior #beq mostrar valor maior ou igual
	j menor #pular para area menor
	maior:
		print("voce pode ter cnh \n") #mostrar valor
		li $v0,10 #finalizar programa ate valor 10
		syscall #finalizar
	menor:
		print("voce não pode ter cnh \n") #mostrar valor
		li $v0,10#finalizar programa ate valor 10
		syscall # finalizar
		
		
		
	  
