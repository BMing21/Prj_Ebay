
package dal;

import context.DBContext;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import models.Cart;
import models.Chart;
import models.Order;
import models.OrderDetail;

public class OrderDAO extends DBContext {

    Connection connection = null;
    DBContext dBContext = new DBContext();

    public Order checkProductOrderByUser(int userId, int product_id) {
        try {
            connection = dBContext.openConnection();
        } catch (SQLException | ClassNotFoundException ex) {
            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        String sql = "select * from Orders o join OrderDetails od on o.id = od.order_id \n"
                + "where o.customer_id = ? and od.product_id = ? and o.status <> 'completed'";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, userId);
            st.setInt(2, product_id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Order c = new Order();
                c.setId(rs.getInt(1));
                return c;
            }
        } catch (SQLException ex) {
            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                dBContext.closeConnection(connection);
            } catch (SQLException e) {
            }
        }
        return null;
    }

    public int createNewOrder(int sum, String fullname, String email, String phone, String address, int user_id, String note) {
        try {
            connection = dBContext.openConnection();
        } catch (SQLException | ClassNotFoundException ex) {
            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        String sql = "INSERT INTO [dbo].[Orders](customer_id, customer_name, email, phone,"
                + " address, note, order_datetime, total_cost, status) values "
                + "(?,?,?,?,?,?,GETDATE(), ?, 'pending')";

        try {
            PreparedStatement st = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            st.setInt(1, user_id);
            st.setString(2, fullname);
            st.setString(3, email);
            st.setString(4, phone);
            st.setString(5, address);
            st.setString(6, note);
            st.setInt(7, sum);
            st.executeUpdate();
            ResultSet rs = st.getGeneratedKeys();
            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException ex) {
            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                dBContext.closeConnection(connection);
            } catch (SQLException e) {
            }
        }
        return 0;

    }

    public void addCartToOrderDetails(List<Cart> listCart, int order_id) {
        try {
            connection = dBContext.openConnection();
        } catch (SQLException | ClassNotFoundException ex) {
            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        try {
            for (Cart cart : listCart) {
                String sql = "INSERT INTO [dbo].[OrderDetails] values (?,?,?,?)";
                PreparedStatement st = connection.prepareStatement(sql);

                st.setInt(1, order_id);
                st.setInt(2, cart.getProduct_id());
                st.setInt(3, cart.getQuantity());
                st.setFloat(4, cart.getTotal_cost());

                st.executeUpdate();
            }
        } catch (SQLException ex) {
            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                dBContext.closeConnection(connection);
            } catch (SQLException e) {
            }
        }

    }

    public List<Order> getAllOrder() {
        try {
            connection = dBContext.openConnection();
        } catch (ClassNotFoundException | SQLException e) {
        }
        List<Order> list = new ArrayList();
        String sql = "select  * from Orders where status <> 'completed'";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Order o = new Order();
                o.setId(rs.getInt(1));
                o.setCustomer_id(rs.getInt(2));
                o.setCustomer_name(rs.getString(3));
                o.setEmail(rs.getString(4));
                o.setPhone(rs.getString(5));
                o.setAddress(rs.getString(6));
                o.setNote(rs.getString(7));
                o.setOrder_datetime(rs.getDate(8));
                o.setTotal_cost(rs.getInt(9));
                o.setStatus(rs.getString(10));
                list.add(o);
            }
        } catch (SQLException ex) {
            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                dBContext.closeConnection(connection);
            } catch (SQLException e) {
            }
        }
        return list;
    }

    public List<Order> pagingOrder(int index, int RECORD_PER_PAGE, String key, String statusStr) {
        try {
            connection = dBContext.openConnection();
        } catch (ClassNotFoundException | SQLException e) {

        }
        List<Order> list = new ArrayList();
        String sql = "select * from Orders where status " + statusStr + " and ((address like N'%" + key + "%') or"
                + " (customer_name like N'%" + key + "%') or (phone like N'%" + key + "%'))";

        sql += " order by id  offset ? rows fetch next ? rows only;";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, (index - 1) * RECORD_PER_PAGE);
            ps.setInt(2, RECORD_PER_PAGE);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Order o = new Order();
                o.setId(rs.getInt(1));
                o.setCustomer_id(rs.getInt(2));
                o.setCustomer_name(rs.getString(3));
                o.setEmail(rs.getString(4));
                o.setPhone(rs.getString(5));
                o.setAddress(rs.getString(6));
                o.setNote(rs.getString(7));
                o.setOrder_datetime(rs.getDate(8));
                o.setTotal_cost(rs.getInt(9));
                o.setStatus(rs.getString(10));
                list.add(o);
            }
        } catch (SQLException ex) {
            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                dBContext.closeConnection(connection);
            } catch (SQLException e) {
            }
        }
        return list;
    }

    public int countOrderByStatus(String key, String statusStr) {
        try {
            connection = dBContext.openConnection();
        } catch (ClassNotFoundException | SQLException e) {
        }
        try {

            String sql = "select count(*) from Orders where status " + statusStr + " and ((address like N'%" + key + "%') or"
                    + " (customer_name like N'%" + key + "%') or (phone like N'%" + key + "%'))";

            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException ex) {
            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                dBContext.closeConnection(connection);
            } catch (SQLException e) {
            }
        }
        return -1;

    }

    public Order getOrderById(int orderId) {
        try {
            connection = dBContext.openConnection();
        } catch (SQLException | ClassNotFoundException ex) {
            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        try {
            String sql = "select * from Orders where id = ?";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, orderId);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Order o = new Order();
                o.setId(rs.getInt(1));
                o.setCustomer_id(rs.getInt(2));
                o.setCustomer_name(rs.getString(3));
                o.setEmail(rs.getString(4));
                o.setPhone(rs.getString(5));
                o.setAddress(rs.getString(6));
                o.setNote(rs.getString(7));
                o.setOrder_datetime(rs.getDate(8));
                o.setTotal_cost(rs.getInt(9));
                o.setStatus(rs.getString(10));
                return o;
            }
        } catch (SQLException ex) {
            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                dBContext.closeConnection(connection);
            } catch (SQLException e) {
            }
        }
        return null;
    }

    public List<OrderDetail> getOrderDetailByOrder(int orderId) {
        try {
            connection = dBContext.openConnection();
        } catch (SQLException | ClassNotFoundException ex) {
            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        List<OrderDetail> list = new ArrayList<>();
        try {
            String sql = "select * from OrderDetails where order_id = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, orderId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                OrderDetail od = new OrderDetail();
                od.setOrder_id(rs.getInt(1));
                od.setProduct_id(rs.getInt(2));
                od.setQuantity(rs.getInt(3));
                od.setPrice(rs.getInt(4));
                list.add(od);
            }
        } catch (SQLException ex) {
            try {
                dBContext.closeConnection(connection);
            } catch (SQLException e) {
            }
        }
        return list;
    }

    public Boolean handleOrder(String status, int order_id) {
        String sqlUpdateStatus = "UPDATE Orders SET status = ? WHERE id = ?";
        try {
            connection = dBContext.openConnection();
        } catch (SQLException | ClassNotFoundException ex) {
            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        }
        try {
            connection.setAutoCommit(false); // Bắt đầu transaction
            // Luôn cập nhật status bất kể là "completed" hay không
            PreparedStatement st = connection.prepareStatement(sqlUpdateStatus);
            st.setString(1, status);
            st.setInt(2, order_id);
            st.executeUpdate();

            connection.commit(); // Hoàn tất transaction
            return true;

        } catch (SQLException ex) {
            try {
                connection.rollback(); // Rollback nếu có lỗi
            } catch (SQLException e) {
                Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, e);
            }
            return false;
        } finally {
            try {
                dBContext.closeConnection(connection);
            } catch (SQLException e) {
                Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, e);
            }
        }
    }

    public List<Chart> getChartRevenueArea(String start, int numberOfDay) {
         try {
            connection = dBContext.openConnection();
        } catch (ClassNotFoundException | SQLException e) {

        }
        List<Chart> list = new ArrayList<>();
        for (int i = 0; i < numberOfDay; i++) {
            int value = 0;
            try {
                String sql = "SELECT SUM(total_cost)\n"
                        + "FROM (\n"
                        + "  SELECT *\n"
                        + "  FROM Orders\n"
                        + "  WHERE status = 'completed' \n"
                        + ") AS orders_with_status\n"
                        + "WHERE order_datetime BETWEEN ? AND DATEADD(DAY,?,?)";
                PreparedStatement st = connection.prepareStatement(sql);
                st.setString(1, start);
                st.setInt(2, i);
                st.setString(3, start);
                ResultSet rs = st.executeQuery();
                if (rs.next()) {
                    value = rs.getInt(1);
                }
                sql = "select  DATEADD(DAY, ?, ?)";
                st = connection.prepareStatement(sql);
                st.setInt(1, i);
                st.setString(2, start);
                rs = st.executeQuery();
                if (rs.next()) {
                    Chart c = new Chart();
                    c.setDate(rs.getDate(1));
                    c.setValue(value);
                    list.add(c);
                }
            } catch (SQLException ex) {
                Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        try {
            dBContext.closeConnection(connection);
        } catch (SQLException e) {
        }

        return list;
    }

    public int gettotalOrderByStatus(String pending, String start, int numberOfDay) {
        try {
            connection = dBContext.openConnection();
        } catch (ClassNotFoundException | SQLException e) {
        }
        int sum = 0;
        for (int i = 0; i < numberOfDay; i++) {
            try {
                String sql = "select count(id) from Orders where status = ? and order_datetime"
                        + " between ? and DATEADD(DAY, ?,?)";
                PreparedStatement st = connection.prepareStatement(sql);
                st.setString(1, pending);
                st.setString(2, start);
                st.setInt(3, i);
                st.setString(4, start);
                ResultSet rs = st.executeQuery();
                if (rs.next()) {
                    sum += rs.getInt(1);
                }
            } catch (SQLException ex) {
                Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        try {
            dBContext.closeConnection(connection);
        } catch (SQLException e) {
        }
        return sum;
    }

    public List<Order> getMyOrder(int userId) {
        try {
            connection = dBContext.openConnection();
        } catch (ClassNotFoundException | SQLException e) {
        }
        List<Order> list = new ArrayList();
        String sql = "select  * from Orders where customer_id = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, userId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Order o = new Order();
                o.setId(rs.getInt(1));
                o.setCustomer_id(rs.getInt(2));
                o.setCustomer_name(rs.getString(3));
                o.setEmail(rs.getString(4));
                o.setPhone(rs.getString(5));
                o.setAddress(rs.getString(6));
                o.setNote(rs.getString(7));
                o.setOrder_datetime(rs.getDate(8));
                o.setTotal_cost(rs.getInt(9));
                o.setStatus(rs.getString(10));
                list.add(o);
            }
        } catch (SQLException ex) {
            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                dBContext.closeConnection(connection);
            } catch (SQLException e) {
            }
        }
        return list;
    }

}
