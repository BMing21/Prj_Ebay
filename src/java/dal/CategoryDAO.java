
package dal;

import context.DBContext;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import models.Category;

public class CategoryDAO extends DBContext {

    Connection connection = null;
    DBContext dBContext = new DBContext();

    public List<Category> getCategoryList() {
        List<Category> list = new ArrayList();
        try {
            connection = dBContext.openConnection();
            String sql = "SELECT * FROM Categories";
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                list.add(new Category(rs.getInt("id"), rs.getString("name")));
            }
        } catch (SQLException | ClassNotFoundException ex) {
            Logger.getLogger(CategoryDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                dBContext.closeConnection(connection);
            } catch (SQLException e) {
                Logger.getLogger(CategoryDAO.class.getName()).log(Level.SEVERE, null, e);
            }
        }
        return list;
    }

    Category getCategoryById(int aInt) {
        try {
            connection = dBContext.openConnection();
            String sql = "SELECT * FROM Categories where id = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, aInt);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                Category c = new Category();
                c.setId(rs.getInt(1));
                c.setName(rs.getString(2));
                return c;
            }
        } catch (SQLException | ClassNotFoundException ex) {
            Logger.getLogger(CategoryDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                dBContext.closeConnection(connection);
            } catch (SQLException e) {
                Logger.getLogger(CategoryDAO.class.getName()).log(Level.SEVERE, null, e);
            }
        }
        return null;
    }
}
