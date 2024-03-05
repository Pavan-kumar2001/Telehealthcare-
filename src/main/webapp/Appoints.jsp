<%@page
	import="javax.security.auth.message.callback.PrivateKeyCallback.Request"%>
<%@page import="com.TeleCare.dbHandler.dataFetcher"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Page Title</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
* {
	box-sizing: border-box;
}

body {
	font-family: Arial, sans-serif;
	line-height: 1.6;
	margin: 0;
	padding: 0;
}

.header {
	padding: 0.5px;
	text-align: left;
	background: white;
}

.header h2 {
	font-size: 22px; /* Change the font size to your desired size */
	margin: 5px 0;
}

.footer {
	text-align: center;
	background-color: #f0f0f0;
	padding: 10px;
}

nav {
	background-color: #333;
	color: #fff;
	padding: 10px;
}

nav a {
	color: #fff;
	text-decoration: none;
	margin-right: 20px;
}

nav a.active {
	background-color: #0056b3;
	font-weight: bold;
}

.container {
	max-width: 1200px;
	margin: 20px auto;
	padding: 20px;
}

.table-container {
	margin-top: 20px;
}

table {
	width: 100%;
	border-collapse: collapse;
}

th, td {
	border: 1px solid #ddd;
	padding: 8px;
	text-align: left;
}

th {
	background-color: #f2f2f2;
}

tr:nth-child(even) {
	background-color: #f9f9f9;
}

tr:hover {
	background-color: #f2f2f2;
}

.start-consult-btn {
	padding: 8px 12px;
	border: none;
	cursor: pointer;
	border-radius: 5px;
	color: #fff;
	font-size: 14px;
	background-color: #3498db;
}

.status-pending {
	background-color: #f6b93b;
	color: #fff;
	padding: 5px 10px;
	border-radius: 5px;
	font-size: 14px;
}

.status-approved {
	background-color: #2ecc71;
	color: #fff;
	padding: 5px 10px;
	border-radius: 5px;
	font-size: 14px;
}

.status-rejected {
	background-color: #e74c3c;
	color: #fff;
	padding: 5px 10px;
	border-radius: 5px;
	font-size: 14px;
}

/* Responsive layout - makes the two columns stack on top of each other instead of next to each other */
@media screen and (max-width: 600px) {
	.column {
		width: 100%;
	}
}
</style>

</head>
<body>

	<% 
 
 String data = (String) session.getAttribute("username");

 //System.out.println(mail);
  List userlist=dataFetcher.getInfoPrf(data);
  
  
  %>


	<div class="header">
		<a href="Doctor_HP.jsp" style="text-decoration: none"> <b><h2>
					<img src="images/Telemedicine-Logo.png" width="40px">Tele
					Health Care
				</h2></b>
		</a>
	</div>

	<nav>
		<a href="Doctor_HP.jsp"
			class="<%= request.getRequestURI().contains("Doctor_HP_hp.jsp") ? "active" : "" %>">Home</a>
		<a href="Appoints.jsp"
			class="<%= request.getRequestURI().contains("Appoints.jsp") ? "active" : "" %>">Appointments</a>
		<a href="Dapr_Rej.jsp"
			class="<%= request.getRequestURI().contains("Dapr_Rej.jsp") ? "active" : "" %>">Approve/Rejects</a>
		<a href="Logout.jsp"
			class="<%= request.getRequestURI().contains("Logout.jsp") ? "active right" : "right" %>">Logout</a>
	</nav>


	<%
String a1="";
for(int i=0;i<userlist.size();i++){
    String cusArr[]=((String)userlist.get(i)).split(":");
    a1=cusArr[1];}

List userlist1=dataFetcher.getInfoPrfA(a1);
    
	 %>
	<div class="container">
		<h2>Doctors Appointments</h2>
		<div class="table-container">
			<table>
				<tr>
					<th>Appointment Id</th>
					<th>Patient Name</th>
					<th>Appointment Type</th>
					<th>Health Issue</th>
					<th>Priority</th>
					<th>Service Type</th>
					<th>Appointment Status</th>
					<th>Date</th>
					<th>Actions</th>
				</tr>
				<tr>
					<% String aa1="";
                    String a2="";
                    String a3="";
                    String a4="";
                    String a5="";
                    String a6="";
                    String a7="";
                    String a8="";
                    String a9="";
                    String a10="";
                    String a11="";
                    String a12="";
                        for(int i=0;i<userlist1.size();i++){
							   String cusArr[]=((String)userlist1.get(i)).split(":");
							    aa1=cusArr[0]; 
							    a2=cusArr[1];
							    a3=cusArr[2]; 
							    a4=cusArr[3];
							    a5=cusArr[4] ;
							    a6=cusArr[5] ;
							    a7=cusArr[6] ;
							    a8=cusArr[7] ;
							    a9=cusArr[8] ;
                        		a10=cusArr[9];
                        		a11=cusArr[10];
							   a12=cusArr[11];
                        
                        %>
				
				<tr>

					<td><%= aa1 %></td>
					<td><%= a2 %></td>
					<td><%= a3 %></td>
					<td><%= a5 %></td>
					<td><%= a6 %></td>
					<td><%= a7 %></td>
					<% String s="Approved";
                                 
                                  if(s.equals(a8)){
                                	  %>
					<td class="status-approved">Approved</td>
					<%}
                                  else{
                                  %>
					<td class="status-pending">pending</td>
					<%} %>
					<td><%= a10 %></td>



					<td>
						<button class="start-consult-btn" onclick="startConsultation(1)">Start
							Consultation</button>
					</td>
				</tr>
				<!-- ... More rows ... -->
				<%} %>

			</table>
		</div>
	</div>

	<div class="footer">
		<p>&copy; 2023 Tele Health Care. All rights reserved.</p>
	</div>

	<!-- Your JavaScript logic here -->
	<script>
    function startConsultation(appointmentId) {
      // Replace this function with your logic to start the Zoom consultation
      console.log("Starting consultation for Appointment ID: " + appointmentId);

      // Replace YOUR_MEETING_ID with the actual meeting ID for the appointment
      var meetingId = "4585";

      // Construct the Zoom meeting URL
      var zoomUrl = "https://zoom.us/start?confno=" + meetingId;

      // Redirect to the Zoom meeting URL to start the consultation
      window.location.href = zoomUrl;
    }
  </script>
</body>
</html>