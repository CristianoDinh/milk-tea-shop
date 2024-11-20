/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;


import java.io.IOException;
import java.util.List;


import javax.servlet.ServletException;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import user.UserDAO;
import user.UserDTO;

/**
 *
 * @author Lenovo
 */
public class LoginController extends HttpServlet {
    
    private static final String ERROR = "login.jsp";
    private static final String ERROR_MESSAGE = "Incorrect UserID or Password !";
    
    //------ SUCCESS PAGE ------------------------
    private static final String AD = "AD";
    private static final String ADMIN_PAGE = "admin.jsp";  
    private static final String US = "US";
    private static final String USER_PAGE = "user.jsp";
    
    
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
        String url = ERROR;
        
        try {
            HttpSession session = request.getSession();
//            //lưu sản phẩm vào session trước để sang shopping.html chỉ việc load lên
//            DrinksDAO drinksDao = new DrinksDAO();
//            List<DrinksDTO> drinksList = drinksDao.getListDrinks();
//            session.setAttribute("TEA_LIST",drinksList);
            //-----------------------------------------------
            String userID = request.getParameter("userID");
            String password = request.getParameter("password");
            
            UserDAO dao = new UserDAO();
            UserDTO loginUser = dao.checkLogin(userID, password);
            
            if(loginUser != null){
                
                session.setAttribute("LOGIN_USER", loginUser);
                
                String roleID = loginUser.getRoleID();
                if(AD.equals(roleID)){
                    url = ADMIN_PAGE;
                }else if (US.equals(roleID)) {
                    url = USER_PAGE;
                }
            }else {
                request.setAttribute("LOGIN_ERROR", ERROR_MESSAGE);//login.jsp
            }
            
        } catch (Exception e) {
            log("Error at Login Servlet: "+e.toString());
        } finally{
            request.getRequestDispatcher(url).forward(request, response);
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
