
package controllers;

import dal.CartDAO;
import dal.ProductDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;
import models.Cart;
import models.Product;
import models.User;

public class CartController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet CartController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CartController at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        User u = (User) session.getAttribute("user");
        if (u == null) {
            response.sendRedirect(request.getContextPath() + "/login");
        } else {
            String action = request.getParameter("action");
            CartDAO cd = new CartDAO();
            switch (action) {
                case "edit" -> {
                    String productId_raw = request.getParameter("product_id");
                    int product_id = Integer.parseInt(productId_raw);
                    String quantity_raw = request.getParameter("quantity");
                    int quantity = Integer.parseInt(quantity_raw);
                    Cart c = cd.checkCart(u.getUserId(), product_id);
                    if (c != null) {
                        int sum = quantity * c.getProduct().getUnitprice();
                        cd.updateQuantityProductInCart(product_id, quantity, sum, u.getUserId());
                    }
                    int totalItem = cd.getTotalItemInCart(u.getUserId());
                    session.setAttribute("totalItem", totalItem);
                    response.sendRedirect("carts?action=details");
                }
                case "delete" -> {
                    String productId_raw = request.getParameter("product_id");
                    int product_id = Integer.parseInt(productId_raw);
                    cd.deleteCart(product_id, u.getUserId());
                    int totalItem = cd.getTotalItemInCart(u.getUserId());
                    session.setAttribute("totalItem", totalItem);
                    response.sendRedirect("carts?action=details");
                }
                case "order" -> {
                    List<Cart> listCart = cd.getCartInfoByUserId(u.getUserId());
                    if (!listCart.isEmpty()) {
                        int sum = 0;
                        for (Cart o : listCart) {
                            sum += o.getTotal_cost();
                        }
                        session.setAttribute("sum", sum);
                        session.setAttribute("historyUrl", "carts?action=details");
                        session.setAttribute("listCart", listCart);
                        request.getRequestDispatcher("./views/cart-contact.jsp").forward(request, response);
                    } else {
                        response.sendRedirect("carts?action=details");
                    }
                }
                default -> {
                    int user_id = u.getUserId();
                    List<Cart> listCart = cd.getCartInfoByUserId(user_id);
                    int sum = 0;
                    for (Cart o : listCart) {
                        sum += o.getTotal_cost();
                    }
                    request.setAttribute("sum", sum);
                    session.setAttribute("historyUrl", "cartinfo");
                    request.setAttribute("listCart", listCart);
                    int totalItem = cd.getTotalItemInCart(user_id);
                    session.setAttribute("totalItem", totalItem);
                    request.getRequestDispatcher("./views/cart-details.jsp").forward(request, response);
                }
            }
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        CartDAO cd = new CartDAO();

        String productId_raw = request.getParameter("product_id");
        int product_id = Integer.parseInt(productId_raw);
        HttpSession session = request.getSession();
        User u = (User) session.getAttribute("user");

        if (u == null) {
            response.sendRedirect(request.getContextPath() + "/login");

        } else {
            int user_id = u.getUserId();
            Cart existCart = cd.checkCart(user_id, product_id);

            int quantity = 1;
            String quantity_raw = request.getParameter("quantity");

            if (quantity_raw != null) {
                quantity = Integer.parseInt(quantity_raw);
            }

            int total_cost;
            ProductDAO pd = new ProductDAO();
            Product p = pd.getProductByID(product_id);
            if (existCart == null) {
                int price = p.getUnitprice();

                total_cost = quantity * price;
                cd.addToCart(product_id, quantity, total_cost, user_id);
            } else {
                quantity += existCart.getQuantity();
                total_cost = existCart.getTotal_cost() + quantity * p.getUnitprice();
                cd.updateQuantityProductInCart(product_id, quantity, total_cost, user_id);
            }
            int totalItem = cd.getTotalItemInCart(u.getUserId());

            session.setAttribute("totalItem", totalItem);
            String historyUrl = (String) session.getAttribute("historyUrl");
            session.setAttribute("noti", "Thêm vào giỏ hàng thành công.");
            response.sendRedirect(historyUrl);
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
