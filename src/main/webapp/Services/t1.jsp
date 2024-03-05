<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="ss.css">
<style>
* {
  box-sizing: border-box;
  font-family: 'Poppins';
}

body {
  font-family: Arial;
  padding: 1px;
  background: #f1f1f1;
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
  width: 75%;
}

/* Right column */
.rightcolumn {
  float: left;
  width: 25%;
  background-color: #f1f1f1;
  padding-left: 5px;
  text-align: center;
  align-items:center;
  justify-content: center;
}

/* Fake image */
.fakeimg {
  background-color: #aaa;
  width: 25%;
  padding: 5%;
}

/* Add a card effect for articles */
.card {
  background-color: white;
  padding: 50px;
  margin-top: 20px;
}

/* Clear floats after the columns */
.row::after {
  content: "";
  display: table;
  clear: both;
}


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
  body  {
  font-family: "Lato", sans-serif;
}
/* Style the sidebar - fixed full height */
.sidebar {
  height: 100%;
  width: 160px;
  position: fixed;
  z-index: 1;
  top: 143px;
  left: 0;
  background-color: #111;
  overflow-x: hidden;
  padding-top: 16px;
}

/* Style sidebar links */
.sidebar a {
  padding: 6px 8px 6px 16px;
  text-decoration: none;
  font-size: 20px;
  color: #818181;
  display: block;
}

/* Style links on mouse-over */
.sidebar a:hover {
  color: #f1f1f1;
}

/* Style the main content */
.main {
  margin-left: 160px; /* Same as the width of the sidenav */
  padding: 0px 10px;
}

/* Add media queries for small screens (when the height of the screen is less than 450px, add a smaller padding and font-size) */
@media screen and (max-height: 450px) {
  .sidebar {padding-top: 15px;}
  .sidebar a {font-size: 18px;}
}
body {
  font-family: Arial, Helvetica, sans-serif;
  margin: 0;
}

html {
  box-sizing: border-box;
}

*, *:before, *:after {
  box-sizing: inherit;
}

.column {
  float: left;
  width: 33.3%;
  margin-bottom: 16px;
  padding: 0 8px;
}

.card {
  box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
  margin: 8px;
}

.about-section {
  padding: 50px;
  text-align: center;
  background-image: url("images/services-and-treatments.jpg");
  color: white;
}

.container {
  padding: 0 16px;
}

.container::after, .row::after {
  content: "";
  clear: both;
  display: table;
}

.title {
  color: grey;
}

.button {
  border: none;
  outline: 0;
  display: inline-block;
  padding: 8px;
  color: white;
  background-color: #000;
  text-align: center;
  cursor: pointer;
  width: 100%;
}
footer {
  text-align: center;
  padding: 3px;
  background-color:#333;
  color: white;
}

.button:hover {
  background-color: #555;
}

@media screen and (max-width: 650px) {
  .column {
    width: 100%;
    display: block;
  }

}
  

</style>
</head><body>

    <div class="header">
       <b><h1 ><img src="Telemedicine-Logo.png" width="40px">Tele Health Care</h1></b>
    </div>
    
    <div class="topnav">
        <a class="active" href="Index.jsp"><i class="fa fa-fw fa-home"></i> Home</a>
    
        <div class="dropdown">
            <button class="dropbtn">Services 
              <i class="fa fa-caret-down"></i>
            </button>
            <div class="dropdown-content">
              <a href="#">Normal Consult</a>
              <a href="#">Specilist Consult</a>
              
            </div>
          </div> 
         <div class="dropdown1">

 <button class="dropbtn1">Treatment

 <i class="fa fa-caret-down"></i>

 </button>

 <div class="dropdown-content1">

 <div class="header1" >

<center> <h2 style="color:black"><b>Treatment Available's</b></h2></center>

 </div>

 <div class="row1">

 <div class="column1" style="height: 350px;">

 <h3><b>Alopathy</b></h3>

 <a href="heart.html">Cardiology (Heart)</a>

 <a href="gastroenterology.html">Gastroenterology & Hepatology (Digestive Care)</a>

 <a href="Neurosurgery.html">Neurosurgery</a>
 
 <a href="cancer.html">Oncology (Cancer)</a>
 
  <a href="t1.jsp">Primary Care</a>
 </div>

 <div class="column1" style="height: 350px;">

 <h3><b>Ayurvedic</b></h3>

 <a href="skincare.html">Skin Care</a>

 <a href="ayurvedicdiabetes.html">Diabetes</a>

 <a href="depressionaxinity.html">Depresion Axinity</a>
 
 <a href="Gastric.html">Gastric</a>

 </div>

 <div class="column1" style="height: 350px;">

 <h3><b>Homoepathy</b></h3>

 <a href="paralysis.html">Paralysis </a>

 <a href="piles.html">Piles </a>

 <a href="eyeproblem.html">Eye Problem</a>
 
 <a href="earinfection.html">Ear Infection</a>
 
 <a href="Allergies.html">Allergy</a>

 </div>

 </div>

 </div>

 </div>

      <a href="contact.html">Contact us</a>
      <a href="#" style="float:right">Logout</a>
    </div>
    <div class="about-section">
      <h1>Specialties, Services &amp; Treatments</h1>
    
    </div>
   <h2 style="text-align:initial;margin-left: 24%">Primary Care</h2></pre> 
    <h4 style="margin-left: 24%; width: 50%;"> Primary care is your first resource for health care. It encompasses health services to cover a range of prevention, 
      wellness and treatment of common health conditions and illnesses. 
      It also is where you go for checkups and routine medical appointments.
      Health care professionals in primary care include physicians, nurse practitioners and physician assistants. 
      They often maintain a long-term relationship with you to support and manage your ongoing care.</h4>
      <h2 style="margin-left: 24%"  >Primary Care includes these specialties:</h2>
      <h4 style="margin-left: 24%"> * Family Medicine<br>
         *Internal Medicine<br>
        * Pediatric & Adolescent Medicine<br>
        To learn about our health care professionals, browse the directory of providers, making sure to select your preferred location.</h4>
    <h2 style="margin-left: 24%" >Key facts</h2>
      <h4 style="margin-left: 24%" >Approximately half the world's population currently lacks access to essential health care.<br> 
      Ageing, population growth, and a rising burden of noncommunicable diseases are driving the transformation of primary care.<br>
      Primary care has been shown to meet most of a person’s health needs throughout their life.</h4>
      <h2 style="margin-left: 24%">What is the relationship between primary care and primary health care? </h2>
      <h4 style="margin-left: 24%">Primary care is a key process in a health system that provides promotive, protective, preventive, curative, rehabilitative, and palliative services throughout the life course. Primary health care (PHC) is a broader whole-of-society approach with three components: (a) primary care and essential public health functions as a core of integrated health services; (b) multisectoral policy and action; and (c) empowered people and communities. </h4>
      <footer>
        <p>Author: Health Care<br>
        <a href="mail:healthcare@gmail.com">hege@example.com</a></p>
      </footer>
      
      </body>
</html>