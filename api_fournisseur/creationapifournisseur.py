from flask import jsonify

@app.route('/api/stock')
def get_stock():
    stocks = StockAcquired.query.all()
    stock_list = [{'factory_id': stock.id, 'current_stock': stock.quantity_parts} for stock in stocks]
    return jsonify(stock_list)
