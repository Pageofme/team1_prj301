package productDAO;

import java.sql.SQLException;
import java.util.List;
import model.*;
import jakarta.persistence.*;

public class ProductDAO implements IProductDAO {
    private EntityManagerFactory emf;
    private EntityManager em;
    public ProductDAO()
    {
        emf = Persistence.createEntityManagerFactory("ligmaBallsPU");
        em = emf.createEntityManager();
    }

    @Override
    public List<Products> searchProduct(String keyword) throws NoResultException 
    {
        TypedQuery<Products> query = em.createNamedQuery("Products.searchProducts", Products.class);
        query.setParameter("keyword", "%" + keyword + "%");
        return query.getResultList();
    }

    @Override
    public Products selectProduct(int id) throws NoResultException 
    {
        TypedQuery<Products> query = em.createNamedQuery("Products.selectByID", Products.class);
        query.setParameter("productID", id);
        return query.getSingleResult();
    }

    @Override
    public List<Products> selectAllProducts() throws NoResultException 
    {
        TypedQuery<Products> query = em.createNamedQuery("Products.selectAll", Products.class);
        return query.getResultList();
    }
    
    public void close() 
    {
        if (em != null && em.isOpen()) 
            em.close();
        if (emf != null && emf.isOpen()) 
            emf.close();
    }

    public static void main(String[] args) throws SQLException 
    {
        ProductDAO dao = new ProductDAO();
        List<Products> list = dao.selectAllProducts();
        System.out.println(list);
    }

}
