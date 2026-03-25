package com.asm2.servlet;

import java.io.IOException;
import java.util.Properties;
import java.util.Random;
import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.asm2.dao.UserDAO;
import com.asm2.entity.User;

@WebServlet("/quen-mat-khau")
public class ForgetServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public ForgetServlet() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        request.getRequestDispatcher("/views/client/forget.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        String email = request.getParameter("email");
        
        // Kiểm tra email có tồn tại
        UserDAO userDAO = new UserDAO();
        User user = userDAO.findByEmail(email);
        
        if (user != null) {
            // Tạo OTP 6 số
            String otp = String.format("%06d", new Random().nextInt(999999));
            
            // Lưu OTP vào database (có thời hạn 10 phút)
            userDAO.saveOTP(user.getId(), otp);
            
            // Gửi email OTP
            sendOTPEmail(email, otp, user.getFullname());
            
            // Chuyển đến trang xác thực OTP
            response.sendRedirect(request.getContextPath() + "/xac-thuc-otp?email=" + email);
            return;
        }
        
        // Luôn hiển thị thành công (bảo mật)
        request.setAttribute("message", "Nếu email tồn tại, chúng tôi đã gửi mã OTP");
        request.getRequestDispatcher("/views/client/forget.jsp").forward(request, response);
    }
    
    private void sendOTPEmail(String toEmail, String otp, String userName) {
        try {
            Properties props = new Properties();
            props.setProperty("mail.smtp.auth", "true");
            props.setProperty("mail.smtp.host", "smtp.gmail.com");
            props.setProperty("mail.smtp.port", "587");
            props.setProperty("mail.smtp.starttls.enable", "true");
            props.put("mail.smtp.starttls.required", "true");
            props.put("mail.smtp.ssl.protocols", "TLSv1.2");

            Session session = Session.getInstance(props, new Authenticator() {
                @Override
                protected PasswordAuthentication getPasswordAuthentication() {
                    String username = "halinhilinh20@gmail.com";
                    String password = "ocww kugl cwca okss"; 
                    return new PasswordAuthentication(username, password);
                }
            });

            MimeMessage mail = new MimeMessage(session);
            mail.setFrom(new InternetAddress("halinhilinh20@gmail.com", "OWLY1KETW Restaurant"));
            mail.setRecipients(MimeMessage.RecipientType.TO, toEmail);
            mail.setSubject("Mã OTP khôi phục mật khẩu - OWLY1KETW", "UTF-8");
            
            String body = "<html><body style='font-family: Arial, sans-serif;'>"
                        + "<h2 style='color: #cda45e;'>KHÔI PHỤC MẬT KHẨU</h2>"
                        + "<p>Xin chào <strong>" + userName + "</strong>,</p>"
                        + "<p>Mã OTP của bạn là: <strong style='font-size: 24px; color: #dc3545;'>" + otp + "</strong></p>"
                        + "<p>Mã có hiệu lực trong 10 phút.</p>"
                        + "<p>Nếu bạn không yêu cầu, vui lòng bỏ qua email này.</p>"
                        + "</body></html>";
            
            mail.setContent(body, "text/html; charset=UTF-8");
            Transport.send(mail);
            
            System.out.println("OTP email sent to: " + toEmail);
            
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("Error sending OTP email: " + e.getMessage());
        }
    }
}