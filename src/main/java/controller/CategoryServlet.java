package controller;

import categoryDAO.CategoryDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;
import model.Categories;
import model.ProductCategories;
import model.Products;
import productDAO.ProductDAO;
import weatherDAO.*;

@WebServlet(name = "CategoryServlet", urlPatterns = {"/category"})
public class CategoryServlet extends HttpServlet {

    ProductDAO productDAO = new ProductDAO();
    CategoryDAO categoryDAO = new CategoryDAO();
    String location = " ";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String categoryID = request.getParameter("cID");
        if (categoryID == null) {
            response.getWriter().println("Invalid category ID");
            return;
        }
        List<Products> products = new ArrayList<>();
        List<Categories> listCategory = productDAO.selectAllCategory();

        //categorized products list
        products = categorizeProductWithWeather(Integer.parseInt(categoryID));

        request.setAttribute("products", products);
        request.setAttribute("category", listCategory);
        request.getRequestDispatcher("ligmaShop/login/guest.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        location = request.getParameter("location");
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
    
    private List<Products> categorizeProductWithWeather(int categoryID) {
        List<ProductCategories> productsWithWeather = new ArrayList<>();
        double temp = (double) WeatherFunction.getWeatherData(location).get("temperature");
        if (temp >= 10)
            productsWithWeather = categoryDAO.categorizeProductWithWeather(categoryID, "hot");
        else
            productsWithWeather = categoryDAO.categorizeProductWithWeather(categoryID, "cold");
        
        List<Products> productList = new ArrayList<>();
        
        for (ProductCategories items : productsWithWeather) {
            //this productID IS A PRODUCT
            productList.add(items.getProductID());
        }
        return productList;
    } 
}
