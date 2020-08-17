/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dal.RoleDAO;
import dal.UserDAO;
import dal.UserRoleDAO;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Role;
import model.User;

/**
 *
 * @author ADMIN
 */
public class RegisterController extends HttpServlet {

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
        List<Role> roles = new RoleDAO().selectAll();
        request.setAttribute("roles", roles);
        request.getRequestDispatcher("/WEB-INF/view/register.jsp").forward(request, response);
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
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        int roleID = Integer.parseInt(request.getParameter("roleID"));
        String email = request.getParameter("email");
        if (isUsernameExisted(username)) {
            List<Role> roles = new RoleDAO().selectAll();
            request.setAttribute("roles", roles);
            request.getRequestDispatcher("/WEB-INF/view/register.jsp").forward(request, response);
        }
        new UserDAO().insert(username, password, roleID, email);
        int userID = new UserDAO().selectByUsername(username).getUserID();
        new UserRoleDAO().insert(userID, roleID);
        response.sendRedirect("login");
    }

    private boolean isUsernameExisted(String username) {
        List<User> users = new UserDAO().selectAll();
        for (User user : users) {
            if (user.getUsername().equals(username)) {
                return true;
            }
        }
        return false;
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
