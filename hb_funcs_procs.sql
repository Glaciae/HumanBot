-- Fonction pour obtenir l'âge d'un employé
CREATE OR REPLACE FUNCTION get_employee_age(employee_id INTEGER) RETURNS INTEGER AS $$
DECLARE
    employee_age INTEGER;
BEGIN
    SELECT Âge INTO employee_age FROM RH_Usine_Mère WHERE ID_Employé = employee_id;
    RETURN employee_age;
END;
$$ LANGUAGE plpgsql;

-- Fonction pour obtenir le nombre total de robots produits
CREATE OR REPLACE FUNCTION get_total_robots_produced() RETURNS INTEGER AS $$
DECLARE
    total_robots INTEGER;
BEGIN
    SELECT SUM(Quantité_robots) INTO total_robots FROM Stock_Usine_Mère;
    RETURN total_robots;
END;
$$ LANGUAGE plpgsql;

-- Fonction pour obtenir le nombre de livraisons effectuées par un fournisseur
CREATE OR REPLACE FUNCTION get_supplier_delivery_count(supplier_id INTEGER) RETURNS INTEGER AS $$
DECLARE
    delivery_count INTEGER;
BEGIN
    SELECT COUNT(*) INTO delivery_count FROM Livraisons WHERE ID_fournisseur = supplier_id;
    RETURN delivery_count;
END;
$$ LANGUAGE plpgsql;








-- Procédure pour ajouter un nouvel employé
CREATE OR REPLACE PROCEDURE add_new_employee(
    nom VARCHAR(50),
    prenom VARCHAR(50),
    age INTEGER,
    date_arrivee DATE
) AS $$
BEGIN
    INSERT INTO RH_Usine_Mère (Nom, Prénom, Âge, Date_arrivée) VALUES (nom, prenom, age, date_arrivee);
END;
$$ LANGUAGE plpgsql;

-- Procédure pour enregistrer une nouvelle entrée de stock
CREATE OR REPLACE PROCEDURE record_stock_entry(
    employee_id INTEGER,
    date DATE,
    quantite_robots INTEGER
) AS $$
BEGIN
    INSERT INTO Stock_Usine_Mère (ID_Employé, Date, Quantité_robots) VALUES (employee_id, date, quantite_robots);
END;
$$ LANGUAGE plpgsql;

-- Procédure pour ajouter une nouvelle livraison
CREATE OR REPLACE PROCEDURE add_new_delivery(
    supplier_id INTEGER,
    employee_id INTEGER,
    date_livraison DATE,
    quantite_pieces INTEGER
) AS $$
BEGIN
    INSERT INTO Livraisons (ID_fournisseur, ID_Employé, Date_livraison, Quantité_pieces) 
    VALUES (supplier_id, employee_id, date_livraison, quantite_pieces);
END;
$$ LANGUAGE plpgsql;
