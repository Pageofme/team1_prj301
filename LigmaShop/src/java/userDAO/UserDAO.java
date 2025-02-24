package userDAO;

import dao.DBConnection;
import java.util.List;
import model.User;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UserDAO implements IUserDAO
{

    private static final String LOGIN = "SELECT UserID from [Users] where userName=? and password=?";
    private static final String LOGIN1 = "SELECT id, userName, role from [Users] where userName=? and password=?";
    private static final String INSERT_USER = "INSERT INTO Users (username, email, country, role, status, password) VALUES (?, ?, ?, ?, ?, ?)";
    private static final String SELECT_USER_BY_ID = "SELECT FROM Users WHERE id= ?";
    private static final String UPDATE_USER = "UPDATE Users SET username ?, email?, country ?, role ?, status ?, password ? WHERE id = ?";
    private static final String SELECT_ALL_USERS = "select * from users";

    public static User checklogin1(String name, String password)
    {
        PreparedStatement pstm = null;
        ResultSet rs = null;
        User us = null;
        try (Connection con = DBConnection.getConnection())
        {
            String sql = LOGIN;
            pstm = con.prepareStatement(sql);
            pstm.setString(1, name);
            pstm.setString(2, password);
            rs = pstm.executeQuery();
            if (rs.next())
            {
                int id = rs.getInt("id");
                String user = rs.getString("userName");
                String role = rs.getString("Role");
                us = new User(id, user, "", role);
            }
        } catch (Exception e)
        {
            e.printStackTrace();
        }
        return us;
    }

    @Override
    public void insertUser(User user) throws SQLException
    {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public User selectUser(int id)
    {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public List<User> selectAllUsers()
    {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public boolean deleteUser(int id) throws SQLException
    {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public boolean updateUser(User user) throws SQLException
    {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

}
