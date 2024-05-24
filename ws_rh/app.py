from flask import Flask, render_template
from sqlalchemy import create_engine
from sqlalchemy.orm import sessionmaker
from models import RH_Usine_Mère, RH_Usine_Rachetée

app = Flask(__name__)
engine = create_engine('postgresql://user:password@localhost/humanbot')
Session = sessionmaker(bind=engine)
session = Session()

@app.route('/employees')
def employees():
    employees_mere = session.query(RH_Usine_Mère).all()
    employees_rachetee = session.query(RH_Usine_Rachetée).all()
    employees = employees_mere + employees_rachetee
    return render_template('employees.html', employees=employees)

if __name__ == '__main__':
    app.run(debug=True)
