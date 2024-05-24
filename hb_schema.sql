-- Table RH - Usine Mère
CREATE TABLE RH_Usine_Mère (
    ID_Employé SERIAL PRIMARY KEY,
    Nom VARCHAR(50) NOT NULL,
    Prénom VARCHAR(50) NOT NULL,
    Âge INTEGER CHECK (Âge >= 18),
    Date_arrivée DATE CHECK (Date_arrivée IS NOT NULL AND Date_arrivée <= CURRENT_DATE),
    Date_départ DATE CHECK (Date_départ IS NULL OR Date_départ >= Date_arrivée)
);

-- Table RH - Usine Rachetée
CREATE TABLE RH_Usine_Rachetée (
    ID_Employé SERIAL PRIMARY KEY,
    Prénom VARCHAR(50) NOT NULL,
    Nom VARCHAR(50) NOT NULL,
    Jour_démarrage DATE CHECK (Jour_démarrage IS NOT NULL AND Jour_démarrage <= CURRENT_DATE),
    Présence BOOLEAN NOT NULL
);

-- Table Stock - Usine Mère
CREATE TABLE Stock_Usine_Mère (
    ID_Stock_UM SERIAL PRIMARY KEY,
    ID_Employé INTEGER NOT NULL REFERENCES RH_Usine_Mère(ID_Employé) ON DELETE CASCADE,
    Date DATE NOT NULL CHECK (Date <= CURRENT_DATE),
    Quantité_robots INTEGER NOT NULL CHECK (Quantité_robots >= 0)
);

-- Table Stock - Usine Rachetée
CREATE TABLE Stock_Usine_Rachetée (
    ID_Stock_UR SERIAL PRIMARY KEY,
    ID_Employé INTEGER NOT NULL REFERENCES RH_Usine_Rachetée(ID_Employé) ON DELETE CASCADE,
    Date DATE NOT NULL CHECK (Date <= CURRENT_DATE),
    Quantité_pieces INTEGER NOT NULL CHECK (Quantité_pieces >= 0)
);

-- Table Fournisseurs
CREATE TABLE Fournisseurs (
    ID_Fournisseur SERIAL PRIMARY KEY,
    Nom VARCHAR(100) NOT NULL
);

-- Table Livraisons
CREATE TABLE Livraisons (
    ID_Livraison SERIAL PRIMARY KEY,
    ID_fournisseur INTEGER NOT NULL REFERENCES Fournisseurs(ID_Fournisseur) ON DELETE CASCADE,
    ID_Employé INTEGER NOT NULL REFERENCES RH_Usine_Rachetée(ID_Employé) ON DELETE CASCADE,
    Date_livraison DATE NOT NULL CHECK (Date_livraison <= CURRENT_DATE),
    Quantité_pieces INTEGER NOT NULL CHECK (Quantité_pieces >= 0)
);
