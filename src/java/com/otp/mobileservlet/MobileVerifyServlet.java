package com.otp.mobileservlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.logging.Level;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.log4j.Logger;
import org.json.JSONException;
import org.json.JSONObject;

@WebServlet(name = "MobileVerifyServlet", urlPatterns = {"/MobileVerifyServlet"})
public class MobileVerifyServlet extends HttpServlet {

    static Logger log = Logger.getLogger(MobileVerifyServlet.class);

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet MobileVerifyServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet MobileVerifyServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String mobileNo = request.getParameter("mobileNo");
        log.info("sikandar" + mobileNo);

        String response1 = api.callapi(mobileNo);

        JSONObject jsonResponse = null;
        boolean phoneValid = false;
        try {
            jsonResponse = new JSONObject(response1);
            phoneValid = jsonResponse.getBoolean("phone_valid");

            log.info("Phone Valid: " + phoneValid);
            DatabasePracticeUtil.callprocedure(mobileNo, phoneValid,response1);
        } catch (JSONException ex) {
            log.info("sikandar" + mobileNo);
        } catch (ClassNotFoundException ex) {
            java.util.logging.Logger.getLogger(MobileVerifyServlet.class.getName()).log(Level.SEVERE, null, ex);
        }

        response.getWriter().write(response1);

//        processRequest(request, response);
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
