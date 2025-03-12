
package controllers;

import dal.OrderDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class UpdateOrderController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet UpdateOrderController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet UpdateOrderController at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String status = request.getParameter("status");
        int order_id = Integer.parseInt(request.getParameter("order_id"));
        OrderDAO od = new OrderDAO();
        Boolean b = od.handleOrder(status, order_id);
        HttpSession ses = request.getSession();
        if (b) {
            ses.setAttribute("noti", "Xử lý đơn hàng " + order_id + " thành công.");
        }
        response.sendRedirect(request.getContextPath() + "/manage-order");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String status = request.getParameter("status");
        int order_id = Integer.parseInt(request.getParameter("order_id"));
        OrderDAO od = new OrderDAO();
        Boolean b = od.handleOrder(status, order_id);
        HttpSession ses = request.getSession();
        if (b) {
            ses.setAttribute("noti", "Xử lý đơn hàng " + order_id + " thành công.");
        }
        response.sendRedirect(request.getContextPath() + "/manage-order");
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
