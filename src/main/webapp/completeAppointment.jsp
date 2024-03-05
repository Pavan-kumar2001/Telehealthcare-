<%@page import="com.TeleCare.dbHandler.dataFetcher"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page import="java.util.Date" %>
<%@ page import="java.time.LocalDate" %>
<%@ page import="java.time.format.DateTimeFormatter" %>
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
 int appointmentId = Integer.parseInt(request.getParameter("appointmentId"));
        String doctorComments = request.getParameter("doctorComments");
        
        LocalDate currentDate = LocalDate.now();
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd-MMM-yy");
        String formattedDate = currentDate.format(formatter);
        
        
        %>
       
       
       <% 
       String patientN="";
       String doctorN="";
       String patientIstr="";
  List userlist=dataFetcher.getInfoPrfM(appointmentId);
  for(int i=0;i<userlist.size();i++){
	    String cusArr[]=((String)userlist.get(i)).split(":");
	    patientN=cusArr[0];
	    doctorN=cusArr[1];
	    patientIstr=cusArr[2];
  }
  %>
  
  <%
  String driver="oracle.jdbc.driver.OracleDriver";
String url="jdbc:oracle:thin:@localhost:1521:xe";
Class.forName(driver);
Connection con=DriverManager.getConnection(url,"system","system");
String sql2="insert into HISTORY values(H_ID.nextval,?,?,?,?,?,?)";
String sql3="DELETE FROM APPOINT WHERE AP_ID=?";
try{
	//ADDING DATA TO MAIN STORAGE
	PreparedStatement ps1=con.prepareStatement(sql2);
	ps1.setInt(1,appointmentId);
	ps1.setString(2,  patientN);
	ps1.setString(3, doctorN);
	ps1.setString(4, patientIstr);
	ps1.setString(5, doctorComments);
	ps1.setString(6, formattedDate);
	
	ps1.executeUpdate();}
	catch(Exception e){
		e.printStackTrace();
		response.getWriter().print("Oops!.....");
	}
try{
	//DELETING DATA FROM TEMPORARY STORAGE
	PreparedStatement ps2=con.prepareStatement(sql3);
	ps2.setInt(1,appointmentId);
	ps2.executeQuery();
	
	response.sendRedirect("Appoints.jsp");
}

	
catch(Exception e){
	e.printStackTrace();
	response.getWriter().print("Oops!.....");
}
%>
       
</body>
</html>