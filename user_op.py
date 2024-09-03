from flask import render_template,redirect,request,session
import mysql.connector
from datetime import datetime

def userHome():
    con=mysql.connector.connect(host="localhost",username="root",database="projecttourismDB")
    cursor=con.cursor()
    sql='select * from Destinations'
    cursor.execute(sql)
    desti=cursor.fetchall()
    sql='select * from Packages'
    cursor.execute(sql)
    packs=cursor.fetchall()
    return render_template("user/userHome.html",desti=desti,packs=packs)

def about():
    con=mysql.connector.connect(host="localhost",username="root",database="projecttourismDB")
    cursor=con.cursor()
    sql='select * from Destinations'
    cursor.execute(sql)
    desti=cursor.fetchall()
    return render_template("user/about.html",desti=desti)

def ShowDestination(did):
    con=mysql.connector.connect(host="localhost",username="root",database="projecttourismDB")
    cursor=con.cursor()
    if request.method=="GET":
        sql='select * from Destinations'
        cursor.execute(sql)
        desti=cursor.fetchall()

        sql='select * from Packages where did=%s'
        val=(did,)
        cursor.execute(sql,val)
        packs=cursor.fetchall() 

        sql = 'SELECT name from Destinations WHERE did=%s'
        val=(did,)
        cursor.execute(sql,val)
        dname = cursor.fetchone()[0]
    return render_template("user/userHome.html",desti=desti,packs=packs,dname=dname)
    

def ViewDetails(packid):
    con=mysql.connector.connect(host="localhost",username="root",database="projecttourismDB")
    cursor=con.cursor()
    if request.method=="GET":
        sql='select * from Destinations'
        cursor.execute(sql)
        dest=cursor.fetchall()

        sql='select * from Packages where pid=%s'
        val=(packid,)
        cursor.execute(sql,val)
        pack=cursor.fetchone()
        return render_template("/user/ViewDetails.html",dest=dest,pack=pack)
    
    else:
        if "uname" in session:
            uname=session["uname"]
            pack_id=request.form["pid"]
            no_of_person=request.form["no_of_person"]
            sql='insert into mycart (pack_id,no_of_person,status,username) values(%s,%s,%s,%s)'
            val=(pack_id,no_of_person,'waiting',uname)
            cursor.execute(sql,val)
            con.commit()
            return redirect("/ShowCart")
        else:
            return redirect("/login")
    
def register():
    if request.method=="GET":
        con=mysql.connector.connect(host="localhost",username="root",database="projecttourismDB")
        cursor=con.cursor()
        sql='select * from Destinations'
        cursor.execute(sql)
        desti=cursor.fetchall()
        return render_template("user/register.html",desti=desti)
    else:
        uname=request.form["uname"]
        pwd=request.form["pwd"]
        email=request.form["email"]
        sql='insert into userinfo values(%s,%s,%s)'
        val=(uname,pwd,email)
        try:
            cursor.execute(sql,val)
            con.commit()
            return redirect("/")
        except:
            return redirect("/register")
        
def login():
    con=mysql.connector.connect(host="localhost",username="root",database="projecttourismDB")
    cursor=con.cursor()
    if request.method=="GET":
        sql='select * from Destinations'
        cursor.execute(sql)
        desti=cursor.fetchall()
        return render_template("user/login.html",desti=desti)
    else:
        uname=request.form["uname"]
        pwd=request.form["pwd"]
        sql='select count(*) from userinfo where username=%s and password=%s'
        val=(uname,pwd)
        cursor.execute(sql,val)
        count=int(cursor.fetchone()[0])
        if count== 1:
            session["uname"]=uname
            return redirect("/")
        else:
            return redirect("/login")

def logout():
    session.clear()
    return redirect("/login")

def ShowCart():
    con=mysql.connector.connect(host="localhost",username="root",database="projecttourismDB")
    cursor=con.cursor()
    if request.method=="GET":
        sql='select * from Destinations'
        cursor.execute(sql)
        desti=cursor.fetchall()
        if "uname" in session:
            sql="select * from pack_cart_vw where username=%s"
            val=(session["uname"],)
            cursor.execute(sql,val)
            orders=cursor.fetchall()

            sql='select sum(total_amount) from pack_cart_vw where username=%s'
            cursor.execute(sql,val)
            total=cursor.fetchone()[0]
            session["total"]=total
            return render_template("user//ShowCart.html",orders=orders,total=total,desti=desti)
        else:
            return redirect("/login")
    else:
        action = request.form["action"]
        cart_id=request.form["cart_id"]
        if action== "edit":
            pno=request.form["pno"]
            sql='update mycart set no_of_person=%s where cart_id=%s'
            val=(pno,cart_id)
            cursor.execute(sql,val)
            con.commit()
        else:
            sql='delete from mycart where cart_id=%s'
            val=(cart_id,)
            cursor.execute(sql,val)
            con.commit()
        return redirect("/ShowCart")
    
def MakePayment():
    if request.method=="GET":
        return render_template("user/MakePayment.html")
    else:
        card_no=request.form["card_no"]
        cvv=request.form["cvv"]
        expiry=request.form["expiry"]
        con=mysql.connector.connect(host="localhost",username="root",database="projecttourismDB")
        cursor=con.cursor()
        sql='select count(*) from payment where cardno=%s and cvv=%s and expiry=%s'
        val=(card_no,cvv,expiry)
        cursor.execute(sql,val)
        count=int(cursor.fetchone()[0])
        if count==1:
            sql1='update payment set balance=balance+%s where cardno=%s'
            val1=(session['total'],'111')
            sql2='update payment set balance=balance-%s where cardno=%s'
            val2=(session['total'],card_no)
            cursor.execute(sql1,val1)
            cursor.execute(sql2,val2)

            # update mycart status from waiting to confirmed
            # sql="update mycart set status='confirmed' where username=%s"
            # val=(session['uname'],)
            # cursor.execute(sql,val)
            # con.commit()
            # return redirect("/")

            sql='insert into order_master (date_of_order,amount,username) values (%s,%s,%s)'
            val=(datetime.now(),session["total"],session["uname"])
            cursor.execute(sql,val)
            cursor.fetchall()
            con.commit()

            dd=datetime.today().strftime("%Y-%m-%d")
            sql='select order_id from order_master where date_of_order=%s and amount=%s and username=%s'
            val=(dd,session['total'],session['uname'])
            print(val)
            cursor.execute(sql,val)
            oid=cursor.fetchone()[0]
            sql="update mycart set status='confirmed',order_id=%s where status='waiting' and username=%s"
            val=(oid,session['uname'])
            cursor.execute(sql,val)
            con.commit()
            return redirect("/")
            
        else:
            return redirect("/MakePayment")
        
def ShowOrder():
    con=mysql.connector.connect(host="localhost",username="root",database="projecttourismDB")
    cursor=con.cursor()
    sql='select * from order_vw where username=%s'
    val=(session['uname'],)
    cursor.execute(sql,val)
    order_details=cursor.fetchall()

    sql='select * from order_master where username=%s'
    val=(session['uname'],)
    cursor.execute(sql,val)
    order=cursor.fetchall()

    sql='select * from Destinations'
    cursor.execute(sql)
    desti=cursor.fetchall()
    return render_template("user/ShowOrder.html",order=order,order_details=order_details,desti=desti)