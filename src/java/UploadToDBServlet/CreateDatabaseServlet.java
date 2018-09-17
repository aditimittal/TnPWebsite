package UploadToDBServlet;

import com.mysql.jdbc.Connection;
import java.io.IOException;
import java.sql.DriverManager;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/CreateDatabaseServlet")
public class CreateDatabaseServlet extends HttpServlet {
    
    @Override
    protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
	
        Connection con = null;
        Statement st;
        String sql, dbname;
        
        try {
            
            String username = (String)request.getSession().getAttribute("name");
            System.out.println(username);
            
            //Set up the connection
            Class.forName("com.mysql.jdbc.Driver");  
            con=(Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/tnp","root",""); 
 
            String year = request.getParameter("dbyear");
                        
            // Validating whether year is null or empty
                if (year == null || year.equals("")) {
                    request.setAttribute("message", "Year required!");
                } 
                else {
                    st = (Statement)con.createStatement();
                    dbname = "db_"+ year;
                    
                    sql = "CREATE DATABASE "+dbname+";";
                    System.out.println(sql);
                    st.executeUpdate(sql);

                    sql = "CREATE TABLE "+dbname;
                    sql = sql + ".personal_details(Enrollment_Number VARCHAR(11) not null primary key," ;
                    sql = sql +" First_Name VARCHAR(50) not null," ;
                    sql = sql +" Last_Name VARCHAR(50) not null," ;
                    sql = sql +" Aadhar_Number BIGINT," ;
                    sql = sql +" Category VARCHAR(10) not null," ;
                    sql = sql +" Temp_Address VARCHAR(100)," ;
                    sql = sql +" Permanent_Address VARCHAR(100) not null," ;
                    sql = sql +" Alt_Email_Id VARCHAR(100)," ;
                    sql = sql +" Father_Name VARCHAR(50) not null," ;
                    sql = sql +" Father_Occupation VARCHAR(50)," ;
                    sql = sql +" Father_Office_Address VARCHAR(100)," ;
                    sql = sql +" Father_Contact_Number VARCHAR(20)," ;
                    sql = sql +" Mother_Name VARCHAR(50) not null," ;
                    sql = sql +" Mother_Occupation VARCHAR(50)," ;
                    sql = sql +" Mother_Office_Address VARCHAR(100)," ;
                    sql = sql +" Mother_Contact_Number VARCHAR(20)," ;
                    sql = sql +" Class_X_School VARCHAR(100) not null," ;
                    sql = sql +" Class_X_Passing_Year INT not null," ;
                    sql = sql +" Class_XII_or_Diploma VARCHAR(10) not null," ;
                    sql = sql +" Class_XII_Board VARCHAR(4)," ;
                    sql = sql +" Class_XII_School VARCHAR(100)," ;
                    sql = sql +" Programme_Code VARCHAR(2) not null," ;
                    sql = sql +" Branch_Code VARCHAR(2) not null);";

                    st.executeUpdate(sql);

                    sql = "CREATE TABLE "+dbname+".undergraduatetable ";
                    sql = sql + "(Enrollment_Number VARCHAR(11) not null primary key," ;
                    sql = sql + " Programme_Code VARCHAR(2) not null," ;
                    sql = sql + " Branch_Code VARCHAR(2) not null," ;
                    sql = sql + " Department VARCHAR(30) not null," ;
                    sql = sql + " Course VARCHAR(30) not null," ;
                    sql = sql + " Institute_Name VARCHAR(6) default 'IGDTUW' not null," ;
                    sql = sql + " Gender VARCHAR(6) default 'Female' not null," ;
                    sql = sql + " DOB DATE not null," ;
                    sql = sql + " Contact_Number VARCHAR(20)," ;
                    sql = sql + " Alt_Contact_Number VARCHAR(20)," ;
                    sql = sql + " EmailId VARCHAR(100) not null," ;
                    sql = sql + " Class_X_Board VARCHAR(4) not null," ;
                    sql = sql + " Class_X_Percentage DOUBLE PRECISION," ;
                    sql = sql + " Class_XII_or_Diploma_Percentage DOUBLE PRECISION," ;
                    sql = sql + " Class_XII_or_Diploma_Passing_Year INT not null, ";
                    sql = sql + " FOREIGN KEY (Enrollment_Number) REFERENCES "+dbname+".personal_details(Enrollment_Number));";

                    st.executeUpdate(sql);

                    sql = "CREATE TABLE "+dbname+".postgraduatetable";
                    sql = sql + "(Enrollment_Number VARCHAR(11) not null primary key," ;
                    sql = sql + " Programme_Code VARCHAR(2) not null," ;
                    sql = sql + " Branch_Code VARCHAR(2) not null," ;
                    sql = sql + " Department VARCHAR(30) not null," ;
                    sql = sql + " Course VARCHAR(30) not null," ;
                    sql = sql + " Institute_Name VARCHAR(6) default 'IGDTUW' not null," ;
                    sql = sql + " Gender VARCHAR(6) default 'Female' not null," ;
                    sql = sql + " DOB DATE not null," ;
                    sql = sql + " Contact_Number VARCHAR(20)," ;
                    sql = sql + " Alt_Contact_Number VARCHAR(20)," ;
                    sql = sql + " EmailId VARCHAR(100) not null," ;
                    sql = sql + " Class_X_Board VARCHAR(4) not null," ;
                    sql = sql + " Class_X_Percentage DOUBLE PRECISION," ;
                    sql = sql + " Class_XII_or_Diploma_Percentage DOUBLE PRECISION," ;
                    sql = sql + " Class_XII_or_Diploma_Passing_Year INT not null," ;
                    sql = sql + " GraduationUniversity VARCHAR(50) not null," ;
                    sql = sql + " GraduationCollege VARCHAR(50) not null," ;
                    sql = sql + " Graduation_Stream VARCHAR(50) not null," ;
                    sql = sql + " Graduation_Percentage DOUBLE PRECISION," ;
                    sql = sql + " Graduation_Year INT not null, ";
                    sql = sql + " FOREIGN KEY (Enrollment_Number) REFERENCES "+dbname+".personal_details(Enrollment_Number));";

                    st.executeUpdate(sql);
					
                    sql = "CREATE TABLE "+dbname+".Programme_Codes";
                    sql = sql + " ( Programme_Name varchar(40) not null primary key,";
                    sql = sql + "	Programme_Code varchar(40) not null,";
                    sql = sql + "	Programme_Type varchar(40) not null,";
                    sql = sql + "	Programme_Duration int(2) not null";
                    sql = sql + ");";

                    st.executeUpdate(sql);

                    sql = "CREATE TABLE "+dbname+".Branch_Codes";
                    sql = sql + " (  Branch_Name varchar(40) not null,";
                    sql = sql + " Branch_Code varchar(40) not null,";
                    sql = sql + " Programme_Name varchar(40) not null,";
                    sql = sql + " foreign key (Programme_Name) references Programme_Codes(Programme_Name) ON DELETE CASCADE";
                    sql = sql + "  );";

                    st.executeUpdate(sql);
                    
                    sql = "CREATE TABLE "+dbname+".company_details (" ;
                    sql = sql + "  company_id int(11) NOT NULL PRIMARY KEY AUTO_INCREMENT," ;
                    sql = sql + "  company_name varchar(50) DEFAULT NULL," ;
                    sql = sql + "  company_type varchar(50) NOT NULL," ;
                    sql = sql + "  type varchar(80) NOT NULL," ;
                    sql = sql + "  company_description text NOT NULL," ;
                    sql = sql + "  industry varchar(80) NOT NULL," ;
                    sql = sql + "  profile_type varchar(50) NOT NULL," ;
                    sql = sql + "  profile varchar(80) NOT NULL," ;
                    sql = sql + "  ctc_last_year int(11) DEFAULT NULL," ;
                    sql = sql + "  ctc_current_year int(11) DEFAULT NULL," ;
                    sql = sql + "  student_poc varchar(100) DEFAULT NULL," ;
                    sql = sql + "  company_poc varchar(100) DEFAULT NULL," ;
                    sql = sql + "  contact_no varchar(11) DEFAULT NULL," ;
                    sql = sql + "  email_addr varchar(100) DEFAULT NULL," ;
                    sql = sql + "  online_test_date date DEFAULT NULL," ;
                    sql = sql + "  visit_date date DEFAULT NULL" ;
                    sql = sql + ");";
                    
                    st.executeUpdate(sql);
                    
                    sql = "CREATE TABLE "+dbname+".company_branch (" ;
                    sql = sql + "  company_id int(11) NOT NULL," ;
                    sql = sql + "  department varchar(30) NOT NULL," ;
                    sql = sql + "  course varchar(30) NOT NULL, " ;
                    sql = sql + "  batch int(4) NOT NULL" ;
                    sql = sql + ");";
                    
                    st.executeUpdate(sql);
                    
                    sql = "CREATE TABLE "+dbname+".placementrecord (" ;
                    sql = sql + "  Enrollment_number varchar(11) NOT NULL," ;
                    sql = sql + "  company_id int(6) NOT NULL," ;
                    sql = sql + "  profile_offered varchar(100) NOT NULL," ;
                    sql = sql + "  type varchar(10) NOT NULL" ;
                    sql = sql + ");";
                    
                    st.executeUpdate(sql);
                    
                    String msg = "Database created ("+dbname+")";
                    request.setAttribute("message", "Database created!");
                    
                    //Entry in Log Table
                    java.text.DateFormat df = new java.text.SimpleDateFormat("YYYY-MM-dd");
                    String formattedDate = df.format(new java.util.Date());
                    df = new java.text.SimpleDateFormat("HH:mm:ss");
                    String formattedTime = df.format(new java.util.Date());
                    String content = "Database created";
                    String mess = "Database created for year "+ year + " as "+dbname;
                    sql = "insert into logtable(user,content,msg,update_date,update_time) values('"+username+"','"+content+"','"+mess+"','"+formattedDate+"','"+formattedTime+"')";
                    int i = st.executeUpdate(sql);
                }
        } catch (Exception e) {
                request.setAttribute("message", e.getMessage());
                e.printStackTrace();
        }
        
        //System.out.println(request.getAttribute("message"));
       //new Gson().toJson(returnMessage, response.getWriter());
        request.getRequestDispatcher("CreateDropDBResult.jsp").forward(request, response);
    }
}