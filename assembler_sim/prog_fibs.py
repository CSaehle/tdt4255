from encinstr import *

fib_inst = [
            encI(LDI, 0, 1, 17), #1 - r1 = 17
            encI(LDI, 0, 2,  0), #2 - r2 = 0
            encI(LDI, 0, 3,  1), #3 - r3 = 1
            encI(LDI, 0, 10, 2), #4 - r10 = 2
            encI(LDI, 0, 11, 1), #5 - r11 = 1
            encI(LDI, 0, 0, 0), #6 - r0 = 0
            encR(RTYPE, 1, 11, 1, 0, SUB), #7 - r1 -= 1
            encI(BEQ, 1, 0, 6), #8 - for1
            encR(RTYPE, 2, 3, 4, 0, ADD), #9 - r4 = r2+r3
            encR(RTYPE, 3, 0, 2, 0, ADD), #10 - r2 = r3+0
            encR(RTYPE, 4, 0, 3, 0, ADD), #11 - r3 = r4+0
            encR(RTYPE, 1, 11, 1, 9, SUB), #12 - r1 -= 1
            encI(SW, 0, 4, 2), #13 - #store r4 to datamem addr 2
            encJ(JMP, 8), #14 - jump to for1
            encI(SW, 0, 4, 1), #store r4 to datamem addr 1
            encI(SW, 0, 4, 1), #store r4 to datamem addr 1
            encI(LW, 0, 7, 1) #store r4 to datamem addr 1
            
    ]

print(simulate(fib_inst, dmemsize=8))
progtb(fib_inst)
#proghex(fib_inst)
#proghex(fib_inst, fname="fib.txt")
