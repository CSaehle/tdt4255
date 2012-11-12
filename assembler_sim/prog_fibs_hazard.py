from encinstr import *

fib_inst = [
            encI(LDI, 0, 1, 17), #1 - r1 = 17
            encI(LDI, 0, 2,  0), #2 - r2 = 0
            encI(LDI, 0, 11,  1), #3 - r11 = 1
            encI(LDI, 0, 3, 1), #4 - r3 = 1
            encR(RTYPE, 1, 11, 1, 0, SUB), #5 - r1 -= 1
            encI(BEQ, 1, 0, 6), #6 - for1
            encR(RTYPE, 2, 3, 4, 0, ADD), #7 - r4 = r2+r3
            encR(RTYPE, 3, 0, 2, 0, ADD), #8 - r2 = r3+0
            encR(RTYPE, 4, 0, 3, 0, ADD), #9 - r3 = r4+0
            encR(RTYPE, 1, 11, 1, 9, SUB), #10 - r1 -= 1
            encI(SW, 0, 4, 1), #11 - store r4 to datamem addr 1
            encJ(JMP, 6), #12 - jump to for1
            NOP, NOP, #13-14
            encI(LW, 0, 7, 1), #15 -load datamem addr 1 to r7
            NOP, NOP, NOP, NOP, NOP, NOP, NOP, #16-22
            encI(BEQ, 0, 0, -6), #23 - infinite do nothing loop to prevent wraparound
            NOP, NOP, NOP, NOP, NOP #24-28 - in case overwriting larger program
        ]

print(simulate(fib_inst, dmemsize=8, endexec=19))
progtb(fib_inst)
progtb(fib_inst, fname="tb_fib.txt")
#proghex(fib_inst)
#proghex(fib_inst, fname="fib.txt")
