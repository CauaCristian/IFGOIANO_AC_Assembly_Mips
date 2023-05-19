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
	printStr("digite o ano que voc� nasceu: \n")
	lerInt()
	moverInt($t0)
	sub $t2,$t1,$t0
	bge $t2,18,maior
	j menor
	maior:
		printStr("voce pode ter habilita��o")
		j final
	menor:
		printStr("voce n�o pode ter habilita��o")
		j final
	final:
		li $v0,10
		syscall 