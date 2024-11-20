
package tech.sendMail;

import java.util.Date;
import java.util.Properties;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;

import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

/**
 *
 * @author BaoDinh
 */
public class Email {
    static final String myEmail = "dinhgiabao1142004@gmail.com";
    static final String applicationPassword = "aiub hkqb wzry ohxo";
    
    public static boolean sendEmail(String toEmail, String emailSubject, String emailContent) {
        Properties props = new Properties();
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.port", "587");
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        
        Authenticator authen = new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication(){
                return new PasswordAuthentication(myEmail, applicationPassword);
            }
        };
        
        // Session
        Session session = Session.getInstance(props, authen);
        // Create Message
        MimeMessage message = new MimeMessage(session);
        
        try {
            message.addHeader("Content-type", "text/HTML; charset=UTF-8");
            message.setFrom(myEmail);
//            Người nhận
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(toEmail, false));
            message.setSubject(emailSubject);
            //message.setSentDate(new Date());
        //    message.setText(emailContent);
            message.setContent(emailContent,"text/HTML; charset=UTF-8");
            
            Transport.send(message); //hàm này dùng để gửi
            System.out.println("Send mail to "+toEmail+" SUCCESSFULLY");
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("FAILED to Send Mail");
            return false;
        }
    }
}
