/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.NoResultException;
import jakarta.persistence.Persistence;
import jakarta.persistence.TypedQuery;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Users;

/**
 *
 * @author ADMIN
 */
@WebServlet(name = "AuthServlet", urlPatterns
        = {
            "/authservlet"
        })

public class AuthServlet extends HttpServlet {
    private static final EntityManagerFactory emf=Persistence.createEntityManagerFactory("ligmaBallsPU");
    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error oc curs
     */
    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    private boolean isValidEmail(String email) {
        String regex = "^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,}$";
        return email.matches(regex);
    }

    private boolean isValidPassword(String password) {
        String regex = "^(?=.*[A-Z])(?=.*\\d)(?=.*[\\W_]).{8,}$";
        return password.matches(regex);
    }

    protected void handleLogin(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        if (email == null || password == null) {
            request.setAttribute("message", "Vui lòng nhập đầy đủ thông tin!");
            request.setAttribute("messageType", "error");
            request.getRequestDispatcher("ligmaShop/login/signIn.jsp").forward(request, response);
            return;
        }

        EntityManager em = emf.createEntityManager();
        try {
            TypedQuery<Users> query = em.createQuery(
                    "SELECT u FROM Users u WHERE u.email = :email AND u.password = :password", Users.class);
            query.setParameter("email", email);
            query.setParameter("password", password);

            Users user = null;
            try {
                user = query.getSingleResult();
            } catch (NoResultException e) {
                user = null;
            }

            if (user != null) {
                HttpSession session = request.getSession();
                session.setAttribute("user", user);
                response.sendRedirect(request.getContextPath()+"/test");
            } else {
                request.setAttribute("message", "Email hoặc mật khẩu không đúng!");
                request.setAttribute("messageType", "error");
                request.getRequestDispatcher("ligmaShop/login/signIn.jsp").forward(request, response);
            }
        } finally {
            em.close();
        }
    }

    protected void handleRegister(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
    String fullname = request.getParameter("fullname");
    String email = request.getParameter("email");
    String phone = request.getParameter("phone");
    String password = request.getParameter("password");

    if (!isValidEmail(email)) {
        response.sendRedirect("ligmaShop/login/register.jsp?error=invalid_email");
        return;
    }
//    if (!isValidPassword(password)) {
//        response.sendRedirect("ligmaShop/login/register.jsp?error=invalid_password");
//        return;
//    }
//    if (!isValidPhone(phone)) {
//        response.sendRedirect("ligmaShop/login/register.jsp?error=invalid_phone");
//        return;
//    }

    EntityManager em = emf.createEntityManager();
    try {
        // Kiểm tra email đã tồn tại chưa
        TypedQuery<Long> query = em.createQuery("SELECT COUNT(u) FROM Users u WHERE u.email = :email", Long.class);
        query.setParameter("email", email);
        Long count = query.getSingleResult();

        if (count > 0) {
            response.sendRedirect("ligmaShop/login/register.jsp?error=email_exists");
            return;
        }

        // Băm mật khẩu
//        String hashedPassword = BCrypt.hashpw(password, BCrypt.gensalt(12));

        // Lưu user mới vào database
        em.getTransaction().begin();
        Users newUser = new Users();
        newUser.setFullName(fullname);
        newUser.setEmail(email);
        newUser.setPhoneNumber(phone);
        newUser.setPassword(password);
        em.persist(newUser);
        em.getTransaction().commit();

        response.sendRedirect("ligmaShop/login/signIn.jsp?success=registered");
    } catch (Exception e) {
        response.sendRedirect("ligmaShop/login/register.jsp?error=registration_failed");
    } finally {
        em.close();
    }
}

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session=request.getSession();
        session.invalidate();
        response.sendRedirect(request.getContextPath()+"/test");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
            System.out.println("action empty");
        } else {
            System.out.println(action);
        }
        switch (action) {
            case "login":
                handleLogin(request, response);
                break;
            case "register":
                handleRegister(request, response);
                break;
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
