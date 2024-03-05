<%@page import="com.TeleCare.dbHandler.dataFetcher"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html><title> Tele Health Care</title>
<head>
<style>
* {
  box-sizing: border-box;
  font-family: 'Poppins';
 
}

body {
  font-family: Arial;
  /* padding: 10px; */
  background: #d7d7d7cd;
  padding: 20px ;
}

/* Header/Blog Title */
.header {
  padding: 0.5px;
  text-align: left;
  background: white;
}

.header h1 {
  
  font-size: 30px;
}

/* Style the top navigation bar */
.topnav {
  overflow: hidden;
  background-color: #333;
  border-radius: 5px;
}

/* Style the topnav links */
.topnav a {
  float: left;
  display: block;
  color: #f2f2f2;
  text-align: center;
  padding: 14px 16px;
  text-decoration: none;
}


/* Change color on hover */
.topnav a:hover {
  background-color: #ddd;
  color: black;
}

/* Create two unequal columns that floats next to each other */
/* Left column */
.leftcolumn {   
  float: left;
  width: 100%;
margin-top: 50px;
}

/* Right column 
.rightcolumn {
  float: left;
  width: 25%;
  background-color: #d7d7d7cd;
  padding-left: 1px;
  text-align: center;
  align-items:center;
  justify-content: center;
  margin-top: -2px;
  margin-bottom: 500px;
}*/


/* Fake image */
.fakeimg {
  background-color: #aaa;
  width: 25%;
  padding: 5%;
}

/* Add a card effect for articles */
.card {
  background-color: white;
  padding:150px  ;
  margin-top: -34%;

}

/* Clear floats after the columns */
.row::after {
  content: "";
  display: table;
  clear: both;
}

/* Footer */


/* Responsive layout - when the screen is less than 800px wide, make the two columns stack on top of each other instead of next to each other */
@media screen and (max-width: 800px) {
  .leftcolumn, .rightcolumn {   
    width: 100%;
    padding: 0;
  }
}

/* Responsive layout - when the screen is less than 400px wide, make the navigation links stack on top of each other instead of next to each other */
@media screen and (max-width: 400px) {
  .topnav a {
    float: none;
    width: 100%;
  }
}
.blink {
    animation: blinker 1.5s linear infinite;
    color: red;
    font-family: sans-serif;
}
@keyframes blinker {
    50% {
        opacity: 0;
    }
}.dropdown {
    float: left;
    overflow: hidden;
  }
  
  .dropdown .dropbtn {
    font-size: 16px;  
    border: none;
    outline: none;
    color: white;
    padding: 14px 16px;
    background-color: inherit;
    font-family: inherit;
    margin: 0;
  }
  
  .navbar a:hover, .dropdown:hover .dropbtn {
    background-color: red;
  }
  
  .dropdown-content {
    display: none;
    position: absolute;
    background-color: #f9f9f9;
    min-width: 160px;
    box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
    z-index: 1;
  }
  
  .dropdown-content a {
    float: none;
    color: black;
    padding: 12px 16px;
    text-decoration: none;
    display: block;
    text-align: left;
  }
  
  .dropdown-content a:hover {
    background-color: #ddd;
  }
  
  .dropdown:hover .dropdown-content {
    display: block;
  }

.faa:hover {
  opacity: 0.7;
}
#k12{
  background-color: rgb(255, 255, 255);
  padding:  50px 50px 11px 50px  ;
  margin-top: 20px;
}
/* Footer css */


*, *:before, *:after {
  box-sizing: border-box;
}

html {
  font-size: 100%;
}

body {
  font-family: acumin-pro, system-ui, sans-serif;
  margin: 0;
  display: grid;
  grid-template-rows: auto 1fr auto;
  font-size: 14px;
  background-color: #d7d7d7cd;
  align-items: start;
  min-height: 100vh;
}



.nav__title {
  font-weight: 400;
  font-size: 15px;
}





.footer ul {
  list-style: none;
  padding-left: 0;
}

.footer li {
  line-height: 2em;
}

.footer a {
  text-decoration: none;
}

.footer__nav {
  display: flex;
	flex-flow: row wrap;
}

.footer__nav > * {
  flex: 1 50%;
  margin-right: 1.25em;
}

.nav__ul a {
  color: #ffffff;
}

.nav__ul--extra {
  column-count: 2;
  column-gap: 1.25em;
}


@media screen and (min-width: 24.375em) {
  .legal .legal__links {
    margin-left: auto;
  }
}

@media screen and (min-width: 40.375em) {
  .footer__nav > * {
    flex: 1;
  }
  
  .nav__item--extra {
    flex-grow: 2;
  }
  
  .footer__addr {
    flex: 1 0px;
  }
  
  .footer__nav {
    flex: 2 0px;
  }
}

/*        */
.styled-table {
    border-collapse: collapse;
    margin: 25px 0;
    font-size: 0.9em;
    font-family: sans-serif;
    min-width: 400px;
    box-shadow: 0 0 20px rgba(0, 0, 0, 0.15);
}
.styled-table {
    border-collapse: collapse;
    margin: 25px 0;
    font-size: 0.9em;
    font-family: sans-serif;
    min-width: 1200px;
    box-shadow: 0 0 20px rgba(0, 0, 0, 0.15);
}
.styled-table th,
.styled-table td {
    padding: 12px 15px;
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
  List userlist=dataFetcher.getInfo();
  
  %>

<div class="header">
  <b><h1 ><img src="images/Telemedicine-Logo.png" width="40px">Tele Health Care</h1></b>
 
</div>

<div class="topnav">
    <a class="active" href="Index.jsp"><i class="fa fa-fw fa-home"></i> Home</a>

    <div class="dropdown">
        <button class="dropbtn">Users
          <i class="fa fa-caret-down"></i>
        </button>
        <div class="dropdown-content">
          <a href="Doctors-List.jsp">Doctors List</a>
          <a href="Patients-List.jsp">Patients List</a>
          
        </div>
      </div> 
    
  <div class="dropdown" style="float: right;">
  <a href="Index.jsp" style="text-decoration: none;"> <button class="dropbtn">LogOut
      <i class="fa fa-caret-down"></i>
    </button></a> 

  </div> 
</div>

<div class="row">
  <div class="leftcolumn">
    <div class="card" style="height: 472px; ">
      <b><h2>Approve/Reject List</h2></b>
        <table class="styled-table">
            <thead>
                <tr>
                    <th>TD-Id</th>
                    <th>Name</th>
                    <th>EMAIL</th>
                    <th>P_NUMBER</th>
                    <th>AGE</th>
                    <th>PASSWORD</th>
                    <th>QUALIFICATION</th>
                    <th>GENDER</th>
                     <th>Fees</th>
                    <th>ACCEPT</th>
                    <th> REJECT</th>
                </tr>
            </thead>
            <tbody>
                
                <tr class="active-row">
                     <% 
                        for(int i=0;i<userlist.size();i++){
							   String cusArr[]=((String)userlist.get(i)).split(":");
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
                                    <td>  <%= cusArr[8] %></td>
                                      <td><a href="Aprrove.jsp?Id=<%=cusArr[0]%>">Approve</a></td>
                                             <td><a href="delete.jsp?Id=<%=cusArr[0]%>">Reject</a></td>
                                
                                </tr>
                                <%   }    %>
            </tbody>
        </table>
    </div> 
  </div>
 


</body>
</html>