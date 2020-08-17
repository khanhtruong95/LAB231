/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package filter;

import java.io.IOException;
import java.util.Arrays;
import java.util.List;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.User;

/**
 *
 * @author ADMIN
 */
public class AuthorizationFilter implements Filter {

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        HttpServletRequest httpServletRequest = (HttpServletRequest) request;
        HttpServletResponse httpServletResponse = (HttpServletResponse) response;
        if (!isAuthorized(httpServletRequest)) {
            System.out.println("Authorization");
            String referer = httpServletRequest.getHeader("Referer");
            httpServletResponse.sendRedirect(referer);
            return;
        }
        chain.doFilter(request, response);
    }

    private boolean isAuthorized(HttpServletRequest request) {
        String url = request.getServletPath();
        User user = (User) request.getSession().getAttribute("user");
        switch (user.getRoleName()) {
            case "Teacher":
                return isTeacherAuthorized(url);
            case "Student":
                return isStudentAuthorized(url);
            default:
                return false;
        }
    }

    private boolean isTeacherAuthorized(String url) {
        List<String> urls = Arrays.asList("/take", "/make", "/manage");
        return urls.contains(url);
    }

    private boolean isStudentAuthorized(String url) {
        List<String> urls = Arrays.asList("/take");
        return urls.contains(url);
    }

    @Override
    public void destroy() {
    }
}
