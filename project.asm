.data
#-----------------------------------player1
	pl1:	.word 0:5 #a1
		.word 0:5 #a2
		.word 0:5 #a3
		.word 0:5 #a4
		.word 0:5 #a5
		.word 0:5 #b1
		.word 0:5 #b2
		.word 0:5 #b3
		.word 0:5 #b4
		.word 0:5 #c1
		.word 0:5 #c2
		.word 0:5 #c3
		.word 0:5 #d1
		.word 0:5 #d2 14
		
	pl1HP:	.word 1,1,0,0,0 #a1
		.word 1,1,0,0,0 #a2
		.word 1,1,0,0,0 #a3
		.word 1,1,0,0,0 #a4
		.word 1,1,0,0,0 #a5
		.word 1,1,1,0,0 #b1
		.word 1,1,1,0,0 #b2
		.word 1,1,1,0,0 #b3
		.word 1,1,1,0,0 #b4
		.word 1,1,1,1,0 #c1
		.word 1,1,1,1,0 #c2
		.word 1,1,1,1,0 #c3
		.word 1,1,1,1,1 #d1
		.word 1,1,1,1,1 #d2 14
	alivepl1: .word 1:14
#-----------------------------------player2
	pl2:
		.word 0:5 #a1
		.word 0:5 #a2
		.word 0:5 #a3
		.word 0:5 #a4
		.word 0:5 #a5
		.word 0:5 #b1
		.word 0:5 #b2
		.word 0:5 #b3
		.word 0:5 #b4
		.word 0:5 #c1
		.word 0:5 #c2
		.word 0:5 #c3
		.word 0:5 #d1
		.word 0:5 #d2
		
	pl2HP:	.word 1,1,0,0,0 #a1
		.word 1,1,0,0,0 #a2
		.word 1,1,0,0,0 #a3
		.word 1,1,0,0,0 #a4
		.word 1,1,0,0,0 #a5
		.word 1,1,1,0,0 #b1
		.word 1,1,1,0,0 #b2
		.word 1,1,1,0,0 #b3
		.word 1,1,1,0,0 #b4
		.word 1,1,1,1,0 #c1
		.word 1,1,1,1,0 #c2
		.word 1,1,1,1,0 #c3
		.word 1,1,1,1,1 #d1
		.word 1,1,1,1,1 #d2 14
	alivepl2: .word 1:14
#-----------------------------------MAP1
	map:	.word 3,4,0,0,0	#1
		.word 51,66,0,0,0	#2
		.word 118,133,0,0,0	#3
		.word 197,198,0,0,0	#4
		.word 204,205,0,0,0	#5
		.word 40,41,42,0,0	#6
		.word 77,92,107,0,0	#7
		.word 113,128,143,0,0	#8
		.word 177,178,179,0,0	#9
		.word 30,45,60,75,0	#10
		.word 85,86,87,88,0	#11
		.word 140,155,170,185,0	#12
		.word 20,21,22,23,24	#13
		.word 135,150,165,180,195	#14		
		.word 33,48,0,0,0	#1	#-----------------------------------MAP2
		.word 111,112,0,0,0	#2
		.word 132,147,0,0,0	#3
		.word 200,201,0,0,0	#4
		.word 205,206,0,0,0	#5
		.word 10,25,40,0,0	#6
		.word 73,74,75,0,0	#7
		.word 93,94,95,0,0	#8
		.word 166,167,168,0,0	#9
		.word 54,69,84,99,0	#10
		.word 140,141,142,143,0	#11
		.word 149,164,179,194,0	#12
		.word 20,21,22,23,24	#13
		.word 101,102,103,104,105	#14
		.word 1,16,0,0,0	#1	#-----------------------------------MAP3
		.word 7,8,0,0,0	#2
		.word 15,30,0,0,0	#3
		.word 196,211,0,0,0	#4
		.word 210,225,0,0,0	#5
		.word 33,34,35,0,0	#6
		.word 41,42,43,0,0	#7
		.word 92,107,122,0,0	#8
		.word 104,119,134,0,0	#9
		.word 66,67,68,69,0	#10
		.word 169,184,199,214,0	#11
		.word 221,222,223,224,0	#12
		.word 112,127,142,157,172	#13
		.word 175,176,177,178,179	#14
	.eqv mapsize 70 #14*5
	.eqv shipnumber 14
	message0: .asciiz "\nplayer1,play map: "
	message1: .asciiz "\nplayer2,play map: "
	message2: .asciiz "\nplayer "
	message3: .asciiz "\nPlease choose mode.(1:common attack, 2:special attack, 3:support)\n"
	message4: .asciiz "\nenemy survivor number: "
	message5: .asciiz "enter the point to attack (1~225).\n"
	message6: .asciiz "miss the attack.\n"
	message7: .asciiz "destroy one part of a ship. \n"
	message8: .asciiz "ship be attack: "
	message9: .asciiz "\nship HP: "
	message10: .asciiz "special attack. (0: 3 row, 1: 3 column, 2: 3x3 square)"
	round: .asciiz "\n\nRound "
	load: .asciiz "\nLOAD......\n"
	newline: .asciiz "\n"
