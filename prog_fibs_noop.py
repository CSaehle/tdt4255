from encinstr import *

fib_inst = [
            encI(LDI, 0, 1, 17), #1 - r1 = 17
            encI(LDI, 0, 11, 1), #2 - r11 = 1
            encI(LDI, 0, 2,  0), #3 - r2 = 0
            encI(LDI, 0, 3,  1), #4 - r3 = 1
            NOP, NOP, NOP, #5-7
            encR(RTYPE, 1, 11, 1, 0, SUB), #8 - r1 -= 1
            NOP, NOP, NOP, NOP, #9-12 
            encI(BEQ, 1, 0, 14), #13 - for1
            encR(RTYPE, 2, 3, 4, 0, ADD), #14 - r4 = r2+r3
            encR(RTYPE, 3, 0, 2, 0, ADD), #15 - r2 = r3+0
            NOP, NOP, NOP, NOP, #16-19
            encR(RTYPE, 4, 0, 3, 0, ADD), #20 - r3 = r4+0
            encR(RTYPE, 1, 11, 1, 9, SUB), #21 - r1 -= 1
            NOP, NOP, NOP, NOP, NOP, #22-26
            encJ(JMP, 13), #27 - jump to for1
            NOP, NOP, NOP, NOP, #28-31
            encI(SW, 0, 4, 1), #32 - store r4 to datamem addr 1
            encI(SW, 0, 4, 1), #33 - store r4 to datamem addr 1
            NOP, NOP, NOP, NOP, #34-37
            encI(LW, 0, 7, 1), #38 -load datamem addr 1 to r7
            encI(LW, 0, 7, 1), #39 -load datamem addr 1 to r7
            NOP, NOP #40-41
    ]

print(simulate(fib_inst, dmemsize=8))
progtb(fib_inst)
progtb(fib_inst, fname="tb_fib.txt")
#proghex(fib_inst)
#proghex(fib_inst, fname="fib.txt")
