MLD

RH_Usine_Mère(ID_Employé_RUM, Prenom_RUM, Nom_RUM, Age_RUM, Date_arrivée_RUM, Date_départ_RUM, #ID_Stock_SUM)
RH_Usine_Rachetée( ID_Employé_RUR , Prénom_RUR, Nom_RUR, Jour_démarrage_RUR, Présence_RUR, #ID_Stock_SUR)
Fournisseurs( ID_Fournisseur, Nom_Fournisseur)
Livraisons(ID_Livraison, Date_Livraison, Quantité, #ID_Fournisseur, #ID_Employé_RUR, #ID_Employé_RUM)
Stock_Usine_Mère(ID_Stock_SUM, Date_SUM, Quantité_restante_SUM)
Stock_Usine_Rachetée( ID_Stock_SUR, Date_SUR, Quantité_restante_SUR)