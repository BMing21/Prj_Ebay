
package models;

import java.sql.Date;
public class Chart {
     private Date date;
    private int value;

    public Chart() {
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public int getValue() {
        return value;
    }

    public void setValue(int value) {
        this.value = value;
    }

    public Chart(Date date, int value) {
        this.date = date;
        this.value = value;
    }
    
}