.text
#-------------------------------------------------------------------------------------
main:
    	li $a1, 3		#Here you set $a1 to the max bound.
	li $v0, 42  		#generates the random number.
	syscall
	move $t0,$a0 		#t0 , player1 map
	li $v0, 4
	la $a0, message0
	syscall
	li $v0, 1
	move $a0,$t0
	syscall
	la $a3, pl1		#pl1 address
	move $a2, $t0		#p1 map
	jal loadmap
	li $a1, 3		#Here you set $a1 to the max bound.
	li $v0, 42  		#generates the random number.
	syscall
	move $t0,$a0 		#t1 , player2 map
	li $v0, 4
	la $a0, message1
	syscall
	li $v0, 1
	move $a0,$t0
	syscall
	la $a3, pl2		#pl2 address
	move $a2, $t0		#p2 map
	jal loadmap		#--------------
	li $s0, 1 		#player1
	li $s1, 1		#round
	LOOP:
		bne $s0, 1, nop1# $a1 HP a2 alive a3 pl2
		la $a1, pl2HP
		la $a2, alivepl2
		la $a3, pl2
		j continue0
		nop1:
		bne $s0, 2, nop2
		la $a1, pl1HP
		la $a2,  alivepl1
		la $a3, pl1
		j continue0
		nop2:
		j main
		continue0:
		li $v0, 4
		la $a0, round
		syscall
		li $v0, 1
		move $a0, $s1
		syscall
		li $v0, 4
		la $a0, message2
		syscall
		li $v0, 1
		move $a0, $s0
		syscall	
		li $v0, 4
		la $a0, message3
		syscall
		li $v0, 5
		syscall
		move $t1, $v0		#$v0 mode number 1,2,3  $t1 mode 
		beq $t1, 1, commonattack
		beq $t1, 2, specialattack
		beq $t1, 3, support
		bgt $t1, 3, LOOP
		blt $t1, 1, LOOP
		continue1:		#check end or continue
		li $t2, 0 		#sum
		li $t3, 0 		#i
		move $t4, $a2
		sumloop:
		beq $t3, shipnumber, checkfinished
		lw $t5, 0($t4)
		add $t2, $t2, $t5
		addi $t3, $t3, 1
		addi $t4, $t4,4
		j sumloop
		checkfinished:
		li $v0, 4
		la $a0, message4
		syscall
		li $v0, 1
		move $a0, $t2
		syscall
		beqz $t2, END
		addi $s1, $s1, 1
		bne $s0, 1, notp1
		addi $s0, $s0, 1
		j LOOP
		notp1:
		bne $s0, 2, notp2
		addi $s0, $s0, -1
		j LOOP
		notp2:
		j main
END:
    	li $v0, 10		
    	syscall
