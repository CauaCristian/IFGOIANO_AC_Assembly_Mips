.data

  #declarando as variaveis
  msg: .asciiz "digite um valor: "
  nota1: .float 0.0
  nota2: .float  0.0 
  nota3: .float  0.0
  media: .float  0.0
  divisao: .float 3.0
  
.text


main:
  
  	
  #pedindo o usuario a primeira nota
  li $v0, 4
  la $a0, msg
  syscall 
  l.s $f0, 6
  syscall
  s.s $f9, nota1
  
  
  
  #pedindo o usuario a segunda nota
  li $v0, 4
  la $a0, msg
  syscall
  l.s $f0, 6
  syscall
  s.s $f9, nota2
  
  
  
  #pedindo o usuario a terceira nota
  li $v0, 4
  la $a0, msg
  syscall
  l.s $f0, 6
  syscall
  s.s $f9, nota3
  
  
  
  #calculando média
  s.s $f0, nota1
  s.s $f1, nota2
  s.s $f3, nota3
  s.s $f7, divisao
  add.s $f5, $f0, $f1
  add.s $f5, $f5, $f3
  div.s $f5, $f5 ,$f7
  s.s $f5, media
  
  
  
  #imprimindo media
  s.s $f11, media
  l.s $f1, 2
  syscall
  
  
  
  #fechando programa
  li $v0, 10
  syscall
