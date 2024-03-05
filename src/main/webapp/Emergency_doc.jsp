<%@page import="javax.security.auth.message.callback.PrivateKeyCallback.Request"%>
<%@page import="com.TeleCare.dbHandler.dataFetcher"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
  
  .card {
  box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
  max-width: 300px;
  margin: auto;
  text-align: center;
}

.title {
  color: grey;
  font-size: 18px;
}

button {
  border: none;
  outline: 0;
  display: inline-block;
  padding: 2px;
  color: white;
  background-color: #000;
  text-align: center;
  cursor: pointer;
  width: 100%;
  font-size: 18px;
}

a {
  text-decoration: none;
  font-size: 22px;
  color: black;
}

button:hover, a:hover {
  opacity: 0.7;
} 
  
  
  
  
    .profile-user {
      height: 20px;
      background: #1a1717;
    }

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

    .left {
      height: 70vh;
      width: 60vh;
      box-shadow: 0px 2px 15px gray;
      border-radius: 10px;
    }

    .left label {
      margin-left: 30px;
      font-size: large;
      font-weight: bold;
    }

    .prf {
      align-items: center;
      justify-content: center;
      text-align: center;
    }

    .right {
      height: 1000vh;
      width: 155vh;
      margin-left: 10px;
    }

    /*grid */
    .grid-container {
      display: grid;
      grid-template-columns: 1fr 1fr 1fr 1fr 1fr;
      grid-gap: 50px;
      margin-left: 70px;
      margin-top: 20px;
    }

    .grid-container > div {
      text-align: center;
      padding: 5px 0;
      font-size: 30px;
    }

    .grid-container img {
      margin-left: 25%;
    }

    .w3-container p {
      text-align: left;
      margin-left: 300px;
      font-size: 20px;
      font-weight: bold;
    }
  </style>
  <link rel="stylesheet" href="bookslot.css">
   <%-- Check if the appointment was successful and display a message --%>
    <% if (request.getParameter("appointmentSuccess") != null) { %>
        <p>Appointment Successful!</p>
    <% } %>
</head>
<body>
  <% 
  String data = (String) session.getAttribute("username");

  List userlist = dataFetcher.getInfoPrfGridEmg();
  %>
  <div class="header">
    <a href="Index.jsp"><b><h1 ><img src="images/Telemedicine-Logo.png" width="40px">Tele Health Care</h1></b></a>
  </div>
  <nav class="navbar navbar-expand-sm bg-dark navbar-dark">
    <a class="navbar-brand" href="Index.jsp">Home</a>
    
   
  
  </nav>
    <center>  <h1 style="font-weight: bold">Emergency Doctors</h1></center> 
  <div class="panel">


    <div class="right">
      <div class="grid-container">
        <% for(int i=0; i<userlist.size(); i++) {
          String cusArr[] = ((String) userlist.get(i)).split(":");
        %>
        <div class="item1">
          <div class="card">
            <img src="images/docPrf.jpeg" alt="John" style="width:50%">
            <h1><%= cusArr[1] %></h1>
            <p class="title"><%= cusArr[5] %></p>
            <p>
              <button onclick="openProfile(<%= i %>)" class="w3-button w3-black">Open profile</button>
            </p>
          </div>
        </div>
        <% } %>
      </div>
    </div>
   <% for(int i=0; i<userlist.size(); i++) {
  String cusArr[] = ((String) userlist.get(i)).split(":");
%>
<div id="id<%= i+1 %>" class="w3-modal">
  <div class="w3-modal-content w3-animate-zoom w3-card-4">
    <header class="w3-container w3-teal">
      <span onclick="closeProfile(<%= i %>)" class="w3-button w3-display-topright">&times;</span>
      <h2><%= cusArr[1] %></h2>
    </header>
    <div class="w3-container">
      <p><strong>ID:</strong> <%= cusArr[0] %></p>
      <p><strong>Email:</strong> <%= cusArr[2] %></p>
      <p><strong>Qualification:</strong> <%= cusArr[5] %></p>
      <p><strong>Age:</strong> <%= cusArr[4] %></p>
      <p><strong>Gender:</strong> <%= cusArr[6] %></p>
      <p><strong>Fees:</strong> <%= cusArr[7] %></p>
      <a href="makeAppointment.jsp?dn=<%= cusArr[1] %>&fees=<%= cusArr[7] %>" class="button">Make An Appointment</a>
    </div>
  </div>
</div>
<% } %>

    <style>
      .button {
        background-color: #728FCE;
        border: none;
        color: black;
        padding: 15px 32px;
        text-align: center;
        text-decoration: none;
        display: inline-block;
        font-size: 16px;
        margin: 4px 2px;
        cursor: pointer;
      }
    </style>
    <script>
      function openProfile(index) {
        var modal = document.getElementById("id" + (index + 1));
        modal.style.display = "block";
      }
      function closeProfile(index) {
        var modal = document.getElementById("id" + (index + 1));
        modal.style.display = "none";
      }
    </script>
  </div>

</body>
</html>
