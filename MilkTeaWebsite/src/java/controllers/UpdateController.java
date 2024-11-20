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

import user.UserDAO;
import user.UserDTO;

/**
 *
 * @author BaoDinh
 */
public class UpdateController extends HttpServlet {

    private static final String ERROR = "SearchController";
    private static final String SUCCESS = "SearchController";

    private static final String ERROR_MESSAGE = "THÔNG TIN KHÔNG ĐỔI MÀ BÀY ĐẶT CẬP NHẬT!";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
        String url = ERROR;
        try {
           String userID = request.getParameter("UpdaterID");
           String fullName = request.getParameter("Edit_fullName");
           String roleID = request.getParameter("Edit_roleID");
           
           UserDAO dao = new UserDAO();
           UserDTO user = dao.getUserByID(userID);
           
           HttpSession session = request.getSession();
            if (user != null) {
                if (user.getFullName().equals(fullName) && user.getRoleID().equals(roleID)) {
                    request.setAttribute("UPDATE_ERROR", ERROR_MESSAGE);
                }else{
                    boolean checkUpdate = dao.update(new UserDTO(userID, fullName, roleID, user.getPassword()));
                    if (checkUpdate) {
                        url = SUCCESS;
                        session.setAttribute("LOGIN_USER", user);//chỗ này chưa biết sẽ getAttribute ở đâu? -> CHO WELCOME: USER
                    }
                }
            }
        }catch(Exception e){
            log("Error at UpdateController: "+e.toString());
        }finally{
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
