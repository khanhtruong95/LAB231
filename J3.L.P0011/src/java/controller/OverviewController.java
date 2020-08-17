/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dal.EntryDAO;
import java.io.IOException;
import java.sql.Date;
import java.sql.SQLException;
import java.time.LocalDate;
import java.time.YearMonth;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Entry;

/**
 *
 * @author ADMIN
 */
public class OverviewController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            List<List<Entry>> lists = new ArrayList<>(0);
            List<Entry> entries = new EntryDAO().selectAll();
            YearMonth ym = getYearMonth(entries.get(0).getPublished());
            List<Entry> list = new ArrayList<>(0);
            for (Entry entry : entries) {
                YearMonth temp = getYearMonth(entry.getPublished());
                if (temp.equals(ym)) {
                    list.add(entry);
                } else {
                    lists.add(list);
                    list = new ArrayList<>(0);
                    list.add(entry);
                    ym = temp;
                }
            }
            lists.add(list);
            request.setAttribute("lists", lists);
            request.getRequestDispatcher("/WEB-INF/view/overview.jsp").forward(request, response);
        } catch (ClassNotFoundException | SQLException ex) {
            request.getRequestDispatcher("/WEB-INF/view/error.jsp").forward(request, response);
        }
    }

    private YearMonth getYearMonth(Date date) {
        LocalDate localDate = date.toLocalDate();
        return YearMonth.of(localDate.getYear(), localDate.getMonthValue());
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
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
        processRequest(request, response);
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
        processRequest(request, response);
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
