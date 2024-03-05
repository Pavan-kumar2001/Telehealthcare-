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
String Id=request.getParameter("Id");
String driver="oracle.jdbc.driver.OracleDriver";
String url="jdbc:oracle:thin:@localhost:1521:xe";
Class.forName(driver);
Connection con=DriverManager.getConnection(url,"system","system");
String sql="SELECT * FROM TEMPDOC_REG WHERE TD_ID=?";
String sql2="insert into DOCTOR_REG values(D_ID.nextval,?,?,?,?,?,?,?,?,?)";
String sql3="DELETE FROM TEMPDOC_REG WHERE TD_ID=?";
int id =0;
String  name="";
String  email="";
String  p_number="";
String  age="";
String  password="";
String  qualification="";
String  gender="";
String  emg="";

int  fees=0;
try{
	//FEATCHING DATA FROM TEMPORARY STORAGE

	PreparedStatement ps=con.prepareStatement(sql);
	ps.setString(1, Id);
	ResultSet rs=	ps.executeQuery();
	while(rs.next()) {
		
		 id=rs.getInt(1);
		 name=rs.getString(2);
		  email=rs.getString(3);
	      p_number=rs.getString(4);
		 age=rs.getString(5);
		 password=rs.getString(6);
		 qualification=rs.getString(7);
		 gender=rs.getString(8);
		 fees=rs.getInt(9);
		 emg=rs.getString(10);
		
	}}catch(Exception e){
		e.printStackTrace();
		response.getWriter().print("Oops!.....");
	}
try{
	//ADDING DATA TO MAIN STORAGE
	PreparedStatement ps1=con.prepareStatement(sql2);
	ps1.setString(1,name);
	ps1.setString(2, email);
	ps1.setString(3, p_number);
	ps1.setString(4, age);
	ps1.setString(5, password);
	ps1.setString(6, qualification);
	ps1.setString(7, gender);
	ps1.setInt(8,fees);
	ps1.setString(9,emg);
	ps1.executeUpdate();}
	catch(Exception e){
		e.printStackTrace();
		response.getWriter().print("Oops!.....");
	}
try{
	//DELETING DATA FROM TEMPORARY STORAGE
	PreparedStatement ps2=con.prepareStatement(sql3);
	ps2.setString(1,Id);
	ps2.executeQuery();
	
	response.sendRedirect("Admin_HP.jsp");
}

	
catch(Exception e){
	e.printStackTrace();
	response.getWriter().print("Oops!.....");
}
	
	

%>
</body>
</html>