.ORIG x3000
LDI R0,NUM
LD R1,DATA ; R1 is the pointer of the string
LDR R3, R1, #0; R3 <- mem[DATA]
ADD R2, R2, #1; R2 <- R2 + 1

loop    ADD R4, R3, #0;R4 is pre-data 
        NOT R4, R4;
        ADD R4, R4, #1;R4 <- (-R4)
        ADD R1, R1, #1;R1 <- R1 + 1
        LDR R3, R1, #0;R3 <- mem[R1]
        ADD R4, R4, R3;R4 <- R4 + R3
        BRZ add1; predata == data
        BRNP store; predata != data
        
add1    ADD R2, R2, #1 
        BRNZP minus
        
store   NOT R2, R2;
        ADD R2, R2, #1;
        ADD R6, R2, R5;R5 is max{R2} ,use R6 to judge if R2 > R5
        BRN store1;R2 > R5,store R2 in R5
        BRZP minus1
        
store1  
        NOT R2, R2;
        ADD R2, R2, #1;
        ADD R5, R2, #0;
        BRP minus1

minus  
        ADD R0, R0, #-1;R0 <- R0 - 1 
        BRP loop 

minus1 
        AND R2, R2, #0;
        ADD R2, R2, #1;
        ADD R0, R0, #-1;R0 <- R0 - 1 
        BRP loop 
STI R5,RESULT
HALT
RESULT .FILL x3050
NUM .FILL x3100
DATA .FILL x3101
.END