loadmap: 				#a2 map number #a3 player address			
	addi $t2, $zero, 0 		#i
    	addi $t1, $zero, 0		#map address
    	mul $t1, $a2, mapsize
    	sll $t1, $t1, 2
    	addi $t0, $zero, 0		#player address
    	add $t0, $t0, $a3
    	while:
    		beq $t2, mapsize, exit
    		lw $t3, map($t1)
    		sw $t3, 0($t0)
    		addi $t2, $t2, 1
    		addi $t1, $t1, 4
    		addi $t0, $t0, 4
    		j while
    	exit:
    		jr $ra
commonattack:
	li $v0, 4
	la $a0, message5
	syscall
	li $v0, 5
	syscall
	bgt $v0, 225, commonattack
	blt $v0, 1, commonattack
	move $a0, $v0			#t0, the 
	jal attackcheck
	beq $v1, 15, commonattackexit
	move $a0, $v1
	jal hpcheck
	j continue1
	commonattackexit:
		j continue1
specialattack:
	li $v0, 4
	la $a0, message10
	syscall
	li $v0, 5
	syscall
	move $t0, $v0			#special attack mode, special attack. (0: 3 row, 1: 3 column, 2: 3x3 square)
	li $v0, 4
	la $a0, message5
	syscall
	li $v0, 5
	syscall
	move $a0, $v0			#special attack point
	beq $t0, 0, ROW
	beq $t0, 1, COLUMN
	beq $t0, 2, SQUARE
	bgt $t0, 2, specialattack
	blt $t0, 0, specialattack
	specatkend:
		j continue1
support:
	j continue1
attackcheck:
	move $t0, $a0
	move $t2, $a1 			# $a1 HP a2 alive a3 pl2
	move $t3, $a2
	move $t4, $a3
	addi $t1, $zero, 0
	catkLoop:
		beq $t1, mapsize, miss
		lw $t5, ($t4)
		beq $t0, $t5, shot
		addi $t1, $t1, 1
		addi $t4, $t4, 4
		j catkLoop
	miss:
		li $v0, 4
		la $a0, message6
		syscall
		addi $t0, $zero, 15
		move $v1, $t0
		jr $ra
	shot:
		li $v0, 4
		la $a0, message7
		syscall
		sll $t5, $t1, 2
		add $t5, $t2, $t5
		sw $zero, ($t5)
		addi $t5, $zero, 5
		div $t4, $t1, $t5
		li $v0, 4
		la $a0, message8
		syscall
		li $v0, 1
		move $a0, $t4
		syscall
		move $v1, $t4		#v1 ship number to be check
		jr $ra
hpcheck:
	move $t0, $a0			#a0 ship number a1 hp a2 alive
	move $t1, $a1
	move $t2, $a2
	mul $t3, $t0, 20
	add $t1, $t1, $t3
	addi $t3, $zero, 0
	addi $t4, $zero, 0
	hpcheckLoop:
		beq $t4, 5, hpcheckend
		lw $t5, ($t1)
		add $t3, $t3, $t5
		addi $t4, $t4, 1
		addi $t1, $t1, 4
		j hpcheckLoop
	hpcheckend:
		li $v0, 4
		la $a0, message9
		syscall
		li $v0, 1
		move $a0, $t3
		syscall
		bne $t3, $zero, hpchecknotdead
		sll $t0, $t0, 2
		add $t2, $t0, $t2
		addi $t5, $zero, 0
		sw $t5, ($t2)
		jr $ra
		hpchecknotdead:
		jr $ra
ROW:
	move $t0, $a0			#point
	jal attackcheck
	beq $v1, 15, ROWexit
	move $a0, $v1
	jal hpcheck
	subi $a0, $t0, 4
	bgt $a0, 225, ROWnext
	blt $a0, 1, ROWnext
	jal attackcheck
	beq $v1, 15, ROWexit
	move $a0, $v1
	jal hpcheck
	ROWnext:
		addi 
j specatkend
COLUMN:
j specatkend
SQUARE:
j specatkend
    			
    	
    	
    	
    	
    	
    	
