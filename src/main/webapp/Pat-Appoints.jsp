<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.*"%>
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

    /* Styles for the appointment table */
    .appointment-table {
      width: 100%;
      border-collapse: collapse;
      margin-top: 20px;
    }

    .appointment-table th,
    .appointment-table td {
      border: 1px solid #ddd;
      padding: 8px;
      text-align: left;
    }

    .appointment-table th {
      background-color: #f2f2f2;
    }

    .appointment-table tr:nth-child(even) {
      background-color: #ffffff; /* Standard color for even rows */
    }

    /* Highlight active row */
    .appointment-table tr.active-row {
      background-color: #f2f2f2; /* Highlight color for active row */
    }

    .appointment-table tr:hover {
      background-color: #f9f9f9; /* Hover color for all rows */
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
  }
  %>
 <% 
    try {
      // Establish a database connection
      String url = "jdbc:oracle:thin:@localhost:1521:xe";
      String user = "system";
      String pass = "system";
      Class.forName("oracle.jdbc.driver.OracleDriver");
      Connection con = DriverManager.getConnection(url, user, pass);

      // Prepare and execute the SQL query
      String query = "SELECT * FROM APPOINT WHERE PATIENT_NAME=?";
      PreparedStatement statement = con.prepareStatement(query);
      statement.setString(1, name);
      ResultSet rs = statement.executeQuery();

      // Process the query result and populate the appointmentData list
      List<String> appointmentData = new ArrayList<String>();
      while (rs.next()) {
        String rowData = rs.getInt(1) + ":" + rs.getString(3) + ":" + rs.getString(5) + ":" + rs.getString(6)
            + ":" + rs.getString(7) + ":" + rs.getString(8) + ":" + rs.getString(9) + ":" + rs.getString(10) + ":"
            + rs.getString(12) + ":" + rs.getString(14);
        appointmentData.add(rowData);
      }

      // Close the database connection
      rs.close();
      statement.close();
      con.close();

      // Display the appointment history
      if (appointmentData.isEmpty()) {
  %>
        <p>No Doctors Found</p>
  <%
      } else {
  %>
    <h2>Appointment List</h2>
    <div class="container">
      <table class="appointment-table">
        <tr>
          <th>Appointment Id</th>
          <th>Appointment type</th>
          <th>Health Issue</th>
          <th>Priority</th>
          <th>Service type</th>
          <th>Appointment Status</th>
          <th>Doctor name</th>
          <th>Date</th>
          <th>Fees</th>
          <th>Zoom Id</th>
        </tr>
        <%
        for (String rowData : appointmentData) {
          String[] rowValues = rowData.split(":");
          String appointmentId = rowValues[0].trim(); // Assuming the appointment Id is the first value

          // Check if the current row is the active row based on some condition (e.g., appointmentId is active)
          boolean isActiveRow = true; // Replace with your logic to determine active row

          // Add class "active-row" to the current row if it's the active row
          String rowClass = isActiveRow ? "active-row" : "";
        %>
        <tr class="<%= rowClass %>">
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
    </div>
  <%
      }
    } catch (Exception e) {
      e.printStackTrace();
    }
  %>

  <div class="footer">
    <p>&copy; 2023 Tele Health Care. All rights reserved.</p>
  </div>
</body>
</html>
