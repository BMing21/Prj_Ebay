
package controllers;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class LogoutController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession(false); // get the session associated with the request

        if (session != null) {
            session.invalidate(); // invalidate the session to remove all session data
        }
        response.sendRedirect("products");
    } 

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        processRequest(request, response);
    } 

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        HttpSession session = request.getSession(false); // get the session associated with the request
        if (session != null) {
            session.invalidate(); // invalidate the session to remove all session data
        }
        response.sendRedirect(request.getContextPath() + "/");
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
