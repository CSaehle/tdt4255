from encinstr import *

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

print(simulate(much_inst, dmemsize=16))
proghex(much_inst)
#proghex(much_inst, fname="much.txt")
