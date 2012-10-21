from encinstr import *

fib_inst = [
            encI(LDI, 0, 1, 17), #1 - r1 = 17
            encI(LDI, 0, 11, 1), #2 - r11 = 1
            encI(LDI, 0, 2,  0), #3 - r2 = 0
            encI(LDI, 0, 3,  1), #4 - r3 = 1
            NOP, #5
            encR(RTYPE, 1, 11, 1, 0, SUB), #6 - r1 -= 1
            NOP, NOP, NOP, #7-9 
            encI(BEQ, 1, 0, 15), #10 - for1
            NOP, NOP, NOP, NOP, #11-14
            encR(RTYPE, 2, 3, 4, 0, ADD), #15 - r4 = r2+r3
            encR(RTYPE, 3, 0, 2, 0, ADD), #16 - r2 = r3+0
            NOP, NOP, NOP, #17-19
            encR(RTYPE, 4, 0, 3, 0, ADD), #20 - r3 = r4+0
            encR(RTYPE, 1, 11, 1, 9, SUB), #21 - r1 -= 1
            NOP, NOP, NOP, #22-24
            encJ(JMP, 10), #25 - jump to for1
            NOP, NOP, NOP, #26-28
            encI(SW, 0, 4, 1), #29 - store r4 to datamem addr 1
            NOP, NOP, NOP, NOP, #30-33
            encI(LW, 0, 7, 1), #34 -load datamem addr 1 to r7
            NOP, NOP, NOP, NOP, NOP, NOP, NOP, #35-41
            encJ(JMP, 35) #42
    ]

print(simulate(fib_inst, dmemsize=8, endexec=41))
progtb(fib_inst)
progtb(fib_inst, fname="tb_fib.txt")
#proghex(fib_inst)
#proghex(fib_inst, fname="fib.txt")
