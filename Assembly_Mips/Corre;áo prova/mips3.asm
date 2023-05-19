
.macro print(%r) # cria uma macro de printar str
	.data 
		msg: .asciiz %r #atribui a variavel msg o conteudo
	.text 
		li $v0,4 #prepara o processador para printar str
		la $a0,msg #manda o conteudo que ta em msg para $a0
		syscall 
.end_macro
.macro lerFloat()
 	li $v0,6 #prepara para ler float
 	syscall
.end_macro 
.macro printFloat()
 	li $v0,2 #prepara pra printa float
 	syscall
.end_macro
.data
	zero: .float 0.0 #coloca o valor 0.0 na variavel 
	index: .float 1.0 #coloca o valor 1.0 na variavel 
	um: .float 1.0 #coloca o valor 1.0 na variavel 
.text
	lwc1 $f1, zero #passa o valor da variavel para o registrador
	lwc1 $f2, index #passa o valor da variavel para o registrador
	lwc1 $f3, um #passa o valor da variavel para o registrador
	
	loop:
		print("digite uma nota: ")
		lerFloat()
		c.eq.s $f0,$f1 #verifica se o numero digitado e igual a zero
		bc1t finalizar #encaminha para a area finalizar se for igual a zero
		bc1f somar #encaminha para area somar se nao for igual a 0
		somar:
			add.s $f4,$f4,$f0 #adiciona a nota somando com as outras notas
			div.s $f5,$f4,$f2 #faz a media das notas dividindo pelo index
			add.s $f2,$f2,$f3 #adiciona mais 1 no index
			j loop
 		finalizar:
 			print("soma: ")
 			mov.s $f12,$f4 #move a soma que ta em $f4 para $f12 para poder printar
 			printFloat() 
 			print("media: ")
 			mov.s  $f12,$f5 # move para $f12 o valor da media que ta em $f5
 			printFloat()
 			li $v0,10 # finaliza o sistema
 			syscall 
	






