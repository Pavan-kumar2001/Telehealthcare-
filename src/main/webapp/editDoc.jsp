<%@page import="java.io.PrintWriter"%>
<%@page import="com.TeleCare.dbHandler.dataFetcher"%>
<%@page import="com.TeleCare.dbHandler.dataInjector"%>
<%@page import="javax.servlet.annotation.WebServlet"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Profile</title>
<style>
.panel{

border: 3px solid black;
width: 30%;
border-radius:10px;
box-shadow:0px 2px 15px black;
text-align: center;
justify-content: center;
align-content: center;
align-items: center;
padding: 50px 0px 20px 0px;

}
input{
border: 2px solid black;

border-radius:5px;
box-shadow:0px 2px 15px black;

}
label{
font-weight: bold;
}
</style>
</head>
<body>
<%
int Id=Integer.parseInt(request.getParameter("Id")); 

String sql="SELECT * FROM DOCTOR_REG WHERE D_ID=?";
String url=("jdbc:oracle:thin:@localhost:1521:xe");
String user="system";
String pass="system";
String str="";

try{
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection con=DriverManager.getConnection(url,user,pass);
PreparedStatement ps=con.prepareStatement(sql);
   ps.setInt(1, Id);

	ResultSet rs=ps.executeQuery();
	while(rs.next()){
	%>
		
     <center>  <h1>Edit Panel</h1><center> 
		
        <div class="panel">

<form action="editDocPrf" method="post">

               <div class="prf">
<h1>Profile</h1>
<img src="images/docPrf.jpeg" height="80px" width="80px" style="border: 2px solid  black; border-radius: 50%;">
</div>
 
<br><label>ID : <input type="text" value=<%=rs.getInt(1) %> name="id"  readonly ></label><br><br><br>
<label>Name : <input type="text" value=<%= rs.getString(2) %> name="name"></label><br><br><br>
<label>Qualification &nbsp;: <input type="text" value=  <%=  rs.getString(7)  %> name="quali">  </label><br><br><br><br>
<label>Email: <input type="text" value= <%=  rs.getString(3)  %> name="email"></label><br><br><br>

<%   }    %>
 
 
<input type="submit" value="submit"> 
  </div>
 </form>
 </div>

  <%
	}
catch(Exception e){
e.printStackTrace();
}
  %>


</body>
</html>