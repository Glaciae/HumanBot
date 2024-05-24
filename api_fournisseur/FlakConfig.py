from flask import Flask
from models import db

app = Flask(_name_)
app.config['SQLALCHEMY_DATABASE_URI'] = 'postgresql://http://localhost:5000/api/stock'
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False
db.init_app(app)
