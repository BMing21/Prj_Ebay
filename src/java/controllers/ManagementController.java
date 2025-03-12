
package controllers;

import dal.DateDAO;
import dal.OrderDAO;
import dal.ProductDAO;
import dal.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;
import models.Chart;
import models.DateObject;

public class ManagementController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ManagementController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ManagementController at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        ProductDAO pd = new ProductDAO();
        UserDAO ud = new UserDAO();
        OrderDAO od = new OrderDAO();
        DateDAO dd = new DateDAO();
        int countCustomer = ud.CountCustomer();
        int countProduct = pd.getTotalProduct();

        DateObject date = dd.get7day();
        String start = date.getStart().toString();
        String end = date.getEnd().toString();
        String start_raw = request.getParameter("start");
        String end_raw = request.getParameter("end");
        if (start_raw != null) {
            start = start_raw;
            end = end_raw;
        }

        int numberOfDay = dd.countDayByStartEnd(start, end);

        // set chart revenue
        List<Chart> listChartRevenueArea = od.getChartRevenueArea(start, numberOfDay);
        int maxListChartRevenueArea = -1;
        for (Chart o : listChartRevenueArea) {
            if (o.getValue() > maxListChartRevenueArea) {
                maxListChartRevenueArea = o.getValue();
            }
        }
        maxListChartRevenueArea = (maxListChartRevenueArea / 1000000 + 2) * 1000000;

        // set chart customer
//        List<Chart> listChartCustomer = ud.getChartCustomerArea(start, numberOfDay);
//        int maxListChartCustomerArea = -1;
//        for (Chart o : listChartCustomer) {
//            if (o.getValue() > maxListChartCustomerArea) {
//                maxListChartCustomerArea = o.getValue();
//            }
//        }
//        maxListChartCustomerArea = (maxListChartCustomerArea / 10 + 1) * 10;
        // set char Order 
        List<String> listStatusOrder = new ArrayList();
        listStatusOrder.add("pending");
        listStatusOrder.add("processing");
        listStatusOrder.add("completed");

        int totalOrderByStatus1 = od.gettotalOrderByStatus("pending", start, numberOfDay);
        int totalOrderByStatus2 = od.gettotalOrderByStatus("processing", start, numberOfDay);
        int totalOrderByStatus3 = od.gettotalOrderByStatus("completed", start, numberOfDay);
        request.setAttribute("listStatusOrder", listStatusOrder);
        request.setAttribute("totalOrder1", totalOrderByStatus1);
        request.setAttribute("totalOrder2", totalOrderByStatus2);
        request.setAttribute("totalOrder3", totalOrderByStatus3);
        request.setAttribute("noCustomer", countCustomer);
        request.setAttribute("noProduct", countProduct);

        request.setAttribute("listChartRevenueArea", listChartRevenueArea);
        request.setAttribute("maxListChartRevenueArea", maxListChartRevenueArea);

        //request.setAttribute("listChartCustomer", listChartCustomer);
        //request.setAttribute("maxListChartCustomerArea", maxListChartCustomerArea);
        request.setAttribute("start", start);
        request.setAttribute("end", end);
        request.setAttribute("p", 0);

        request.getRequestDispatcher("./views/dashboard.jsp").forward(request, response);
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
