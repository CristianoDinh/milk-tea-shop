
package controllers;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import drinks.DrinksDTO;
import drinks.DrinksDAO;
import user.UserDAO;
import user.UserDTO;

/**
 *
 * @author BaoDinh
 */

//Controller này dùng để lưu List Product vào session để sang trang SUCCESS database load lên
public class ShoppingPageController extends HttpServlet {

    private static final String ERROR = "shopping.jsp";
    private static final String SUCCESS = "shopping.jsp";
    private static final String ERROR_MESSAGE = "There is not exitst any products.";
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        
        try {
            HttpSession session = request.getSession();
            //lưu sản phẩm vào session trước để sang shopping.html chỉ việc load lên
            DrinksDAO drinksDao = new DrinksDAO();
            List<DrinksDTO> drinksList = drinksDao.getListDrinks();
            
            if(drinksList != null){
                session.setAttribute("DRINKS_LIST",drinksList);           
                url = SUCCESS;
            }else {
                request.setAttribute("LoadDB_ERROR", ERROR_MESSAGE);//login.jsp
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
