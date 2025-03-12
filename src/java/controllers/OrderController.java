
package controllers;

import dal.CartDAO;
import dal.OrderDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;
import models.Cart;
import models.User;

public class OrderController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        String fullname = request.getParameter("fullName");
        String phone = request.getParameter("phone").trim();
        String email = request.getParameter("email").trim();
        String address = request.getParameter("address").trim();
        String note = request.getParameter("note").trim();
        CartDAO cd = new CartDAO();
        OrderDAO od = new OrderDAO();

        List<Cart> listCart = (List<Cart>) session.getAttribute("listCart");
        if (listCart == null || listCart.isEmpty()) { // trường hợp click vào history browser
            //session.setAttribute("notification", "Giỏ hàng rỗng");
            response.sendRedirect("list-product");
        } else {
            int sum = (int) session.getAttribute("sum");
            User u = (User) session.getAttribute("user");
            int user_id = u.getUserId();
            int order_id = od.createNewOrder(sum, fullname, email, phone, address, user_id, note);
            od.addCartToOrderDetails(listCart, order_id);
            cd.deleteCartByUserId(user_id);
            session.setAttribute("totalItem", 0);
            request.setAttribute("sum", sum);
            request.setAttribute("order_id", order_id);
            request.setAttribute("fullName", fullname);
            request.setAttribute("email", email);
            request.setAttribute("phone", phone);
            request.setAttribute("address", address);
            request.setAttribute("note", note);
            request.getRequestDispatcher("./views/thankyou.jsp").forward(request, response);
        }

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
