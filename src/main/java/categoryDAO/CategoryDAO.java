package categoryDAO;

import dao.DBConnection;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.NoResultException;
import jakarta.persistence.Persistence;
import jakarta.persistence.TypedQuery;
import java.util.List;
import model.ProductCategories;

public class CategoryDAO
{

    private EntityManager em;

    public CategoryDAO()
    {
        em = DBConnection.getEntityManager();
    }

    public List<ProductCategories> categorizeProductWithWeather(int categoryID, String condition) throws NoResultException
    {
        String[] hotKeywords =
        {
            "ngắn", "sơ", "jean", "kaki", "thể thao", "croptop", "sát", "nắng"
        };
        String[] coldKeywords =
        {
            "khoác", "jean", "kaki", "len", "hoodie", "dài", "cổ"
        };

        // Base query with parameter placeholders
        StringBuilder query = new StringBuilder("SELECT p FROM ProductCategories p WHERE p.categoryID.categoryID = :categoryID AND (");

        // Select keywords based on condition
        String[] keywords = condition.equalsIgnoreCase("hot") ? hotKeywords : coldKeywords;

        // Build LIKE clauses for each keyword with parameters
        for (int i = 0; i < keywords.length; i++)
        {
            query.append("p.productID.productName LIKE :keyword").append(i);
            if (i < keywords.length - 1)
            {
                query.append(" OR ");
            }
        }
        query.append(")");

        // Create and parameterize the query
        TypedQuery<ProductCategories> typedQuery = em.createQuery(query.toString(), ProductCategories.class);
        typedQuery.setParameter("categoryID", categoryID);
        for (int i = 0; i < keywords.length; i++)
        {
            typedQuery.setParameter("keyword" + i, "%" + keywords[i] + "%");
        }

        // Debugging
        System.out.println("Generated Query: " + query.toString());
        return typedQuery.getResultList();
    }

    public static void main(String[] args)
    {
        CategoryDAO c = new CategoryDAO();
//        List<ProductCategories> list = c.categorizeProduct(1, "nô lệ");
//        for (ProductCategories pro : list) {
//            //ong noi lay thang bo lay thang con
//            System.out.println(pro.getProductID());
//        }
    }
}
