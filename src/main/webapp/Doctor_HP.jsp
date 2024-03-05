<%@page import="javax.security.auth.message.callback.PrivateKeyCallback.Request"%>
<%@ page import="java.util.Date" %>
<%@ page import="java.time.LocalDate" %>
<%@ page import="java.time.format.DateTimeFormatter" %>
<%@page import="com.TeleCare.dbHandler.dataFetcher"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>

<title>Doctor Page</title>
  <link rel="icon" href="images/Telemedicine-Logo.png" type="image/x-icon">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
* {
  box-sizing: border-box;
}

/* Style the body */
body {
  font-family: Arial, Helvetica, sans-serif;
  margin: 0;
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
/* Column container */
.row {  
  display: -ms-flexbox; /* IE10 */
  display: flex;
  -ms-flex-wrap: wrap; /* IE10 */
  flex-wrap: wrap;
}

/* Create two unequal columns that sits next to each other */
/* Sidebar/left column */
.side {
  -ms-flex: 30%; /* IE10 */
  flex: 30%;
  background-color: #f1f1f1;
  padding: 30px 30px 220px 30px;
}

/* Main column */
.main {   
  -ms-flex: 70%; /* IE10 */
  flex: 70%;
  background-color: white;
  padding: 20px;
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

/* Create two equal columns that floats next to each other */
.column {
  float: left;
  width: 50%;
  padding: 10px;
  height: 300px; /* Should be removed. Only for demonstration */
 
}

/* Clear floats after the columns */
.row:after {
  content: "";
  display: table;
  clear: both;
}



.flip-card {

  width: 400px;
  height: 250px;
  border: 1px solid #f1f1f1;
  perspective: 1000px; /* Remove this if you don't want the 3D effect */
  margin-top: 20px;
  margin-left: 40px;
}

/* This container is needed to position the front and back side */
.flip-card-inner {
  position: relative;
  width: 100%;
  height: 100%;
  text-align: center;
  transition: transform 0.8s;
  transform-style: preserve-3d;
}

/* Do an horizontal flip when you move the mouse over the flip box container */
.flip-card:hover .flip-card-inner {
  transform: rotateY(180deg);
}

/* Position the front and back side */
.flip-card-front, .flip-card-back {
  position: absolute;
  width: 100%;
  height: 100%;
  -webkit-backface-visibility: hidden; /* Safari */
  backface-visibility: hidden;
}

/* Style the front side (fallback if image is missing) */
.flip-card-front {
  background-color: #fbfbff;;
  color: black;
  box-shadow: 0px 2px 15px black;
  border-radius: 10px;
}

/* Style the back side */
.flip-card-back {
  background-color: #e0e0e0;
  color: black;
  transform: rotateY(180deg);
   border-radius: 10px;
     box-shadow: 0px 2px 15px black;
   
}


/* Responsive layout - makes the two columns stack on top of each other instead of next to each other */
@media screen and (max-width: 600px) {
  .column {
    width: 100%;
  }
}

/* Container needed to position the overlay. Adjust the width as needed */
.container {
  position: relative;
  width: 100%;
  max-width: 400px;
}

/* Make the image to responsive */
.image {
  width: 100%;
  height: auto;
}

/* The overlay effect (full height and width) - lays on top of the container and over the image */
.overlay {
  position: absolute;
  top: 0;
  bottom: 0;
  left: 0;
  right: 0;
  height: 100%;
  width: 100%;
  opacity: 0;
  transition: .3s ease;
  background-color: red;
}

/* When you mouse over the container, fade in the overlay icon*/
.container:hover .overlay {
  opacity: 1;
}

/* The icon inside the overlay is positioned in the middle vertically and horizontally */
.icon {
  color: white;
  font-size: 100px;
  position: absolute;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
  -ms-transform: translate(-50%, -50%);
  text-align: center;
}

/* When you move the mouse over the icon, change color */
.fa-user:hover {
  color: #eee;
}

/*Systele tabel*/
.styled-table {
    border-collapse: collapse;
    margin: 25px 0;
    font-size: 0.9em;
    font-family: sans-serif;
    min-width: 0px;
    box-shadow: 0 0 20px rgba(0, 0, 0, 0.15);
}
  .footer {
      text-align: center;
      background-color: #f0f0f0;
      padding: 10px;
    }
.styled-table {
    border-collapse: collapse;
    margin: 0px 0;
    font-size: 0.9em;
    font-family: sans-serif;
    min-width: 0px;
    box-shadow: 0 0 20px rgba(0, 0, 0, 0.15);
}
.styled-table th,
.styled-table td {
    padding: 5px 7px;
}
.styled-table tbody tr {
    border-bottom: 1px solid #dddddd;
}

.styled-table tbody tr:nth-of-type(even) {
    background-color: #f3f3f3;
}

.styled-table tbody tr:last-of-type {
    border-bottom: 2px solid #009879;
}
.styled-table tbody tr.active-row {
    font-weight: bold;
    color: #009879;
}

#ediprf{
background-color: black;
color: white;
padding: 7px;
margin-top: 14%;
margin-left: 2%;
border-radius: 10px;



}

</style>

</head>
<body>
    
 <% 
 

 //HttpServletRequest req = (HttpServletRequest) pageContext.getRequest();
 String data = (String) session.getAttribute("username");

 String pp="";
 String pp1="";
 String pp2="";
 String pp3="";
 String pp4="";

 String ap_cond="";
 
 //System.out.println(mail);
  List userlist=dataFetcher.getInfoPrf(data);
  for(int i=0;i<userlist.size();i++){
      String cusArr[]=((String)userlist.get(i)).split(":");
      pp=cusArr[0] ;
      pp1=cusArr[1];
      pp2=cusArr[2];
      pp3=cusArr[3];
      pp4=cusArr[5];
  }
  int fees=dataFetcher.getInfoPrfAFEES(pp1);

  List userlistC=dataFetcher.getInfoPrfCon(pp1);
  for(int i=0;i<userlistC.size();i++){
      String cusArr[]=((String)userlistC.get(i)).split(":");
      ap_cond=cusArr[0];
  }
 
  %>
  
      <div class="header">
    <a href="Doctor_HP.jsp" style="text-decoration: none">
      <b><h2><img src="images/Telemedicine-Logo.png" width="40px">Tele Health Care</h2></b>
    </a>
  </div>

<nav>
  <a href="Doctor_HP.jsp" class="<%= request.getRequestURI().contains("Doctor_HP_hp.jsp") ? "active" : "" %>">Home</a>
  <a href="conEmernav.jsp?Id=<%= pp %>" class="<%= request.getRequestURI().contains("conEmernav.jsp") ? "active" : "" %>">Consult Emergency</a>
  <a href="Appoints.jsp" class="<%= request.getRequestURI().contains("Appoints.jsp") ? "active" : "" %>">Appointments</a>
  <a href="Dapr_Rej.jsp" class="<%= request.getRequestURI().contains("Dapr_Rej.jsp") ? "active" : "" %>">Approve/Rejects</a>
  <a href="Logout.jsp" class="<%= request.getRequestURI().contains("Logout.jsp") ? "active right" : "right" %>">Logout</a>
</nav>


<div class="row">
  <div class="side">
    <h2 style="color:green;">Profile</h2>
    <img src="images/docPrf.jpeg" width="100px" style="border-radius: 45%; margin-left: 30%;" >

    <h3>Id Number&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;: <%=pp %> </h3>
   
    <h3> Name &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;: <%= pp1 %> </h3>
    <h3>Qualification &nbsp;&nbsp;&nbsp;&nbsp;:<%=pp2  %> </h3>
    <h3>Email &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:<%= pp3 %> </h3>
   
   
    
    <div class="edit">
   <a href="editDoc.jsp?Id=<%= pp %>"><button  id="ediprf">Edit Profile</button></a> 
    <a href="deleteDocPrf.jsp?Id=<%= pp %>" >   <button id="ediprf">Delete Profile</button></a> 
 <% 

 
 if (pp4.equals("No")) { %>
  <a href="consult_emr.jsp?Id=<%= pp %>">
    <button id="ediprf">Emergency Consultancy</button>
  </a>
<% } else { %>

<% } %>

     
    </div>
  </div>
  <div class="main">
   
    <div class="row">
        <div class="column" style="background-color:#fbfbff;">
            <div class="flip-card">
                <div class="flip-card-inner">
                  <div class="flip-card-front">
<h1 style="background-color:#e0e0e0;border-radius:10px; margin: 90px 45px 0px 45px;">Total Appointments Done</h1>
                  </div>
                  <div class="flip-card-back">
                    <h2 style="color:Black;">Total Appointment Conducted</h2>
                    <h2 style="color:red;"><%=ap_cond %></h2>
                    <p>Till Now</p>
                  </div>
                </div>
              </div>
        </div>
       
        <div class="column" style="background-color:#fbfbff;">
            <div class="flip-card">
                <div class="flip-card-inner">
                  <div class="flip-card-front">
                   <h1 style="background-color:#e0e0e0;border-radius:10px; margin: 90px 45px 0px 45px;">Fees Collected</h1>
                  </div>
                  <div class="flip-card-back">
  
                    <h1>Total Fees Collected</h1>
                    
          <label style="background-color: black ; color: white;padding: 10px 20px 10px 20px;font-weight: bold;font-size:25px;   border-radius: 10px"><%=fees %>.Rs</label><span>  </span>
                    <p>Till Now</p> 
                  
                  </div>
                </div>
              </div>
        </div>
      </div>
   
<%
    LocalDate currentDate = LocalDate.now();

    DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
    
    String formattedDate = currentDate.format(formatter);
   
    System.out.print(formattedDate);
    List userlist1=dataFetcher.getInfoPrfATODAY(pp1,formattedDate);
    
%>
      <h2 style="color: blue;">Today Appointment</h2>

        <table class="styled-table">
            <thead>
                <tr>
                    <th>Appointment Id</th>
                    <th>Patient Name</th>
                    <th>Appointment type</th>
                    <th>Phone NUMBER</th>
                    <th>Patient Instructions</th>
                    <th>Priority</th>
                    <th>Service type</th>
                   <th> Appointment status</th>
                </tr>
            </thead>
            <tbody>
                
                <tr class="active-row">
                    <% 
                        for(int i=0;i<userlist1.size();i++){
							   String cusArr[]=((String)userlist1.get(i)).split(":");
                        %>
                                <tr>
                                    <td>  <%= cusArr[0] %></td>
                                    <td>  <%= cusArr[1] %></td>
                                    <td>  <%= cusArr[2] %></td>
                                    <td>  <%= cusArr[3] %></td>
                                    <td>  <%= cusArr[4] %></td>
                                    <td>  <%= cusArr[5] %></td>
                                    <td>  <%= cusArr[6] %></td>
                                    <td>  <%= cusArr[7] %></td>
                                 
                                   
                                
                                </tr>
                                
                                <%  
                                }  
                              %>
            </tbody>
            
        </table>
    </div> 
  </div>
<div class="footer">
    <p>&copy; 2023 Tele Health Care. All rights reserved.</p>
  </div>
</body>
</html>
    