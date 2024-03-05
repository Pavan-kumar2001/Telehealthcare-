<%@page import="javax.security.auth.message.callback.PrivateKeyCallback.Request"%>
<%@page import="com.TeleCare.dbHandler.dataFetcher"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Approve-Reject Page</title>
  <link rel="icon" href="images/Telemedicine-Logo.png" type="image/x-icon">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
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

    .approve-btn, .reject-btn {
      padding: 8px 12px;
      border: none;
      cursor: pointer;
      border-radius: 5px;
      color: #fff;
      font-size: 14px;
    }

    .approve-btn {
      background-color: #4CAF50;
    }

    .reject-btn {
      background-color: #f44336;
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
/* Responsive layout - when the screen is less than 700px wide, make the two columns stack on top of each other instead of next to each other */
@media screen and (max-width: 700px) {
  .row {   
    flex-direction: column;
  }
}

/* Responsive layout - when the screen is less than 400px wide, make the navigation links stack on top of each other instead of next to each other */
@media screen and (max-width: 400px) {
  .navbar a {
    float: none;
    width: 100%;
  }
}
* {
  box-sizing: border-box;
}
</style>

</head>
<body>
    
 <% 

 
  
  
 String data = (String) session.getAttribute("username");
  //System.out.println(str);
  List userlist=dataFetcher.getInfoPrf(data);
  
  
  
  %>
  
   <div class="header">
    <a href="Doctor_HP.jsp" style="text-decoration: none">
      <b><h2><img src="images/Telemedicine-Logo.png" width="40px">Tele Health Care</h2></b>
    </a>
  </div>

<nav>
  <a href="Doctor_HP.jsp" class="<%= request.getRequestURI().contains("Doctor_HP_hp.jsp") ? "active" : "" %>">Home</a>
  <a href="Appoints.jsp" class="<%= request.getRequestURI().contains("Appoints.jsp") ? "active" : "" %>">Appointments</a>
  <a href="Dapr_Rej.jsp" class="<%= request.getRequestURI().contains("Dapr_Rej.jsp") ? "active" : "" %>">Approve/Rejects</a>
  <a href="Logout.jsp" class="<%= request.getRequestURI().contains("Logout.jsp") ? "active right" : "right" %>">Logout</a>
</nav>



     <%
String a1="";
for(int i=0;i<userlist.size();i++){
    String cusArr[]=((String)userlist.get(i)).split(":");
    a1=cusArr[1];}

List userlist1=dataFetcher.getInfoPrfTemp(a1);
    
	 %>
  <div class="container">
    <h2>Approve/Reject Appointments</h2>
    <div class="table-container">
      <table>
        <tr>
          <th>Appointment Id</th>
          <th>Patient Name</th>
          <th>Appointment Type</th>
          <th>Health Issue</th>
          <th>Date</th>
          <th>Fees</th>
         <th>Paid Status</th>
         <th>Appointment Status</th>
          <th>Actions</th>
        </tr>
        <!-- Add appointment data rows here -->
        <!-- Example row:--->
        <% for(int i=0; i<userlist1.size(); i++) {
            String cusArr[] = ((String)userlist1.get(i)).split(":");
        %>
        <tr>
            <tr>
                <td><%= cusArr[0] %></td>
                <td><%= cusArr[1] %></td>
                <td><%= cusArr[2] %></td>
                <td><%= cusArr[3] %></td>
                <td><%= cusArr[4] %></td>
                <td><%= cusArr[5] %></td>
                <td><%= cusArr[6] %></td>
          <td class="status-pending">Pending</td>
          <td>
            <form action="AppointApprove.jsp" method="post">
                <input type="hidden" name="userId" value="<%= cusArr[0] %>">
                <input type="hidden" id="zoomLink_<%= cusArr[0] %>" name="zoomLink" placeholder="Zoom Link">
                <button type="submit" class="approve-btn" onclick="generateZoomLink('<%= cusArr[0] %>')">Generate Zoom Link and Approve</button>
              </form>
            
            <button class="reject-btn"  href="delete.jsp?Id=<%= cusArr[0] %>">Reject</button>
          </td>
        </tr>
      <%} %>
      </table>
      <script>
        function generateZoomLink(userId) {
          var zoomLink = "https//zoom.us/meetingid=" + userId;
          document.getElementById("zoomLink_" + userId).value = zoomLink;
        }
        </script>
    </div>
  </div>

  <div class="footer">
    <p>&copy; 2023 Tele Health Care. All rights reserved.</p>
  </div>

  <!-- Add JavaScript logic for approving/rejecting appointments if needed -->
</body>
</html>
    