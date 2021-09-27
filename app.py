import mysql.connector

from flask import *
app = Flask(__name__)

@app.route('/')
@app.route('/viewStates')
def addstate_html():
    con = mysql.connector.connect(host='localhost',database='farm2home' ,user='root',password='')
    cur = con.cursor()
    cur.execute('select id,name from state where delflag=0')
    states_db = cur.fetchall()
    return render_template('viewstates.html',states=states_db)   
   
@app.route('/addState', methods=['GET','POST'])
def add_state():
    state_name = request.form['state_name']
    con = mysql.connector.connect(host='localhost',database='farm2home' ,user='root',password='')
    cur = con.cursor()
    cur.execute("insert into state(name) values('" + state_name + "')")
    con.commit()
    return addstate_html()
    #return redirect(url_for('http://localhost:5000/viewStates'))
 
@app.route('/viewCities')
def viewcities_html():
    con = mysql.connector.connect(host='localhost',database='farm2home' ,user='root',password='')
    cur = con.cursor()
    cur.execute('select name from city where delflag=0')
    cities_db = cur.fetchall()
    return render_template('viewcities.html',cities=cities_db)   
 
@app.route('/addcity')
def addcity_html():
    con = mysql.connector.connect(host='localhost',database='farm2home' ,user='root',password='')
    cur = con.cursor()
    cur.execute('select id,name from state')
    states_db = cur.fetchall()
    return render_template('addcity.html',states=states_db)   
   
@app.route('/addCity', methods=['GET','POST'])
def add_city():
    city_name = request.form['city_name']
    state_id = request.form['state_id']
    con = mysql.connector.connect(host='localhost',database='farm2home' ,user='root',password='')
    cur = con.cursor()
    cur.execute("insert into city(name,state_id) values('" + city_name + "'," + state_id + ")")
    con.commit()
    return'<h1>record inserted successfully..'    
 
@app.route('/viewproducts')
def hello_world():
    return render_template('view_product.html')

@app.route('/viewproducts')
def view_products():
    con = mysql.connector.connect(host='localhost',database='farm2home' ,user='root',password='')
    cur = con.cursor()
    cur.execute('select * from products')
    products_db = cur.fetchall()
   # return'<h1>'+str(products_db)
    return render_template('viewproducts.html',products=products_db)

@app.route('/addcat')
def addcat_html():
    return render_template('addcategory.html')

@app.route('/addCategory', methods=['GET','POST'])
def add_category():
    cat_name = request.form['cat_name']
    cat_description = request.form['cat_desc']
    con = mysql.connector.connect(host='localhost',database='farm2home' ,user='root',password='')
    cur = con.cursor()
    cur.execute("insert into category(name,description) values('" + cat_name + "','" + cat_description + "')")
    con.commit()
    return'<h1>record inserted successfully..'
 

@app.route('/addproduct')
def addproduct_html():
    con = mysql.connector.connect(host='localhost',database='farm2home' ,user='root',password='')
    cur = con.cursor()
    cur.execute('select id from category')
    categories_db = cur.fetchall()
    return render_template('addproduct.html')

@app.route('/addproduct', methods=['GET','POST'])
def add_product():
    product_name= request.form['product_name']
    con = mysql.connector.connect(host='localhost',database='farm2home' ,user='root',password='')
    cur = con.cursor()
    cur.execute("insert into product(name) values('" + product + "')")
    con.commit()
    return'<h1>record inserted successfully..'







 


 
   
@app.route('/addarea')
def addarea_html():
    return render_template('addarea.html') 
   
@app.route('/addArea', methods=['GET','POST'])
def add_area():
    area_name = request.form['area_name']
    con = mysql.connector.connect(host='localhost',database='farm2home' ,user='root',password='')
    cur = con.cursor()
    cur.execute("insert into area(name) values('" + area_name + "')")
    con.commit()
    return'<h1>record inserted successfully..'   
        
    

    

if __name__ == '__main__':
    app.run()