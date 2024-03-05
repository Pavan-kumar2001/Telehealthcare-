<%@page import="java.text.SimpleDateFormat"%>
<%@page import="javax.security.auth.message.callback.PrivateKeyCallback.Request"%>
<%@ page import="java.util.Date" %>
<%@ page import="java.time.LocalDate" %>
<%@ page import="java.time.format.DateTimeFormatter" %>
<%@page import="com.TeleCare.dbHandler.dataFetcher"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Patient Web Page</title>
  <link rel="icon" href="images/Telemedicine-Logo.png" type="image/x-icon">
  <style>
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
    .container {
      display: flex;
      justify-content: space-between;
      max-width: 1200px;
      margin: 20px auto;
      padding: 20px;
    }
    .profile {
      width: 30%;
      background-color: #f0f0f0;
      padding: 20px;
      border-radius: 10px;
    }
    .profile img {
      width: 100px;
      height: 100px;
      border-radius: 50%;
      margin-bottom: 10px;
    }
    .profile h2 {
      font-size: 24px;
      margin-bottom: 10px;
      font-weight: bold;
      color: #007bff; /* Change the color to your desired color */
    }
    .profile p {
      margin: 5px 0;
    }
    .appointments {
      width: 65%;
    }
    .appointment-card {
      background-color: #f9f9f9;
      padding: 15px;
      margin-bottom: 15px;
      border-radius: 5px;
      box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
    }
    .appointment-card h2 {
      font-size: 20px;
      margin-bottom: 10px;
      color: #007bff;
    }
    .appointment-card p {
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
    .my-appointments-btn {
  display: block;
  margin-top: 10px;
  background-color: #007bff;
  color: #fff;
  padding: 8px 16px;
  text-align: center;
  border-radius: 5px;
  text-decoration: none;
}

.my-appointments-btn:hover {
  background-color: #0056b3;
}
     nav a.active {
      background-color: #0056b3;
      font-weight: bold;
    }
  </style>
</head>
<body>
  <% 
  String data = (String) session.getAttribute("username");
  List<String> userlist1 = dataFetcher.getInfoPrfe(data);
 
  %>
   <div class="header">
    <a href="Patient_hp.jsp" style="text-decoration: none">
      <b><h2><img src="images/Telemedicine-Logo.png" width="40px">Tele Health Care</h2></b>
    </a>
  </div>
   <nav>
    <a href="Patient_hp.jsp" class="<%= request.getRequestURI().contains("Patient_hp.jsp") ? "active" : "" %>">Home</a>
    <a href="Normal.jsp" class="<%= request.getRequestURI().contains("Normal.jsp") ? "active" : "" %>">Normal-Doctors</a>
    <a href="Nor$.jsp" class="<%= request.getRequestURI().contains("Nor$.jsp") ? "active" : "" %>">Specialist-Doctors</a>
    <a href="search.jsp" class="<%= request.getRequestURI().contains("search.jsp") ? "active" : "" %>">Check Appointment Status</a>
    <a href="CHistory.jsp" class="<%= request.getRequestURI().contains("CHistory.jsp") ? "active" : "" %>">Consult History</a>
    <a href="P_Logout.jsp" style="margin-left: 700px;" class="<%= request.getRequestURI().contains("P_Logout.jsp") ? "active" : "" %>">Logout</a>
    <!-- Add more links if needed -->
  </nav>
  <% String name="";
  for(int i=0; i<userlist1.size(); i++){
    String cusArr[] = userlist1.get(i).split(":");
    name=cusArr[1];
  %>
  <div class="container">
    <div class="profile">
      <img src="images/docPrf.jpeg" alt="Patient Avatar">
      <h2><%= name %></h2>
      <p><strong>ID:</strong> <%=cusArr[0]  %></p>
      <p><strong>Email:</strong> <%= cusArr[2] %></p>
      <p><strong>Phone Number:</strong> <%=cusArr[3] %></p>
     <p><strong>Age:</strong> 35</p>
     <a href="edit.jsp" class="my-appointments-btn">My Profile</a>

      <a href="Pat-Appoints.jsp" class="my-appointments-btn">My Appointments</a>
    </div>
  <%} %>
   <% 
SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
String currentDate = sdf.format(new Date());

// Fetch today's appointments
 List<String> userlist = dataFetcher.getInfotodayAA(currentDate, name);
%>

<div class="appointments" id="appointments">
  <h1>Today Appointments</h1>
  <% for (String appointment : userlist) {
    String[] appointmentData = appointment.split(":");
  %>
    <div class="appointment-card">
      <h2>Appointment with <%= appointmentData[0] %></h2>
      <p>Date: <%= appointmentData[1] %></p>
      <p>APPOINTMENT_STATUS: <%= appointmentData[2] %></p>
      <% if (appointmentData.length > 3 && appointmentData[3] != null && !appointmentData[3].isEmpty()) { %>
        <p>Zoom Link: <a href="<%= appointmentData[3] %>" target="_blank"><%= appointmentData[3] %></a></p>
      <% } else { %>
        <p>Zoom Link: N/A</p>
      <% } %>
    </div>
  <% } %>
</div>
</div>
  <div class="footer">
    <p>&copy; 2023 Tele Health care. All rights reserved.</p>
  </div>
</body>
</html>
