package DATABASE_FETCH;

import java.lang.reflect.Field;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

public class FetchDetailsDAO 
{
    public Map<String, PersonalDetailsPOJO> getStudentALLDetails(String Programme_Code, String Branch_Code, int year) throws SQLException
    {
        connection co = new connection();
        Map<String, PersonalDetailsPOJO> res = null;
        String db_name = "db_"+year;
        
        try 
        { 
            Connection  con = co.establishConnection();
            res = new HashMap<String, PersonalDetailsPOJO>();
            String SQLQuery = "select * from "+db_name+".personal_details where Programme_Code = ? and Branch_Code = ?";
            PreparedStatement pst = con.prepareStatement(SQLQuery); //Create Statement to interact
            pst.setString(1, Programme_Code);
            pst.setString(2, Branch_Code);
            System.out.println(SQLQuery);
//            pst.setInt(3, year);
            
            ResultSet rs = pst.executeQuery();
            while (rs.next())
            {
                PersonalDetailsPOJO us = new PersonalDetailsPOJO();
                us.setEnrollment_Number(rs.getString("Enrollment_Number"));
                us.setFirst_Name(rs.getString("First_Name"));
                us.setLast_Name(rs.getString("Last_Name"));                
                us.setAadhar_Number(rs.getLong("Aadhar_Number"));
                
                us.setCategory(rs.getString("Category"));
                us.setTemp_Address(rs.getString("Temp_Address"));
                us.setPermanent_Address(rs.getString("Permanent_Address"));
                us.setAlt_Email_Id(rs.getString("Alt_Email_Id"));
                
                us.setFather_Name(rs.getString("Father_Name"));
                us.setFather_Occupation(rs.getString("Father_Occupation"));
                us.setFather_Office_Address(rs.getString("Father_Office_Address"));
                us.setFather_Contact_Number(rs.getString("Father_Contact_Number"));
                
                us.setMother_Name(rs.getString("Mother_Name"));
                us.setMother_Occupation(rs.getString("Mother_Occupation"));
                us.setMother_Office_Address(rs.getString("Mother_Office_Address"));
                us.setMother_Contact_Number(rs.getString("Mother_Contact_Number"));               
                
                us.setClass_X_School(rs.getString("Class_X_School"));
                us.setClass_X_Passing_Year(rs.getInt("Class_X_Passing_Year"));
                us.setClass_XII_or_Diploma(rs.getString("Class_XII_or_Diploma"));
                us.setClass_XII_Board(rs.getString("Class_XII_Board"));
                us.setClass_XII_School(rs.getString("Class_XII_School"));
                
                us.setProgramme_Code(Programme_Code);
                us.setBranch_Code(Branch_Code);
                
                res.put(rs.getString("Enrollment_Number"), us);
            } 
            con.close();
        }
        catch(Exception e)
        {
            System.err.println(e);
        }
        
        return res;
    }    
    
    public Map<String, EducationalPOJO> getStudentALLEducationalDetails(String Programme_Code, String Branch_Code, int year) throws SQLException
    {
        connection co = new connection();
        Map<String, EducationalPOJO> res = null;
        String db_name = "db_"+year;
        
        try  
        {
            Connection con = co.establishConnection();
            res = new HashMap<String, EducationalPOJO>();
            String SQLQuery = "select * from "+db_name+".result where enrollment_number LIKE '___"+Programme_Code+Branch_Code+"%'";
            PreparedStatement pst = con.prepareStatement(SQLQuery); //Create Statement to interact
            
            ResultSet rs = pst.executeQuery();
            while (rs.next())
            {
                EducationalPOJO edu = new EducationalPOJO();
                String erno = rs.getString("enrollment_number");
                int sem = rs.getInt("semester");
                
                if(res.containsKey(erno))
                {
                    edu = res.get(erno);                    
                }
                
                edu.setErno(erno);  
                
                IterateEducationalPOJO(edu, rs.getInt("total_marks"), rs.getInt("total_marks_credits"), 
                rs.getInt("total_credits"), rs.getFloat("percentage"), rs.getFloat("percentage_credits"), sem);
                
                res.put(erno, edu);
            }
            con.close();
        }
        catch(Exception e)
        {
            System.err.println(e);
        }
        
        return res;
    }

