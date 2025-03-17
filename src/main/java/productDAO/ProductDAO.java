package productDAO;

import dao.DBConnection;
import java.util.List;
import model.*;
import jakarta.persistence.*;

public class ProductDAO implements IProductDAO {

    private EntityManager em;

    public ProductDAO() {
        em = DBConnection.getEntityManager();
    }

    @Override
    public List<Products> searchProduct(String keyword) throws NoResultException {
        TypedQuery<Products> query = em.createNamedQuery("Products.searchProducts", Products.class);
        query.setParameter("keyword", "%" + keyword + "%");
        return query.getResultList();
    }

    @Override
    public Products selectProduct(int id) throws NoResultException {
        TypedQuery<Products> query = em.createNamedQuery("Products.selectByID", Products.class);
        query.setParameter("productID", id);
        return query.getSingleResult();
    }

    @Override
    public List<Products> selectAllProducts() throws NoResultException {
        TypedQuery<Products> query = em.createNamedQuery("Products.selectAll", Products.class);
        return query.getResultList();
    }
    
    //retrieve a category list from Categories table
    //pass this information to the ProductServlet to display on the USER PAGE FUCKING USER PAGE NIGGER
    public List<Categories> selectAllCategory() throws NoResultException {
        TypedQuery<Categories> query = em.createNamedQuery("Categories.findAll", Categories.class);
        return query.getResultList();
    }
}
