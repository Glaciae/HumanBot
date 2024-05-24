-- Création de la table d'audit
CREATE TABLE Audit_Employés (
    ID_Audit SERIAL PRIMARY KEY,
    ID_Employé INTEGER,
    Nom VARCHAR(50),
    Prénom VARCHAR(50),
    Âge INTEGER,
    Date_arrivée DATE,
    Date_départ DATE,
    Operation VARCHAR(10),
    Timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Fonction pour l'audit de l'insertion dans RH_Usine_Mère
CREATE OR REPLACE FUNCTION audit_insert_rh_um()
RETURNS TRIGGER AS $$
BEGIN
    INSERT INTO Audit_Employés (ID_Employé, Nom, Prénom, Âge, Date_arrivée, Date_départ, Operation)
    VALUES (NEW.ID_Employé, NEW.Nom, NEW.Prénom, NEW.Âge, NEW.Date_arrivée, NEW.Date_départ, 'INSERT');
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Fonction pour l'audit de la mise à jour dans RH_Usine_Mère
CREATE OR REPLACE FUNCTION audit_update_rh_um()
RETURNS TRIGGER AS $$
BEGIN
    INSERT INTO Audit_Employés (ID_Employé, Nom, Prénom, Âge, Date_arrivée, Date_départ, Operation)
    VALUES (NEW.ID_Employé, NEW.Nom, NEW.Prénom, NEW.Âge, NEW.Date_arrivée, NEW.Date_départ, 'UPDATE');
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Fonction pour l'audit de la suppression dans RH_Usine_Mère
CREATE OR REPLACE FUNCTION audit_delete_rh_um()
RETURNS TRIGGER AS $$
BEGIN
    INSERT INTO Audit_Employés (ID_Employé, Nom, Prénom, Âge, Date_arrivée, Date_départ, Operation)
    VALUES (OLD.ID_Employé, OLD.Nom, OLD.Prénom, OLD.Âge, OLD.Date_arrivée, OLD.Date_départ, 'DELETE');
    RETURN OLD;
END;
$$ LANGUAGE plpgsql;

-- Fonction pour prévenir la suppression si associée à des stocks
CREATE OR REPLACE FUNCTION prevent_delete_rh_um()
RETURNS TRIGGER AS $$
BEGIN
    IF EXISTS (SELECT 1 FROM Stock_Usine_Mère WHERE ID_Employé = OLD.ID_Employé) THEN
        RAISE EXCEPTION 'Cannot delete employee % because they are associated with stock records', OLD.ID_Employé;
    END IF;
    RETURN OLD;
END;
$$ LANGUAGE plpgsql;

-- Trigger pour l'audit de l'insertion dans RH_Usine_Mère
CREATE TRIGGER trg_audit_insert_rh_um
AFTER INSERT ON RH_Usine_Mère
FOR EACH ROW
EXECUTE FUNCTION audit_insert_rh_um();

-- Trigger pour l'audit de la mise à jour dans RH_Usine_Mère
CREATE TRIGGER trg_audit_update_rh_um
AFTER UPDATE ON RH_Usine_Mère
FOR EACH ROW
EXECUTE FUNCTION audit_update_rh_um();

-- Trigger pour l'audit de la suppression dans RH_Usine_Mère
CREATE TRIGGER trg_audit_delete_rh_um
AFTER DELETE ON RH_Usine_Mère
FOR EACH ROW
EXECUTE FUNCTION audit_delete_rh_um();

-- Trigger pour prévenir la suppression si associée à des stocks
CREATE TRIGGER trg_prevent_delete_rh_um
BEFORE DELETE ON RH_Usine_Mère
FOR EACH ROW
EXECUTE FUNCTION prevent_delete_rh_um();