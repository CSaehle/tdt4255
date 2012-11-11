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

NOP = 0

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
    ones = msig - 1
    
    if x & msig:
        x &= ones
        x ^= ones
        x = -(x+1)
    else:
        x &= ones

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

def progtb(instrs, start=1, fname=None):
    lines = []
    for i, instr in enumerate(instrs):
        pos = 'x"'+hex(i+start)[2:].rjust(8, '0').upper()+'"'
        instr = 'x"'+outhex(instr)[2:].rjust(8, '0').upper()+'"'
        lines += ["      command <= CMD_WI;", "      bus_address_in <= {};".format(pos), "      bus_data_in <= {};".format(instr), "      wait for clk_period*3;", ""]
        lines += ["      command <= CMD_IDLE;", "      bus_address_in <= zero;", "      bus_data_in <= zero;", "      wait for clk_period*3;", ""]
    lines = "\n".join(lines)
    
    if fname:
        f = open(fname, 'w')
        f.write(lines)
        f.write('\n')
        f.close()
    else:
        print(lines)
    

def simulate(instrs, start=1, startexec=1, endexec=None, dmeminit=None, imemsize=0xFF, dmemsize=0xFF):
    plen = len(instrs)
    reg = [0] * 32
    dmem = [0] * dmemsize
    imem = [0] * imemsize
    imem[start:start+plen] = instrs #copy program to instruction memory
    if dmeminit:
        dmem[0:len(dmeminit)] = dmeminit #initialize data memory

    if not endexec:
        endexec = start + plen
    pc = startexec
    

    while (pc <= endexec):
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

            offset = fr2c(i_im, 16)

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
