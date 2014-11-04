/* Les entrees */
entree(crudites).
entree(terrine).
entree(melon).

/*les viandes (avec legume associés) */
viande(steack).
viande(poulet).
viande(gigot).

/* les poissons (avec legumes associés) */
poisson(bar).
poisson(saumon).

/* les desserts*/
dessert(sorbet).
dessert(creme).
dessert(tarte).

/* composition d'un menu simple : une entrée e un plat et un desser */
menu_simple(E,P,D) :- entree(E), plat(P), dessert(D).

/* plat de resistance */
plat(P):- viande(P).
plat(P):- poisson(P).


/*maxNote([Val],[Note],Val,Note).
maxNote([Val|ResteVal],[Note|ResteNote],Val,Note):- maxNote(ResteVal,ResteNote,MaxResteV,MaxResteN),Val>MaxResteV.

maxNote([Val|ResteVal],[Note|ResteNote],MaxResteV,MaxResteN):- maxNote(ResteVal,ResteNote,MaxResteV,MaxResteN),Val=<MaxResteV.



meilleurP([[X],[Y]],X,Y).
meilleurP([[A,B]|ResteP],[A,B]):- meilleurP(ResteP,[ResteP1,ResteP2]),A>ResteP1.
meilleurP([[A,B]|ResteP],[ResteP1,ResteP2]):- meilleurP(ResteP,[ResteP1,ResteP2]),A>ResteP1.
*/
