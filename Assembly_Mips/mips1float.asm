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

.macro terminar()

	li $v0,10
	syscall
	
.end_macro 

.data
	zero: .double 0.0
.text
	printString("quanto você ganha: ")
	lerFloat()#guarda em f0
	lwc1 $f1,zero
	add.s $f2,$f1,$f0
	printString("quanto vc deve: ")
	lerFloat()#guarda em f0
	add.s $f3,$f1,$f0
	sub.s $f10,$f2,$f3
	printString("seu saldo é: ")
	printFloat($f10)
	terminar()
	  
	 
