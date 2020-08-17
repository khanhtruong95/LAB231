/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dal;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author ADMIN
 */
public class BaseDAO {

    protected Connection getConnection() throws ClassNotFoundException, SQLException {
        String user = "sa";
        String password = "0123456789";
        String url = "jdbc:sqlserver://localhost:1433;databaseName=LAB231_J3LP0018";
        Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
        return DriverManager.getConnection(url, user, password);
    }

    protected void closeConnection(Connection connection) throws SQLException {
        if (connection != null) {
            connection.close();
        }
    }

    protected PreparedStatement getStatement(Connection connection, String sql) throws SQLException {
        return connection.prepareStatement(sql);
    }

    protected void closeStatement(PreparedStatement statement) throws SQLException {
        if (statement != null) {
            statement.close();
        }
    }

    protected ResultSet getResultSet(PreparedStatement statement) throws SQLException {
        return statement.executeQuery();
    }

    protected void closeResultSet(ResultSet rs) throws SQLException {
        if (rs != null) {
            rs.close();
        }
    }
}
