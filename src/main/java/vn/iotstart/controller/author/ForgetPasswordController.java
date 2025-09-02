package vn.iotstart.controller.author;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import vn.iotstart.model.User;
import vn.iotstart.service.UserService;
import vn.iotstart.service.impl.UserServiceImpl;

@WebServlet("/forget")
public class ForgetPasswordController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private UserService userService = new UserServiceImpl();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("views/forget.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String email = req.getParameter("email");
        User user = userService.getByEmail(email);

        if (user == null) {
            req.setAttribute("alert", "Email không tồn tại!");
        } else {
            req.setAttribute("alert", "Email đã được gửi tới " + email + ". Vui lòng kiểm tra hộp thư.");
        }

        req.getRequestDispatcher("views/forget.jsp").forward(req, resp);
    }
}