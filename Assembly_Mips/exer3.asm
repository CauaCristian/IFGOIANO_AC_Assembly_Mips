.macro lerFloat()
	li $v0,6
	syscall
.end_macro 
.macro printFloat()
	li $v0,2
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
.data
	zero: .float 0.0
	index: .float 1.0
	um: .float 1.0
.text
	lwc1  $f1,zero
	lwc1  $f5,index
	lwc1  $f6,um
	loop:
		printStr("digite uma nota: ")
		lerFloat()
		mov.s $f2, $f0 
		c.eq.s $f1,$f2
		bc1t final
		bc1f calcular
		calcular:
			add.s $f3,$f3,$f2
			div.s $f4,$f3,$f5
			add.s $f5, $f5, $f6
			j loop
	final:
		printStr("a soma e: ")
		mov.s $f12, $f3
		printFloat()
		printStr("\na media e: ")
		mov.s $f12, $f4
		printFloat()
		