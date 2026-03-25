package com.asm2.servlet;

import java.io.IOException;
import javax.mail.PasswordAuthentication;
import java.util.Properties;

import javax.activation.DataHandler;
import javax.activation.FileDataSource;
import javax.mail.Authenticator;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;
import javax.mail.internet.MimeMultipart;
import javax.mail.internet.MimeBodyPart;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

/**
 * Servlet implementation class EmailServlet
 */
@WebServlet("/EmailServlet")
@MultipartConfig(
		  fileSizeThreshold = 1024 * 1024, // 1MB
		    maxFileSize = 1024 * 1024 * 5,   // 5MB
		    maxRequestSize = 1024 * 1024 * 10 // 10MB
		)
public class EmailServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     * Họ và tên: Lê Nguyễn Hà Linh
     * mssv: TC00424
     */
    public EmailServlet() {
        super();
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/mail.jsp").forward(request, response);
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Lấy dữ liệu từ form
    	request.setCharacterEncoding("utf-8");
        String from = request.getParameter("from");
        String to = request.getParameter("to");
        String subject = request.getParameter("subject");
        String body = request.getParameter("body");

        // Kiểm tra các trường bắt buộc
        if (from == null || from.trim().isEmpty()) {
            from = "halinhilinh20@gmail.com"; // Giá trị mặc định
        }
        if (to == null || to.trim().isEmpty()) {
            response.setContentType("text/html");
            response.getWriter().write("<h3>Error: Recipient email is required!</h3>");
            response.getWriter().write("<a href='mail.jsp'>Back to Form</a>");
            return;
        }
        if (subject == null || subject.trim().isEmpty()) {
            subject = "No Subject";
        }
        if (body == null || body.trim().isEmpty()) {
            body = "No Body";
        }

        // Lấy file đính kèm (nếu có)
        Part filePart = request.getPart("attachment");
        String attachmentPath = null;
        if (filePart != null && filePart.getSize() > 0) {
            String fileName = filePart.getSubmittedFileName();
            attachmentPath = getServletContext().getRealPath("/") +  fileName;
            filePart.write(attachmentPath);
        }

        // Gọi phương thức send của Mailer với attachment
        Mailer.send(from, to, subject, body, attachmentPath);

        // Xóa file tạm (nếu có) sau khi gửi
        if (attachmentPath != null) {
            java.io.File file = new java.io.File(attachmentPath);
            if (file.exists()) file.delete();
        }

        // Thông báo thành công và quay lại form
        response.setContentType("text/html");
        response.getWriter().write("<h3>Email sent successfully!</h3>");
        response.getWriter().write("<a href='mail.jsp'>Back to Form</a>");
    }

    public static class Mailer {
        public static void send(String from, String to, String subject, String body, String attachmentPath) {
            Properties props = new Properties();
            props.setProperty("mail.smtp.auth", "true");
            props.setProperty("mail.smtp.host", "smtp.gmail.com");
            props.setProperty("mail.smtp.port", "587");
            props.setProperty("mail.smtp.starttls.enable", "true");
            props.put("mail.smtp.starttls.required", "true");
            props.put("mail.smtp.ssl.protocols", "TLSv1.2");
            props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");

            Session session = Session.getInstance(props, new Authenticator() {
                @Override
                protected PasswordAuthentication getPasswordAuthentication() {
                    String username = "halinhilinh20@gmail.com";
                    String password = "ocww kugl cwca okss"; 
                    return new PasswordAuthentication(username, password);
                }
            });

            try {
                MimeMessage mail = new MimeMessage(session);
                mail.setFrom(new InternetAddress(from));
                mail.setRecipients(RecipientType.TO, to);
                mail.setSubject(subject, "utf-8");

                // Sử dụng Multipart để hỗ trợ attachment
                MimeMultipart multipart = new MimeMultipart();

                // Phần 1: Nội dung body (text/HTML)
                MimeBodyPart messageBodyPart = new MimeBodyPart();
                messageBodyPart.setText(body, "utf-8", "html");
                multipart.addBodyPart(messageBodyPart);

                // Phần 2: Attachment (nếu có file)
                if (attachmentPath != null && !attachmentPath.isEmpty() && new java.io.File(attachmentPath).exists()) {
                    MimeBodyPart attachmentPart = new MimeBodyPart();
                    FileDataSource fileDataSource = new FileDataSource(attachmentPath);
                    attachmentPart.setDataHandler(new DataHandler(fileDataSource));
                    attachmentPart.setFileName(fileDataSource.getName()); // Tên file hiển thị
                    multipart.addBodyPart(attachmentPart);
                }

                // Đặt multipart vào message
                mail.setContent(multipart);
                mail.setReplyTo(mail.getFrom());

                // Gửi mail
                Transport.send(mail);
                System.out.println("Email sent successfully with attachment: " + attachmentPath); // Debug
            } catch (Exception e) {
                e.printStackTrace();
                System.out.println("Error sending email: " + e.getMessage()); // Debug
            }
        }
    }

	public static void sendConfirmationEmail(String toEmail, String subject, String body) {
		// TODO Auto-generated method stub
		
	}
}