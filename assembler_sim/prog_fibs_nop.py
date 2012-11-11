from encinstr import *

fib_inst = [
            encI(LDI, 0, 1, 17), #1 - r1 = 17
            encI(LDI, 0, 11, 1), #2 - r11 = 1
            encI(LDI, 0, 2,  0), #3 - r2 = 0
            encI(LDI, 0, 3,  1), #4 - r3 = 1
            NOP, NOP, NOP, #5-7
            encR(RTYPE, 1, 11, 1, 0, SUB), #8 - r1 -= 1
            NOP, NOP, NOP, NOP, #9-12 
            encI(BEQ, 1, 0, 18), #13 - for1
            NOP, NOP, NOP, NOP, #14-17
            encR(RTYPE, 2, 3, 4, 0, ADD), #18 - r4 = r2+r3
            encR(RTYPE, 3, 0, 2, 0, ADD), #19 - r2 = r3+0
            NOP, NOP, NOP, NOP, #20-23
            encR(RTYPE, 4, 0, 3, 0, ADD), #24 - r3 = r4+0
            encR(RTYPE, 1, 11, 1, 9, SUB), #25 - r1 -= 1
            NOP, NOP, NOP, NOP, NOP, #26-30
            encJ(JMP, 13), #31 - jump to for1
            NOP, NOP, NOP, NOP, #32-35
            encI(SW, 0, 4, 1), #36 - store r4 to datamem addr 1
            NOP, NOP, NOP, NOP, #37-40
            encI(LW, 0, 7, 1), #41 -load datamem addr 1 to r7
            NOP, NOP, NOP, NOP, NOP, NOP, NOP, NOP, NOP, NOP, #42-51
            encJ(JMP, 42) #52
    ]

print(simulate(fib_inst, dmemsize=8, endexec=51))
progtb(fib_inst)
progtb(fib_inst, fname="tb_fib.txt")
#proghex(fib_inst)
#proghex(fib_inst, fname="fib.txt")
