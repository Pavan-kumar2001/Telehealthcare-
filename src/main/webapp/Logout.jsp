<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Logout</title>
      <script type="text/javascript">
        function preventBack() { window.history.forward(); }
        setTimeout("preventBack()", 0);
        window.onunload = function () { null };
    </script>
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
    
    /* Footer */
    .footer {
      padding: 20px;
      text-align: center;
      background: #ddd;
      margin-top: 20px;
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
    
      
    
    </style>
</head>
<body>
   
    
        <div class="header">
          <a href="Index.jsp"><b><h1 ><img src="images/Telemedicine-Logo.png" width="40px">Tele Health Care</h1></b></a>
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
              <div class="dropdown">
                <button class="dropbtn">Treatment 
                  <i class="fa fa-caret-down"></i>
                </button>
                <div class="dropdown-content">
                  <a href="#">Diabetes</a>
                  <a href="#">Link 2</a>
                  <a href="#">Link 3</a>
                </div>
              </div> 
          <a href="Contact_Us.jsp">Contact us</a>
         
        </div>
         <h1>Logout Successful!</h1>
    <p>Thank you for using our application. Please take a moment to review your experience.</p>
    
    <!-- Add your review form or any other content here -->
    
    <!-- Example review form -->
    <form action="Doctor_Login.jsp" method="post">
        <label for="rating">Rating (1-5):</label>
        <input type="number" name="rating" min="1" max="5" required>
        
        <label for="comments">Comments:</label>
        <textarea name="comments" required></textarea>
        
        <input type="submit" value="Submit Review">
    </form>
    
    <!-- Redirect to review.jsp after a few seconds -->
    <script>
        setTimeout(function() {
            window.location.href = "Doctor_Login.jsp";
        }, 20000); // Redirect after 20 seconds
    </script>
</body>
</html>
