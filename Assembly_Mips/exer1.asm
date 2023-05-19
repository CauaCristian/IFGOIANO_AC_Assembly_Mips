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
	printStr("digite o ano atual: \n")
	lerInt()
	moverInt($t1)
	printStr("digite o ano que você nasceu: \n")
	lerInt()
	moverInt($t0)
	sub $t2,$t1,$t0
	bge $t2,18,maior
	j menor
	maior:
		printStr("voce pode ter habilitação")
		j final
	menor:
		printStr("voce não pode ter habilitação")
		j final
	final:
		li $v0,10
		syscall 