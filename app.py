from flask import Flask, render_template, jsonify
from config import Config
from models import db, EmployeSocieteMere, EmployeUsineRachetee, LivraisonSocieteMere, LivraisonUsineRachetee, StockUsineRachetee

app = Flask(__name__)
app.config.from_object(Config)
db.init_app(app)

@app.route('/employees')
def employees_page():
    employees_societe_mere = EmployeSocieteMere.query.all()
    employees_usine_rachetee = EmployeUsineRachetee.query.all()
    return render_template('employees.html', employees_societe_mere=employees_societe_mere, employees_usine_rachetee=employees_usine_rachetee)

@app.route('/deliveries')
def deliveries_page():
    deliveries_societe_mere = LivraisonSocieteMere.query.filter(LivraisonSocieteMere.date_livraison >= datetime.date.today() - datetime.timedelta(days=10)).all()
    deliveries_usine_rachetee = LivraisonUsineRachetee.query.filter(LivraisonUsineRachetee.date_livraison >= datetime.date.today() - datetime.timedelta(days=10)).all()
    return render_template('deliveries.html', deliveries_societe_mere=deliveries_societe_mere, deliveries_usine_rachetee=deliveries_usine_rachetee)

@app.route('/api/stock')
def stock_api():
    stock = StockUsineRachetee.query.all()
    return jsonify([{'date_utilisation': s.date_utilisation.isoformat(), 'quantite_pieces': s.quantite_pieces} for s in stock])

@app.route('/stock')
def stock_page():
    stock = StockUsineRachetee.query.all()
    return render_template('stock.html', stock=stock)

if __name__ == '__main__':
    app.run(debug=True)
