
.align 2
.global addnumbers
.type addnumbers @function

addnumbers:
	ADD W0, W0, W1
	RET

.global subnumbers
.type subnumbers @function

subnumbers:
	SUB X0,X0, X1
	RET

.global mulnumbers
.type mulnumbers @function
mulnumbers:
	MUL X0, X0, X1
	RET

.global count 
.type count @function
count:
	CMP X1, X0
	B.LE zero_exit 
	MOV X4, X0
	MOV X0, #1
	CMP X1, XZR
	B.NE LOOP

zero_exit:
	MOV X0, XZR
	RET

LOOP:
	ADD X0, X0, #1
	ADD X4, X4, X2
	CMP X4, X1
	B.GT decrem_x0
	CMP X4, X1
	B.LE LOOP
	RET

decrem_x0:
	SUB X0, X0, #1
	RET

.global mymemncpy 
.type mymemncpy @function
mymemncpy:
	MOV X4, X2
	CBZ X0, END
	CBZ X1, END

CPYLOOP:
	LDRB W5, [X1], #1
	STRB W5, [X0], #1
	SUB X4, X4, #1
	CMP X4, XZR
	B.GT CPYLOOP
	SUB X0, X2, X4
	RET

END:
	MOV X0, XZR
	RET
