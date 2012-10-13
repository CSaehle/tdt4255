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

def to2c(x, bits):
    ones = (1 << bits)-1
    if (x>0):
        return x & ones
    x = -x
    x &= ones
    x ^= ones
    x += 1
    x &= ones
    return x

def fr2c(x, bits):
    msig = 1 << (bits-1)
    mask = msig - 1
    
    if x & msig:
        x &= mask
        x = -x
    else:
        x &= mask

    return x
        
        

def alu(x, y, funct, bits=32):
    ones = (1 << bits)-1
    if funct == ADD: return (x+y) & ones
    if funct == SUB: return (x-y) & ones
    if funct == AND: return (x&y) & ones
    if funct ==  OR: return (x|y) & ones
    if funct == SLT: return 1 if (x<y) else 0
    return 0

def encR (opcode, rs, rt, rd, shamt, funct):
    ans = ""
    ans += bin(opcode)[2:].rjust(6, '0')
    ans += bin(rs)[2:].rjust(5, '0')
    ans += bin(rt)[2:].rjust(5, '0')
    ans += bin(rd)[2:].rjust(5, '0')
    ans += bin(shamt)[2:].rjust(5, '0')
    ans += bin(funct)[2:].rjust(6, '0')

    return int(ans, 2)

def encI (opcode, rs, rt, immediate):
    ans = ""
    ans += bin(opcode)[2:].rjust(6, '0')
    ans += bin(rs)[2:].rjust(5, '0')
    ans += bin(rt)[2:].rjust(5, '0')
    ans += bin(to2c(immediate,16))[2:].rjust(16, '0')

    return int(ans, 2)

def encJ (opcode, target):
    ans = ""
    ans += bin(opcode)[2:].rjust(6, '0')
    ans += bin(target)[2:].rjust(26, '0')

    return int(ans, 2)

def outhex(x):
    res = hex(x)
    if res[-1] == 'L':
        res = res[:-1]
    return res

def proghex(instrs, start=1, addrlen=2, fname=None):
    lines = [None] * len(instrs)
    for i, instr in enumerate(instrs):
        pos = "0x"+hex(i+start)[2:].rjust(addrlen, '0').upper() 
        instr = "0x"+outhex(instr)[2:].rjust(8, '0').upper()
        lines[i] = pos + " " + instr
    lines = "\n".join(lines)
    
    if fname:
        f = open(fname, 'w')
        f.write(lines)
        f.write('\n')
        f.close()
    else:
        print(lines)

def simulate(instrs, start=1, startexec=1, dmeminit=None, imemsize=0xFF, dmemsize=0xFF):
    plen = len(instrs)
    reg = [0] * 32
    dmem = [0] * dmemsize
    imem = [0] * imemsize
    imem[start:start+plen] = instrs #copy program to instruction memory
    if dmeminit:
        dmem[0:len(dmeminit)] = dmeminit #initialize data memory
    
    pend = start + plen
    pc = startexec
    

    while (pc <= pend):
        instr = imem[pc]        
        bcode = bin(instr)[2:].rjust(32, '0')
        opcode = int(bcode[0:6], 2)

        if opcode == RTYPE:
            r_rs   = int(bcode[ 6:11], 2)
            r_rt   = int(bcode[11:16], 2)
            r_rd   = int(bcode[16:21], 2)
            r_shmt = int(bcode[21:26], 2)
            r_func = int(bcode[26:32], 2)

            x = fr2c(reg[r_rs], 32)
            y = fr2c(reg[r_rt], 32)
            r = alu(x, y, r_func)
            reg[r_rd] = to2c(r, 32)
            pc += 1
            
        elif opcode == JMP:
            j_tgt  = int(bcode[ 6:32], 2)
            pc = j_tgt

        else:
            i_rs   = int(bcode[ 6:11], 2)
            i_rt   = int(bcode[11:16], 2)
            i_im   = int(bcode[16:32], 2)

            offset = fr2c(i_im, 32)

            #print("offset:", offset)

            if   opcode == LW:
                reg[i_rt] = dmem[reg[i_rs]+offset]
            elif opcode == SW:
                dmem[reg[i_rs]+offset] = reg[i_rt]
            elif opcode == LDI:
                reg[i_rt] = offset
            elif opcode == BEQ:
                if reg[i_rs] == reg[i_rt]:
                    pc += offset
                    #print("branch to: ",pc)
                else:
                    pass
                    #print("no branch because ", reg[i_rs], "!=", reg[i_rt])

            pc += 1
        #print(pc)

    return (reg, dmem)
            
    

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

much_inst = [
            encI(LDI, 0, 1, 8),
            encI(LDI, 0, 2, 16),
            encI(LDI, 0, 3, 74),
            encI(LDI, 0, 4, 4095),
            encR(RTYPE, 1, 2, 5, 0, SLT),
            encR(RTYPE, 2, 1, 6, 0, SLT),
            encR(RTYPE, 2, 4, 7, 0, SLT),
            encR(RTYPE, 1, 2, 8, 0, ADD),
            encR(RTYPE, 3, 2, 9, 0, SUB),
            encR(RTYPE, 3, 1, 10,0, AND),
            encR(RTYPE, 3, 2, 11,0, OR),
            encI(SW, 0, 1, 1),
            encI(SW, 0, 2, 2),
            encI(SW, 0, 3, 3),
            encI(SW, 0, 4, 4),
            encI(SW, 0, 5, 5),
            encI(SW, 0, 6, 6),
            encI(SW, 0, 7, 7),
            encI(SW, 0, 8, 8),
            encI(SW, 0, 9, 9),
            encI(SW, 0,10, 10),
            encI(SW, 0,11, 11),
            encI(SW, 0,12, 12),
            encI(SW, 0,13, 13)
        ]
            

print(simulate(fib_inst, dmemsize=8))
proghex(fib_inst)
proghex(fib_inst, fname="fib.txt")

#print(simulate(much_inst, dmemsize=16))
#proghex(much_inst)
#proghex(much_inst, fname="much.txt")
