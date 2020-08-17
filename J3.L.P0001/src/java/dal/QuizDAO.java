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
import model.Quiz;

/**
 *
 * @author ADMIN
 */
public class QuizDAO extends BaseDAO {

    public void insert(String question, String option1, String option2, String option3, String option4, String answer, int userID) {
        String sql = "INSERT INTO [Quizzes]\n"
                + "([Question],[Option1],[Option2],[Option3],[Option4],[Answer],[UserID],[Created]) VALUES\n"
                + "(?,?,?,?,?,?,?,GETDATE());";
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, question);
            statement.setString(2, option1);
            statement.setString(3, option2);
            statement.setString(4, option3);
            statement.setString(5, option4);
            statement.setString(6, answer);
            statement.setInt(7, userID);
            statement.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }

    public List<Quiz> selectByUserID(int userID) {
        List<Quiz> quizzes = new ArrayList<>(0);
        String sql = "SELECT * FROM [Quizzes]\n"
                + "WHERE [UserID]=?;";
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, userID);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                Quiz quiz = new Quiz();
                quiz.setQuizID(rs.getInt("QuizID"));
                quiz.setQuestion(rs.getString("Question"));
                quiz.setOption1(rs.getString("Option1"));
                quiz.setOption2(rs.getString("Option2"));
                quiz.setOption3(rs.getString("Option3"));
                quiz.setOption4(rs.getString("Option4"));
                quiz.setAnswer(rs.getString("Answer"));
                quiz.setUserID(rs.getInt("UserID"));
                quiz.setCreated(rs.getDate("Created"));
                quizzes.add(quiz);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return quizzes;
    }

    public List<Quiz> selectAll() {
        List<Quiz> quizzes = new ArrayList<>(0);
        String sql = "SELECT * FROM [Quizzes];";
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                Quiz quiz = new Quiz();
                quiz.setQuizID(rs.getInt("QuizID"));
                quiz.setQuestion(rs.getString("Question"));
                quiz.setOption1(rs.getString("Option1"));
                quiz.setOption2(rs.getString("Option2"));
                quiz.setOption3(rs.getString("Option3"));
                quiz.setOption4(rs.getString("Option4"));
                quiz.setAnswer(rs.getString("Answer"));
                quiz.setUserID(rs.getInt("UserID"));
                quiz.setCreated(rs.getDate("Created"));
                quizzes.add(quiz);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return quizzes;
    }

    public List<Quiz> selectTop(int top) {
        List<Quiz> quizzes = new ArrayList<>(0);
        String sql = "SELECT TOP (?) * FROM [Quizzes]\n"
                + "ORDER BY NEWID();";
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, top);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                Quiz quiz = new Quiz();
                quiz.setQuizID(rs.getInt("QuizID"));
                quiz.setQuestion(rs.getString("Question"));
                quiz.setOption1(rs.getString("Option1"));
                quiz.setOption2(rs.getString("Option2"));
                quiz.setOption3(rs.getString("Option3"));
                quiz.setOption4(rs.getString("Option4"));
                quiz.setAnswer(rs.getString("Answer"));
                quiz.setUserID(rs.getInt("UserID"));
                quiz.setCreated(rs.getDate("Created"));
                quizzes.add(quiz);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return quizzes;
    }
}
