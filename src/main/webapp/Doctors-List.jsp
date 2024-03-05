<%@page import="java.sql.*"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
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

    .container {
      margin-left: 50px;
    }

    .panel {
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
      margin-top: 12%;
      margin-left: 30%;
      display: block;
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
      width: 20%;
      border-radius: 4px;
      cursor: pointer;
      margin-left: 8px;
    }

    .search-form button[type="submit"]:hover {
      background-color: #45a049;
    }

    /* Add your custom CSS styles here */

    /* Additional styles for list view */
    .doctors-list {
      margin-top: 20px;
    }

    /* New CSS for table formatting */
    .doctors-table {
      width: 100%;
      border-collapse: collapse;
      margin-top: 20px;
    }

    .doctors-table th,
    .doctors-table td {
      padding: 8px;
      border: 1px solid #ddd;
      text-align: left;
    }

    .doctors-table th {
      background-color: #f2f2f2;
    }
  </style>
  <link rel="stylesheet" href="bookslot.css">
</head>

<body>
  <div class="header">
    <a href="Index.jsp">
      <b>
        <h1><img src="images/Telemedicine-Logo.png" width="40px">Tele Health Care</h1>
      </b>
    </a>
  </div>

  <nav class="navbar navbar-expand-sm bg-dark navbar-dark">
    <a class="navbar-brand" href="Admin_HP.jsp">Home</a>
    <a class="navbar-brand" href="Admin_Login.jsp" style="margin-left: 1350px;">Logout</a>
  </nav>

  <% 
    try {
      // Establish a database connection
      String url=("jdbc:oracle:thin:@localhost:1521:xe");
      String user="system";
      String pass="system";
      Class.forName("oracle.jdbc.driver.OracleDriver");
      Connection con=DriverManager.getConnection(url,user,pass);

      // Prepare and execute the SQL query
      String query = "SELECT * FROM DOCTOR_REG";
      PreparedStatement statement = con.prepareStatement(query);
      ResultSet rs = statement.executeQuery();

      // Process the query result and populate the appointmentData list
      List<String> appointmentData = new ArrayList<String>();
      while (rs.next()) {
        String rowData = rs.getInt(1) + ":" + rs.getString(2) + ":" + rs.getString(3) + ":" + rs.getString(4) + ":" + rs.getString(5) + ":" + rs.getString(7) + ":" + rs.getString(8)+ ":" + rs.getInt(9)+ ":" + rs.getString(10);
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
  <div class="doctors-list">
    <table class="doctors-table">
      <tr>
        <th>Name</th>
        <th>Email</th>
        <th>Ph-Number</th>
        <th>Age</th>
        <th>Qualification</th>
        <th>Gender</th>
        <th>Fees</th>
        <th>Emergency</th>
      </tr>
      <% 
        for (String rowData : appointmentData) { 
          String[] rowValues = rowData.split(":");
      %>
      <tr>
        <td><%= rowValues[1].trim() %></td>
        <td><%= rowValues[2].trim() %></td>
        <td><%= rowValues[3].trim() %></td>
        <td><%= rowValues[4].trim() %></td>
        <td><%= rowValues[5].trim() %></td>
        <td><%= rowValues[6].trim() %></td>
        <td><%= rowValues[7].trim() %></td>
        <td><%= rowValues[8].trim() %></td>
      </tr>
      <% } %>
    </table>
  </div>
  <% 
      }
    } catch (Exception e) {
      e.printStackTrace();
    }
  %>
</body>
</html>
