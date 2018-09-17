package model;

public class CalendarPOJO 
{
    private int calID;
    private int date;
    private int month;
    private int year;
    private String deptName;
    private String courseName;
    private int yearOfDegree;
    private int companyID;
    private String EventInfo;

    public int getCalID() 
    { 
        System.out.println(" IN CAL POJO get CALID "+calID);
        return calID;
    }

    public void setCalID(int calID) {
        System.out.println(" IN CAL POJO set CALID "+calID);
        this.calID = calID;
    }

    public int getDate() {
        System.out.println(" IN CAL POJO get date "+date);
        return date;
    }

    public void setDate(int date) {
        System.out.println(" IN CAL POJO set date "+date);
        this.date = date;
    }

    public int getMonth() {
        System.out.println(" IN CAL POJO get month "+month);
        return month;
    }

    public void setMonth(int month) {
        System.out.println(" IN CAL POJO set month "+month);
        this.month = month;
    }

    public int getYear() {
        System.out.println(" IN CAL POJO get year "+year);
        return year;
    }

    public void setYear(int year) {
        System.out.println(" IN CAL POJO set year "+year);
        this.year = year;
    }

    public String getDeptName() {
        return deptName;
    }

    public void setDeptName(String deptName) {
        this.deptName = deptName;
    }

    public String getCourseName() {
        return courseName;
    }

    public void setCourseName(String courseName) {
        this.courseName = courseName;
    }

    public int getYearOfDegree() {
        System.out.println(" IN CAL POJO get yearOfDegree "+yearOfDegree);
        return yearOfDegree;
    }

    public void setYearOfDegree(int yearOfDegree) {
        System.out.println(" IN CAL POJO set yearOfDegree "+yearOfDegree);
        this.yearOfDegree = yearOfDegree;
    }

    public int getCompanyID() {
        System.out.println(" IN CAL POJO get companyID "+companyID);
        return companyID;
    }

    public void setCompanyID(int companyID) {
        System.out.println(" IN CAL POJO set companyID "+companyID);
        this.companyID = companyID;
    }

    public String getEventInfo() {
        System.out.println(" IN CAL POJO get EventInfo "+EventInfo);
        return EventInfo;
    }

    public void setEventInfo(String EventInfo) {
        System.out.println(" IN CAL POJO set EventInfo "+EventInfo);
        this.EventInfo = EventInfo;
    }
    
    
}
