# 1) considere o seguinte senario.

 # uma empresa financeira necessita deliberar a aprovação ou reprovação de um financiamento.
 # para tanto são necessario analisar alguns atributos:
 # maior de idade. 
 # valor da mensalidade do financiamento menor igual a 30% da renda mensal
 # sistema de jurus funcionara da seguinte forma:
 # se < 5000 3% ao mês
 # entre 5001 e 50000 2% ao mês
 # acima de 50000 1% ao mês
 # o sistema deve perguntar para o usuario quantos meses ele quer pagar esse financiamento
 
 #criando uma macro que imprime string
.macro printString(%r)
	.data
		texto: .asciiz  %r
	.text
	
	li $v0,4
	la $a0,texto 
	syscall 
.end_macro
#criando uma macro que imprime inteiro
.macro printInt(%r)
       	
	li $v0,1
	la $a0,(%r)
	syscall
.end_macro 
#criando uma macro que recebe um inteiro
.macro readInt(%r)
	li $v0,5 
	syscall
	move %r, $v0
.end_macro 
#criando uma macro que encerra o codigo
.macro endCode()
	li $v0, 10
	syscall 
.end_macro 

	
.text 
	#pegando o valor da idade do usuario
	printString("digite sua idade")
	readInt($t0)
	
	#verificando se e maior de 18
	beq $t0, 18, maior
	#se nao for maior ira para area final
	j final
		maior:
			#pegando o valor do emprestimo
			printString("digite quanto quer emprestado (sem virgula)")
			readInt($t1)
			#pegando por quantas vezes o usuario quer pagar o emprestimo
			printString("por quantos meses você deseja pagar o financiamento")
			readInt($t2)
			#pegando o salario do usuario
			printString("digite seu salario mensal")
			readInt($t3)
			#verificando se o salario informado e menor que 5000, caso for menor ira para area juros3
			ble $t1, 5000, juros3
			#se for maior ira para area jump1
			j jump1
				
				juros3:
					#pegando o valor do juros mensal desse emprestimo
					div $t7, $t1, 100
					mul $t7, $t7,3
					j continuar
			jump1:
			#verificando se o salario informado e menor que 50000
			ble $t1, 50000, juros2
			j jump2
				juros2:
					#pegando o valor do juros mensal desse emprestimo
					div $t7, $t1, 100
					mul $t7, $t7,2
					j continuar
			jump2:
				#pegando o valor do juros mensal desse emprestimo
				div $t7, $t1, 100
				mul $t7, $t7,1
				j continuar
			continuar:
				#pegando o valor de 30% do salario
				div $t3,$t3,10
				mul $t3,$t3,3
				#pegando o valor do juros pela quantidade dos meses
				add $t8, $t7, $t1
				mul $t9, $t7, $t2
				#atribuindo o valor do juros ao valor do emprestimo e distribuindo as parcelas pela quantidade de meses
				add $t6, $t1,$t9
				div $t5, $t6, $t2
				#verificando se o valor de 30% do salario e menor que o valor das parcelas, se for ira para a regiaro do codigo (final:)
				ble $t3,$t5,final
				#caso seja maior, ele sera aprovado e imprimira todos os dados necessarios para o emprestimo
				printString("voce esta aprovado ")
				printString(" durante ")
				#imprimindo o valor dos meses
				printInt($t2)
				printString(" meses sua mensalidade e de ")
				#imprimindo o valor das mensalidades 
				printInt($t5)
				#encerrando o codigo
				endCode()
	#final: area aonde caso o emprestimo nao for aprovado ira se direcionar
	final: 
		#imprimindo para o usuario que o emprestimo foi de comes e bebes 
		printString("nao aprovado")
		#encerrando o codigo
		endCode()
			
			
			