    Map<String, UnderGradPOJO> getStudentALLUnderGradDetails(String Programme_Code, String Branch_Code, int year) 
    {
        connection co = new connection();
        Map<String, UnderGradPOJO> res = null;
        String db_name = "db_"+year;
        
        try 
        { 
            Connection  con = co.establishConnection();
            res = new HashMap<String, UnderGradPOJO>();
            String SQLQuery = "select * from "+db_name+".undergraduatetable where Programme_Code = ? and Branch_Code = ?";
            PreparedStatement pst = con.prepareStatement(SQLQuery); //Create Statement to interact
            pst.setString(1, Programme_Code);
            pst.setString(2, Branch_Code);
            System.out.println(SQLQuery);
            
            ResultSet rs = pst.executeQuery();
            while (rs.next())
            {
                UnderGradPOJO us = new UnderGradPOJO();
                
                us.setEnrollment_Number(rs.getString("Enrollment_Number"));
                us.setDepartment(rs.getString("Department"));
                us.setCourse(rs.getString("Course"));                
                us.setInstitute_Name(rs.getString("Institute_Name"));
                us.setGender(rs.getString("Gender"));
                
                us.setDOB(rs.getDate("DOB"));
                us.setContact_Number(rs.getString("Contact_Number"));
                us.setAlt_Contact_Number(rs.getString("Alt_Contact_Number"));
                us.setEmailId(rs.getString("EmailId"));
                
                us.setClass_X_Board(rs.getString("Class_X_Board"));
                us.setClass_X_Percentage(rs.getDouble("Class_X_Percentage"));
                us.setClass_XII_or_Diploma_Percentage(rs.getDouble("Class_XII_or_Diploma_Percentage"));
                us.setClass_XII_or_Diploma_Passing_Year(rs.getInt("Class_XII_or_Diploma_Passing_Year"));
                
                us.setProgramme_Code(Programme_Code);
                us.setBranch_Code(Branch_Code);
                
                res.put(rs.getString("Enrollment_Number"), us);
            } 
            con.close();
        }
        catch(Exception e)
        {
            System.err.println(e);
        }
        
        return res;        
    }
    
    Map<String, PostGradPOJO> getStudentALLPostGradDetails(String Programme_Code, String Branch_Code, int year) 
    {
        connection co = new connection();
        Map<String, PostGradPOJO> res = null;
        String db_name = "db_"+year;
        
        try 
        { 
            Connection  con = co.establishConnection();
            res = new HashMap<String, PostGradPOJO>();
            String SQLQuery = "select * from "+db_name+".postgraduatetable where Programme_Code = ? and Branch_Code = ?";
            PreparedStatement pst = con.prepareStatement(SQLQuery); //Create Statement to interact
            pst.setString(1, Programme_Code);
            pst.setString(2, Branch_Code);
            System.out.println(SQLQuery);
            
            ResultSet rs = pst.executeQuery();
            while (rs.next())
            {
                PostGradPOJO us = new PostGradPOJO();
                
                us.setEnrollment_Number(rs.getString("Enrollment_Number"));
                System.out.println(" In DAOOOOOOO ------ "+rs.getString("Department"));
                us.setDepartment(rs.getString("Department"));
                us.setCourse(rs.getString("Course"));                
                us.setInstitute_Name(rs.getString("Institute_Name"));
                us.setGender(rs.getString("Gender"));
                
                us.setDOB(rs.getDate("DOB"));
                us.setContact_Number(rs.getString("Contact_Number"));
                us.setAlt_Contact_Number(rs.getString("Alt_Contact_Number"));
                us.setEmailId(rs.getString("EmailId"));
                
                us.setClass_X_Board(rs.getString("Class_X_Board"));
                us.setClass_X_Percentage(rs.getDouble("Class_X_Percentage"));
                us.setClass_XII_or_Diploma_Percentage(rs.getDouble("Class_XII_or_Diploma_Percentage"));
                us.setClass_XII_or_Diploma_Passing_Year(rs.getInt("Class_XII_or_Diploma_Passing_Year"));                
                
                us.setGraduationUniversity(rs.getString("GraduationUniversity"));
                us.setGraduationCollege(rs.getString("GraduationCollege"));
                us.setGraduation_Stream(rs.getString("Graduation_Stream"));
                us.setGraduation_Percentage(rs.getDouble("Graduation_Percentage"));
                us.setGraduation_Year(rs.getInt("Graduation_Year"));
                
                us.setProgramme_Code(Programme_Code);
                us.setBranch_Code(Branch_Code);
                
                res.put(rs.getString("Enrollment_Number"), us);
            } 
            con.close();
        }
        catch(Exception e)
        {
            System.err.println(e);
        }
        
        return res;
    }
    
