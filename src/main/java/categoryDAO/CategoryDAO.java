/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package categoryDAO;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.NoResultException;
import jakarta.persistence.Persistence;
import jakarta.persistence.TypedQuery;
import java.util.List;
import model.ProductCategories;
import model.Products;

/**
 *
 * @author nkmq21
 */
public class CategoryDAO {

    private EntityManagerFactory emf;
    private EntityManager em;

    public CategoryDAO() {
        emf = Persistence.createEntityManagerFactory("ligmaBallsPU");
        em = emf.createEntityManager();
    }

    public List<ProductCategories> categorizeProduct(String categoryID) throws NoResultException {
        TypedQuery<ProductCategories> query = (TypedQuery<ProductCategories>) em.createNamedQuery("ProductCategories.categorizeProductByCategoryID");
        query.setParameter("categoryID", categoryID);
        //return the product'id list which belong to the category
        return query.getResultList();
    }
    
    public static void main(String[] args) {
        CategoryDAO c = new CategoryDAO();
        List<ProductCategories> list = c.categorizeProduct("3");
        for (ProductCategories pro : list) {
            //ong noi lay thang bo lay thang con
            System.out.println(pro.getProductID().getProductName());
        }
    }
}
