/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import user.UserDAO;
import user.UserDTO;

import java.io.IOException;
import java.util.List;

/**
 *
 * @author BaoDinh
 */
public class SearchController extends HttpServlet {

    private static final String ERROR = "admin.jsp";
    private static final String SUCCESS = "admin.jsp";
    
    private static final String ERROR_MESSAGE = "Account that you are searching do not exists !!!";
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        response.setContentType("text/html;charset=UTF-8");  
        String url = ERROR;
        try {           
            String search = request.getParameter("searchInfo");
            UserDAO dao = new UserDAO();
            List<UserDTO> listUser = dao.getListUser(search);
            
            if (listUser.size() > 0) {
                request.setAttribute("LIST_USER", listUser);
                url = SUCCESS;
            }else if(listUser.isEmpty()){
                request.setAttribute("LIST_USER", listUser);
                request.setAttribute("SEARCH_ERROR", ERROR_MESSAGE);
                url = ERROR;
            }
      
        }catch(Exception e){
            log("Error at LoginServlet:" +e.toString());
        
        }finally{
            request.getRequestDispatcher(url).forward(request, response); //chuyen trang .jsp/....
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
