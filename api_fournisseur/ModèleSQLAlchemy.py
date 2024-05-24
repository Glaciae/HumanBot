from flask import Flask, request, jsonify
import psycopg2

app = Flask(_name_)

def get_db_connection():
    conn = psycopg2.connect(
        dbname='your_db_name',
        user='your_db_user',
        password='your_db_password',
        host='your_db_host'
    )
    return conn

@app.route('/livraisons', methods=['GET'])
def get_livraisons():
    conn = get_db_connection()
    cursor = conn.cursor()
    cursor.execute('SELECT * FROM Livraisons;')
    livraisons = cursor.fetchall()
    cursor.close()
    conn.close()
    return jsonify(livraisons)

@app.route('/livraison', methods=['POST'])
def add_livraison():
    new_livraison = request.get_json()
    conn = get_db_connection()
    cursor = conn.cursor()
    cursor.execute(
        'INSERT INTO Livraisons (ID_fournisseur, Date_livraison, Quantité_pieces, ID_ouvrier) VALUES (%s, %s, %s, %s)',
        (new_livraison['ID_fournisseur'], new_livraison['Date_livraison'], new_livraison['Quantité_pieces'], new_livraison['ID_ouvrier'])
    )
    conn.commit()
    cursor.close()
    conn.close()
    return jsonify({'message': 'Livraison added!'}), 201

@app.route('/livraison/<int:id>', methods=['PUT'])
def update_livraison(id):
    updated_livraison = request.get_json()
    conn = get_db_connection()
    cursor = conn.cursor()
    cursor.execute(
        'UPDATE Livraisons SET ID_fournisseur = %s, Date_livraison = %s, Quantité_pieces = %s, ID_ouvrier = %s WHERE ID_Livraison = %s',
        (updated_livraison['ID_fournisseur'], updated_livraison['Date_livraison'], updated_livraison['Quantité_pieces'], updated_livraison['ID_ouvrier'], id)
    )
    conn.commit()
    cursor.close()
    conn.close()
    return jsonify({'message': 'Livraison updated!'})

@app.route('/livraison/<int:id>', methods=['DELETE'])
def delete_livraison(id):
    conn = get_db_connection()
    cursor = conn.cursor()
    cursor.execute('DELETE FROM Livraisons WHERE ID_Livraison = %s', (id,))
    conn.commit()
    cursor.close()
    conn.close()
    return jsonify({'message': 'Livraison deleted!'})

if _name_ == '_main_':
    app.run(debug=True)