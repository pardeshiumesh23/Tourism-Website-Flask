from flask import render_template,redirect,request
import mysql.connector
from werkzeug.utils import secure_filename

def showAllDestinations():
    con=mysql.connector.connect(host="localhost",username="root",database="projecttourismDB")
    cursor=con.cursor()
    sql='select * from Destinations'
    cursor.execute(sql)
    desti=cursor.fetchall()
    return render_template("Admin/Destination/showAllDestinations.html",desti=desti)

def addDestination():
    if request.method=="GET":
        return render_template("Admin/Destination/addDestination.html")
    else:
        name=request.form["name"]
        location=request.form["location"]
        description=request.form["description"]
        f=request.files["image_url"]
        filename=secure_filename(f.filename)
        filename="static/Images/"+f.filename #This will save your file to the spicfic location
        f.save(filename)
        filename="Images/"+f.filename   
        con=mysql.connector.connect(host="localhost",username="root",database="projecttourismDB")
        cursor=con.cursor()
        sql='insert into Destinations (name,description,location,image_url) values(%s,%s,%s,%s)'
        val=(name,description,location,filename)
        cursor.execute(sql,val)
        con.commit()
        return redirect("/showAllDestinations")
    
def editDestination(did):
    con=mysql.connector.connect(host="localhost",username="root",database="projecttourismDB")
    cursor=con.cursor()
    if request.method=="GET":
        sql='select * from Destinations where did=%s'
        val=(did,)
        cursor.execute(sql,val)
        dest=cursor.fetchone()
        return render_template("Admin/Destination/editDestination.html",dest=dest)
    else: 
        name=request.form["name"]
        location=request.form["location"]
        description=request.form["description"]
        f=request.files["image_url"]
        filename=secure_filename(f.filename)
        filename="static/Images/"+f.filename
        f.save(filename)
        filename="Images/"+f.filename
        sql='update Destinations set name=%s,location=%s,description=%s,image_url=%s where did=%s' 
        val=(name,location,description,filename,did)
        cursor.execute(sql,val)
        con.commit()
        return redirect("/showAllDestinations")
    
def deleteDestination(did):
    if request.method=="GET":
        return render_template("Admin/Destination/deleteDestination.html")
    else:
        action=request.form["action"]
        if action=="Yes":
            con=mysql.connector.connect(host="localhost",username="root",database="projecttourismDB")
            cursor=con.cursor()
            sql='delete from Destinations where did=%s'
            val=(did,)
            cursor.execute(sql,val)
            con.commit()
        return redirect("/showAllDestinations")
    
def showAllPackages():
    con=mysql.connector.connect(host="localhost",username="root",database="projecttourismDB")
    cursor=con.cursor()
    sql='select * from Packages'
    cursor.execute(sql)
    package=cursor.fetchall()
    return render_template("Admin/Packages/showAllPackages.html",package=package)

    
def addPackage():
    if request.method=="GET":
        return render_template("Admin/Packages/addPackage.html")
    else:
        id=request.form["id"]
        name=request.form["name"]
        did=request.form["did"]
        price=request.form["price"]
        duration=request.form["duration"]
        details=request.form["details"]
        f=request.files["image_url"]
        filename=secure_filename(f.filename)
        filename="static/Images/"+f.filename #This will save your file to the spicfic location
        f.save(filename)
        filename="Images/"+f.filename 
        con=mysql.connector.connect(host="localhost",username="root",database="projecttourismDB")
        cursor=con.cursor()
        sql='insert into Packages (pid,pack_name,did,price,duration,details,image_url)values(%s,%s,%s,%s,%s,%s,%s)'
        val=(id,name,did,price,duration,details,filename)
        cursor.execute(sql,val)
        con.commit()
        return redirect ("/showAllPackages")
    
def editPackage(pid):
    con=mysql.connector.connect(host="localhost",username="root",database="projecttourismDB")
    cursor=con.cursor()    
    if request.method=="GET":
        sql="select * from Packages where pid=%s"
        val=(pid,)
        cursor.execute(sql,val)
        pack=cursor.fetchone()
        return render_template("Admin/Packages/editPackage.html",pack=pack)
    
    else:
        name=request.form["name"]
        did=request.form["did"]
        price=request.form["price"] 
        duration=request.form["duration"]
        details=request.form["details"]
        f=request.files["image_url"]
        filename=secure_filename(f.filename)
        filename="static/Images/"+f.filename #This will save your file to the spicfic location
        f.save(filename)
        filename="Images/"+f.filename
        sql='update Packages set pack_name=%s,did=%s,price=%s,duration=%s,details=%s,image_url=%s where pid=%s'
        val=(name,did,price,duration,details,pid,filename)
        cursor.execute(sql,val)
        con.commit()
        return redirect("/showAllPackages")
    
def deletePackage(pid):
    if request.method=="GET":
        return render_template("Admin/Packages/deletePackage.html")
    else:
        action=request.form["action"]
        if action=="Yes":
            con=mysql.connector.connect(host="localhost",username="root",database="projecttourismDB")
            cursor=con.cursor()
            sql="delete from Packages where pid=%s"
            val=(pid,)
            cursor.execute(sql,val)
            con.commit()
        return redirect("/showAllPackages")