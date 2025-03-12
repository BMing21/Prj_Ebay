
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
import models.Cart;
import models.Product;
import models.User;

public class CartDAO extends DBContext {

    Connection connection = null;
    DBContext dBContext = new DBContext();

    public List<Cart> getCartInfoByUserId(int userId) {
        try {
            connection = dBContext.openConnection();
        } catch (SQLException | ClassNotFoundException ex) {
            Logger.getLogger(CartDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        List<Cart> list = new ArrayList<>();
        String sql = "select * from Carts where [customer_id] = ?";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, userId);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Cart c = new Cart();
                c.setCustomer_id(rs.getInt(1));
                c.setProduct_id(rs.getInt(2));
                c.setQuantity(rs.getInt(3));
                c.setTotal_cost(rs.getInt(4));

                UserDAO ud = new UserDAO();
                User u = ud.getUserById(userId);
                c.setCustomer(u);
                ProductDAO id = new ProductDAO();
                Product d = id.getProductByID(rs.getInt(2));
                c.setProduct(d);

                list.add(c);
            }
        } catch (SQLException ex) {
            Logger.getLogger(CartDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                dBContext.closeConnection(connection);
            } catch (SQLException e) {
            }
        }
        return list;
    }

    public Cart checkCart(int user_id, int product_id) {
        try {
            connection = dBContext.openConnection();
        } catch (SQLException | ClassNotFoundException ex) {
            Logger.getLogger(CartDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        String sql = "select top 1* from Carts where [customer_id] = ? and product_id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, user_id);
            st.setInt(2, product_id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Cart c = new Cart();
                c.setCustomer_id(rs.getInt(1));
                c.setProduct_id(rs.getInt(2));
                c.setQuantity(rs.getInt(3));
                c.setTotal_cost(rs.getInt(4));
                ProductDAO pd = new ProductDAO();
                c.setProduct(pd.getProductByID(rs.getInt(2)));
                return c;
            }
        } catch (SQLException ex) {
            Logger.getLogger(CartDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                dBContext.closeConnection(connection);
            } catch (SQLException e) {
            }
        }
        return null;
    }

    public void addToCart(int product_id, int quantity, int total_cost, int user_id) {
        try {
            connection = dBContext.openConnection();
        } catch (SQLException | ClassNotFoundException ex) {
            Logger.getLogger(CartDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        try {
            String sql = "insert into Carts values(?,?,?,?);";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, user_id);
            st.setInt(2, product_id);
            st.setInt(3, quantity);
            st.setInt(4, total_cost);
            st.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(CartDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                dBContext.closeConnection(connection);
            } catch (SQLException e) {
            }
        }
    }

    public void updateQuantityProductInCart(int product_id, int quantity, int total_cost, int user_id) {
        try {
            connection = dBContext.openConnection();
        } catch (SQLException | ClassNotFoundException ex) {
            Logger.getLogger(CartDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        try {
            String sql = "UPDATE Carts "
                    + "   SET [quantity] = ? \n"
                    + "      ,[total_cost] = ? \n"
                    + " WHERE [product_id] = ? and [customer_id] = ?";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, quantity);
            st.setFloat(2, total_cost);
            st.setInt(3, product_id);
            st.setInt(4, user_id);
            st.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(CartDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                dBContext.closeConnection(connection);
            } catch (SQLException e) {
            }
        }
    }

    public int getTotalItemInCart(int userId) {
        int total = 0;
        try {
            connection = dBContext.openConnection();
        } catch (SQLException | ClassNotFoundException ex) {
            Logger.getLogger(CartDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        String sql = "select sum(quantity) as totalItem from Carts where customer_id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, userId);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                total = rs.getInt("totalItem");
            }
        } catch (SQLException ex) {
            Logger.getLogger(CartDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                dBContext.closeConnection(connection);
            } catch (SQLException e) {
            }
        }
        return total;
    }

    public void deleteCart(int product_id, int user_id) {
        try {
            connection = dBContext.openConnection();
        } catch (SQLException | ClassNotFoundException ex) {
            Logger.getLogger(CartDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        try {
            String sql = "DELETE FROM [dbo].[Carts]\n"
                    + "      WHERE [product_id] = ? and [customer_id] = ? ";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, product_id);
            st.setInt(2, user_id);
            st.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(CartDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                dBContext.closeConnection(connection);
            } catch (SQLException e) {
            }
        }
    }

    public void deleteCartByUserId(int user_id) {
        try {
            connection = dBContext.openConnection();
        } catch (SQLException | ClassNotFoundException ex) {
            Logger.getLogger(CartDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        try {
            String sql = "DELETE FROM [dbo].[Carts]\n"
                    + "      WHERE [customer_id] = ?";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, user_id);
            st.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(CartDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                dBContext.closeConnection(connection);
            } catch (SQLException e) {
            }
        }
    }
}
