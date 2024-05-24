-- Vue ALL_WORKERS
CREATE VIEW ALL_WORKERS AS
SELECT 
    Nom AS lastname, 
    Prénom AS firstname, 
    Âge AS age, 
    Date_arrivée AS start_date 
FROM RH_Usine_Mère
WHERE Date_départ IS NULL
UNION
SELECT 
    Nom AS lastname, 
    Prénom AS firstname, 
    EXTRACT(YEAR FROM AGE(Jour_démarrage)) AS age, 
    Jour_démarrage AS start_date 
FROM RH_Usine_Rachetée
WHERE Présence = TRUE
ORDER BY start_date DESC;

-- Vue ALL_WORKERS_ELAPSED
CREATE VIEW ALL_WORKERS_ELAPSED AS
SELECT 
    lastname, 
    firstname, 
    age, 
    start_date, 
    CURRENT_DATE - start_date AS days_elapsed
FROM ALL_WORKERS;

-- Vue BEST_SUPPLIERS
CREATE VIEW BEST_SUPPLIERS AS
SELECT 
    f.Nom AS supplier_name, 
    SUM(l.Quantité_pieces) AS total_pieces
FROM Livraisons l
JOIN Fournisseurs f ON l.ID_fournisseur = f.ID_Fournisseur
GROUP BY f.Nom
HAVING SUM(l.Quantité_pieces) > 1000
ORDER BY total_pieces DESC;

-- Vue ROBOTS_FACTORIES
CREATE VIEW ROBOTS_FACTORIES AS
SELECT 
    um.Date AS date_produced, 
    um.Quantité_robots AS robot_quantity, 
    'Usine Mère' AS factory_name
FROM Stock_Usine_Mère um
UNION
SELECT 
    ur.Date AS date_produced, 
    ur.Quantité_pieces AS robot_quantity, 
    'Usine Rachetée' AS factory_name
FROM Stock_Usine_Rachetée ur;
