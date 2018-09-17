<%@page import="java.text.SimpleDateFormat, java.util.Date"%>
<%@page import="java.sql.*,java.util.*"%>
<%@page errorPage="ErrorPage.jsp"%>
<%
String enrollnum = request.getParameter("enrollnum");
String branchcode = enrollnum.substring(5, 7);
String programcode = enrollnum.substring(3, 5);
String year = enrollnum.substring(7, 11);
String fname = request.getParameter("fname");
String lname = request.getParameter("lname");
String department = request.getParameter("department");
String course = request.getParameter("course");
String date1 = request.getParameter("dob");
Date utilDate = new SimpleDateFormat("yyyy-MM-dd").parse(date1);
java.sql.Date dob = new java.sql.Date(utilDate.getTime()); 
String category = request.getParameter("category");
Long an = Long.parseLong(request.getParameter("aadharnum"));
String t = request.getParameter("tempaddr");
String permaddr = request.getParameter("permaddr");
String contact = request.getParameter("contact"); 
String altcontact = request.getParameter("altcontact");
String email = request.getParameter("email");
String altemail = request.getParameter("altemail");

String father_name = request.getParameter("fathname");
String father_occ = request.getParameter("fathoccptn");
String fathcntct = request.getParameter("fathcntct");
String fathoffaddr = request.getParameter("fathoffaddr");
String mothname = request.getParameter("mothname");
String mothoccptn = request.getParameter("mothoccptn");
String mothcntct = request.getParameter("mothcntct");
String mothoffaddr = request.getParameter("mothoffaddr");

String xboard = request.getParameter("xboard");
float xpercentage = Float.parseFloat(request.getParameter("xpercentage"));
int xpassyr = Integer.parseInt(request.getParameter("xpassyr"));
String xschlname = request.getParameter("xschlname");

String xiiboard = request.getParameter("xiiboard");
String xiiboarddiploma = request.getParameter("xiidiploma");
float xiipercentage = Float.parseFloat(request.getParameter("xiipercentage"));
int xiipassyr = Integer.parseInt(request.getParameter("xiipassyr"));
String xiischlname = request.getParameter("xiischlname");

