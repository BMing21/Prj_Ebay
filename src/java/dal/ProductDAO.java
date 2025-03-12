
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
import models.Image;
import models.Product;

public class ProductDAO extends DBContext {

    Connection connection = null;
    DBContext dBContext = new DBContext();

    public List<Product> filterPaging(int index, int record_per_page, String searchKey, String categoryId, String type, String value) {
        List<Product> list = new ArrayList<>();
        String query = "select * from Products where category_id " + categoryId + " and name like N'%" + searchKey + "%' "
                + "order by " + value + " " + type + " offset ? rows fetch next ? rows only;";
        try {
            connection = dBContext.openConnection();
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setInt(1, (index - 1) * record_per_page);
            ps.setInt(2, record_per_page);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Product d = new Product();
                d.setId(rs.getInt("id"));
                d.setName(rs.getString("name"));
                d.setQuantity(rs.getInt("quantity"));
                d.setDescription(rs.getString("description"));
                d.setUnitprice(rs.getInt("unitprice"));
                d.setCategory_id(rs.getInt("category_id"));
                d.setImages(getImagesOfProduct(rs.getInt("id")));
                list.add(d);
            }
        } catch (SQLException e) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, e);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                dBContext.closeConnection(connection);
            } catch (SQLException e) {
            }
        }

        return list;
    }

    private List<Image> getImagesOfProduct(int aInt) {
        List<Image> list = new ArrayList<>();
        String sql = "select * from ProductsImages di join Images "
                + "i on di.image_id = i.id where di.product_id=?";
        try {
            connection = dBContext.openConnection();
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, aInt);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Image i = new Image();
                i.setId(rs.getInt(3));
                i.setUrl(rs.getString(4));
                list.add(i);
            }
        } catch (SQLException e) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, e);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                dBContext.closeConnection(connection);
            } catch (SQLException e) {
            }
        }
        return list;
    }

    public int countProductByCondition(String searchKey, String categoryId) {
        try {
            // index: trang click
            connection = dBContext.openConnection();
        } catch (SQLException | ClassNotFoundException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        String query = "select count(*) from Products where category_id " + categoryId + "  and name like N'%" + searchKey + "%' ";
        try {
            PreparedStatement ps = connection.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException e) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, e);
        } finally {
            try {
                dBContext.closeConnection(connection);
            } catch (SQLException e) {
            }
        }
        return -1;
    }

    public List<Product> getAll() {
        List<Product> list = new ArrayList<>();
        String query = "select * from Products ";
        try {
            connection = dBContext.openConnection();
            PreparedStatement ps = connection.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Product d = new Product();
                d.setId(rs.getInt("id"));
                d.setName(rs.getString("name"));
                d.setQuantity(rs.getInt("quantity"));
                d.setDescription(rs.getString("description"));
                d.setUnitprice(rs.getInt("unitprice"));
                d.setCategory_id(rs.getInt("category_id"));
                CategoryDAO cd = new CategoryDAO();
                d.setCategory(cd.getCategoryById(rs.getInt("category_id")));
                d.setImages(getImagesOfProduct(rs.getInt(1)));
                list.add(d);
                System.out.println("hihi");
            }
        } catch (SQLException e) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, e);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                dBContext.closeConnection(connection);
            } catch (SQLException e) {
            }
        }

        return list;
    }

    public Product getProductByID(int product_id) {
        String query = "select * from Products where id=?";
        try {
            connection = dBContext.openConnection();
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setInt(1, product_id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                Product d = new Product();
                d.setId(rs.getInt("id"));
                d.setName(rs.getString("name"));
                d.setQuantity(rs.getInt("quantity"));
                d.setDescription(rs.getString("description"));
                d.setUnitprice(rs.getInt("unitprice"));
                d.setCategory_id(rs.getInt("category_id"));
                d.setImages(getImagesOfProduct(rs.getInt("id")));
                return d;
            }
        } catch (SQLException e) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, e);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                dBContext.closeConnection(connection);
            } catch (SQLException e) {
            }
        }
        return null;
    }

    public List<Product> getRelatedProduct(int product_id, int category_id) {
        List<Product> list = new ArrayList<>();
        String query = "select * from Products where category_id=? and id <> ? ";
        try {
            connection = dBContext.openConnection();
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setInt(1, category_id);
            ps.setInt(2, product_id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Product d = new Product();
                d.setId(rs.getInt("id"));
                d.setName(rs.getString("name"));
                d.setQuantity(rs.getInt("quantity"));
                d.setDescription(rs.getString("description"));
                d.setUnitprice(rs.getInt("unitprice"));
                d.setCategory_id(rs.getInt("category_id"));
                d.setImages(getImagesOfProduct(rs.getInt("id")));

                list.add(d);
            }
        } catch (SQLException e) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, e);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                dBContext.closeConnection(connection);
            } catch (SQLException e) {
            }
        }
        return list;
    }

    public int getTotalProduct() {
        try {
            connection = dBContext.openConnection();
        } catch (SQLException | ClassNotFoundException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        String sql = "select COUNT(id) from Products";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException e) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, e);
        } finally {
            try {
                dBContext.closeConnection(connection);
            } catch (SQLException e) {
            }
        }
        return 0;
    }

    public void updateProduct(Product d) {
        try {
            connection = dBContext.openConnection();
        } catch (SQLException | ClassNotFoundException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        String sql = "UPDATE Products set name = ? , unitprice = ? ,  description = ? ,"
                + "  category_id = ?, quantity = ? where id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, d.getName());
            st.setInt(2, d.getUnitprice());
            st.setString(3, d.getDescription());
            st.setInt(4, d.getCategory_id());
            st.setInt(5, d.getQuantity());
            st.setInt(6, d.getId());
            st.executeUpdate();
        } catch (SQLException e) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, e);
        } finally {
            try {
                dBContext.closeConnection(connection);
            } catch (SQLException e) {
            }
        }
    }

    public int createProduct(Product d) {
        int dishId = -1;
        try {
            connection = dBContext.openConnection();
        } catch (SQLException | ClassNotFoundException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        String sql = "Insert into Products (name,unitprice,description,"
                + " category_id, quantity) values (?,?,?,?,?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            st.setString(1, d.getName());
            st.setInt(2, d.getUnitprice());
            st.setString(3, d.getDescription());
            st.setInt(4, d.getCategory_id());
            st.setInt(5, d.getQuantity());

            st.executeUpdate();
            ResultSet rs = st.getGeneratedKeys();
            if (rs.next()) {
                dishId = rs.getInt(1);
            }
        } catch (SQLException e) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, e);
        } finally {
            try {
                dBContext.closeConnection(connection);
            } catch (SQLException e) {
            }
        }
        return dishId;

    }

    public int createImage(String base64Image) {
        int imageId = -1;
        try {
            connection = dBContext.openConnection();
        } catch (SQLException | ClassNotFoundException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        String sql = "INSERT INTO Images (url) VALUES (?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            st.setString(1, base64Image);

            // Thực thi câu lệnh
            st.executeUpdate();

            // Lấy ID tự động sinh ra
            ResultSet rs = st.getGeneratedKeys();
            if (rs.next()) {
                imageId = rs.getInt(1);
            }
        } catch (SQLException e) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, e);
        } finally {
            try {
                dBContext.closeConnection(connection);
            } catch (SQLException e) {
            }
        }

        return imageId;
    }

    public void saveImageToProduct(int newdishId, int newimageId) {
        try {
            connection = dBContext.openConnection();
        } catch (SQLException | ClassNotFoundException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        String sql = "INSERT INTO ProductsImages (product_id, image_id) VALUES (?, ?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, newdishId);
            st.setInt(2, newimageId);
            // Thực thi câu lệnh
            st.executeUpdate();
        } catch (SQLException e) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, e);
        } finally {
            try {
                dBContext.closeConnection(connection);
            } catch (SQLException e) {
            }
        }
    }

    public void deleteProduct(int parseInt) {
        try {
            connection = dBContext.openConnection();
        } catch (SQLException | ClassNotFoundException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        
        try {
            String sql = "Delete FROM OrderDetails where product_id = ?";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, parseInt);
            st.executeUpdate();
            sql = "Delete FROM Feedbacks  where product_id = ?";
            st = connection.prepareStatement(sql);
            st.setInt(1, parseInt);
            st.executeUpdate();
            sql = "Delete FROM Carts   where product_id = ?";
            st = connection.prepareStatement(sql);
            st.setInt(1, parseInt);
            st.executeUpdate();
            sql = "Delete FROM ProductsImages    where product_id = ?";
            st = connection.prepareStatement(sql);
            st.setInt(1, parseInt);
            st.executeUpdate();
            sql = "Delete FROM Products     where id = ?";
            st = connection.prepareStatement(sql);
            st.setInt(1, parseInt);
            // Thực thi câu lệnh
            st.executeUpdate();
        } catch (SQLException e) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, e);
        } finally {
            try {
                dBContext.closeConnection(connection);
            } catch (SQLException e) {
            }
        }
    }

}
