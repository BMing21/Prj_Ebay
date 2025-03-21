
package models;

import java.sql.Date;

public class DateObject {
     private java.sql.Date start;
    private java.sql.Date end;

    public DateObject() {
    }

    public DateObject(Date start, Date end) {
        this.start = start;
        this.end = end;
    }

    public Date getStart() {
        return start;
    }

    public void setStart(Date start) {
        this.start = start;
    }

    public Date getEnd() {
        return end;
    }

    public void setEnd(Date end) {
        this.end = end;
    }
    
    
}
