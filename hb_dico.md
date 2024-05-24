# Dictionnaire de Données

Ce dictionnaire de données regroupe toutes les données que l’on exploitera tout le long du projet. Donc aucune catégorisation n’est faite mais toutes les précisions s’y retrouvent.

## Usine Rachetée (UR) et Usine Mère (UM)

### Employés

| Code                   | Nature       | Description                           | Contraintes          |
|------------------------|--------------|---------------------------------------|----------------------|
| **ID_Employé**         | INTEGER      | Identifiant unique de l'employé       | Primary Key, Auto increment |
| **Nom_Employé**        | VARCHAR(50)  | Nom de l'employé                      | NOT NULL             |
| **Prénom_Employé**     | VARCHAR(50)  | Prénom de l'employé                   | NOT NULL             |
| **age_Employé**        | INTEGER      | Âge de l'employé                      | NOT NULL             |
| **Date_arrivée_Employé** | DATE       | Date d'arrivée dans l'usine           | NULLABLE             |
| **Date_départ_Employé** | DATE        | Date de départ de l'employé           | NOT NULL             |
| **Présence**           | BOOLEAN      | Présence dans les effectifs           | BOOLEAN              |

### Stock Usine Rachetée (UR)

| Code                   | Nature       | Description                           | Contraintes          |
|------------------------|--------------|---------------------------------------|----------------------|
| **ID_Stock_UR**        | INTEGER      | Identifiant unique du relevé de stock usine rachetée | NOT NULL, Auto increment |
| **Date_stock_UR**      | DATE         | Date du relevé de stock usine rachetée |                      |
| **Quantité_pieces**    | INTEGER      | Quantité de pièces détachées utilisées ce jour-là | NULLABLE             |

### Livraison

| Code                   | Nature       | Description                           | Contraintes          |
|------------------------|--------------|---------------------------------------|----------------------|
| **ID_Livraison**       | INTEGER      | Identifiant unique de la livraison    | Primary Key, Auto increment |
| **ID_fournisseur**     | INTEGER      | Identifiant unique du fournisseur     | Primary Key, Auto increment |
| **Date_livraison**     | DATE         | Date de la livraison                  |                      |

### Usine

| Code                   | Nature       | Description                           | Contraintes          |
|------------------------|--------------|---------------------------------------|----------------------|
| **Nom_Usine**          | VARCHAR(100) | Nom de l’usine                        | NOT NULL             |

### Stock Usine Mère (UM)

| Code                   | Nature       | Description                           | Contraintes          |
|------------------------|--------------|---------------------------------------|----------------------|
| **ID_Stock_UM**        | INTEGER      | Identifiant unique du relevé de stock usine Mère | Primary Key           |
| **Date_stock_UM**      | DATE         | Date du relevé de stock usine mère    |                      |
| **Quantité_robots**    | INTEGER      | Quantité de robots                    | NULLABLE             |
