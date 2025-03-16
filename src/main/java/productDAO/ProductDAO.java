package productDAO;

import java.sql.SQLException;
import java.util.List;
import model.*;
import jakarta.persistence.*;

public class ProductDAO implements IProductDAO {

    private EntityManagerFactory emf;
    private EntityManager em;

    public ProductDAO() {
        emf = Persistence.createEntityManagerFactory("ligmaBallsPU");
        em = emf.createEntityManager();
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
    
    public List<Products> findProductsCategoryByWeather(int categoryID, String keyword) {
        TypedQuery<Products> query = (TypedQuery<Products>) em.createNamedQuery("Products.findCategoryByWeather");
        query.setParameter("categoryID", categoryID);
        query.setParameter("keyword", "%" + keyword + "%");
        return query.getResultList();
    }

    public void close() {
        if (em != null && em.isOpen()) {
            em.close();
        }
        if (emf != null && emf.isOpen()) {
            emf.close();
        }
    }

    public static void main(String[] args) {
        ProductDAO cate = new ProductDAO();
//        List<Categories> list = cate.selectAllCategory();
//        for (Categories categories : list) {
//            System.out.println("name: " + categories.getCategoryName());
//            System.out.println("description: " + categories.getDescription());
//        }
        
        int categoryID = 3;
        String keyword = "Áo";
        
        
        List<Products> listP = cate.findProductsCategoryByWeather(categoryID, keyword);
        for (Products products : listP) {
            System.out.println(products.getProductName());
        }
        
    }

}
