/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import tech.sendMail.Email;
import user.UserDAO;
import user.UserDTO;
import user.UserError;

/**
 *
 * @author BaoDinh
 */
public class CreateAccountController extends HttpServlet {

    private static final String ERROR = "createAccount.jsp"; 
    //private static final String SUCCESS = "EmailRegisterController"; 
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
        String url = ERROR;
        UserDAO dao = new UserDAO();
        
        UserError userError = new UserError();
        boolean checkValidation = true;
        try {
            String userID = request.getParameter("newUserID");
            String fullName = request.getParameter("newFullName");
            String roleID = request.getParameter("roleID"); //default is 'US'
            String password = request.getParameter("newPassword");
            String confirmPass = request.getParameter("confirmPassword");
            
            String emailRegister = request.getParameter("emailAddress");
        //Validation
            if (userID.length() <4 || userID.length() >10) {
                userError.setUserIDError("UserID must be in range [4...10]");
                checkValidation = false;
            }
            if (fullName.length() <5 || fullName.length() >50){
                userError.setFullNameError("Full Name must have the length in range [5...50]");
                checkValidation = false;
            }
            if (!password.equals(confirmPass)){
                userError.setConfirmError("The password confirmation does not match.");
                checkValidation = false;
            }
            
            if(checkValidation){
                UserDTO newUser = new UserDTO(userID, fullName, roleID, password);
                boolean checkInsert = dao.insert(newUser);
                if(checkInsert){
                    HttpSession mailSession = request.getSession();
                    mailSession.setAttribute("EmailRegister", emailRegister);//lấy bên EmailResponeController
                    mailSession.setAttribute("CustomerName", fullName);//lấy bên EmailResponeController
                    //url = SUCCESS;
                    request.setAttribute("CREATE_SUCCESS", "Create new Account SUCCESSFULLY!");
                    
                    
                }else{
                    userError.setError("Create new Account FAILED!");
                    request.setAttribute("CREATE_ERROR", userError);
                }
            }else{
                userError.setError("Create new Account FAILED!");
                request.setAttribute("CREATE_ERROR", userError);
            }
        }catch(Exception e){
            log("Error at CreateController: " + e.toString());
        }finally{
            //request.getRequestDispatcher(url).forward(request, response);
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
        try{            
            HttpSession mailSession = request.getSession();
            String customerName = request.getParameter("newFullName");
            String toEmail = request.getParameter("emailAddress");    //this session from CreateAccountController
            String emailSubject = "Announcement of Gia Bao MilkTea";

         String emailContent = "<!DOCTYPE html>" +
                    "<html lang=\"en\">" +
                    "<head>" +
                    "<meta charset=\"UTF-8\">" +
                    "<meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">" +
                    "<title>Welcome to Gia Bảo MilkTea</title>" +
                    "<style>" +
                    "body { font-family: Arial, sans-serif; background-color: #f9f9f9; margin: 0; padding: 0; }" +
                    ".container { max-width: 600px; margin: 20px auto; background-color: #ffffff; padding: 20px; border-radius: 10px; box-shadow: 0 0 10px rgba(0, 0, 0, 0.1); }" +
                    ".header { background-color: #04AA6D; color: white; padding: 10px 0; text-align: center; border-top-left-radius: 10px; border-top-right-radius: 10px; }" +
                    ".header h1 { margin: 0; }" +
                    ".content { padding: 20px; text-align: center; }" +
                    ".content p { margin: 10px 0; line-height: 1.6; }" +
                    ".button { display: inline-block; padding: 5px 5px; margin: 5px 5px; font-size: 16px; color: #ffffff; background-color: dimgray; text-decoration: none; border-radius: 5px; }" +
                    ".footer { background-color: #f0f0f0; padding: 10px; text-align: center; font-size: 12px; border-bottom-left-radius: 10px; border-bottom-right-radius: 10px; }" +
                    ".footer p { margin: 5px 0; }" +
                    "</style>" +
                    "</head>" +
                    "<body>" +
                    "<div class=\"container\">" +
                    "<div class=\"header\">" +
                    "<h1>Welcome to Gia Bảo MilkTea!</h1>" +
                    "</div>" +
                    "<div class=\"content\">" +
                    "<p>Dear Customer " + customerName + ",</p>" +
                    "<p>Thank you for registering with Gia Bảo MilkTea. We are excited to have you on board.</p>" +
                    "<p>Enjoy the best milk tea in town and stay tuned for our latest updates and promotions.</p>" +
                    "<a href=\"http://localhost:8080/www.prj302-milkTea.com/shopping.jsp\" class=\"button\" style=\"color: lightgoldenrodyellow\">Visit Our Website</a>" +
                    "</div>" +
                    "<div class=\"footer\">" +
                    "<p>&copy; 2024 Gia Bảo MilkTea. All rights reserved.</p>" +
                    "<p>If you have any questions, feel free to <a href=\"mailto:support@giabaomilktea.com\">contact us</a>.</p>" +
                    "</div>" +
                    "</div>" +
                    "</body>" +
                    "</html>";



            boolean checkSending = Email.sendEmail(toEmail, emailSubject, emailContent); //dùng thông qua static method: class.method()
            if (checkSending) {
                mailSession.setAttribute("SendEmailResult", "SendEmail successfully");
            } else {
                mailSession.setAttribute("SendEmailResult", "Failed to send email");
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            request.getRequestDispatcher("createAccount.jsp").forward(request, response);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
