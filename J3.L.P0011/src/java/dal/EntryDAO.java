/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dal;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Entry;

/**
 *
 * @author ADMIN
 */
public class EntryDAO extends BaseDAO {

    public List<Entry> selectTop(int top) throws ClassNotFoundException, SQLException {
        List<Entry> entries = new ArrayList<>(0);
        String sql = "SELECT TOP(?) * FROM [Entries]\n"
                + "INNER JOIN [Categories] ON [Entries].[CategoryID]=[Categories].[CategoryID]\n"
                + "ORDER BY [Entries].[Published] DESC;";
        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet rs = null;
        try {
            connection = getConnection();
            statement = getStatement(connection, sql);
            statement.setInt(1, top);
            rs = getResultSet(statement);
            while (rs.next()) {
                Entry entry = new Entry();
                entry.setEntryID(rs.getInt("EntryID"));
                entry.setCategoryName(rs.getNString("CategoryName"));
                entry.setHeading(rs.getNString("Heading"));
                entry.setPublished(rs.getDate("Published"));
                entry.setImageName(rs.getNString("ImageName"));
                entry.setAuthor(rs.getNString("Author"));
                entry.setContent(rs.getNString("Content"));
                entries.add(entry);
            }
        } finally {
            closeResultSet(rs);
            closeStatement(statement);
            closeConnection(connection);
        }
        return entries;
    }

    public List<Entry> selectAll() throws ClassNotFoundException, SQLException {
        List<Entry> entries = new ArrayList<>(0);
        String sql = "SELECT * FROM [Entries]\n"
                + "INNER JOIN [Categories] ON [Entries].[CategoryID]=[Categories].[CategoryID]\n"
                + "ORDER BY [Entries].[Published] DESC;";
        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet rs = null;
        try {
            connection = getConnection();
            statement = getStatement(connection, sql);
            rs = getResultSet(statement);
            while (rs.next()) {
                Entry entry = new Entry();
                entry.setEntryID(rs.getInt("EntryID"));
                entry.setCategoryName(rs.getNString("CategoryName"));
                entry.setHeading(rs.getNString("Heading"));
                entry.setPublished(rs.getDate("Published"));
                entry.setImageName(rs.getNString("ImageName"));
                entry.setAuthor(rs.getNString("Author"));
                entry.setContent(rs.getNString("Content"));
                entries.add(entry);
            }
        } finally {
            closeResultSet(rs);
            closeStatement(statement);
            closeConnection(connection);
        }
        return entries;
    }

    public Entry selectByEntryID(int entryID) throws ClassNotFoundException, SQLException {
        String sql = "SELECT * FROM [Entries]\n"
                + "INNER JOIN [Categories] ON [Entries].[CategoryID]=[Categories].[CategoryID]\n"
                + "WHERE [Entries].[EntryID]=?\n"
                + "ORDER BY [Entries].[Published] DESC;";
        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet rs = null;
        try {
            connection = getConnection();
            statement = getStatement(connection, sql);
            statement.setInt(1, entryID);
            rs = getResultSet(statement);
            while (rs.next()) {
                Entry entry = new Entry();
                entry.setEntryID(rs.getInt("EntryID"));
                entry.setCategoryName(rs.getNString("CategoryName"));
                entry.setHeading(rs.getNString("Heading"));
                entry.setPublished(rs.getDate("Published"));
                entry.setImageName(rs.getNString("ImageName"));
                entry.setAuthor(rs.getNString("Author"));
                entry.setContent(rs.getNString("Content"));
                return entry;
            }
        } finally {
            closeResultSet(rs);
            closeStatement(statement);
            closeConnection(connection);
        }
        return null;
    }
}
