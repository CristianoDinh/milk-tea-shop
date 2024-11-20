/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import shopping.Cart;
import drinks.DrinksDTO;

/**
 *
 * @author BaoDinh
 */
public class AddController extends HttpServlet {
    private static final String ERROR = "shopping.jsp"; 
    private static final String SUCCESS = "shopping.jsp"; //trang jsp để báo lỗi+thành công khi add

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
        String url = ERROR;
        try {
        //Cách 1: sản phẩm được show bên shopping.html theo <option>
//            String teaString = request.getParameter("cmbTea");
//            String arr[] = teaString.split("-"); //tách chuỗi theo dấu '-' -> đưa vào array
//            String id = arr[0];//id Sản phẩm
//            String name = arr[1];//name Sản phẩm
//            double price = Double.parseDouble(arr[2]);
//            int quantity = Integer.parseInt(request.getParameter("cmbQuantity"));
//            
           
        //Cách 2: sản phẩm được load lên từ database bên shopping.html
            String drinksID = request.getParameter("teaID");
            String drinksName = request.getParameter("teaName");
            int drinksQuantity = Integer.parseInt(request.getParameter("quantity"));
            double teaPrice = Double.parseDouble(request.getParameter("price"));
        
            DrinksDTO newDrinks = new DrinksDTO(drinksID,drinksName,drinksQuantity,teaPrice);
            HttpSession session = request.getSession();//Create session and check if cart ís empty -> new Cart
            Cart cart= (Cart)session.getAttribute("CART");//getSession notNULL trong trường hợp add thêm nhiều lần.
            if (cart==null) {
                cart = new Cart();               
            }
            boolean checkAdd= cart.add(newDrinks);
            if(checkAdd){
                session.setAttribute("CART",cart); //update Cart onto Session
                session.setAttribute("ADD_MESSAGE", "You have picked "+drinksName+" with quantity is "+drinksQuantity);//output result for user
                
                request.setAttribute("addedProductId", drinksID);
                request.setAttribute("nameTea", drinksName);
                request.setAttribute("quantityTea", drinksQuantity);
                
                // After processing the form successfully
request.setAttribute("successFlag", "true");
//request.getRequestDispatcher("yourJspPage.jsp").forward(request, response);
                url = SUCCESS;
            }else{//đoạn else này đang chế, chưa sử dụng được
                //session.setAttribute("EMPTY_CART", "Your CART is empty, please add something to CART.");
                //Không sử dụng để gán Error cho empty cart được vì khi ViewCart -> chuyển sang viewCart.jsp chứ ko qua AddController này
            }  
        }catch(Exception e){
            log("Error at LoginServlet:" +e.toString());
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
