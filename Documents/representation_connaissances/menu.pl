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

