<%@page import="java.sql.*"%>
<%@page import="javax.servlet.ServletException"%>
<%@page import="javax.servlet.http.HttpServletRequest"%>
<%@page import="javax.servlet.http.HttpServletResponse"%>
<%@page import="javax.servlet.http.HttpSession"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html lang="en">

<head>


  <meta charset="utf-8">

  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="patient_Home.css">

  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">

  <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.slim.min.js"></script>

  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>

  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>

  <style>


  /* Header/Blog Title */

.header {

  padding: 0.5px;

  text-align: left;

  background: white;

}

.container{

margin-left: 50px;

}

.panel{
    display: flex;

  border: 0px solid black;

 padding-bottom: 100px;

 margin: 5px 10px 10px 10px;

 box-shadow: 0px 0px 6px rgb(0, 0, 0);

 border-radius: 10px;

}

.header h1 {

  

  font-size: 30px;

}



    .search-form {
  margin-top:12%;
  margin-left:30%;
  display:block;
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
  width:20%;
  border-radius: 4px;
  cursor: pointer;
  margin-left: 8px;
}

.search-form button[type="submit"]:hover {
  background-color: #45a049;
}
  

  </style>
<link rel="stylesheet" href="bookslot.css" >
</head>

<body>





  <div class="header">
 <a href="Index.jsp"><b><h1 ><img src="images/Telemedicine-Logo.png" width="40px">Tele Health Care</h1></b></a>
  </div>



<nav class="navbar navbar-expand-sm bg-dark navbar-dark">

  <a class="navbar-brand" href="Patient_hp.jsp">Home</a>
    <a class="navbar-brand" href="Normal.jsp">Normal-Doctors</a>
    <a class="navbar-brand" href="Nor$.jsp">Specialist-Doctors</a>
    <a class="navbar-brand" href="search.jsp">Check Appointment Status</a>
    <a class="navbar-brand" href="CHistory.jsp">Consult History</a>
    <a class="navbar-brand" href="P_Logout.jsp" style="margin-left: 550px;">Logout</a>

  
</nav>
    <div class="message">
        <% if ("true".equals(request.getParameter("appointmentSuccess"))) { %>
            <p>Your appointment has been confirmed successfully!</p>
        <% } %>
    </div>
    <%-- Establish a database connection --%>
    <%
    Connection connection = null;
    Statement selectStatement = null;
    ResultSet resultSet = null;
    
    try {
    	Class.forName("oracle.jdbc.driver.OracleDriver");
        String jdbcUrl = "jdbc:oracle:thin:@localhost:1521:xe";
        String username = "system";
        String password = "system";
        connection = DriverManager.getConnection(jdbcUrl, username, password);
        
        selectStatement = connection.createStatement();
    } catch (Exception e) {
        throw new ServletException("Unable to connect to the database.", e);
    }
    %>
    
    <%-- Fetch data from the database --%>
    <% boolean hasData = false;
    try {
        String selectQuery = "SELECT * FROM mytable";
        resultSet = selectStatement.executeQuery(selectQuery);
        
        // Check if there are any rows in the result set
        hasData = resultSet.next();
    } catch (Exception e) {
        throw new ServletException("Error fetching data from the database.", e);
    }
    %>
    
 <%-- Display the fetched data --%>
<% if (hasData) { %>
<table style="border-collapse: collapse; width: 100%;">
  <tr>
    <th style="border: 1px solid black; padding: 8px;">Sl No</th>
    <th style="border: 1px solid black; padding: 8px;">Temp ID</th>
    <th style="border: 1px solid black; padding: 8px;">Download</th>
  </tr>
  <% int slNo = 1;
  do { %>
    <tr>
      <td style="border: 1px solid black; padding: 8px;"><%= slNo++ %></td>
      <td style="border: 1px solid black; padding: 8px;"><%= resultSet.getString("temp_id") %></td>
      <td style="border: 1px solid black; padding: 8px;">
        <a href="download.jsp?temp_id=<%= resultSet.getString("temp_id") %>">Download PDF</a>
      </td>
    </tr>
  <% } while (resultSet.next()); %>
</table>
<% } else { %>
  <p>No data available.</p>
<% } %>

<style>
table {
  border-collapse: collapse;
  width: 100%;
  margin-top: 10px;
  background-color: #ffffff;
  border-radius: 8px;
}

th, td {
  border: 1px solid #e0e0e0;
  padding: 12px;
  font-size: 16px;
  font-weight: 400;
  color: #333333;
}

th {
  background-color: #f0f0f0;
  text-align: center;
}

tr:nth-child(even) {
  background-color: #f8f8f8;
}

</style>


    <%-- Close database resources --%>
    <%
    try {
        if (selectStatement != null) {
            selectStatement.close();
        }
        if (resultSet != null) {
            resultSet.close();
        }
        if (connection != null) {
            connection.close();
        }
    } catch (Exception e) {
        throw new ServletException("Error closing database resources.", e);
    }
    %>
</body>
</html>

