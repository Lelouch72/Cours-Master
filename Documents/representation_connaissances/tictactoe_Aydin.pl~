/* Aydin Emre TICTACTOE */


/* Visualition de la grille de jeu */

afficheLigne([]).
afficheLigne([X|Q]) :-  write(X),tab(1), afficheLigne(Q).

afficheGrille([X|Q]):- afficheLigne(X), nl, afficheGrille(Q).

succNum(1,2).
succNum(2,3).


succAlpha(a,b).
succAlpha(b,c).


ligneDeGrille2([H1,H2,H3],[H1,H2,H3]).
ligneDeGrille(1,[H|_],[H1,H2,H3|_]):- ligneDeGrille2(H,[H1,H2,H3]).
ligneDeGrille(NumLigne,[_|T],Ligne):- succNum(X,NumLigne), ligneDeGrille(X,T,Ligne).

/* ligneDeGrille(2,[[o,-,x],[o,o,-],[x,-,o]],[o,o,-]). */

caseDeLigne(a,[V|_],V).
caseDeLigne(Col,[_|T],Valeur):- succAlpha(X,Col), caseDeLigne(X,T,Valeur).


/* caseDeLigne(b,[x,-,o],-). */

caseDeGrille(NumCol,NumLigne,Grille,Case):- ligneDeGrille(NumLigne,Grille,L), caseDeLigne(NumCol,L,Case).


/* caseDeGrille(b,2,[[o,-,x],[o,o,-],[x,-,o]], o). */ 

afficheCaseDeGrille(NumCol,NumLigne,Grille):- caseDeGrille(NumCol,NumLigne,Grille,X), write(X).


/* Gestion des coups */

leCoupEstValide(NumCol,NumLigne,Grille):- caseDeGrille(NumCol,NumLigne,Grille,-).


coupJoueDansLigne(a,Val,[_|Ligne],[Val|Ligne]).
coupJoueDansLigne(C,Val,[H|Dep],[H|Arr]):- succAlpha(X,C), coupJoueDansLigne(X,Val,Dep,Arr). 


coupJoueDansGrille(C,1,Val,[H|Grille],[H1|Grille]):- coupJoueDansLigne(C,Val,H,H1).
coupJoueDansGrille(C,NumLigne,Val,[H|GrilleDep],[H|GrilleArr]) :- leCoupEstValide(C,NumLigne,[H|GrilleDep]), succNum(X,NumLigne), coupJoueDansGrille(C,X,Val,GrilleDep,GrilleArr).
/*coupJoueDansGrille(a,2,x,[[-,-,x],[-,o,-],[x,o,o]],[[-,-,x],[x,o,-],[x,o,o]]). */

/* coupJoueDansGrille(a,2,x,[[-,-,x],[-,o,-],[x,o,o]],X). */


ligneFaite(_,[]).
ligneFaite(Val,[Val|Ligne]) :- ligneFaite(Val,Ligne).
/* ligneFaite(-,[-,-,-]). */


ligneExiste(Val,Grille,Ligne) :- ligneDeGrille(Ligne,Grille,NumLigne), ligneFaite(Val,NumLigne). 
/* ligneExiste(-,[[-,-,x],[-,-,-],[x,o,o]],2).  La ligne 2 est pleine de "-"*/


colonneExiste(Val,[H],C):- caseDeLigne(C,H,Val).
colonneExiste(Val,[X|Grille],C) :- caseDeLigne(C,X,Val), colonneExiste(Val,Grille,C).

/* colonneExiste(-,[[x,-,-],[x,-,-],[x,-,-]],c).  La colonne c est remplie de "-" */


diagonaleGD(Val,Grille):- caseDeGrille(a,1,Grille,Val),caseDeGrille(b,2,Grille,Val),caseDeGrille(c,3,Grille,Val).
diagonaleDG(Val,Grille):- caseDeGrille(c,1,Grille,Val),caseDeGrille(b,2,Grille,Val),caseDeGrille(a,3,Grille,Val).
/* diagonaleDG(o,[[x,-,o],[x,o,-],[o,o,x]]). */


partieGagnee(Val,Grille) :- ligneExiste(Val,Grille,_).
partieGagnee(Val,Grille) :- colonneExiste(Val,Grille,_).
partieGagnee(Val,Grille) :- diagonaleGD(Val,Grille).
partieGagnee(Val,Grille) :- diagonaleDG(Val,Grille).

/* partieGagnee(o,[[o,-,x],[o,-,-],[o,-,-]]).  Partie Gagnee en colonne
   partieGagnee(o,[[o,o,o],[o,-,-],[o,-,-]]).  Partie Gagnee en ligne
   partieGagnee(o,[[o,-,x],[o,o,-],[o,-,o]]).  Partie Gagnee en diagonale GD
   partieGagnee(x,[[o,-,x],[o,x,-],[x,-,o]]).  Partie Gagnee en diagonale DG

   partieGagnee(X,[[o,-,x],[o,o,-],[x,-,o]]).  Requete pour savoir si une grille est gagnante 

*/

