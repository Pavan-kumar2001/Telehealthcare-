<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
int Id=Integer.parseInt(request.getParameter("userId"));
String zoomLink = request.getParameter("zoomLink"); // Retrieve the Zoom link parameter
System.out.print(zoomLink);
String driver="oracle.jdbc.driver.OracleDriver";
String url="jdbc:oracle:thin:@localhost:1521:xe";
Class.forName(driver);
Connection con=DriverManager.getConnection(url,"system","system");
String sql="SELECT * FROM APPOINT_TEMP WHERE TAP_ID=?";
String sql2 = "INSERT INTO APPOINT (AP_ID, PATIENT_NAME, APPOINTMENT_TYPE, PHONE_NUMBER, PATIENT_INSTRUCTIONS, PRIORITY, SERVICE_TYPE, APPOINTMENT_STATUS, DOCTOR_NAME, DATE_COLUMN, TD_ID, FEES, PAYSTATUS, ZOOM_LINK) " +"VALUES (AP_ID.nextval, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

String sql3="DELETE FROM APPOINT_TEMP WHERE TAP_ID=?";
int id=0;
String P_name="";
String App_typ="";
String p_number="";
String patient="";
String priority="";
String service="";
String doc_name="";
String date="";
int fees=0;
String fees_paid="";

try {
    // Fetching data from temporary storage
    PreparedStatement ps=con.prepareStatement(sql);
    ps.setInt(1, Id);
    ResultSet rs = ps.executeQuery();
    while(rs.next()) {
        id = rs.getInt(1);
        P_name = rs.getString(2);
        App_typ = rs.getString(3);
        p_number = rs.getString(4);
        patient = rs.getString(5);
        priority = rs.getString(6);
        service = rs.getString(7);
        doc_name = rs.getString(8);
        date = rs.getString(9);
        fees = rs.getInt(10);
        fees_paid = rs.getString(11);
    }
} catch (Exception e) {
    e.printStackTrace();
    response.getWriter().print("Oops!.....");
}

String amount = Integer.toString(fees);
try {
    // Adding data to the main storage
    PreparedStatement ps1 = con.prepareStatement(sql2);
    ps1.setString(1, P_name);
    ps1.setString(2, App_typ);
    ps1.setString(3, p_number);
    ps1.setString(4, patient);
    ps1.setString(5, priority);
    ps1.setString(6, service);
    ps1.setString(7, "Approved");
    ps1.setString(8, doc_name);
    ps1.setString(9, date);
    ps1.setInt(10, Id);
    ps1.setString(11, amount);
    ps1.setString(12, fees_paid);
    ps1.setString(13, zoomLink); // Set the Zoom link parameter in the SQL statement
    ps1.executeUpdate();
} catch (Exception e) {
    e.printStackTrace();
    response.getWriter().print("Oops!.....");
}

try {
    // Deleting data from temporary storage
    PreparedStatement ps2 = con.prepareStatement(sql3);
    ps2.setInt(1, Id);
    ps2.executeQuery();
    
    response.sendRedirect("Dapr_Rej.jsp");
} catch (Exception e) {
    e.printStackTrace();
    response.getWriter().print("Oops!.....");
}
%>
</body>
</html>
