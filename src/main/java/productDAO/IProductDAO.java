package productDAO;

import productDAO.*;
import java.util.List;
import model.*;
import java.sql.SQLException;

public interface IProductDAO {
//    public void insertProduct (Product pro) throws SQLException;

    public Products selectProduct (int id);
//
    public List<Products> selectAllProducts();
    
    public List<Products> searchProduct(String keyword);

//    public boolean deleteProduct (int id) throws SQLException;
//
//    public boolean updateProduct (Product pro) throws SQLException;
}
