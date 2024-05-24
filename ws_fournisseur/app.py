from flask import Flask, render_template, request, redirect, url_for
from sqlalchemy import create_engine
from sqlalchemy.orm import sessionmaker
from models import Fournisseur, Livraisons

app = Flask(__name__)
# Update with your actual database credentials
engine = create_engine('postgresql://myuser:mypassword@localhost/humanbot_db')
Session = sessionmaker(bind=engine)
session = Session()

@app.route('/fournisseurs')
def fournisseurs():
    fournisseurs = session.query(Fournisseur).all()
    return render_template('fournisseurs.html', fournisseurs=fournisseurs)

@app.route('/livraisons')
def livraisons():
    livraisons = session.query(Livraisons).all()
    return render_template('livraisons.html', livraisons=livraisons)

if __name__ == '__main__':
    app.run(debug=True)
