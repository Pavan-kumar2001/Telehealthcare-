<%@page import="com.TeleCare.dbHandler.dataFetcher"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Normal Doctor</title>
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
    .footer {
      text-align: center;
      background-color: #f0f0f0;
      padding: 10px;
      margin-top: 30px;
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
 
    .centered-grid {
      display: grid;
      justify-content: center; /* Center horizontally */
      align-items: center; /* Center vertically */
      height: 70vh; /* 80% of viewport height */
    }
    .search-form {
      display: grid;
      grid-template-columns: 1fr auto;
      grid-gap: 10px;
       background-color:  #f0f0f0; /* Standard color for the search box */
      padding: 10px;
      border-radius: 6px;
      box-shadow: 0px 0px 6px rgba(0, 0, 0, 0.2);
    }
    .search-form input[type="text"] {
      padding: 8px;
      font-size: 16px;
      border: 1px solid #ccc;
      border-radius: 4px;
    }
    .search-form button[type="submit"] {
      padding: 8px 16px;
      font-size: 16px;
      background-color: #4CAF50;
      color: white;
      border: none;
      width: 130%;
      border-radius: 4px;
      cursor: pointer;
    }
    .search-form button[type="submit"]:hover {
      background-color: #45a049;
    }
    .search-results {
      margin-top: 20px;
      text-align: center;
      font-weight: bold;
    }
  </style>
  <!-- Add Bootstrap CSS and JavaScript files -->
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
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

  <%
    String data = (String) session.getAttribute("username");
    List userlist = dataFetcher.getInfoPrfeSECH(data);
    String name = "";
    for (int i = 0; i < userlist.size(); i++) {
      String cusArr[] = ((String) userlist.get(i)).split(":");
      name = cusArr[0];
    }
  %>
  <!-- Centered grid for the search form -->
  <div class="centered-grid">
    <form class="search-form" action="srch" method="post">
      <input type='hidden' name='name' value="<%= name %>">
      <input type="text" name="TD" placeholder="Enter your Temp ID">
      <button type="submit">Search</button>
    </form>
  </div>

  <%
    String namea = "Search Here ";
    String nam = request.getParameter("name");
    int appointmentId = 0;

    try {
      appointmentId = Integer.parseInt(request.getParameter("b1"));
    } catch (NumberFormatException e) {
      // Handle the case when the appointment ID is not a valid integer
    }

    if (nam != null && appointmentId > 0) {
      %>
      <div class="search-results">Your search term: <%= nam %></div>
      <div class="search-results">Your Appointment ID is: <%= appointmentId %></div>
      <%
    } else if (nam != null) {
      %>
      <div class="search-results">Your search term: <%= nam %></div>
      <div class="search-results">Please provide a valid Appointment ID.</div>
      <%
    } else {
      %>
      <div class="search-results"><%= namea %></div>
      <%
    }
  %>

  <div class="footer">
    <p>&copy; <%= new java.text.SimpleDateFormat("yyyy").format(new java.util.Date()) %> Doctors. All rights reserved.</p>
  </div>
</body>
</html>
