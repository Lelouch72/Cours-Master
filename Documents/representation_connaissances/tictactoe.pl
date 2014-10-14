/*l1([-,-,-]).
l2([-,-,-]).
l3([-,-,-]).

grille([l1,l2,l3]).
*/


afficheLigne([]).
afficheLigne([X|Q]) :-  write(X),tab(1), afficheLigne(Q).

afficheGrille([X|Q]):- afficheLigne(X), nl, afficheGrille(Q).

succNum(1,2).
succNum(2,3).


succAlpha(a,b).
succAlpha(b,c).




ligneDeGrille2([H1,H2,H3],[H1,H2,H3]).
ligneDeGrille(1,[H|_],[H1,H2,H3|_]):- ligneDeGrille2(H,[H1,H2,H3]).
ligneDeGrille(NumLigne,[_|T],Ligne):- succ(X,NumLigne), ligneDeGrille(X,T,Ligne).

caseDeLigne(a,[V|_],V).
caseDeLigne(Col,[_|T],Valeur):- succAlpha(X,Col), caseDeLigne(X,T,Valeur).

caseDeGrille(NumCol,NumLigne,Grille,Case):- ligneDeGrille(NumLigne,Grille,L), caseDeLigne(NumCol,L,Case).
