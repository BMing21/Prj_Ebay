
package controllers;

import dal.OrderDAO;
import dal.ProductDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import models.Order;
import models.OrderDetail;
import models.Product;

public class OrderDetailsController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet OrderDetailsController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet OrderDetailsController at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        OrderDAO odd = new OrderDAO();
        ProductDAO pd = new ProductDAO();

        String orderId_raw = request.getParameter("order_id");
        String type = request.getParameter("type");
        request.setAttribute("typee", type);
        int orderId = Integer.parseInt(orderId_raw);
        Order order = odd.getOrderById(orderId);
        List<OrderDetail> order_details = odd.getOrderDetailByOrder(orderId);
        List<Product> products = pd.getAll();
        request.setAttribute("order", order);
        request.setAttribute("order_details", order_details);
        request.setAttribute("products", products);
        request.getRequestDispatcher("./views/order-details.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
