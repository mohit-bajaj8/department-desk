
from flask import Flask, render_template,render_template_string,request,session,url_for,redirect,send_from_directory
from flask_mysqldb import MySQL
import os
from werkzeug.security import generate_password_hash, check_password_hash
from datetime import datetime
app=Flask(__name__)
app.config['MYSQL_HOST']='localhost'
app.config['MYSQL_PORT']=3306
app.config['MYSQL_USER']='root'
app.config['MYSQL_PASSWORD']=''
app.config['MYSQL_DB']='dms_db'
app.secret_key='MOHIT'
mysql = MySQL(app)

# useful functions
def err_occ():
    return render_template_string("""
                                    <script>
                                        alert('Error Occured');
                                        window.location.href = history.back(); 
                                    </script>
                                """)
def upload_succes():
    return render_template_string("""
                                        <script>
                                            alert('File Uploaded');
                                            window.location.href = history.back(); 
                                        </script>
                                    """)

def invalid_cred():
    return render_template_string("""
                                                    <script>
                                                        alert('invalid credentials');
                                                        window.location.href = '/login'; 
                                                    </script>
                                                """)



@app.route('/')
def index():
    cur = mysql.connection.cursor()
    cur.execute("select * from timetable order by id desc limit 1;")
    mysql.connection.commit()
    t=list(cur.fetchall())
    cur.close()
    return render_template("index.html",tt=t)
@app.route('/contactus')
def contactus():
    return render_template("contactus.html")

@app.route('/course')
def course():
    return render_template("course.html")

@app.route('/annoucment')
def annoucment():
    try:
        cur = mysql.connection.cursor()
        cur.execute("USE dms_db;")
        cur.execute("select * from annoucment order by id desc;")
        mysql.connection.commit()
        stu = cur.fetchall()
        stu = list(stu)
        cur.close()
        return render_template("annoucment.html", stu=stu)
    except:
        mysql.connection.rollback()
        return err_occ()
@app.route('/contactform',methods=['POST'])
def contactform():
    if request.method == 'POST':
        name=request.form['name']
        email = request.form['email']
        message = request.form['message']
        try:
            cur = mysql.connection.cursor()
            cur.execute("USE dms_db;")
            cur.execute("INSERT INTO contactus (name, email, message) VALUES (%s, %s, %s)", (name, email, message))
            mysql.connection.commit()
            cur.close()
            return render_template_string("""
                <script>
                    alert('Message Sent');
                    window.location.href = '/contactus'; 
                </script>
            """)
        except:
            mysql.connection.rollback()
            return err_occ()
    else:
        render_template("/contactus")
@app.route('/studymaterial')
def studymaterial():
    try:
        cur = mysql.connection.cursor()
        cur.execute("USE dms_db;")
        cur.execute("select * from studymat order by id desc;")
        mysql.connection.commit()
        stu = cur.fetchall()
        stu = list(stu)
        cur.close()
        return render_template("studymaterial.html", stu=stu)
    except:
        return err_occ()
@app.route('/login')
def login():
    return render_template("login.html")
@app.route('/login_req',methods=['POST'])
def login_req():
    if request.method =='POST':
        log=request.form['username']
        pas=request.form['password']
        user=request.form['user']
        try:
            if user == 'Admin':
                cur = mysql.connection.cursor()
                cur.execute("USE dms_db;")
                cur.execute("SELECT * FROM admin WHERE login = %s;", (log,))
                result = cur.fetchone()
                mysql.connection.commit()
                # use login:130 and password: moh
                if result and check_password_hash(result[1], pas):
                    session['username'] = result
                    cur.close()
                    return redirect(url_for('Admin_das'))
                else:
                    cur.close()
                    return invalid_cred()
            elif user == 'Teacher':
                cur = mysql.connection.cursor()
                cur.execute("USE dms_db;")
                cur.execute("SELECT * FROM teacher WHERE staff_id = %s;", (log,))
                result = cur.fetchone()
                mysql.connection.commit()
                if result and check_password_hash(result[1], pas):
                    session['username'] = result
                    cur.close()
                    return redirect(url_for('Tech_das'))
                else:
                    cur.close()
                    return invalid_cred()
            elif user == 'Student':
                cur = mysql.connection.cursor()
                cur.execute("USE dms_db;")
                cur.execute("SELECT * FROM student WHERE roll_no = %s;", (log,))
                result = cur.fetchone()
                mysql.connection.commit()
                if result and check_password_hash(result[1], pas):
                    session['username'] = result
                    cur.close()
                    return redirect(url_for('Stu_das'))
                else:
                    cur.close()
                    return invalid_cred()
            else:
                return invalid_cred()
        except Exception as e:
            mysql.connection.rollback()
            return err_occ()
    else:
        return err_occ()
