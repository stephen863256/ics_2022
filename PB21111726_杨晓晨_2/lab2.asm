.ORIG x3000
ADDALl ADD R6, R6, #1 ;F(0),store F[N-2]
       ADD R1, R1, #1 ;F(0),store F[N-1]%q
       ADD R2, R2, #1 ;F(1),store F[N]
LOAD LDI R3, P;initially store value p, then store value p-1
     LDI R4, Q;initially store value q 
     LDI R5, N;store value N
     ADD R5, R5, #-2
     ADD R3, R3, #-1;R3 <-  R3 - 1
     NOT R7, R4;R7 <- not R4
     ADD R7, R7, #1;R7 <- not R4 + 1// store value -q
loop 
      ADD R0, R6, #0; R0 <- F(N-2)
      ADD R1, R2, #0; R1 <- F(N-1)
      
    
modp  AND R0, R3, R0
      
      ADD R6, R1, #0
modq  ADD R1, R1, R7;R1 <- R1 + (-R4)
      BRP modq; R1 > 0,continue the loop
      BRZ add1; R1 = 0
      ADD R1, R1, R4;R1 <- R1 + (R4)

add1  ADD R2, R1, R0; R2 <- R1 + R0
      ADD R5, R5, #-1
      BRZP loop
STI R2, RESULT
TRAP x25;HALT
      
P .FILL x3100
Q .FILL x3101
N .FILL x3102
RESULT .FILL x3103
.END





