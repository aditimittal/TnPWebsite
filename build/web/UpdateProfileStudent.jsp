<header><%@include file="dash.jsp" %></header>
<br>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page errorPage="ErrorPage.jsp"%>
<%
String enrollnum = (String)session.getAttribute("eno");
String branchcode = enrollnum.substring(5, 7);
String programcode = enrollnum.substring(3, 5);
String year = enrollnum.substring(7, 11);
String db = "db_"+year;
String driver = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/"+db;
String userid = "root";
String password = "";
try {
Class.forName(driver);
} catch (ClassNotFoundException e) {
e.printStackTrace();
}
Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;
Statement st = null;
ResultSet rs = null;

%>
<%
try{
connection = DriverManager.getConnection(connectionUrl, userid, password);
statement = connection.createStatement();
st = connection.createStatement();
connection.setCatalog(db);

String p = "SELECT Programme_Type FROM Programme_Codes INNER JOIN Branch_Codes ON Programme_Codes.Programme_Name=Branch_Codes.Programme_Name WHERE Programme_Code = '" +programcode+ "' AND Branch_Code = '" +branchcode+ "'";
rs = st.executeQuery(p);
rs.first();
String ptype = rs.getString("Programme_Type");

if(ptype.equals("UNDERGRADUATE")){
    String sql = "SELECT Personal_Details.Enrollment_Number AS Enrollment_Number, Personal_Details.First_Name AS First_Name, Personal_Details.Last_Name AS Last_Name, Personal_Details.Aadhar_Number AS Aadhar_Number, Personal_Details.Category AS Category, Personal_Details.Temp_Address AS Temp_Address, Personal_Details.Permanent_Address AS Permanent_Address, Personal_Details.Alt_Email_Id AS Alt_Email_Id, Personal_Details.Father_Name AS Father_Name, Personal_Details.Father_Occupation AS Father_Occupation, Personal_Details.Father_Office_Address AS Father_Office_Address, Personal_Details.Father_Contact_Number AS Father_Contact_Number, Personal_Details.Mother_Name AS Mother_Name, Personal_Details.Mother_Occupation AS Mother_Occupation, Personal_Details.Mother_Office_Address AS Mother_Office_Address, Personal_Details.Mother_Contact_Number AS Mother_Contact_Number, Personal_Details.Class_X_School AS Class_X_School, Personal_Details.Class_X_Passing_Year AS Class_X_Passing_Year, Personal_Details.Class_XII_or_Diploma AS Class_XII_or_Diploma, Personal_Details.Class_XII_Board AS Class_XII_Board, Personal_Details.Class_XII_School AS Class_XII_School, Personal_Details.Programme_Code AS Programme_Code, Personal_Details.Branch_Code AS Branch_Code, Undergraduatetable.Department AS Department, Undergraduatetable.Course AS Course, Undergraduatetable.DOB AS DOB, Undergraduatetable.Contact_Number AS Contact_Number, Undergraduatetable.Alt_Contact_Number AS Alt_Contact_Number, Undergraduatetable.EmailId AS EmailId, Undergraduatetable.Class_X_Board AS Class_X_Board, Undergraduatetable.Class_X_Percentage AS Class_X_Percentage, Undergraduatetable.Class_XII_or_Diploma_Percentage AS Class_XII_or_Diploma_Percentage,  Undergraduatetable.Class_XII_or_Diploma_Passing_Year AS Class_XII_or_Diploma_Passing_Year FROM  " +db+  "."+"personal_details INNER JOIN  " +db+  "."+" undergraduatetable ON personal_details.Enrollment_Number=undergraduatetable.Enrollment_Number WHERE personal_details.Enrollment_Number="+enrollnum;
    resultSet = statement.executeQuery(sql);
}
else if(ptype.equals("POSTGRADUATE")){
    String sql = "SELECT Personal_Details.Enrollment_Number AS Enrollment_Number, Personal_Details.First_Name AS First_Name, Personal_Details.Last_Name AS Last_Name, Personal_Details.Aadhar_Number AS Aadhar_Number, Personal_Details.Category AS Category, Personal_Details.Temp_Address AS Temp_Address, Personal_Details.Permanent_Address AS Permanent_Address, Personal_Details.Alt_Email_Id AS Alt_Email_Id, Personal_Details.Father_Name AS Father_Name, Personal_Details.Father_Occupation AS Father_Occupation, Personal_Details.Father_Office_Address AS Father_Office_Address, Personal_Details.Father_Contact_Number AS Father_Contact_Number, Personal_Details.Mother_Name AS Mother_Name, Personal_Details.Mother_Occupation AS Mother_Occupation, Personal_Details.Mother_Office_Address AS Mother_Office_Address, Personal_Details.Mother_Contact_Number AS Mother_Contact_Number, Personal_Details.Class_X_School AS Class_X_School, Personal_Details.Class_X_Passing_Year AS Class_X_Passing_Year, Personal_Details.Class_XII_or_Diploma AS Class_XII_or_Diploma, Personal_Details.Class_XII_Board AS Class_XII_Board, Personal_Details.Class_XII_School AS Class_XII_School, Personal_Details.Programme_Code AS Programme_Code, Personal_Details.Branch_Code AS Branch_Code, Postgraduatetable.Department AS Department, Postgraduatetable.Course AS Course, Postgraduatetable.DOB AS DOB, Postgraduatetable.Contact_Number AS Contact_Number, Postgraduatetable.Alt_Contact_Number AS Alt_Contact_Number, Postgraduatetable.EmailId AS EmailId, Postgraduatetable.Class_X_Board AS Class_X_Board, Postgraduatetable.Class_X_Percentage AS Class_X_Percentage, Postgraduatetable.Class_XII_or_Diploma_Percentage AS Class_XII_or_Diploma_Percentage,  Postgraduatetable.Class_XII_or_Diploma_Passing_Year AS Class_XII_or_Diploma_Passing_Year, Postgraduatetable.GraduationUniversity AS  GraduationUniversity, Postgraduatetable.GraduationCollege AS  GraduationCollege, Postgraduatetable.Graduation_Stream AS  Graduation_Stream, Postgraduatetable.Graduation_Percentage AS  Graduation_Percentage, Postgraduatetable.Graduation_Year AS  Graduation_Year FROM  " +db+  "."+"personal_details INNER JOIN  " +db+  "."+" Postgraduatetable ON personal_details.Enrollment_Number=Postgraduatetable.Enrollment_Number WHERE personal_details.Enrollment_Number="+enrollnum;
    resultSet = statement.executeQuery(sql);
}   

while(resultSet.next()){
%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!--        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>-->
        <link rel="stylesheet" href="css/UpdateStudent.css">
        <script>
            function validation(){
                var contact = document.getElementById("contact");
                var altcontact = document.getElementById("altcontact");
                var email = document.getElementById("email");
                var altemail = document.getElementById("altemail");
                var fathcntct = document.getElementById("fathcntct");
                var mothcntct = document.getElementById("mothcntct");

                var strFields = "";
                
                if(altemail.value && email.value && altemail.value == email.value)
                    strFields += "Value of Email ID and Alternate Email ID cannot be same. \n";
                if(altcontact.value && contact.value && altcontact.value == contact.value)
                    strFields += "Value of Contact Number and Alternate Contact Number cannot be same. \n"; 
                if(fathcntct.value && contact.value && fathcntct.value == contact.value)
                    strFields += "Value of your Contact Number and Father's Contact Number cannot be same. \n";
                if(mothcntct.value && contact.value && mothcntct.value == contact.value)
                    strFields += "Value of your Contact Number and Mother's Contact Number cannot be same. \n";
                
                if(strFields != "")
                    alert(strFields);
                else{
                    $('#update').attr("type", "submit");
                    $('#update').attr("formaction", "UpdateData.jsp");
                }
            }
        </script>
    </head>
    
    <body>
    <div id="updateprofilebody">              
        <div class="panels container">
                    <form action="UpdateData.jsp" method="post">
                        
                        <span>
                            <span style="background: #ffffff; border: 0.12em solid #000000; " class="input-group-addon"><h3><b>Personal Details</b></h3></span>
                        </span>
                        <br><br>
                        <span class="form1_item form-group field  ">
                            <input type="text" id="enrollnum" name="enrollnum" class="form-control" value="<%=resultSet.getString("Enrollment_Number") %>" onkeydown="return false;" />
                            <label for="enrollnum" >Enrollment Number</label>
                        </span>
                       
                        <span class="form1_item form1_col1 form-group field">
                            <input type="text" id="fname" class="form-control" value="<%=resultSet.getString("First_Name") %>" onkeydown="return false;" name="fname" />
                            <label for="fname">First Name</label>
                        </span>
                        <span class="form1_item form1_col2 form-group field">
                            <input type="text" id="lname" class="form-control" value="<%=resultSet.getString("Last_Name") %>" onkeydown="return false;" name="lname"/>
                            <label for="lname">Last Name</label>
                        </span>
                        <span class="form1_item form1_col1 form-group field">
                            <input type="text" id="dob" class="form-control" value="<%=resultSet.getString("DOB") %>" onkeydown="return false;" name="dob"/>
                            <label for="dob">Date of Birth</label>
                        </span>
                        <span class="form1_item form1_col2 form-group field">
                            <input type="text" id="category" class="form-control" value="<%=resultSet.getString("Category") %>" onkeydown="return false;" name="category"/>
                            <label for="category">Category</label>
                        </span>
                        <span class="form1_item form-group field">
                            <input type="text" id="aadharnum" class="form-control" value="<%=resultSet.getString("Aadhar_Number") %>" onkeydown="return false;" name="aadharnum" />
                            <label for="aadharnum">Aadhar Number</label>
                        </span>
                        <span class="form1_item form-group field">
                            <input type="text" id="permaddr" class="form-control" value="<%=resultSet.getString("Permanent_Address") %>" maxlength="100" name="permaddr" required />
                            <label for="permaddr">Permanent Address</label>
                        </span>
                        <span class="form1_item form-group field">
                            <input type="text" id="tempaddr" class="form-control" value="<%=resultSet.getString("Temp_Address") %>" maxlength="100" name="tempaddr" />
                            <label for="tempaddr">Temporary Address</label>
                        </span>
                        <span class="form1_item form1_col1 form-group field">
                            <input type="text" id="contact" minlength="10" class="form-control" maxlength="10" value="<%=resultSet.getString("Contact_Number") %>" name="contact" pattern="[789][0-9]{9}" title="Only numeric values are allowed" required/>
                            <label for="contact">Contact</label>
                        </span>
                        <span class="form1_item form1_col2 form-group field">
                            <input type="text" id="altcontact" minlength="10" maxlength="10" class="form-control" value="<%=resultSet.getString("Alt_Contact_Number")%>" name="altcontact" pattern="[789][0-9]{9}" title="Only numeric values are allowed" />
                            <label for="altcontact">Alternate Contact</label>
                        </span>
                        <span class="form1_item form1_col1 form-group field">
                            <input type="email" id="email" class="form-control"  value="<%=resultSet.getString("EmailID") %>" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,3}$" title="Invalid Email id" required name="email" />
                            <label for="email">Email ID</label>
                        </span>
                        <span class="form1_item form1_col2 form-group field">
                            <input type="email" id="altemail" value="<%=resultSet.getString("Alt_Email_ID") %>" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,3}$" class="form-control" title="Invalid Email id" name="altemail" />
                            <label for="altemail">Alternate Email ID</label>
                        </span>
                                
                    <span class="form-group">
                        <span class="input-group-addon" style="background: #ffffff; border: 0.12em solid #000000; " class="input-group-addon"><h3><b>Parent Contact Details</b></h3></span>
                    </span>
                    <br><br>
                    <span class="form1_item form-group field">
                        <input type="text" id="fathname" class="form-control" value="<%=resultSet.getString("Father_Name") %>" onkeydown="return false;" name="fathname"/>
                        <label for="fathname">Father's Name</label>
                    </span>
                    <span class="form1_item form1_col1 form-group field">
                        <input type="text" id="fathoccptn" class="form-control" value="<%=resultSet.getString("Father_Occupation") %>" pattern="[A-Za-z\s]+" title="Only alphabets are allowed." name="fathoccptn"/>
                        <label for="fathoccptn">Father's Occupation</label>
                    </span>
                    <span class="form1_item form1_col2 form-group field">
                        <input type="text" id="fathcntct" class="form-control" value="<%=resultSet.getString("Father_Contact_Number") %>" minlength="10" maxlength="10" pattern="[789][0-9]{9}" title="Only numeric values are allowed." name="fathcntct"/>
                        <label for="fathcntct">Father's Contact</label>
                    </span>
                    <span class="form1_item form-group field">
                        <input type="text" id="fathoffaddr" class="form-control" value="<%=resultSet.getString("Father_Office_Address") %>" name="fathoffaddr"/>
                        <label for="fathoffaddr">Father's Office Address</label>
                    </span>
                    <span class="form1_item form-group field">
                        <input type="text" id="mothname" class="form-control" value="<%=resultSet.getString("Mother_Name") %>" onkeydown="return false;" name="mothname"/>
                        <label for="mothname">Mother's Name</label>
                    </span>
                    <span class="form1_item form1_col1 form-group field">
                        <input type="text" id="mothoccptn" class="form-control" value="<%=resultSet.getString("Mother_Occupation") %>" pattern="[A-Za-z\s]+" title="Only alphabets are allowed." name="mothoccptn"/>
                        <label for="mothoccptn">Mother's Occupation</label>
                    </span>
                    <span class="form1_item form1_col2 form-group field">
                        <input type="text" id="mothcntct" class="form-control" value="<%=resultSet.getString("Mother_Contact_Number") %>" minlength="10" maxlength="10" pattern="[789][0-9]{9}" title="Only numeric values are allowed." name="mothcntct"/>
                        <label for="mothcntct">Mother's Contact</label>
                    </span>
                    <span class="form1_item form-group field">
                        <input type="text" id="mothoffaddr" class="form-control" value="<%=resultSet.getString("Mother_Office_Address") %>" name="mothoffaddr"/>
                        <label for="mothoffaddr">Mother's Office Address</label>
                    </span>
               
                    <span class="form-group">
                        <span class="input-group-addon" style="background: #ffffff; border: 0.12em solid #000000; " class="input-group-addon"><h3><b>Class X</b></h3></span>
                    </span>
                    <br><br>
                    <span class="form1_item form-group field">
                        <input type="text" id="xboard" class="form-control" value="<%=resultSet.getString("Class_X_Board") %>" maxlength="4" name="xboard" pattern="[A-Za-z\s]+" title="Only alphabets are allowed." required name="xboard"/>
                        <label for="xboard">Board</label>
                    </span>
                    <span class="form1_item form1_col1 form-group field">
                        <input type="number" step="0.01" min="0" max="100" maxlength="5" id="xpercentage" class="form-control" value="<%=resultSet.getString("Class_X_Percentage") %>" pattern="[0-9]+" title="Only numeric values are allowed." required name="xpercentage"/>
                        <label for="xpercentage">Percentage</label>
                    </span>
                    <span class="form1_item form1_col2 form-group field">
                        <input type="text" id="xpassyr" value="<%=resultSet.getInt("Class_X_Passing_Year") %>" class="form-control" minlength="4" maxlength="4" name="xpassyr" pattern="[0-9]+" title="Only numeric values are allowed." required name="xpassyr"/>
                        <label for="xpassyr">Passing Year</label>
                    </span>
                    <span class="form1_item form-group field">
                        <input type="text" value="<%=resultSet.getString("Class_X_School") %>" class="form-control" pattern="[A-Za-z\s]+" title="Only alphabets are allowed." required name="xschlname"/>
                        <label for="xschlname">School Name</label>
                    </span>

                    <span class="form-group">
                        <span class="input-group-addon" style="background: #ffffff; border: 0.12em solid #000000; " class="input-group-addon"><h3><b>Class XII/Diploma</b></h3></span>
                    </span>
                    <br><br>
                    <span class="form1_item form1_col1 form-group field">
                        <input type="text" id="xiidiploma" value="<%=resultSet.getString("Class_XII_or_Diploma") %>" class="form-control" pattern="[A-Za-z\s]+" title="Only alphabets are allowed." required name="xiidiploma">
                        <label for="xiidiploma">XII/Diploma</label>
                    </span>
                    <span class="form1_item form1_col2 form-group field">
                        <input type="text" id="xiiboard" value="<%=resultSet.getString("Class_XII_Board") %>" name="xiiboard" class="form-control" maxlength="4" pattern="[A-Za-z\s]+" title="Only alphabets are allowed." required />
                        <label for="xiiboard">Board</label>
                    </span>
                    <span class="form1_item form1_col1 form-group field">
                        <input type="number" step="0.01" min="0" max="100" maxlength="5" id="xiipercentage" value="<%=resultSet.getString("Class_XII_or_Diploma_Percentage")%>" name="xiipercentage" class="form-control" pattern="[0-9]+" title="Only numeric values are allowed." required/>
                        <label for="xiipercentage">Percentage</label>
                    </span>
                    <span class="form1_item form1_col2 form-group field">
                        <input type="text" id="xiipassyr" value="<%=resultSet.getInt("Class_XII_or_Diploma_Passing_Year") %>" name="xiipassyr" class="form-control" minlength="4" maxlength="4" pattern="[0-9]+" title="Only numeric values are allowed." required/>
                        <label for="xiipassyr">Passing Year</label>
                    </span>
                    <span class="form1_item form-group field">
                        <input type="text" id="xiischlname" class="form-control" value="<%=resultSet.getString("Class_XII_School") %>" name="xiischlname" pattern="[A-Za-z\s]+" title="Only alphabets are allowed." required/>
                        <label for="xiischlname">School Name</label>
                    </span>
                    
                    <%if(ptype.equals("POSTGRADUATE")){
                        int load = 1;
                    %>
                        <span id="A"  style="display:none;">
                           <span class="form-group">
                               <span class="input-group-addon" style="background: #ffffff; border: 0.12em solid #000000; " class="input-group-addon"><h3><b>Undergraduate Details</b></h3></span>
                           </span>
                           <br><br>
                           <span class="form1_item form-group field">
                               <input type="text" id="graduniv" class="form-control require-if-active" value="<%=resultSet.getString("GraduationUniversity") %>" name="graduniv" pattern="[A-Za-z\s]+" title="Only alphabets are allowed."/>
                               <label for="graduniv">Graduation University</label>
                           </span>
                           <span class="form1_item form1_col1 form-group field">
                               <input type="text" id="gradclg" class="form-control require-if-active" value="<%=resultSet.getString("GraduationCollege") %>" name="gradclg" pattern="[A-Za-z\s]+" title="Only alphabets are allowed." />
                               <label for="gradclg">Graduation College</label>
                           </span>
                           <span class="form1_item form1_col2 form-group field">
                               <input type="text" id="gradstream" class="form-control require-if-active" value="<%=resultSet.getString("Graduation_Stream") %>" name="gradstream" pattern="[A-Za-z\s]+" title="Only alphabets are allowed." />
                               <label for="gradstream">Graduation Stream</label>
                           </span>
                           <span class="form1_item form_col1 form-group field">
                                <input type="number" step="0.01" min="0" max="100" maxlength="5" id ="gradpercentage" class="form-control require-if-active" value="<%=resultSet.getString("Graduation_Percentage") %>" name="gradpercentage" />
                                <label for="gradpercentage">Graduation Percentage</label>
                           </span>
                           <span class="form1_item form_col2 form-group field">
                               <input type="text" id="gradyr" class="form-control require-if-active" value="<%=resultSet.getInt("Graduation_Year") %>" minlength="4" maxlength="4" pattern="[0-9]{4}" title="Only numeric values are allowed." name="gradyr" />
                               <label for="gradyr">Graduation Year</label>
                           </span>
                       </span>

                       <script>
                               var d = document;
                               var load = <%=load%>;
                               if(load == 1)
                                   func();
                               function func() {

                                   var postgradDisplay  = d.getElementById("A");
                                   if(<%=(ptype.equals("UNDERGRADUATE"))%>) {  
                                       postgradDisplay.style.display  = "none";
                                       $(".require-if-active").each(function() {
                                            var el = $(this);
                                            el.prop("required", false);
                                        });
                                   }  
                                   else { 
                                       postgradDisplay.style.display  = "block"; 
                                       $(".require-if-active").each(function() {
                                            var el = $(this);
                                            el.prop("required", true);
                                        });
                                   }
                               } 
                       </script>
                    <% } %>
                <input type="button" id="update" value="Update" onclick="validation()" style="background-color: #39843c; border-radius: 0 !important; border: none; margin-left:85%; width:15%; color:white; min-height:7%; font-size:1.2em; text-align:center;" class="btn btn-default">   
                
            </div>
                        
        </form>
                <br><br>
    </div>
    </body>
</html>
<%
        }
        //con.close();
    } 
    catch (Exception e) {
        e.printStackTrace();
    }
%>

<footer><%@include file="footer2.jsp" %></footer>
