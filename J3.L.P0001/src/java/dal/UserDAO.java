/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.User;

/**
 *
 * @author ADMIN
 */
public class UserDAO extends BaseDAO {

    public List<User> selectAll() {
        List<User> users = new ArrayList<>(0);
        String sql = "SELECT * FROM [Users]\n"
                + "INNER JOIN [Roles] ON [Users].[RoleID]=[Roles].[RoleID];";
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                User user = new User();
                user.setUserID(rs.getInt("UserID"));
                user.setUsername(rs.getString("Username"));
                user.setPassword(rs.getString("Password"));
                user.setRoleName(rs.getString("RoleName"));
                user.setEmail(rs.getString("Email"));
                users.add(user);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return users;
    }

    public void insert(String username, String password, int roleID, String email) {
        String sql = "INSERT INTO [Users]([Username],[Password],[RoleID],[Email]) VALUES (?,?,?,?);";
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, username);
            statement.setString(2, password);
            statement.setInt(3, roleID);
            statement.setString(4, email);
            statement.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }

    public User selectByUsername(String username) {
        String sql = "SELECT * FROM [Users]\n"
                + "INNER JOIN [Roles] ON [Users].[RoleID]=[Roles].[RoleID]\n"
                + "WHERE [Username]=?;";
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, username);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                User user = new User();
                user.setUserID(rs.getInt("UserID"));
                user.setUsername(rs.getString("Username"));
                user.setPassword(rs.getString("Password"));
                user.setRoleName(rs.getString("RoleName"));
                user.setEmail(rs.getString("Email"));
                return user;
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return null;
    }
}
