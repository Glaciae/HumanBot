from sqlalchemy import Column, Integer, String, Date, Boolean
from sqlalchemy.ext.declarative import declarative_base

Base = declarative_base()

class RH_Usine_Mère(Base):
    __tablename__ = 'RH_Usine_Mère'
    ID_Employé = Column(Integer, primary_key=True)
    Prénom = Column(String, nullable=False)
    Nom = Column(String, nullable=False)
    Age = Column(Integer)
    Date_arrivée = Column(Date, nullable=False)
    Date_départ = Column(Date)
    Présence = Column(Boolean)

class RH_Usine_Rachetée(Base):
    __tablename__ = 'RH_Usine_Rachetée'
    ID_Employé = Column(Integer, primary_key=True)
    Prénom = Column(String, nullable=False)
    Nom = Column(String, nullable=False)
    Jour_démarrage = Column(Date, nullable=False)
    Présence = Column(Boolean)
