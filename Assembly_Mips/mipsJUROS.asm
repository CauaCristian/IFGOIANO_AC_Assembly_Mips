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
 
.macro printString(%r)
	.data
		texto: .asciiz  %r
	.text
	
	li $v0,4
	la $a0,texto 
	syscall 
.end_macro

.macro printInt(%r)
       	
	li $v0,1
	la $a0,(%r)
	syscall
.end_macro 

.macro readInt(%r)
	li $v0,5 
	syscall
	move %r, $v0
.end_macro 
.macro endCode()
	li $v0, 10
	syscall 
.end_macro 

	
.text 

	printString("digite sua idade")
	readInt($t0)
	
	
	beq $t0, 18, maior
	j final
		maior:
			printString("digite quanto quer emprestado (sem virgula)")
			readInt($t1)
			printString("por quantos meses você deseja pagar o financiamento")
			readInt($t2)
			printString("digite seu salario mensal")
			readInt($t3)
			div $t3,
			
			ble $t1, 5000, juros3
			j jump1
				juros3:
				
					div $t7, $t1, 100
					mul $t7, $t7,3
					j continuar
			jump1:
			ble $t1, 50000, juros2
			j jump2
				juros2:
					div $t7, $t1, 100
					mul $t7, $t7,2
					j continuar
			jump2:
				div $t7, $t1, 100
				mul $t7, $t7,1
				j continuar
			continuar:
				add $t8, $t7, $t1
				mul $t9, $t7, $t2
				add $t6, $t1,$t9
				div $t5, $t6, $t2
				printString("voce esta aprovado ")
				printString(" durante ")
				printInt($t2)
				printString(" meses sua mensalidade e de ")
				printInt($t5)
				endCode()
	final: 
		printString("nao aprovado")
		endCode()
			
			
			



