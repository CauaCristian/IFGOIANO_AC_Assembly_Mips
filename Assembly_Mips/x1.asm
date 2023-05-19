.data
msg1: .asciiz "Digite o lado do quadrado: "
msg2: .asciiz "A area do quadrado e: "
.text
main:
    # Imprimimindo a msg para o usuário
    li $v0, 4
    la $a0, msg1
    syscall
    
    # Lendo o lado do quadrado
    li $v0, 5
    syscall
    move $s0, $v0 # Armazenando o lado do quadrado em $s0
    
    # Calculando a área do quadrado
    mul $s1, $s0, $s0 
    
    # Imprimindo o resultado
    li $v0, 4
    la $a0, msg2
    syscall
    
    li $v0, 1
    move $a0, $s1 # Imprimindo o resultado
    syscall
    
    # Encerrando o programa
    li $v0, 10
    syscall