String postgrad = request.getParameter("postgrad"); 
String UG="undergrad";
String PG="postgrad";
String db="db_"+year;
Statement statement = null;
ResultSet resultSet = null;
boolean reg = false;
        try{
           Class.forName("com.mysql.jdbc.Driver");
           Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/"+db, "root", "");
           Statement st = con.createStatement();
           statement = con.createStatement();
           con.setCatalog(db);

           String p = "SELECT Programme_Type FROM Programme_Codes INNER JOIN Branch_Codes ON Programme_Codes.Programme_Name=Branch_Codes.Programme_Name WHERE Programme_Code = '" +programcode+ "' AND Branch_Code = '" +branchcode+ "'";
           resultSet = statement.executeQuery(p);
           resultSet.first();
           String ptype = resultSet.getString("Programme_Type");
           
          if(postgrad.equals(UG) && ptype.equals("UNDERGRADUATE")){  
                int i = st.executeUpdate("insert into " +db+  "."+"personal_details(Enrollment_Number, First_Name, Last_Name, Aadhar_Number, Category, Temp_Address, Permanent_Address, Alt_Email_Id, Father_Name, Father_Occupation, Father_Office_Address, Father_Contact_Number, Mother_Name, Mother_Occupation, Mother_Office_Address, Mother_Contact_Number, Class_X_School, Class_X_Passing_Year, Class_XII_or_Diploma, Class_XII_Board, Class_XII_School, Programme_Code, Branch_Code)" + "values('"+enrollnum+"','"+fname+"','"+lname+"','"+an+"','"+category+"','"+t+"','"+permaddr+"','"+altemail+"','"+father_name+"','"+father_occ+"','"+fathoffaddr+"','"+fathcntct+"','"+mothname+"','"+mothoccptn+"','"+mothoffaddr+"','"+mothcntct+"','"+xschlname+"','"+xpassyr+"','"+xiiboarddiploma+"','"+xiiboard+"','"+xiischlname+"','"+programcode+"','"+branchcode+"')"); 
                int ug = st.executeUpdate("insert into " +db+  "."+"undergraduatetable(Enrollment_Number, Programme_Code, Branch_Code, Department, Course, DOB, Contact_Number, Alt_Contact_Number, EmailId, Class_X_Board, Class_X_Percentage ,Class_XII_or_Diploma_Percentage,  Class_XII_or_Diploma_Passing_Year)" +" values('"+enrollnum+"','"+programcode+"','"+branchcode+"','"+department+"','"+course+"','"+dob+"','"+contact+"','"+altcontact+"','"+email+"','"+xboard+"','"+xpercentage+"','"+xiipercentage+"','"+xiipassyr+"')"); 
                if(i==1 && ug==1)
                    reg = true;
          }
          else if(postgrad.equals(PG) && ptype.equals("POSTGRADUATE")){
               String graduniv = request.getParameter("graduniv");;
               String gradclg = request.getParameter("gradclg");
               String gradstream = request.getParameter("gradstream");
               int gradyr = Integer.parseInt(request.getParameter("gradyr"));
               float gradpercentage = Float.parseFloat(request.getParameter("gradpercentage"));
               int i = st.executeUpdate("insert into " +db+  "."+"personal_details(Enrollment_Number, First_Name, Last_Name, Aadhar_Number, Category, Temp_Address, Permanent_Address, Alt_Email_Id, Father_Name, Father_Occupation, Father_Office_Address, Father_Contact_Number, Mother_Name, Mother_Occupation, Mother_Office_Address, Mother_Contact_Number, Class_X_School, Class_X_Passing_Year, Class_XII_or_Diploma, Class_XII_Board, Class_XII_School, Programme_Code, Branch_Code)" + "values('"+enrollnum+"','"+fname+"','"+lname+"','"+an+"','"+category+"','"+t+"','"+permaddr+"','"+altemail+"','"+father_name+"','"+father_occ+"','"+fathoffaddr+"','"+fathcntct+"','"+mothname+"','"+mothoccptn+"','"+mothoffaddr+"','"+mothcntct+"','"+xschlname+"','"+xpassyr+"','"+xiiboarddiploma+"','"+xiiboard+"','"+xiischlname+"','"+programcode+"','"+branchcode+"')"); 
               int pg = st.executeUpdate("insert into " +db+  "."+"postgraduatetable(Enrollment_Number, Programme_Code, Branch_Code, Department, Course, DOB, Contact_Number, Alt_Contact_Number, EmailId, Class_X_Board, Class_X_Percentage ,Class_XII_or_Diploma_Percentage,  Class_XII_or_Diploma_Passing_Year, GraduationUniversity, GraduationCollege, Graduation_Stream, Graduation_Percentage, Graduation_Year)" +" values('"+enrollnum+"','"+programcode+"','"+branchcode+"','"+department+"','"+course+"','"+dob+"','"+contact+"','"+altcontact+"','"+email+"','"+xboard+"','"+xpercentage+"','"+xiipercentage+"','"+xiipassyr+"','"+graduniv+"','"+gradclg+"','"+gradstream+"','"+gradpercentage+"','"+gradyr+"')");       
               if(i==1 && pg==1)
                    reg = true;
          }
          if(reg){ %>
                <script>
                    window.location = 'UpdateProfileStudent.jsp';
                </script>
                
            <% }
            else{ %>
                <script>
                    window.location = 'personalInfo.jsp';
                    alert("There was some error in the registeration. Please fill the form carefully.");
                </script>
            <%}
              
        }
        catch(Exception e){
            System.out.print(e);
            e.printStackTrace();
        }
%>