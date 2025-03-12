
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
import models.User;
import org.apache.tomcat.jakartaee.commons.compress.utils.IOUtils;

@MultipartConfig(
        fileSizeThreshold = 1024 * 1024 * 2, // 2 MB
        maxFileSize = 1024 * 1024 * 10, // 10 MB
        maxRequestSize = 1024 * 1024 * 50 // 50 MB
)
public class ProfileController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ProfileController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ProfileController at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        if (user != null) {
            request.getRequestDispatcher("./views/profile.jsp").forward(request, response);
        } else {
            response.sendRedirect(request.getContextPath() + "/login");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        UserDAO ud = new UserDAO();

        String updatePart = request.getParameter("updatePart");
        if (updatePart.equals("about")) {
            String fullName = request.getParameter("fullName");
            String email = request.getParameter("email");
            String phone = request.getParameter("phone");
            String address = request.getParameter("address");
            String tmp = "";
            User existingUser = ud.checkExist("email", email, user.getUserId());
            if (existingUser != null) {
                // Email đã tồn tại
                session.setAttribute("notification", "Email already in use by another user.");
                response.sendRedirect(request.getContextPath() + "/profile");
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
            ud.updateProfile(user);
            session.setAttribute("user", user);
            response.sendRedirect("profile");
        } else {
            String oldPassword = request.getParameter("oldPassword");
            String newPassword = request.getParameter("newPassword");
            User loggedInUser = ud.login(user.getEmail(), oldPassword);
            if (loggedInUser != null) {
                int numberOfChange = ud.changePassword(user.getUserId(), newPassword);
                if (numberOfChange > 0) {
                    // Thay đổi mật khẩu thành công
                    session.setAttribute("notification", "Change password successfully.");
                    session.setAttribute("typeNoti", "alert-success");
                    session.removeAttribute("user");
                    response.sendRedirect(request.getContextPath() + "/login");
                } else {
                    // Có lỗi xảy ra trong quá trình thay đổi mật khẩu
                    session.setAttribute("notification", "Failed to change password. Please try again later.");
                    session.setAttribute("typeNoti", "alert-danger");
                    response.sendRedirect(request.getContextPath() + "/profile"); // Redirect back to the profile page
                }
            } else {
                // Mật khẩu cũ không đúng
                session.setAttribute("notification", "Old password is incorrect.");
                session.setAttribute("typeNoti", "alert-danger");
                response.sendRedirect(request.getContextPath() + "/profile"); // Redirect back to the profile page
            }
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
