package com.TeleCare.Patient;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/PaymentStatusServlet")
public class PaymentStatusServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve the tapId and fees values from the hidden input fields
        int tapId = Integer.parseInt(request.getParameter("tapId"));
        String fees = request.getParameter("fees");

        // Update the payment status in the APPOINT_TEMP table
        String driver = "oracle.jdbc.driver.OracleDriver";
        String url = "jdbc:oracle:thin:@localhost:1521:xe";
        String user = "system";
        String password = "system";

        try {
            Class.forName(driver);
            Connection con = DriverManager.getConnection(url, user, password);
            String sql = "UPDATE APPOINT_TEMP SET PAYSTATUS = 'paid' WHERE TAP_ID = ?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, tapId);

            int rowsAffected = ps.executeUpdate();
            if (rowsAffected > 0) {
                System.out.println("Payment status updated successfully");
            } else {
                System.out.println("No rows updated");
            }

            ps.close();
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        // Redirect back to the patient_hp.jsp page with appointment success parameter
        response.sendRedirect("knowID.jsp?appointmentSuccess=true");
    }
}
