package productDAO;

import productDAO.*;
import java.util.List;
import model.*;
import java.sql.SQLException;

public interface IProductDAO {
//    public void insertProduct (Product pro) throws SQLException;

    public Product selectProduct (int id);
//
    public List<Product> selectAllProducts();
    
    public List<Product> searchProduct(String keyword);

//    public boolean deleteProduct (int id) throws SQLException;
//
//    public boolean updateProduct (Product pro) throws SQLException;
}
