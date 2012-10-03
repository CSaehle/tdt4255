RTYPE = 0
LW = 0b100011
SW = 0b101011
LDI = 0b001111
BEQ = 0b000100
JMP = 0b000010


ADD = 0b100000
SUB = 0b100010
AND = 0b100100
OR  = 0b100101
SLT = 0b101010



def encR (opcode, rs, rt, rd, shamt, funct):
    ans = ""
    ans += bin(opcode)[2:].rjust(6, '0')
    ans += bin(rs)[2:].rjust(5, '0')
    ans += bin(rt)[2:].rjust(5, '0')
    ans += bin(rd)[2:].rjust(5, '0')
    ans += bin(shamt)[2:].rjust(5, '0')
    ans += bin(funct)[2:].rjust(6, '0')

    return hex(int(ans, 2))[2:].rjust(8, '0').upper()

def encI (opcode, rs, rt, immediate):
    ans = ""
    ans += bin(opcode)[2:].rjust(6, '0')
    ans += bin(rs)[2:].rjust(5, '0')
    ans += bin(rt)[2:].rjust(5, '0')
    ans += bin(immediate)[2:].rjust(16, '0')

    return hex(int(ans, 2))[2:].rjust(8, '0').upper()

def encJ (opcode, target):
    ans = ""
    ans += bin(opcode)[2:].rjust(6, '0')
    ans += bin(target)[2:].rjust(26, '0')

    return hex(int(ans, 2))[2:].rjust(8, '0').upper()

def genprog(instrs, start=1):
    for i, instr in enumerate(instrs, start):
        print(hex(i)[2:].upper(), instr)

prog = [
            encI(LDI, 0, 1, 17), #1 - r1 = 42
            encI(LDI, 0, 2,  0), #2 - r2 = 0
            encI(LDI, 0, 3,  1), #3 - r3 = 1
            encI(LDI, 0, 10, 2), #4 - r10 = 2
            encI(LDI, 0, 11, 1), #5 - r11 = 1
            encR(RTYPE, 1, 10, 1, 0, SUB), #6 - r1 -= 2
            encI(BEQ, 1, 0, 4), #7 - for1
            encR(RTYPE, 2, 3, 4, 0, ADD), #8 - r4 = r2+r3
            encR(RTYPE, 3, 0, 2, 0, ADD), #9 - r2 = r3+0
            encR(RTYPE, 4, 0, 3, 0, ADD), #10 - r3 = r4+0
            encJ(JMP, 7), #11 - jump to for1
            encI(SW, 0, 4, 1) #store r4 to datamem addr 1
            
    ]

genprog(prog)
