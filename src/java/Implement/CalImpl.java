package Implement;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import model.CalendarPOJO;
import model.OtherCalendarPOJO;

public class CalImpl 
{
    public ArrayList<CalendarPOJO> getCal(int date, int month, int year) throws SQLException
    {
        connection co = new connection();
        ArrayList<CalendarPOJO> res= null;
        
        try 
        {
            Connection con = co.establishConnection();
            res = new ArrayList<CalendarPOJO>();
            
            String SQLQuery = "select calID, deptName, courseName, yearOfDegree, companyID, EventInfo from calendar where date = ? and month_ = ? and year_ = ?";
            PreparedStatement pst = con.prepareStatement(SQLQuery); //Create Statement to interact
            pst.setInt(1, date);
            pst.setInt(2, month);
            pst.setInt(3, year);
            
            ResultSet rs = pst.executeQuery();
            System.out.println("before ");
            while (rs.next())
            {
                CalendarPOJO cp = new CalendarPOJO();
                cp.setCalID(rs.getInt("calID"));
                cp.setDeptName(rs.getString("deptName"));
                cp.setCourseName(rs.getString("courseName"));
                cp.setYearOfDegree(rs.getInt("yearOfDegree"));
                cp.setCompanyID(rs.getInt("companyID"));
                cp.setEventInfo(rs.getString("EventInfo"));
                
                cp.setDate(date);
                cp.setMonth(month);
                cp.setYear(year);
                
                res.add(cp);
            }
        con.close();
        }
        catch(Exception e)
        {
            
        }
        
        getAllCompany();
        return res;
    }
    
    public ArrayList<OtherCalendarPOJO> getotherCal(int date, int month, int year) throws SQLException
    {
        connection co = new connection();
        ArrayList<OtherCalendarPOJO> res = null;
        try
        {
            Connection con = co.establishConnection();
            res = new ArrayList<OtherCalendarPOJO>();
            
            String SQLQuery = "select * from otherCalendar where date = ? and month_ = ? and year_ = ?";
            PreparedStatement pst = con.prepareStatement(SQLQuery); //Create Statement to interact
            pst.setInt(1, date);
            pst.setInt(2, month);
            pst.setInt(3, year);
            
            ResultSet rs = pst.executeQuery();
            
            while (rs.next())
            {
                OtherCalendarPOJO ocp = new OtherCalendarPOJO();
                ocp.setOcalID(rs.getInt("ocalID"));
                ocp.setEventtype(rs.getString("eventtype"));
                ocp.setEventInfo(rs.getString("EventInfo"));
                
                ocp.setDate(date);
                ocp.setMonth(month);
                ocp.setYear(year);
                
                res.add(ocp);
             }
            con.close();
        }
        catch(Exception e)
        {
            
        }
        return res;
    }
    
    public String findCompanyName(int companyID) throws SQLException 
    {        
        connection co = new connection();
        String companyName = "";
        try
        {
            Connection con = co.establishConnection();
            String SQLQuery = "select company_name, profile from company_details where company_id = "+companyID;
            ResultSet rs;
            try
            {
                Statement st = con.createStatement();
                rs = st.executeQuery(SQLQuery);
                while(rs.next())
                {
                    companyName = rs.getString("company_name")+" "+rs.getString("profile");
                }
                
                con.close();
                rs.close();
            }
            catch(Exception e)
            {
                
            }
        }
        catch(Exception e)
        {
            
        }
        
        return companyName;
    }

    public void getAllCompany() throws SQLException 
    {    
        connection co = new connection();
        try
        {
            Connection con = co.establishConnection();
            String SQLQuery = "select * from company ";
            ResultSet rs;
            try
            {
                Statement st = con.createStatement();
                rs = st.executeQuery(SQLQuery);
                    System.out.println();
                while(rs.next())
                {
                    System.out.println("Company : "+rs.getInt(1)+" "+rs.getString(2));
                }
                    System.out.println();
                    con.close();
                    rs.close();
            }
            catch(Exception e)
            {}
        }
        catch(Exception e)
        {}        
    }
}