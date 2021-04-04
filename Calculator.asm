.MODEL SMALL
.STACK 100H
.DATA
USMANINST DB 0DH,0AH,"USMAN INSTITUTE OF TECHNOLOGY",0DH,0AH
DB "********************************************",0DH,0AH
DB "-> PRESS 'A' FOR ADDITION",0DH,0AH
DB "-> PRESS 'S' FOR SUBTRACTION",0DH,0AH
DB "-> PRESS 'E' FOR EXIT ",0DH,0AH
DB "-> PRESS 'R' FOR RETURN TO MAINMENU",0DH,0AH
DB "********************************************",0DH,0AH
DB "ENTER YOUR CHOICE: " ,"$"

OPERAND1 DB 0DH,0AH,"ENTER FIRST VALUE: $"
OPERAND2 DB 0DH,0AH,"ENTER SECOND VALUE: $"
RESULT_IS DB 0DH,0AH,0DH,0AH,"RESULT IS: $"

USERINPUT DB ?
VAL1 DB ?
VAL2 DB ?
RESULT DW ?

.CODE
.STARTUP

MENU:
MOV AH,09H
LEA DX,USMANINST
INT 21H

MOV AH,01H
INT 21H

MOV USERINPUT,AL

CMP USERINPUT,'A'
JE ADDPRO

CMP USERINPUT,'S'
JE SUBPRO

CMP USERINPUT,'E'
JE EXITPRO

JMP MENU

ADDPRO:
MOV AH,09H
LEA DX,OPERAND1
INT 21H

MOV AH,01H
INT 21H

MOV VAL1,AL

MOV AH,09H
LEA DX,OPERAND2
INT 21H

MOV AH,01H
INT 21H
MOV VAL2,AL

MOV AH,02H
MOV DL,0AH
INT 21H

MOV AH,02H
MOV DL,0DH
INT 21H

MOV AX,0H
MOV DL,VAL1

ADD AL,DL
MOV DL,VAL2

ADD AL,DL

AAA
OR AX,3030H

MOV RESULT,AX


MOV AH,09H
LEA DX,RESULT_IS
INT 21H

MOV AH,02H
MOV CX,RESULT
MOV DL,CH
INT 21H

MOV AH,02H
MOV CX,RESULT
MOV DL,CL
INT 21H

JMP MENU

SUBPRO:

MOV AH,09H
LEA DX,OPERAND1
INT 21H
MOV AH,01H
INT 21H
MOV VAL1,AL

MOV AH,09H
LEA DX,OPERAND2
INT 21H
MOV AH,01H
INT 21H
MOV VAL2,AL

MOV AH,02H
MOV DL,0AH
INT 21H

MOV AH,02H
MOV DL,0DH
INT 21H

MOV AX,0H
MOV AL,VAL1

MOV DL,VAL2

SUB AL,DL

AAS
OR AX,3030H
MOV RESULT,AX

MOV AH,02H
MOV CX,RESULT
MOV DL,CH
INT 21H

MOV AH,09H
LEA DX,RESULT_IS
INT 21H

MOV AH,02H
MOV CX,RESULT
MOV DL,CH
INT 21H

MOV AH,02H
MOV CX,RESULT
MOV DL,CL
INT 21H
JMP MENU

EXITPRO:

.EXIT
END