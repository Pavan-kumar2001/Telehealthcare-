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
int Id=Integer.parseInt(request.getParameter("Id"));


	
	
	String sql="DELETE FROM DOCTOR_REG  WHERE D_ID=?";
	String url=("jdbc:oracle:thin:@localhost:1521:xe");
	String user="system";
	String pass="system";

	try{
		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection con=DriverManager.getConnection(url,user,pass);
		PreparedStatement ps=con.prepareStatement(sql);

		ps.setInt(1, Id);
	
	


		ResultSet rs=ps.executeQuery();
      
	response.sendRedirect("Doctor_Reg.jsp");
			
}
		
	
catch(Exception e){
	e.printStackTrace();
	System.out.print("OPPS");
	
}
 



%>
</body>
</html>