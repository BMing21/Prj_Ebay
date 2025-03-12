
package controllers;

import dal.OrderDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;
import models.Order;

public class ManageOrderController extends HttpServlet {

    private final int RECORD_PER_PAGE = 12;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ManageOrderController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ManageOrderController at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        OrderDAO od = new OrderDAO();
        HttpSession session = request.getSession();

        List<Order> orders = od.getAllOrder();
        String indexPageStr = request.getParameter("index");
        if (indexPageStr == null) {
            indexPageStr = "1";
        }
        int index = Integer.parseInt(indexPageStr);

        String statusStr = " != 'completed'";
        String status = "%%";
        String statusOrderStr = request.getParameter("status");
        if (statusOrderStr != null && !statusOrderStr.equals("null")) {
            statusStr = "like " + "'%" + statusOrderStr + "%'";
            status = statusOrderStr;
        }

        String key = "";
        String keyStr = request.getParameter("key");
        if (keyStr != null) {
            key = keyStr.trim();
        }

        // using banana approach
        List<Order> listOfPage = od.pagingOrder(index, RECORD_PER_PAGE, key, statusStr);
        int count = od.countOrderByStatus(key, statusStr);
        int endPage = count / RECORD_PER_PAGE;
        if ((count % RECORD_PER_PAGE) != 0) {
            endPage++;
        }
        session.setAttribute("orderList", orders);
        String history = "manageorder?index=" + index;
        if (statusOrderStr != null) {
            history = history + "&status=" + statusOrderStr;
        }
        request.setAttribute("p", 2);
        session.setAttribute("historyUrl", history);
        request.setAttribute("status", status);
        request.setAttribute("key", key);
        String historyKey = "key=" + key;
        request.setAttribute("historyKey", historyKey);
        request.setAttribute("endPage", endPage);
        request.setAttribute("listOfPage", listOfPage);
        request.setAttribute("pageIndex", index);
        //request.setAttribute("listByCond", listByCondition);
        request.getRequestDispatcher("./views/manage-order-list.jsp").forward(request, response);
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
