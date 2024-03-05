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
String Id=request.getParameter("Id");
String driver="oracle.jdbc.driver.OracleDriver";
String url="jdbc:oracle:thin:@localhost:1521:xe";
String sql="DELETE FROM TEMPDOC_REG WHERE TD_ID=?";
try{
	Class.forName(driver);
	Connection con=DriverManager.getConnection(url,"system","system");
	PreparedStatement ps=con.prepareStatement(sql);
	ps.setString(1,Id);
	ps.executeQuery();
	
	response.sendRedirect("Admin_HP.jsp");
	
}catch(Exception e){
	e.printStackTrace();
	response.getWriter().print("Aiyyo couldn't deleted");
}

%>
</body>
</html>