@app.route("/logout")
def logout():
    if 'username' in session:
        session.pop('username',None)
        return redirect(url_for('login'))
    else:
        return redirect(url_for('login'))
@app.route("/Tech_das")
def Tech_das():
    try:
        if 'username' in session:
            details = session['username']
            details = list(details)
            details[5] = datetime.strptime(details[5], "%a, %d %b %Y %H:%M:%S %Z")
            details[5] = details[5].date()
            details[7] = datetime.strptime(details[7], "%a, %d %b %Y %H:%M:%S %Z")
            details[7] = details[7].date()
            return render_template("Tech_das.html", details=details)
        else:
            return redirect(url_for('login'))
    except:
        return err_occ()
@app.route("/Stu_das")
def Stu_das():
    try:
        if 'username' in session:
            details = session['username']
            details = list(details)
            details[5] = datetime.strptime(details[5], "%a, %d %b %Y %H:%M:%S %Z")
            details[5] = details[5].date()
            return render_template("Stu_das.html", details=details)
        else:
            return redirect(url_for('login'))
    except:
        return err_occ()
@app.route('/studentmsg',methods=['POST'])
def studentmsg():
    if request.method == 'POST':
        subject = request.form['subject']
        message = request.form['message']
        details = session['username']
        details = list(details)
        roll_no = details[0]
        try:
            cur = mysql.connection.cursor()
            cur.execute("USE dms_db;")
            cur.execute("INSERT INTO student_messages (roll_no, subject, message) VALUES (%s, %s, %s)", (roll_no,subject,message))
            mysql.connection.commit()
            cur.close()
            return render_template_string("""
                <script>
                    alert('Message Sent');
                    window.location.href = history.back();
                </script>
            """)
        except:
            mysql.connection.rollback()
            return err_occ()
    else:
        render_template("/contactus")
@app.route("/Admin_das")
def Admin_das():
    if 'username' in session:
        cur = mysql.connection.cursor()
        cur.execute("USE dms_db;")
        cur.execute("select * from student_messages order by id desc;")
        mysql.connection.commit()
        msg = cur.fetchall()
        msg = list(msg)
        cur.execute("select * from contactus order by id desc;")
        mysql.connection.commit()
        contact_msg = cur.fetchall()
        contact_msg = list(contact_msg)
        cur.execute("select * from student order by roll_no;")
        mysql.connection.commit()
        stu = cur.fetchall()
        stu = list(stu)
        cur.execute("select * from teacher order by staff_id;")
        mysql.connection.commit()
        teach = cur.fetchall()
        teach= list(teach)
        cur.close()

        return render_template("Admin_das.html",msg=msg,stu=stu,teach=teach,contact_msg=contact_msg)
    else :
        return redirect(url_for('login'))
@app.route("/techreg",methods=['POST'])
def techreg():
    try:
        if request.method == 'POST':
            staff_id = request.form['staff_id']
            passw = request.form['pass']
            hashed_pass = generate_password_hash(passw)
            name = request.form['name']
            email = request.form['email']
            mobile_no = request.form['mobile_no']
            dob = request.form['dob']
            designation = request.form['designation']
            doj = request.form['doj']
            is_admin=request.form.get('admin')
            cur = mysql.connection.cursor()
            cur.execute("USE dms_db;")
            cur.execute("INSERT INTO teacher VALUES (%s, %s, %s, %s, %s, %s, %s, %s)",
                        (staff_id, hashed_pass, name, email, mobile_no, dob, designation, doj))
            if is_admin:
                cur.execute("INSERT INTO admin(login,pass,name) VALUES (%s, %s, %s)",
                            (staff_id, hashed_pass, name))
            mysql.connection.commit()
            cur.close()
            return render_template_string("""
                            <script>
                                alert('Registration successful');
                                window.location.href = '/Admin_das'; 
                            </script>
                        """)
        else:
            return err_occ()
    except Exception as e:
        return err_occ()
