
nott(1,0).
nott(0,1).


nand(0,0,1).
nand(0,1,1).
nand(1,0,1). 
nand(1,1,0).

xor(0,0,0).
xor(0,1,1).
xor(1,0,1).
xor(1,1,0).



circuit(X,Y,Z):- nand(X,Y,A), nott(X,B), xor(A,B,C), nott(C,Z).


