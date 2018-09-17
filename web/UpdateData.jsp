<%@page import="java.text.SimpleDateFormat, java.util.Date"%>
<%@page errorPage="ErrorPage.jsp"%>
<%@page import="java.sql.*,java.util.*"%>
<%
String enrollnum = (String)session.getAttribute("eno");
String branchcode = enrollnum.substring(5, 7);
String programcode = enrollnum.substring(3, 5);
String year = enrollnum.substring(7, 11);
String department = request.getParameter("department");
String course = request.getParameter("course");

Long an = Long.parseLong(request.getParameter("aadharnum"));
String t = request.getParameter("tempaddr");
String permaddr = request.getParameter("permaddr");

String contact = request.getParameter("contact"); 
String altcontact = request.getParameter("altcontact");
String email = request.getParameter("email");
String altemail = request.getParameter("altemail");

String father_name = request.getParameter("fathname");
String father_occ = request.getParameter("fathoccptn");
String fathcntct  =  request.getParameter("fathcntct");
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
String db="db_"+year;
Statement st = null;
ResultSet rs = null;
boolean table1 = false;
boolean table2 = false;

        try{
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/"+db, "root", "");
            st = con.createStatement();
            con.setCatalog(db);
            String p = "SELECT Programme_Type FROM Programme_Codes INNER JOIN Branch_Codes ON Programme_Codes.Programme_Name=Branch_Codes.Programme_Name WHERE Programme_Code = '" +programcode+ "' AND Branch_Code = '" +branchcode+ "'";
            rs = st.executeQuery(p);
            rs.first();
            String ptype = rs.getString("Programme_Type");
            if(ptype.equals("UNDERGRADUATE")){
                String sql = "Update " +db+  "."+"undergraduatetable set Contact_Number = ?, Alt_Contact_Number = ?, EmailId = ?, Class_X_Board= ?, Class_X_Percentage = ?, Class_XII_or_Diploma_Percentage = ?, Class_XII_or_Diploma_Passing_Year = ? where Enrollment_Number="+enrollnum;
                
                PreparedStatement ps = con.prepareStatement(sql);
                ps.setString(1, contact);
                ps.setString(2, altcontact);
                ps.setString(3, email);
                ps.setString(4, xboard);
                ps.setFloat(5, xpercentage);
                ps.setFloat(6, xiipercentage);
                ps.setInt(7, xiipassyr);
                      
                int i = ps.executeUpdate();
                if(i == 1)
                    table1 = true;
            }
            else if(ptype.equals("POSTGRADUATE"))
            {
               String graduniv=request.getParameter("graduniv");
               String gradclg=request.getParameter("gradclg");
               String gradstream=request.getParameter("gradstream");
               int gradyr = Integer.parseInt(request.getParameter("gradyr"));
               float gradpercentage = Float.parseFloat(request.getParameter("gradpercentage"));
                
                String sql = "Update " +db+  "."+"postgraduatetable set Contact_Number = ?, Alt_Contact_Number = ?, EmailId = ?, Class_X_Board= ?, Class_X_Percentage = ?, Class_XII_or_Diploma_Percentage = ?, Class_XII_or_Diploma_Passing_Year = ?,GraduationUniversity=?, GraduationCollege=?, Graduation_Stream=?, Graduation_Percentage=?, Graduation_Year=? where Enrollment_Number="+enrollnum;
                PreparedStatement ps = con.prepareStatement(sql);
                ps.setString(1, contact);
                ps.setString(2, altcontact);
                ps.setString(3, email);
                ps.setString(4, xboard);
                ps.setFloat(5, xpercentage);
                ps.setFloat(6, xiipercentage);
                ps.setInt(7, xiipassyr);
                ps.setString(8, graduniv);
                ps.setString(9, gradclg);
                ps.setString(10, gradstream);
                ps.setFloat(11, gradpercentage);
                ps.setInt(12, gradyr);
                      
                int i = ps.executeUpdate();
                if(i == 1)
                    table1 = true;
                
            }

            String sql = "Update " +db+  "."+"personal_details set Aadhar_Number = ?, Temp_Address = ?, Permanent_Address = ?, Alt_Email_Id = ?, Father_Name = ?, Father_Occupation = ?, Father_Office_Address = ?, Father_Contact_Number = ?, Mother_Name = ?, Mother_Occupation = ?, Mother_Office_Address = ?, Mother_Contact_Number = ?, Class_X_School = ?, Class_X_Passing_Year = ?, Class_XII_or_Diploma = ?, Class_XII_Board = ?, Class_XII_School = ? where Enrollment_Number="+enrollnum;
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setLong(1, an);
            ps.setString(2, t);
            ps.setString(3, permaddr);
            ps.setString(4, altemail);
            ps.setString(5, father_name);
            ps.setString(6, father_occ);
            ps.setString(7, fathoffaddr);
            ps.setString(8, fathcntct);
            ps.setString(9, mothname);
            ps.setString(10, mothoccptn);
            ps.setString(11, mothoffaddr);
            ps.setString(12, mothcntct);
            ps.setString(13, xschlname);
            ps.setInt(14, xpassyr);
            ps.setString(15, xiiboarddiploma);
            ps.setString(16, xiiboard);
            ps.setString(17, xiischlname);
           
            int i = ps.executeUpdate();
            if(i == 1)
                table2 = true;
            
            if(table1 && table2){ %>
                <script>
                    window.location = 'UpdateProfileStudent.jsp';
                    alert("The data has been successfully updated!");
                </script>
                
            <% }
            else{ %>
                <script>
                    window.location = 'UpdateProfileStudent.jsp';
                    alert("There is an error in data updation. Please try again.");
                </script>
            <%}
        }
        catch(Exception e){
            System.out.print(e);
            e.printStackTrace();
        }
        %>

