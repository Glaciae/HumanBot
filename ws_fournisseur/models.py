from sqlalchemy import Column, Integer, String, Date
from sqlalchemy.ext.declarative import declarative_base

Base = declarative_base()

class Fournisseur(Base):
    __tablename__ = 'Fournisseurs'
    ID_Fournisseur = Column(Integer, primary_key=True)
    Nom_Fournisseur = Column(String, nullable=False)

class Livraisons(Base):
    __tablename__ = 'Livraisons'
    ID_Livraison = Column(Integer, primary_key=True)
    ID_Fournisseur = Column(Integer)
    Date_Livraison = Column(Date, nullable=False)
    Quantité = Column(Integer, nullable=False)
    ID_Employé = Column(Integer)
