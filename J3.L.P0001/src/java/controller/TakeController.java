/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dal.QuizDAO;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Quiz;

/**
 *
 * @author ADMIN
 */
public class TakeController extends HttpServlet {

    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<Quiz> quizzes = new QuizDAO().selectAll();
        request.setAttribute("max", quizzes.size());
        request.getRequestDispatcher("/WEB-INF/view/take1.jsp").forward(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        if (request.getParameter("top") != null) {
            showQuizzes(request, response);
        } else {
            showResult(request, response);
        }
    }

    private void showQuizzes(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int top = Integer.parseInt(request.getParameter("top"));
        request.getSession().setAttribute("top", top);
        List<Quiz> quizzes = new QuizDAO().selectTop(top);
        request.getSession().setAttribute("quizzes", quizzes);
        request.getSession().setAttribute("maxIndex", quizzes.size() - 1);
        request.getRequestDispatcher("/WEB-INF/view/take2.jsp").forward(request, response);
    }

    private void showResult(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<Quiz> quizzes = (List<Quiz>) request.getSession().getAttribute("quizzes");
        int maxIndex = Integer.parseInt(request.getSession().getAttribute("maxIndex").toString());
        int correctAnswers = 0;
        for (int index = 0; index <= maxIndex; index++) {
            String answer = "";
            for (int i = 0; i <= 4; i++) {
                if (request.getParameter("quiz" + index + ".answer" + i) != null) {
                    answer += i;
                }
            }
            if (answer.equals(quizzes.get(index).getAnswer())) {
                correctAnswers++;
            }
        }
        double score = (double) correctAnswers / (maxIndex + 1) * 10;
        request.setAttribute("score", score);
        request.setAttribute("percentage", (int) (score * 10));
        request.setAttribute("status", score >= 5 ? "Passed" : "Failed");
        request.getRequestDispatcher("/WEB-INF/view/take3.jsp").forward(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override

    public String getServletInfo() {
        return "Short description";
    }
}
