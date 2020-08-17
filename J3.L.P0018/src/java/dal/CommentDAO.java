/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dal;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

/**
 *
 * @author ADMIN
 */
public class CommentDAO extends BaseDAO {

    public void insert(String name, String email, String message) throws ClassNotFoundException, SQLException {
        String sql = "INSERT INTO [Comments]([Name],[Email],[Message]) VALUES (?,?,?);";
        Connection connection = null;
        PreparedStatement statement = null;
        try {
            connection = getConnection();
            statement = getStatement(connection, sql);
            statement.setNString(1, name);
            statement.setNString(2, email);
            statement.setNString(3, message);
            statement.executeUpdate();
        } finally {
            closeStatement(statement);
            closeConnection(connection);
        }
    }
}
