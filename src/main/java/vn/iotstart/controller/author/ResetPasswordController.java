package vn.iotstart.controller.author;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import vn.iotstart.configs.DBConnectSQL;

@WebServlet(urlPatterns = "/reset-password")
public class ResetPasswordController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String token = req.getParameter("token");
        if (token == null) {
            req.setAttribute("alert", "Token không hợp lệ!");
            req.getRequestDispatcher("/views/forget-password.jsp").forward(req, resp);
            return;
        }

        req.setAttribute("token", token);
        req.getRequestDispatcher("/views/reset-password.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");

        String token = req.getParameter("token");
        String newPassword = req.getParameter("newPassword");

        if (token == null || newPassword == null || newPassword.isEmpty()) {
            req.setAttribute("alert", "Vui lòng nhập mật khẩu mới!");
            req.setAttribute("token", token);
            req.getRequestDispatcher("/views/reset-password.jsp").forward(req, resp);
            return;
        }

        try {
            Connection conn = new DBConnectSQL().getConnection();
            String sql = "SELECT * FROM [User] WHERE reset_token = ? AND reset_expiry > ?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, token);
            ps.setTimestamp(2, new java.sql.Timestamp(System.currentTimeMillis()));
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                String updateSql = "UPDATE [User] SET password = ?, reset_token = NULL, reset_expiry = NULL WHERE reset_token = ?";
                PreparedStatement updatePs = conn.prepareStatement(updateSql);
                updatePs.setString(1, newPassword);
                updatePs.setString(2, token);
                updatePs.executeUpdate();

                req.setAttribute("message", "Mật khẩu đã được đặt lại thành công!");
            } else {
                req.setAttribute("alert", "Token hết hạn hoặc không hợp lệ!");
            }

            rs.close();
            ps.close();
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
            req.setAttribute("alert", "Lỗi khi đặt lại mật khẩu!");
        }

        req.getRequestDispatcher("/views/reset-password.jsp").forward(req, resp);
    }
}