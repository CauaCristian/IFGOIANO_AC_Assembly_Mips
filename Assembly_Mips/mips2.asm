.data 
#declarando variaveis 
pergunta: .asciiz "digite a sua idade"
msg1: .asciiz "voce e menor de idade"
msg2: .asciiz "voce e maior de idade"

.text
#printando a pergunta
li $v0, 4
la $a0, pergunta
syscall
#recebendo a idade
li $v0, 5
syscall

#movendo para um registrador
move $t1, $v0
li $t0, 18

#devio se for menor
blt $t1,$t0, menor
bge $t1,$t0,maior

menor:
li $v0, 4
la $a0,msg1
syscall 
li $v0, 10
syscall 
maior:
li $v0, 4
la $a0,msg2
syscall 
li, $v0, 10
syscall 
