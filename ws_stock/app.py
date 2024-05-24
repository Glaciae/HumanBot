from flask import Flask, render_template
from sqlalchemy import create_engine
from sqlalchemy.orm import sessionmaker
from models import Stock_Usine_Mère, Stock_Usine_Rachetée

app = Flask(__name__)
engine = create_engine('postgresql://user:password@localhost/humanbot')
Session = sessionmaker(bind=engine)
session = Session()

@app.route('/stocks')
def stocks():
    stocks_mere = session.query(Stock_Usine_Mère).all()
    stocks_rachetee = session.query(Stock_Usine_Rachetée).all()
    stocks = stocks_mere + stocks_rachetee
    return render_template('stocks.html', stocks=stocks)

if __name__ == '__main__':
    app.run(debug=True)
