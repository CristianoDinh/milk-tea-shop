/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package filter;

import java.io.IOException;
import java.io.PrintStream;
import java.io.PrintWriter;
import java.io.StringWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import user.UserDTO;

/**
 *
 * @author BaoDinh
 */
@WebFilter(filterName = "AuthenticationFilter", urlPatterns = {"/*"})
public class AuthenticationFilter implements Filter {
    
    private static List<String> USER_RESOURCE;
    private static List<String> ADMIN_RESOURCE;
    private static List<String> NON_AUTHEN_RESOURCE;
    
    private static final String US = "US";
    private static final String AD = "AD";
    private static final String LOGIN_PAGE = "login.html";
    
    private static final boolean debug = true;

    // The filter configuration object we are associated with.  If
    // this value is null, this filter instance is not currently
    // configured. 
    private FilterConfig filterConfig = null;
    
    public AuthenticationFilter() {
        USER_RESOURCE = new ArrayList<>();
        USER_RESOURCE.add("user.jsp");
        USER_RESOURCE.add("viewCart.jsp");
        USER_RESOURCE.add("checkOut.jsp");
        USER_RESOURCE.add("endShopping.jsp");
        USER_RESOURCE.add("viewCart.jsp");
        

        ADMIN_RESOURCE = new ArrayList<>();
        ADMIN_RESOURCE.add("admin.jsp");
        
        NON_AUTHEN_RESOURCE = new ArrayList<>();
        NON_AUTHEN_RESOURCE.add("login.html");
        NON_AUTHEN_RESOURCE.add("login.jsp");
        NON_AUTHEN_RESOURCE.add("MainController");
        NON_AUTHEN_RESOURCE.add(".png");
        NON_AUTHEN_RESOURCE.add(".gif");
        NON_AUTHEN_RESOURCE.add(".jpg");
        NON_AUTHEN_RESOURCE.add("shopping.jsp");
        
        NON_AUTHEN_RESOURCE.add("checkOut.jsp");
        
    }    
    
    
    
    public void doFilter(ServletRequest request, ServletResponse response,
            FilterChain chain)
            throws IOException, ServletException {
        
       
        try {
            HttpServletRequest req = (HttpServletRequest) request;
            HttpServletResponse res = (HttpServletResponse) response;
            String uri = req.getRequestURI();
            int index = uri.lastIndexOf("/");
            String resource = uri.substring(index+1);
            boolean checkContain = false;
            for (String value : NON_AUTHEN_RESOURCE) {
                if (uri.contains(value)) {
                    checkContain = true;
                    break;
                }
            }
            if(checkContain){
                chain.doFilter(request, response);
            }else {
                HttpSession session = req.getSession();
                if (session == null || session.getAttribute("LOGIN_USER") ==null) {
                    res.sendRedirect(LOGIN_PAGE);
                }else{
                    UserDTO user = (UserDTO) session.getAttribute("LOGIN_USER");
                    String roleID = user.getRoleID();
                    if (AD.equals(roleID) && ADMIN_RESOURCE.contains(resource)) {
                        chain.doFilter(request, response);
                    }else if(US.equals(roleID) && USER_RESOURCE.contains(resource)){
                        chain.doFilter(request, response);
                    }else{
                        res.sendRedirect("login.jsp");
                    }
                }
            }
        } catch (Exception e) {
           
        }
        
    }
     
    
    
    
    //---------------------------------------------------------------------------------------
    private void doBeforeProcessing(ServletRequest request, ServletResponse response)
            throws IOException, ServletException {
        
    }    
    
    private void doAfterProcessing(ServletRequest request, ServletResponse response)
            throws IOException, ServletException {
        if (debug) {
            log("AuthenticationFilter:DoAfterProcessing");
        }

        // Write code here to process the request and/or response after
        // the rest of the filter chain is invoked.
        // For example, a logging filter might log the attributes on the
        // request object after the request has been processed. 
        /*
	for (Enumeration en = request.getAttributeNames(); en.hasMoreElements(); ) {
	    String name = (String)en.nextElement();
	    Object value = request.getAttribute(name);
	    log("attribute: " + name + "=" + value.toString());

	}
         */
        // For example, a filter might append something to the response.
        /*
	PrintWriter respOut = new PrintWriter(response.getWriter());
	respOut.println("<P><B>This has been appended by an intrusive filter.</B>");
         */
    }



    /**
     * Return the filter configuration object for this filter.
     */
    public FilterConfig getFilterConfig() {
        return (this.filterConfig);
    }

    /**
     * Set the filter configuration object for this filter.
     *
     * @param filterConfig The filter configuration object
     */
    public void setFilterConfig(FilterConfig filterConfig) {
        this.filterConfig = filterConfig;
    }

    /**
     * Destroy method for this filter
     */
    public void destroy() {        
    }

    /**
     * Init method for this filter
     */
    public void init(FilterConfig filterConfig) {        
        this.filterConfig = filterConfig;
        if (filterConfig != null) {
            if (debug) {                
                log("AuthenticationFilter:Initializing filter");
            }
        }
    }

    /**
     * Return a String representation of this object.
     */
    @Override
    public String toString() {
        if (filterConfig == null) {
            return ("AuthenticationFilter()");
        }
        StringBuffer sb = new StringBuffer("AuthenticationFilter(");
        sb.append(filterConfig);
        sb.append(")");
        return (sb.toString());
    }
    
    private void sendProcessingError(Throwable t, ServletResponse response) {
        String stackTrace = getStackTrace(t);        
        
        if (stackTrace != null && !stackTrace.equals("")) {
            try {
                response.setContentType("text/html");
                PrintStream ps = new PrintStream(response.getOutputStream());
                PrintWriter pw = new PrintWriter(ps);                
                pw.print("<html>\n<head>\n<title>Error</title>\n</head>\n<body>\n"); //NOI18N

                // PENDING! Localize this for next official release
                pw.print("<h1>The resource did not process correctly</h1>\n<pre>\n");                
                pw.print(stackTrace);                
                pw.print("</pre></body>\n</html>"); //NOI18N
                pw.close();
                ps.close();
                response.getOutputStream().close();
            } catch (Exception ex) {
            }
        } else {
            try {
                PrintStream ps = new PrintStream(response.getOutputStream());
                t.printStackTrace(ps);
                ps.close();
                response.getOutputStream().close();
            } catch (Exception ex) {
            }
        }
    }
    
    public static String getStackTrace(Throwable t) {
        String stackTrace = null;
        try {
            StringWriter sw = new StringWriter();
            PrintWriter pw = new PrintWriter(sw);
            t.printStackTrace(pw);
            pw.close();
            sw.close();
            stackTrace = sw.getBuffer().toString();
        } catch (Exception ex) {
        }
        return stackTrace;
    }
    
    public void log(String msg) {
        filterConfig.getServletContext().log(msg);        
    }
    
}
