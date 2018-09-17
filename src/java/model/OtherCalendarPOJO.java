package model;

public class OtherCalendarPOJO 
{
    private int ocalID;
    private int date;
    private int month;
    private int year;
    private String eventtype;
    private String EventInfo;

    public int getOcalID() {
        return ocalID;
    }

    public void setOcalID(int ocalID) {
        this.ocalID = ocalID;
    }

    public int getDate() {
        return date;
    }

    public void setDate(int date) {
        this.date = date;
    }

    public int getMonth() {
        return month;
    }

    public void setMonth(int month) {
        this.month = month;
    }

    public int getYear() {
        return year;
    }

    public void setYear(int year) {
        this.year = year;
    }

    public String getEventtype() {
        return eventtype;
    }

    public void setEventtype(String eventtype) {
        this.eventtype = eventtype;
    }

    public String getEventInfo() {
        return EventInfo;
    }

    public void setEventInfo(String EventInfo) {
        this.EventInfo = EventInfo;
    }
    
    
}
