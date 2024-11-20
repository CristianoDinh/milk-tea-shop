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

/**
 *
 * @author Lenovo
 */
public class MainController extends HttpServlet {

    private static final String WELCOME_PAGE = "login.html";
    
    //Nhãn 
    private static final String LOGIN = "Login"; //"Login" tương ứng với value của nút SUBMIT
    private static final String LOGIN_CONTROLLER = "LoginController";
    
    private static final String SEARCH = "Search";
    private static final String SEARCH_CONTROLLER = "SearchController";
    
    private static final String UPDATE = "Update";
    private static final String UPDATE_CONTROLLER = "UpdateController";
    
    private static final String DELETE = "Delete";
    private static final String DELETE_CONTROLLER = "DeleteController";
    
    private static final String LOGOUT = "Logout";
    private static final String LOGOUT_CONTROLLER = "LogoutController";
    //--------------------------------------------------------------------------
    private static final String CREATE_PAGE = "CreateAccount_Page";
    private static final String CREATE_PAGE_VIEW = "createAccount.html";
    
    private static final String CREATE_ACCOUNT = "Create Account";
    private static final String CREATE_ACCOUNT_CONTROLLER = "CreateAccountController";
    //--------------------------------------------------------------------------
    private static final String SHOPPING_PAGE = "Shopping_Page";
    private static final String SHOPPING_PAGE_CONTROLLER = "ShoppingPageController";
    private static final String SHOPPING_PAGE_VIEW = "shopping.html";//ko qua shopping.html nữa
    
    private static final String ADD_TO_CART = "Add to Cart";
    private static final String ADD_CART_CONTROLLER = "AddController";
    
    private static final String VIEW_CART = "View Cart";
    private static final String VIEW_CART_CONTROLLER = "viewCart.jsp";
    
    private static final String EDIT = "Edit";
    private static final String EDIT_CONTROLLER = "EditController";
    
    private static final String REMOVE = "Remove";
    private static final String REMOVE_CONTROLLER = "RemoveController";
    //--------------------------------------------------------------------------
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
        String url = WELCOME_PAGE ; //MainController chuyen trang dau tien la login.html
        try {
            String action = request.getParameter("action"); //name:"action" có value"Login"
            
            //if action.equals(LOGIN): khả năng null-pointer-exception. Vì action có 2 khả năng
            if(action == null){
                url = WELCOME_PAGE;
            }
            else if (LOGIN.equals(action)) {
                url = LOGIN_CONTROLLER;
            }else if(SEARCH.equals(action)){  
                url = SEARCH_CONTROLLER;
            }else if(UPDATE.equals(action)){  
                url = UPDATE_CONTROLLER;
            }else if(DELETE.equals(action)){  
                url = DELETE_CONTROLLER;
            }else if(LOGOUT.equals(action)){
                url = LOGOUT_CONTROLLER;
            }
            else if(CREATE_PAGE.equals(action)){
                url = CREATE_PAGE_VIEW;
            }else if(CREATE_ACCOUNT.equals(action)){
                url = CREATE_ACCOUNT_CONTROLLER;
            }
            else if(SHOPPING_PAGE.equals(action)){
                url = SHOPPING_PAGE_CONTROLLER;
            }else if(ADD_TO_CART.equals(action)){
                url = ADD_CART_CONTROLLER;
            }else if(VIEW_CART.equals(action)){
                url = VIEW_CART_CONTROLLER;
            }else if(EDIT.equals(action)){
                url = EDIT_CONTROLLER;
            }else if(REMOVE.equals(action)){
                url = REMOVE_CONTROLLER;
            }
            
                     
        } catch (Exception e) {
            log("Error at MainControllerServlet: "+e.toString());
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
