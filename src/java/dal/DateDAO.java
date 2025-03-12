
package dal;

import context.DBContext;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import models.DateObject;

public class DateDAO extends DBContext{
    Connection connection = null;
    DBContext dBContext = new DBContext();
    
    public DateObject get7day() {
        DateObject date;
        try {
            connection = dBContext.openConnection();
        } catch (SQLException | ClassNotFoundException ex) {
            Logger.getLogger(DateDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        try {
            String sql = "select GETDATE(), GETDATE()-6";

            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();

            if (rs.next()) {
                date = new DateObject();
                date.setStart(rs.getDate(2));
                date.setEnd(rs.getDate(1));

                return date;
            }

        } catch (SQLException ex) {
            Logger.getLogger(DateDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                dBContext.closeConnection(connection);
            } catch (SQLException e) {
            }
        }
        return null;
    }

    public int countDayByStartEnd(String start, String end) {
        try {
            connection = dBContext.openConnection();
        } catch (SQLException | ClassNotFoundException ex) {
            Logger.getLogger(DateDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        String sql = "SELECT DATEDIFF(day, ?, ?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, start);
            st.setString(2, end);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return rs.getInt(1) + 1;
            }
        } catch (SQLException ex) {
            Logger.getLogger(DateDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                dBContext.closeConnection(connection);
            } catch (SQLException e) {
            }
        }
        return 0;
    }
}
