def decinstr(x):
    bcode = bin(x)[2:].rjust(32, '0')
    opcode = bcode[0:6]

    r_rs   = int(bcode[ 6:11], 2)
    r_rt   = int(bcode[11:16], 2)
    r_rd   = int(bcode[16:21], 2)
    r_shmt = int(bcode[21:26], 2)
    r_func = int(bcode[26:32], 2)
    
    i_rs   = int(bcode[ 6:11], 2)
    i_rt   = int(bcode[11:16], 2)
    i_im   = int(bcode[16:32], 2)

    j_tgt  = int(bcode[ 6:32], 2)

    res = """\
---R-type---
opcode:            {0}
rs:         {1:5d}  {1:05b}
rt:         {2:5d}  {2:05b}
rd:         {3:5d}  {3:05b}
shamt:      {4:5d}  {4:05b}
funct:             {5:05b}

---I-type---
opcode:            {0}
rs:         {1:5d}  {1:05b}
rt:         {2:5d}  {2:05b}
immediate:  {6:5d}  {6:016b}

---J-type---
opcode:               {0}
target:     {7:8d}  {7:026b}
""".format(opcode, r_rs, r_rt, r_rd, r_shmt, r_func,
           i_im, j_tgt)

    print(res)
