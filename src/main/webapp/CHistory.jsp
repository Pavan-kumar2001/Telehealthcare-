<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
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
      margin-bottom: 20px; /* Add margin to push the table down */
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
    /* Add styles for the appointment table */
    .appointment-table {
      width: 100%;
      border-collapse: collapse;
    }
  
    .appointment-table th,
    .appointment-table td {
      border: 1px solid #ddd;
      padding: 8px;
    }
  
    .appointment-table th {
      background-color: #f2f2f2;
      text-align: left;
    }
  
    .appointment-table tr:nth-child(even) {
      background-color: #f9f9f9;
    }
  
    .appointment-table tr:hover {
      background-color: #ddd;
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
  <div class="centered-grid">
    <div class="container">
      <form class="search-form"  method="get">
        <input type="text" name="appointmentId" placeholder="Enter your Appointment ID">
        <button type="submit">Search</button>
      </form>
      <%
      String appointmentId = request.getParameter("appointmentId");
      
      if (appointmentId != null) {
        try {
          // Establish a database connection
          String url=("jdbc:oracle:thin:@localhost:1521:xe");
          String user="system";
          String pass="system";
          Class.forName("oracle.jdbc.driver.OracleDriver");
          Connection con=DriverManager.getConnection(url,user,pass);

          // Prepare and execute the SQL query
          String query = "SELECT * FROM HISTORY WHERE AP_ID = ?";
          PreparedStatement statement = con.prepareStatement(query);
          statement.setString(1, appointmentId);
          ResultSet rs = statement.executeQuery();

          // Process the query result and populate the appointmentData list
          List<String> appointmentData = new ArrayList<String>();
          while (rs.next()) {
            String rowData = rs.getInt(1) + ":" + rs.getInt(2) + ":" + rs.getString(3) + ":" + rs.getString(4) + ":" + rs.getString(5) + ":" + rs.getString(6) + ":" + rs.getString(7);
            appointmentData.add(rowData);
          }

          // Close the database connection
          rs.close();
          statement.close();
          con.close();

          // Display the appointment history
          if (appointmentData.isEmpty()) {
            %>
            <div class="search-results">No appointment history found for ID <%= appointmentId %>.</div>
            <%
          } else {
            %>
            <h2 class="search-results">Appointment History for ID <%= appointmentId %>:</h2>
            <table class="appointment-table">
              <tr>
                <th>Health ID</th>
                <th>Appointment ID</th>
                <th>Patient Name</th>
                <th>Doctor Name</th>
                <th>Health Issue</th>
                <th>Doctor Prescription</th>
                <th>Appointment Date</th>
              </tr>
              <%
              for (String rowData : appointmentData) { 
                String[] rowValues = rowData.split(":");
              %>
              <tr>
                <%
                for (String value : rowValues) { 
                %>
                <td><%= value.trim() %></td>
                <%
                } 
                %>
              </tr>
              <%
              } 
              %>
            </table>
            <%
          }
        } catch (Exception e) {
          e.printStackTrace();
        }
      }
      %>
    </div>
  </div>
  <div class="footer">
    <p>&copy; <%= new java.text.SimpleDateFormat("yyyy").format(new java.util.Date()) %> Doctors. All rights reserved.</p>
  </div>
</body>
</html>
