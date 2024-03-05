<%@page import="javax.security.auth.message.callback.PrivateKeyCallback.Request"%>
<%@page import="com.TeleCare.dbHandler.dataFetcher"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Page Title</title>
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

/* Header/logo Title */
.header {
  padding: 0.5px;
  text-align: left;
  background: white;
}

.header h1 {
  
  font-size: 30px;
}

/* Sticky navbar - toggles between relative and fixed, depending on the scroll position. It is positioned relative until a given offset position is met in the viewport - then it "sticks" in place (like position:fixed). The sticky value is not supported in IE or Edge 15 and earlier versions. However, for these versions the navbar will inherit default position */
.navbar {
  overflow: hidden;
  background-color: #333;
  position: sticky;
  position: -webkit-sticky;
  top: 0;
}

/* Style the navigation bar links */
.navbar a {
  float: left;
  display: block;
  color: white;
  text-align: center;
  padding: 14px 20px;
  text-decoration: none;
}


/* Right-aligned link */
.navbar a.right {
  float: right;
}

/* Change color on hover */
.navbar a:hover {
  background-color: #ddd;
  color: black;
}

/* Active/current link */
.navbar a.active {
  background-color: #666;
  color: white;
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


</style>

</head>
<body>
    
 <% 
 

 String id=request.getParameter("Id");

 //System.out.println(mail);
  List userlist=dataFetcher.emergency(id);
  
  
  %>
  
    <div class="header">
        <a href="Index.jsp"><b><h1 ><img src="images/Telemedicine-Logo.png" width="40px">Tele Health Care</h1></b></a>
       
      </div>

<div class="navbar">
 <a href="Doctor_HP.jsp" class="active">Home</a>
  <a href="#">Consult Emergency</a>
  
    <a href="Dapr_Rej.jsp">Approve/Rejects</a>
  <a href="Logout.jsp" class="right">Logout</a>
</div>



    <div class="main">

    <div class="row">
        <div class="column" style="background-color:#fbfbff; width: 1726px">
         <h2>Total Appointment</h2>
        <table class="styled-table">
            <thead>
                <tr>
                    <th>Patient Name</th>
                    <th>Pateint P.No</th>
                 
                    <th>Health Issue</th>
                    
              
                   
                   
                   <th style="width: 100px; "> Doctor Prescription</th>
                </tr>
            </thead>
            <tbody>
                
                <tr class="active-row">
                    <% String aa1="";
                    String a2="";
                    String a3="";
                    String a4="";
                 
                        for(int i=0;i<userlist.size();i++){
							   String cusArr[]=((String)userlist.get(i)).split(":");
							    aa1=cusArr[0]; 
							    a2=cusArr[1];
							 a3=cusArr[2];
							    a4=cusArr[3];
							 
							   
                        %>
                                <tr>
                                    
                                    <td>  <%= aa1 %></td>
                                    <td>  <%= a2 %></td>
                                   
                                    <td>  <%= a4 %></td>
                                    
                               
                                  <td>   
                    <form method='post' action='completeAppointment.jsp'>
                    <input type='hidden' name='appointmentId' value=  <%= id %>  >
                    <textarea class='comment-input' name='doctorComments' rows='2' cols='30' placeholder='Doctor&#39;s Comments'></textarea><br>
                    <input type='submit' class='complete-button' value='Complete'>
                    </form></td>
                                </tr>
                   
                                <%} %>
            </tbody>
        </table>
    </div> 
  </div>
 
 




</body>
</html>
    