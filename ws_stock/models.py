from sqlalchemy import Column, Integer, Date
from sqlalchemy.ext.declarative import declarative_base

Base = declarative_base()

class Stock_Usine_Mère(Base):
    __tablename__ = 'Stock_Usine_Mère'
    ID_Stock = Column(Integer, primary_key=True)
    Date = Column(Date, nullable=False)
    Quantité_restante = Column(Integer)

class Stock_Usine_Rachetée(Base):
    __tablename__ = 'Stock_Usine_Rachetée'
    ID_Stock = Column(Integer, primary_key=True)
    Date = Column(Date, nullable=False)
    Quantité_restante = Column(Integer)
