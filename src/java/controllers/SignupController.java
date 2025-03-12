
package controllers;

import dal.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import java.io.InputStream;
import java.nio.file.Paths;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Base64;
import java.util.logging.Level;
import java.util.logging.Logger;
import models.RoleConstant;
import models.User;
import org.apache.tomcat.jakartaee.commons.compress.utils.IOUtils;

@MultipartConfig(
        fileSizeThreshold = 1024 * 1024 * 2, // 2 MB
        maxFileSize = 1024 * 1024 * 10, // 10 MB
        maxRequestSize = 1024 * 1024 * 50 // 50 MB
)
public class SignupController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet SignupController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet SignupController at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = new User();
        UserDAO ud = new UserDAO();

        String updatePart = request.getParameter("updatePart");
        String fullName = request.getParameter("fullName");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");
        String password = request.getParameter("password");
        String tmp = "";
        User existingUser = ud.checkExist("email", email, -1);
        if (existingUser != null) {
            // Email đã tồn tại
            session.setAttribute("noti", "Đăng ký thất bại. Email đã tồn tại");
            response.sendRedirect("login");
            return;
        }
        user.setFullName(fullName);
        user.setAddress(address);
        user.setEmail(email);
        user.setPhone(phone);

        String base64Image = "";
        Part filePart = request.getPart("avatar");
        String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString(); // Lấy tên tệp
        if (fileName != null && !fileName.isEmpty()) {
            InputStream imageStream = filePart.getInputStream();
            byte[] imageBytes = IOUtils.toByteArray(imageStream);
            base64Image = "data:image/png;base64," + Base64.getEncoder().encodeToString(imageBytes);
        } else {
            base64Image = user.getAvatar();
        }
        user.setAvatar(base64Image);
        long currentTimeMillis = System.currentTimeMillis();
        int currentTimeInInt = (int) currentTimeMillis;
        user.setUserId(currentTimeInInt);
        user.setPassword(password);
        user.setRole(RoleConstant.USER_ROLE);
        ud.registerProfile(user);
        response.sendRedirect("login");
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
