def decinstri(x):
    bcode = bin(x)[2:].rjust(32, '0')
    opcode = bcode[0:6]
    rs = bcode[6:11]
    rt = bcode[11:16]
    im = bcode[16:32]
    return (opcode, rs, rt, im)
