<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>



<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%

String driver = "oracle.jdbc.driver.OracleDriver";
    String url="jdbc:Oracle:thin:@localhost:1521:xe";
    String user="system";
    String passworda="system";
    int appointmentId = Integer.parseInt(request.getParameter("appointmentId"));
    double fees = Double.parseDouble(request.getParameter("fees"));

    // Perform payment processing logic (e.g., connect to payment gateway, process payment)

    // If payment is successful, update the payment status in the database
    boolean paymentSuccessful = true; // Set this based on the actual payment result
    if (paymentSuccessful) {
        try (Connection connection = DriverManager.getConnection(url, user, passworda)) {
            // Update the payment status in the database for the appointment
            String updatePaymentSql = "UPDATE APPOINT_TEMP SET PAYSTATUS = 'Paid' WHERE appointment_id = ?";
            PreparedStatement updatePaymentStatement = connection.prepareStatement(updatePaymentSql);
            updatePaymentStatement.setInt(1, appointmentId);
            updatePaymentStatement.executeUpdate();
            // You can also store the payment details or perform additional actions here

            // Redirect back to the appointment form with a success message
            response.sendRedirect("makeAppointment.jsp?success=true");
        } catch (Exception e) {
            e.printStackTrace();
            // Handle database error or provide appropriate response
            response.sendRedirect("makeAppointment.jsp?error=database");
        }
    } else {
        // Handle payment failure and redirect back to the appointment form with an error message
        response.sendRedirect("makeAppointment.jsp?error=payment");
    }
%>
</body>
</html>