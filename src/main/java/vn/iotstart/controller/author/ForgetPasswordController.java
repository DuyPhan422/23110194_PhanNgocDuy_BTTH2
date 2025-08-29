package vn.iotstart.controller.author;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Date;
import java.util.UUID;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import vn.iotstart.configs.DBConnectSQL;

@WebServlet(urlPatterns = "/forget-password")
public class ForgetPasswordController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/views/forget-password.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");

        String email = req.getParameter("email");

        if (email == null || email.isEmpty()) {
            req.setAttribute("alert", "Vui lòng nhập email!");
            req.getRequestDispatcher("/views/forget-password.jsp").forward(req, resp);
            return;
        }

        try {
            Connection conn = new DBConnectSQL().getConnection();
            String sql = "SELECT * FROM [User] WHERE email = ?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, email);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                // Tạo mã token ngẫu nhiên
                String token = UUID.randomUUID().toString();
                Date expiry = new Date(System.currentTimeMillis() + 30 * 60 * 1000); // Hết hạn sau 30 phút

                // Lưu token và thời gian hết hạn vào cơ sở dữ liệu
                String updateSql = "UPDATE [User] SET reset_token = ?, reset_expiry = ? WHERE email = ?";
                PreparedStatement updatePs = conn.prepareStatement(updateSql);
                updatePs.setString(1, token);
                updatePs.setTimestamp(2, new java.sql.Timestamp(expiry.getTime()));
                updatePs.setString(3, email);
                updatePs.executeUpdate();

                // Gửi OTP hoặc liên kết (tạm thời hiển thị trên trang)
                req.setAttribute("message", "Mã đặt lại mật khẩu đã được gửi. Token: " + token);
            } else {
                req.setAttribute("alert", "Email không tồn tại!");
            }

            rs.close();
            ps.close();
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
            req.setAttribute("alert", "Lỗi khi xử lý yêu cầu!");
        }

        req.getRequestDispatcher("/views/forget-password.jsp").forward(req, resp);
    }
}