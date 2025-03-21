package productDAO;

import productDAO.*;
import dao.DBConnection;
import java.sql.SQLException;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.*;

public class ProductDAO implements IProductDAO {

    private static final String LOGIN = "SELECT id from [Users] where name=? and password=?";
    private static final String SIMPLE_SEARCH = "SELECT * FROM [PRODUCTS] WHERE ProductName LIKE ?"; //muon tim theo nhieu thu thi them "OR ___ LIKE ?"
    private static final String INSERT_PRODUCT = "INSERT INTO Product(name, price, description, stock, import_date) values (?, ?, ?, ?, ?)";
    private static final String UPDATE_DATE = "UPDATE [Product] SET import_date = GETDATE() WHERE import_date IS NULL";
    private static final String SELECT_PRODUCT_BY_ID = "SELECT * FROM [Product] WHERE id=?";
    private static final String UPDATE_PRODUCT = "UPDATE [Product] SET name=?, price=?, description=?, stock=?, import_date=? where id=?";
    private static final String SELECT_ALL_PRODUCTS = "SELECT * FROM [Product]";
    private static final String DELETE_BY_ID = "DELETE FROM [Product] WHERE id=?";

    public boolean checkLogin(String productername, String password) {
        try (Connection con = DBConnection.getConnection(); PreparedStatement ptm = con.prepareStatement(LOGIN)) {

            ptm.setString(1, productername);
            ptm.setString(2, password);

            try (ResultSet rs = ptm.executeQuery()) {
                if (rs.next()) {
                    return true;
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

//    @Override
//    public void insertProduct(Product product) throws SQLException {
//        try (Connection con = DBConnection.getConnection(); PreparedStatement ps = con.prepareStatement(INSERT_PRODUCT)) {
//            ps.setString(1, product.getName());
//            ps.setDouble(2, product.getPrice());
//            ps.setString(3, product.getDesc());
//            ps.setInt(4, product.getStock());
//            ps.setString(5, product.getImport_date());
//            ps.executeUpdate();
//            
//            PreparedStatement ps2 = con.prepareStatement(UPDATE_DATE);
//            ps2.executeUpdate();
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//    }
    
    @Override
    public List<Product> searchProduct(String keyword) {
        List<Product> productList = new ArrayList<>();
        try (Connection con = DBConnection.getConnection(); PreparedStatement ps = con.prepareStatement(SIMPLE_SEARCH)) {
            ps.setString(1, "%" + keyword + "%");
            ResultSet rs = ps.executeQuery();
            while (rs.next())
                productList.add(new Product(rs.getInt("ProductID"), rs.getString("ProductName"), rs.getString("Description"), rs.getDouble("Price"), rs.getDate("CreatedDate"), rs.getInt("CompanyID")));
            con.close();
        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return productList;
    }

//    @Override
//    public Product selectProduct(int id) {
//        Product product = new Product();
//        try (Connection con = DBConnection.getConnection(); PreparedStatement ps = con.prepareStatement(SELECT_PRODUCT_BY_ID)) {
//            ps.setInt(1, id);
//            ResultSet rs = ps.executeQuery();
//            if (rs.next()) {
//                product.setId(rs.getInt("id"));
//                product.setName(rs.getString("name"));
//                product.setPrice(rs.getDouble("price"));
//                product.setDesc(rs.getString("description"));
//                product.setStock(rs.getInt("stock"));
//                product.setImport_date(rs.getString("import_date"));
//            }
//            con.close();
//        } catch (SQLException ex) {
//            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
//        }
//        return product;
//    }
//
//    @Override
//    public List<Product> selectAllProducts() {
//        List<Product> list = new ArrayList<>();
//        try (Connection con = DBConnection.getConnection(); PreparedStatement ps = con.prepareStatement(SELECT_ALL_PRODUCTS)) {
//            ResultSet rs = ps.executeQuery();
//            while (rs.next()) {
//                Product product = new Product();
//                product.setId(rs.getInt("id"));
//                product.setName(rs.getString("name"));
//                product.setPrice(rs.getDouble("price"));
//                product.setDesc(rs.getString("description"));
//                product.setStock(rs.getInt("stock"));
//                product.setImport_date(rs.getString("import_date"));
//                list.add(product);
//            }
//            con.close();
//        } catch (SQLException ex) {
//            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
//        }
//        return list;
//    }
//
//    @Override
//    public boolean deleteProduct(int id) throws SQLException {
//        try (Connection con = DBConnection.getConnection(); PreparedStatement ps = con.prepareStatement(DELETE_BY_ID)) {
//            ps.setInt(1, id);
//            return ps.executeUpdate() > 0;
//        }
//    }
//
//    @Override
//    public boolean updateProduct(Product product) throws SQLException {
//        try (Connection con = DBConnection.getConnection(); PreparedStatement ps = con.prepareStatement(UPDATE_PRODUCT)) {
//            ps.setString(1, product.getName());
//            ps.setDouble(2, product.getPrice());
//            ps.setString(3, product.getDesc());
//            ps.setInt(4, product.getStock());
//            ps.setString(5, product.getImport_date());
//            ps.setInt(6, product.getId());
//
//            return ps.executeUpdate() > 0;
//        }
//    }

    public static void main(String[] args) throws SQLException {
        ProductDAO dao = new ProductDAO();

//        Product product = new Product(21, "Razer Cobra", 40.00, "Lightweight gaming mouse", 2, "2025-02-13");
//        dao.insertProduct(product);
//        System.out.println(dao.selectProduct(11));
//        System.out.println(dao.selectAllProducts());
    }

}