    private void IterateEducationalPOJO(EducationalPOJO edu, int total_marks, int total_marks_credits, 
            int total_credits, float percentage, float percentage_credits, int sem)
    {
        if(sem==1)
        {
            edu.setTotal_Marks_Sem_1(total_marks);
            edu.setTotal_Marks_With_Credit_Sem_1(total_marks_credits);
            edu.setCredits_Obtained_Sem_1(total_credits);
            edu.setPercentage_Sem_1(percentage);
            edu.setPercenatge_With_Credit_Sem_1(percentage_credits);
        }
        else if(sem==2)
        {
            edu.setTotal_Marks_Sem_2(total_marks);
            edu.setTotal_Marks_With_Credit_Sem_2(total_marks_credits);
            edu.setCredits_Obtained_Sem_2(total_credits);
            edu.setPercentage_Sem_2(percentage);
            edu.setPercenatge_With_Credit_Sem_2(percentage_credits);
        }
        else if(sem==3)
        {
            edu.setTotal_Marks_Sem_3(total_marks);
            edu.setTotal_Marks_With_Credit_Sem_3(total_marks_credits);
            edu.setCredits_Obtained_Sem_3(total_credits);
            edu.setPercentage_Sem_3(percentage);
            edu.setPercenatge_With_Credit_Sem_3(percentage_credits);
        }
        else if(sem==4)
        {
            edu.setTotal_Marks_Sem_4(total_marks);
            edu.setTotal_Marks_With_Credit_Sem_4(total_marks_credits);
            edu.setCredits_Obtained_Sem_4(total_credits);
            edu.setPercentage_Sem_4(percentage);
            edu.setPercenatge_With_Credit_Sem_4(percentage_credits);
        }
        else if(sem==5)
        {
            edu.setTotal_Marks_Sem_5(total_marks);
            edu.setTotal_Marks_With_Credit_Sem_5(total_marks_credits);
            edu.setCredits_Obtained_Sem_5(total_credits);
            edu.setPercentage_Sem_5(percentage);
            edu.setPercenatge_With_Credit_Sem_5(percentage_credits);
        }
        else if(sem==6)
        {
            edu.setTotal_Marks_Sem_6(total_marks);
            edu.setTotal_Marks_With_Credit_Sem_6(total_marks_credits);
            edu.setCredits_Obtained_Sem_6(total_credits);
            edu.setPercentage_Sem_6(percentage);
            edu.setPercenatge_With_Credit_Sem_6(percentage_credits);
        }
        else if(sem==7)
        {
            edu.setTotal_Marks_Sem_7(total_marks);
            edu.setTotal_Marks_With_Credit_Sem_7(total_marks_credits);
            edu.setCredits_Obtained_Sem_7(total_credits);
            edu.setPercentage_Sem_7(percentage);
            edu.setPercenatge_With_Credit_Sem_7(percentage_credits);
        }
        else if(sem==8)
        {
            edu.setTotal_Marks_Sem_8(total_marks);
            edu.setTotal_Marks_With_Credit_Sem_8(total_marks_credits);
            edu.setCredits_Obtained_Sem_8(total_credits);
            edu.setPercentage_Sem_8(percentage);
            edu.setPercenatge_With_Credit_Sem_8(percentage_credits);
        }
        else if(sem==9)
        {
            edu.setTotal_Marks_Sem_9(total_marks);
            edu.setTotal_Marks_With_Credit_Sem_9(total_marks_credits);
            edu.setCredits_Obtained_Sem_9(total_credits);
            edu.setPercentage_Sem_9(percentage);
            edu.setPercenatge_With_Credit_Sem_9(percentage_credits);
        }
        else if(sem==10)
        {
            edu.setTotal_Marks_Sem_10(total_marks);
            edu.setTotal_Marks_With_Credit_Sem_10(total_marks_credits);
            edu.setCredits_Obtained_Sem_10(total_credits);
            edu.setPercentage_Sem_10(percentage);
            edu.setPercenatge_With_Credit_Sem_10(percentage_credits);
        }
        else if(sem==11)
        {
            edu.setTotal_Marks_Sem_11(total_marks);
            edu.setTotal_Marks_With_Credit_Sem_11(total_marks_credits);
            edu.setCredits_Obtained_Sem_11(total_credits);
            edu.setPercentage_Sem_11(percentage);
            edu.setPercenatge_With_Credit_Sem_11(percentage_credits);
        }
        else if(sem==12)
        {
            edu.setTotal_Marks_Sem_12(total_marks);
            edu.setTotal_Marks_With_Credit_Sem_12(total_marks_credits);
            edu.setCredits_Obtained_Sem_12(total_credits);
            edu.setPercentage_Sem_12(percentage);
            edu.setPercenatge_With_Credit_Sem_12(percentage_credits);
        }
    }
}