@app.route("/stureg",methods=['POST'])
def stureg():
    try:
        if request.method == 'POST':
            rollno = request.form['rollno']
            passw = request.form['pass']
            hashed_pass = generate_password_hash(passw)
            name = request.form['name']
            email = request.form['email']
            mobile_no = request.form['mobile_no']
            dob = request.form['dob']
            course = request.form['course']
            startyear = request.form['startyear']
            endyear = request.form['endyear']
            cur = mysql.connection.cursor()
            cur.execute("USE dms_db;")
            cur.execute("INSERT INTO student VALUES (%s, %s, %s, %s, %s, %s, %s, %s,%s)",
                        (rollno, hashed_pass, name, email, mobile_no, dob, course, startyear, endyear))
            mysql.connection.commit()
            cur.close()
            return render_template_string("""
                            <script>
                                alert('Registration successful');
                                window.location.href = '/Admin_das'; 
                            </script>
                        """)
        else:
            mysql.connection.rollback()
            return err_occ()
    except Exception as e:
        mysql.connection.rollback()
        return err_occ()
@app.route('/uploadstudy',methods=['POST'])
def uploadstudy():
    try:
        app.config['UPLOAD_FOLDER'] = 'uploads/studymaterial'
        if request.method == 'POST':
            title = request.form['filename']
            file = request.files['file']
            filen = file.filename
            filepath = os.path.join(app.config['UPLOAD_FOLDER'], filen)
            file.save(filepath)
            cur = mysql.connection.cursor()
            cur.execute("USE dms_db;")
            cur.execute("INSERT INTO studymat (filename,filepath, filetitle) VALUES (%s, %s, %s)",
                        (filen, filepath, title))
            mysql.connection.commit()
            return upload_succes()
        else:
            mysql.connection.rollback()
            return err_occ()
    except Exception as e:
        mysql.connection.rollback()
        return err_occ()
@app.route('/uploadannc',methods=['POST'])
def uploadannc():
    try:
        app.config['UPLOAD_FOLDER'] = 'uploads/annoucments'
        if request.method == 'POST':
            title = request.form['filename']
            file = request.files['file']
            filen = file.filename
            filepath = os.path.join(app.config['UPLOAD_FOLDER'], filen)
            file.save(filepath)
            cur = mysql.connection.cursor()
            cur.execute("USE dms_db;")
            cur.execute("INSERT INTO annoucment (filename,filepath, filetitle) VALUES (%s, %s, %s)",
                        (filen, filepath, title))
            mysql.connection.commit()
            return upload_succes()
        else:
            mysql.connection.rollback()
            return err_occ()
    except Exception as e:
        mysql.connection.rollback()
        return err_occ()
@app.route('/uploadtimetable',methods=['POST'])
def uploadtimetable():
    try:
        app.config['UPLOAD_FOLDER'] = 'uploads/timetable'
        if request.method == 'POST':
            title = request.form['filename']
            file = request.files['file']
            filen = file.filename
            filepath = os.path.join(app.config['UPLOAD_FOLDER'], filen)
            file.save(filepath)
            cur = mysql.connection.cursor()
            cur.execute("USE dms_db;")
            cur.execute("INSERT INTO timetable (filename,filepath, filetitle) VALUES (%s, %s, %s)",
                        (filen, filepath, title))
            mysql.connection.commit()
            return upload_succes()
        else:
            mysql.connection.rollback()
            return err_occ()
    except Exception as e:
        mysql.connection.rollback()
        return err_occ()
@app.route('/download/<path:filename>')
def download(filename):
    return send_from_directory('uploads', filename, as_attachment=True)
if __name__=="__main__":
    app.run(debug=True)

