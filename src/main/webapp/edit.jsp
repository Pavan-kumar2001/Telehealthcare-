<%@page import="java.util.List"%>
<%@page import="com.TeleCare.dbHandler.dataFetcher"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Patient Profile</title>
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
      font-size: 22px;
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
      color: #007bff;
    }

    .profile p {
      margin: 5px 0;
    }

    .profile form {
      margin-top: 20px;
    }

    .profile label {
      display: block;
      margin-bottom: 5px;
    }

    .profile input {
      width: 100%;
      padding: 8px;
      margin-bottom: 10px;
    }

    .profile input[type="submit"] {
      background-color: #007bff;
      color: #fff;
      border: none;
      border-radius: 5px;
      padding: 10px;
      cursor: pointer;
    }

    .profile input[type="submit"]:hover {
      background-color: #0056b3;
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
      <!-- Profile edit form -->
      <form action="UpdateProfileServlet" method="post">
        <input type="hidden" name="patientID" value="<%= cusArr[0] %>">
        <label for="name">Name:</label>
        <input type="text" id="name" name="name" value="<%= name %>">
        <label for="email">Email:</label>
        <input type="email" id="email" name="email" value="<%= cusArr[2] %>">
        <label for="phone">Phone Number:</label>
        <input type="tel" id="phone" name="phone" value="<%= cusArr[3] %>">
        <input type="submit" value="Save Changes">
      </form>
      
      <!-- Delete account button -->
      <form action="DeleteAccountServlet" method="post">
        <input type="hidden" name="patientID" value="<%= cusArr[0] %>">
        <input type="submit" value="Delete Account">
      </form>
    </div>
  <%} %>
</div>
 <!-- Footer -->
  <div class="footer">
    <p>&copy; 2023 Tele Health Care. All rights reserved.</p>
  </div>
</body>
</html>
