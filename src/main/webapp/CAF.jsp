<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>

</head>

<body>
<%
String name = request.getParameter("pname");
String dname = request.getParameter("dname");
String fees = request.getParameter("fees");
String at = request.getParameter("at");
String st = request.getParameter("st");
String pr = request.getParameter("pr");
String phone = request.getParameter("phone");
String date = request.getParameter("date");
String msg = request.getParameter("message");
String paystatus = null;

System.out.println(name);
System.out.println(dname);
System.out.println(fees);
System.out.println(at);
System.out.println(st);
System.out.println(pr);
System.out.println(phone);
System.out.println(date);
System.out.println(msg);

String driver = "oracle.jdbc.driver.OracleDriver";
String url = "jdbc:oracle:thin:@localhost:1521:xe";
String user = "system";
String passworda = "system";
String sql = "insert into APPOINT_TEMP values(TAP_ID.nextval,?,?,?,?,?,?,?,?,?,?)";
String str = "";
int tapId = -1;
Class.forName(driver);
Connection con = DriverManager.getConnection(url, user, passworda);
PreparedStatement ps = con.prepareStatement(sql, new String[]{"TAP_ID"});

try {
    ps.setString(1, name);
    ps.setString(2, at);
    ps.setString(3, phone);
    ps.setString(4, msg);
    ps.setString(5, pr);
    ps.setString(6, st);
    ps.setString(7, dname);
    ps.setString(8, date);
    ps.setString(9, fees);
    ps.setString(10, paystatus);

    int rowsAffected = ps.executeUpdate();
    if (rowsAffected > 0) {
        // Rows were inserted successfully
        System.out.println("Rows inserted successfully");

        ResultSet generatedKeys = ps.getGeneratedKeys();
        if (generatedKeys.next()) {
            tapId = generatedKeys.getInt(1);
            System.out.println("Generated TAP_ID: " + tapId);
            session.setAttribute("tapId",tapId);
            
        }
        generatedKeys.close();
        String redirectURL = "Epayment.jsp?tapId=" + tapId + "&fees=" + fees;
        response.sendRedirect(redirectURL);
    } else {
        // No rows were inserted
        System.out.println("No rows inserted");
    }

    // Close the database resources
    ps.close();
    con.close();
} catch (Exception e) {
    e.printStackTrace();
}
%>

</body>
</html>
