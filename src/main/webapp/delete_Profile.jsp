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
<title>Delete profile</title>
</head>
<body>
<%
int id=Integer.parseInt(request.getParameter("Id"));
String sql="DELETE FROM PATIENT_REG WHERE P_ID=?";
String url=("jdbc:oracle:thin:@localhost:1521:xe");
String user="system";
String pass="system";
String str="";

try{
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection con=DriverManager.getConnection(url,user,pass);
PreparedStatement ps=con.prepareStatement(sql);
   ps.setInt(1, id);

	ResultSet rs=ps.executeQuery();
	response.getWriter().print("Successfully deleted profile Id="+id);
	
	}catch(Exception e){
		e.printStackTrace();
		response.getWriter().print("OOps");
	}


	%>
</body>
</html>