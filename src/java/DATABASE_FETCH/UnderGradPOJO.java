package DATABASE_FETCH;

import java.sql.Date;

public class UnderGradPOJO 
{
    String Enrollment_Number;
    String Department ="", Course ="";  
    
    String Institute_Name ="";
    String Gender ="";    
    Date DOB;
    
    String Contact_Number ="", Alt_Contact_Number ="", EmailId ="";
    
    String Class_X_Board ="";
    Double Class_X_Percentage, Class_XII_or_Diploma_Percentage;
    int Class_XII_or_Diploma_Passing_Year;
    
    String Programme_Code ="", Branch_Code ="";

    public String getEnrollment_Number() {
        return Enrollment_Number;
    }

    public void setEnrollment_Number(String Enrollment_Number) {
        this.Enrollment_Number = Enrollment_Number;
    }

    public String getDepartment() {
        return Department;
    }

    public void setDepartment(String Department) {
        this.Department = Department;
    }

    public String getCourse() {
        return Course;
    }

    public void setCourse(String Course) {
        this.Course = Course;
    }

    public String getInstitute_Name() {
        return Institute_Name;
    }

    public void setInstitute_Name(String Institute_Name) {
        this.Institute_Name = Institute_Name;
    }

    public String getGender() {
        return Gender;
    }

    public void setGender(String Gender) {
        this.Gender = Gender;
    }

    public Date getDOB() {
        return DOB;
    }

    public void setDOB(Date DOB) {
        this.DOB = DOB;
    }

    public String getContact_Number() {
        return Contact_Number;
    }

    public void setContact_Number(String Contact_Number) {
        this.Contact_Number = Contact_Number;
    }

    public String getAlt_Contact_Number() {
        return Alt_Contact_Number;
    }

    public void setAlt_Contact_Number(String Alt_Contact_Number) {
        this.Alt_Contact_Number = Alt_Contact_Number;
    }

    public String getEmailId() {
        return EmailId;
    }

    public void setEmailId(String EmailId) {
        this.EmailId = EmailId;
    }

    public String getClass_X_Board() {
        return Class_X_Board;
    }

    public void setClass_X_Board(String Class_X_Board) {
        this.Class_X_Board = Class_X_Board;
    }

    public Double getClass_X_Percentage() {
        return Class_X_Percentage;
    }

    public void setClass_X_Percentage(Double Class_X_Percentage) {
        this.Class_X_Percentage = Class_X_Percentage;
    }

    public Double getClass_XII_or_Diploma_Percentage() {
        return Class_XII_or_Diploma_Percentage;
    }

    public void setClass_XII_or_Diploma_Percentage(Double Class_XII_or_Diploma_Percentage) {
        this.Class_XII_or_Diploma_Percentage = Class_XII_or_Diploma_Percentage;
    }

    public int getClass_XII_or_Diploma_Passing_Year() {
        return Class_XII_or_Diploma_Passing_Year;
    }

    public void setClass_XII_or_Diploma_Passing_Year(int Class_XII_or_Diploma_Passing_Year) {
        this.Class_XII_or_Diploma_Passing_Year = Class_XII_or_Diploma_Passing_Year;
    }

    public String getProgramme_Code() {
        return Programme_Code;
    }

    public void setProgramme_Code(String Programme_Code) {
        this.Programme_Code = Programme_Code;
    }

    public String getBranch_Code() {
        return Branch_Code;
    }

    public void setBranch_Code(String Branch_Code) {
        this.Branch_Code = Branch_Code;
    }
}