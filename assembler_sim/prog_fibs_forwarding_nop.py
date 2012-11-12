from encinstr import *

fib_inst = [
            encI(LDI, 0, 1, 17), #1 - r1 = 17
            encI(LDI, 0, 11, 1), #2 - r11 = 1
            encI(LDI, 0, 2,  0), #3 - r2 = 0
            encI(LDI, 0, 3,  1), #4 - r3 = 1
            encR(RTYPE, 1, 11, 1, 0, SUB), #5 - r1 -= 1
            NOP, #6
            encI(BEQ, 1, 0, 12), #7 - for1
            NOP, NOP, NOP, NOP, #8-11
            encR(RTYPE, 2, 3, 4, 0, ADD), #12 - r4 = r2+r3
            encR(RTYPE, 3, 0, 2, 0, ADD), #13 - r2 = r3+0
            NOP, #14
            encR(RTYPE, 4, 0, 3, 0, ADD), #15 - r3 = r4+0
            encR(RTYPE, 1, 11, 1, 9, SUB), #16 - r1 -= 1
            NOP,  #17
            encI(SW, 0, 4, 1), #18 - store r4 to datamem addr 1
            encJ(JMP, 7), #19 - jump to for1
            NOP, NOP, NOP, NOP, #20-23
            encI(LW, 0, 7, 1), #24 -load datamem addr 1 to r7
            NOP, NOP, NOP, NOP, NOP, NOP, NOP, #25-31
            encI(BEQ, 0, 0, -6), #32 - infinite do nothing loop to prevent wraparound
            NOP, NOP, NOP, NOP, NOP #33-37 - in case overwriting larger program
        ]

print(simulate(fib_inst, dmemsize=8, endexec=28))
progtb(fib_inst)
progtb(fib_inst, fname="tb_fib.txt")
#proghex(fib_inst)
#proghex(fib_inst, fname="fib.txt")
