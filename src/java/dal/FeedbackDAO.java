
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
import models.Feedback;

public class FeedbackDAO extends DBContext{

     Connection connection = null;
    DBContext dBContext = new DBContext();

    public List<Feedback> getAllFeedbackByProductId(int product_id) {
        try {
            connection = dBContext.openConnection();
        } catch (SQLException | ClassNotFoundException ex) {
            Logger.getLogger(FeedbackDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        List<Feedback> list = new ArrayList<>();
        String sql = "select * from Feedbacks where product_id = ? order by date desc";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, product_id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Feedback f = new Feedback();
                f.setFback_id(rs.getInt(1));
                f.setFullName(rs.getString(2));
                f.setRated_star(rs.getInt(3));
                f.setFeedback_content(rs.getString(4));
                f.setFeedback_image(rs.getString(5));
                f.setProduct_id(rs.getInt(6));
                f.setUser_id(rs.getInt(7));
                f.setDate(rs.getTimestamp(8));
                f.setAvatar_user(rs.getString(9));
                list.add(f);
            }
        } catch (SQLException e) {
            Logger.getLogger(FeedbackDAO.class.getName()).log(Level.SEVERE, null, e);
        } finally {
            try {
                dBContext.closeConnection(connection);
            } catch (SQLException e) {
            }
        }

        return list;
    }

    public List<Feedback> pagingFeedback(int product_id, int index, int record_per_page) {
        List<Feedback> list = getAllFeedbackByProductId(product_id);
        int begin = (index - 1) * record_per_page;
        List<Feedback> feedbacks = new ArrayList();
        int size = list.size() > (begin + record_per_page) ? (begin + record_per_page) : list.size();
        for (int i = begin; i < size; i++) {
            feedbacks.add(list.get(i));
        }
        return feedbacks;
    }
    
    public void deleteFeedbacktById(int id) {
        try {
            connection = dBContext.openConnection();
        } catch (SQLException | ClassNotFoundException ex) {
            Logger.getLogger(FeedbackDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        String sql = "DELETE FROM [dbo].Feedbacks \n"
                + "      WHERE fback_id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            st.executeUpdate();

        } catch (SQLException e) {
            Logger.getLogger(FeedbackDAO.class.getName()).log(Level.SEVERE, null, e);
        } finally {
            try {
                dBContext.closeConnection(connection);
            } catch (SQLException e) {
            }
        }
    }
    
    public void addNewFeedback(String fullName, int rated_star, String feedback_content, String image, int product_id, int user_id, String avatar_user) {
        try {
            connection = dBContext.openConnection();
        } catch (SQLException | ClassNotFoundException ex) {
            Logger.getLogger(FeedbackDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        try {
            String sql = "INSERT INTO Feedbacks values(?,?,?,?,?,?,GETDATE(),?);";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, fullName);
            st.setInt(2, rated_star);
            st.setString(3, feedback_content);
            st.setString(4, image);
            st.setInt(5, product_id);
            st.setInt(6, user_id);
            st.setString(7, avatar_user);
            st.executeUpdate();
        } catch (SQLException e) {
            Logger.getLogger(FeedbackDAO.class.getName()).log(Level.SEVERE, null, e);
        } finally {
            try {
                dBContext.closeConnection(connection);
            } catch (SQLException e) {
            }
        }
    }

    
}
