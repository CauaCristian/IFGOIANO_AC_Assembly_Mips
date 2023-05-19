.macro lerInt()
	li $v0, 5
	syscall
.end_macro
.macro moverInt(%r)
	move %r,$v0
.end_macro 
.macro printInt()
	li $v0, 1
	syscall 
.end_macro
.macro printStr(%r)
	.data
		msg: .asciiz %r
	.text
		li $v0,4
		la $a0,msg
		syscall 
.end_macro

.text
	printStr("digite a quantidade de bolacha que deseja no estoque: \n")
	lerInt()
	moverInt($t0)
	move $t1,$zero
	loop: 
		ble $t0,$t1, finaliza�ao
		printStr("1 =  inserir item \n") 
		printStr("2 =  remover item \n") 
		printStr("3 =  consultar item \n") 
		printStr("4 =  encerrar \n")
		printStr("digite um valor de opera��o: \n") 
		lerInt()
		moverInt($t2)
		beq $t2,1,primeiraOp�ao
		j verifica�aoDois
		primeiraOp�ao:
			printStr("digite quantos itens que deseja inserir: \n")
			lerInt()
			add $t0,$t0,$v0
			j loop
		verifica�aoDois:
		beq $t2,2,segundaOp�ao
		j verifica�aoTreis
		segundaOp�ao:
			printStr("digite quantos itens que deseja remover: \n")
			lerInt()
			sub  $t0,$t0,$v0
			j loop
		verifica�aoTreis:
		beq $t2,3,terceiraOp�ao
		j verifica�aoQuatro
		terceiraOp�ao:
			printStr("no estoque contem ")
			move $a0,$t0
			printInt()
			printStr(" bolachas \n")
			j loop
		verifica�aoQuatro:
		beq $t2,4,quartaOp�ao
		j loop
		quartaOp�ao:
			li $v0, 10
			syscall
	finaliza�ao:
		printStr("realizar compra")
		
		
		
