<%@ page language="java" contentType="text/html; charset=UTF-8"

 pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html><title> TeleHealthCare</title>
 <link rel="icon" href="images/Telemedicine-Logo.png" type="image/x-icon">
<head>
<link rel="stylesheet" href="Index.css">
<style>
.about-section {
  padding: 110px;
  text-align: center;
  background-image: url("images/loooo.jpg");
  color: white;
  background-repeat: no-repeat;
  background-size: cover;
  opacity: 0.9;




}</style>
</head>

<body >



<div class="header">

 <a href="Index.jsp" style="text-decoration: none"><b><h1 ><img src="images/Telemedicine-Logo.png" width="40px" href="Index.jsp">Tele Health Care</h1></b></a>

 

</div>



<div class="topnav">

 <a class="active" href="Index.jsp"><i class="fa fa-fw fa-home"></i> Home</a>



 <div class="dropdown">

 <button class="dropbtn">Services 

 <i class="fa fa-caret-down"></i>

 </button>

 <div class="dropdown-content">

<b> <a href="#">Normal Consult</a></b>

<b> <a href="#">Specilist Consult</a></b>

 

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

 <a href="Services/heart.html">Cardiology (Heart)</a>

 <a href="Services/gastroenterology.html">Gastroenterology & Hepatology (Digestive Care)</a>

 <a href="Services/Neurosurgery.html">Neurosurgery</a>
 
 <a href="Services/cancer.html">Oncology (Cancer)</a>
 
  <a href="Services/t1.jsp">Primary Care</a>
 </div>

 <div class="column1" style="height: 350px;">

 <h3><b>Ayurvedic</b></h3>

 <a href="Services/skincare.html">Skin Care</a>

 <a href="Services/ayurvedicdiabetes.html">Diabetes</a>

 <a href="Services/depressionaxinity.html">Depresion Axinity</a>
 
 <a href="Services/Gastric.html">Gastric</a>

 </div>

 <div class="column1" style="height: 350px;">

 <h3><b>Homoepathy</b></h3>

 <a href="Services/.paralysis.html">Paralysis </a>

 <a href="Services/piles.html">Piles </a>

 <a href="Services/eyeproblem.html">Eye Problem</a>
 
 <a href="Services/earinfection.html">Ear Infection</a>
 
 <a href="Services/Allergies.html">Allergy</a>

 </div>

 </div>

 </div>

 </div>
 
 <a href="Doctor_List_hp.jsp">Doctors</a>

 <a href="Contact_Us.jsp">Contact us</a>





 <div class="dropdown" style="float: right; margin-right: 50px;">

 <button class="dropbtn" >Signup 

 <i class="fa fa-caret-down"></i>

 </button>

 <div class="dropdown-content">

 

 <a href="Patient_Reg.jsp">Patient-Signup </a>

 <a href="Doctor_Reg.jsp">Doctor-Signup </a>

 </div>

 </div> 

 </a>

 

 <div class="dropdown" style="float: right;">

 <button class="dropbtn" id="newdrop">Login

 <i class="fa fa-caret-down"></i>

 </button>

 <div class="dropdown-content">

 <a href="Admin_Login.jsp">Admin-Login</a>

 <a href="Patient_Login.jsp">Patient-Login</a>

 <a href="Doctor_Login.jsp">Doctor-Login</a>

 </div>

 </div> 

</div>

 <div class="about-section">
      
    
    </div>

<div class="row">

 <div class="leftcolumn">

 <div class="card">

 <b><h2>Benefits of telemedicine</h2></b>

<b><p style="font-size: 15px"> Improved access to healthcare: Telemedicine enables patients to connect with healthcare providers regardless of their geographic location. This is particularly beneficial for individuals in rural or underserved areas who may have limited access to healthcare facilities. It also helps those with mobility issues or transportation challenges.</p><br>
<P>Convenience and reduced costs: Telemedicine eliminates the need for patients to travel to a healthcare facility, saving time and expenses associated with transportation. It also reduces the burden of waiting rooms and allows patients to receive care from the comfort of their homes. This can be especially valuable for individuals with chronic conditions or those requiring frequent follow-up visits.</P><br>
<p>Continuity of care: Telemedicine allows for seamless and continuous healthcare delivery. Patients can have follow-up appointments, receive medication management, and monitor their progress remotely. This promotes better care coordination and ensures ongoing support for patients, particularly those with chronic illnesses.</p>
</b>

 </div>

 <div class="card" id="k12" style="height:800px;">

 <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">


<body>



<div class="w3-container">

</div>



<div class="w3-content w3-display-container">



<div class="w3-display-container mySlides">

 <img src="images/doctor1.jpg" height="500px" style="width:95%;" >

</div>



<div class="w3-display-container mySlides">

 <img src="images/doctor2.webp" height="500px" style="width:95%;" >

</div>



<div class="w3-display-container mySlides">

 <img src="images/doctor3.jpg" height="500px" style="width:85%;">

</div>



<div class="w3-display-container mySlides">

 <img src="images/doctor4.jpg" height="500px" style="width:95%;">

</div>



<div class="w3-display-container mySlides">

 <img src="images/doctor5.jpg" height="500px" style="width:95%;">

 </div>

 



<button class="w3-button w3-display-left w3-black" onclick="plusDivs(-1)">&#10094;</button>

<button class="w3-button w3-display-right w3-black" onclick="plusDivs(1)">&#10095;</button>



</div>



<script>

var slideIndex = 1;

showDivs(slideIndex);



function plusDivs(n) {

 showDivs(slideIndex += n);

}



function showDivs(n) {

 var i;

 var x = document.getElementsByClassName("mySlides");

 if (n > x.length) {slideIndex = 1}

 if (n < 1) {slideIndex = x.length}

 for (i = 0; i < x.length; i++) {

 x[i].style.display = "none"; 

 }

 x[slideIndex-1].style.display = "block"; 

}

</script>



</div>

 </div>

 <div class="rightcolumn">

 <div class="card">

 <div class="form">

 <b><h2 class="blink"> Emergency care!</h2></b><p>Your Name</p>

 <input type="name" name="name" placeholder="Enter Your Name Here">

 <p>Phone Number</p>

 <input type="name" name="" placeholder="phone Number">,<br><br>

 

 <button class="btnn" style="background-color: red; color: white; border-radius: 10px;"><a href="Emergency_doc.jsp" style="text-decoration: none;">Consult</a></button>



 <a href="Patient_Reg.jsp"><p class="link">Ready to Register<br></a>

<a href="Patient_Login.jsp"> <a href="#">Sign In </a> here</a></p></a >

 <p class="liw">Log in with Us</p>



 



 </div>

 </div>

 <div class="card">

 <h3>Popular Post</h3>



 <div class="fakeimguu">

 <div class="blog-list-widget">

 <div class="list-group">

 <a href="marketing-single.html" class="list-group-item list-group-item-action flex-column align-items-start">

 <div class="w-100 justify-content-between">

 <img src="images/hairs.jpeg" alt="" class="img-fluid float-left">

 <h5 class="mb-1">Using cold cap to prevent hair loss during cancer</h5>

 <small>12 June, 2023</small>

 </div>

 </a>



 <a href="marketing-single.html" class="list-group-item list-group-item-action flex-column align-items-start">

 <div class="w-100 justify-content-between">

 <img src="images/food.jpeg" alt="" class="img-fluid float-left">

 <h5 class="mb-1">Reducing your risk for colorectal cancer</h5>

 <small>13 June, 2023</small>

 </div>

 </a>



 <a href="marketing-single.html" class="list-group-item list-group-item-action flex-column align-items-start">

 <div class="w-100 last-item justify-content-between">

 <img src="images/grocery.jpeg" alt="" class="img-fluid float-left">

 <h5 class="mb-1">5 things you can do to keep your colon healthy</h5>

 <small>19 June, 2023</small>

 </div>

 </a>

 </div>

 </div><!-- end blog-list -->

 </div>

 

 </div>

 <div class="card flw" style="height:245px;">

 <h3>Follow Me</h3>

 <!-- Add icon library -->

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

 <a href="https://www.facebook.com/campaign/landing.php?campaign_id=14884913640&extra_1=s%7Cc%7C550525805424%7Cb%7Cfacebook%20com%20%23%7C&placement=&creative=550525805424&keyword=facebook%20com%20%23&partner_id=googlesem&extra_2=campaignid%3D14884913640%26adgroupid%3D128696221352%26matchtype%3Db%26network%3Dg%26source%3Dnotmobile%26search_or_content%3Ds%26device%3Dc%26devicemodel%3D%26adposition%3D%26target%3D%26targetid%3Dkwd-498889442776%26loc_physical_ms%3D1007768%26loc_interest_ms%3D%26feeditemid%3D%26param1%3D%26param2%3D&gclid=CjwKCAjwkLCkBhA9EiwAka9QRidzOW0xfd8jGfPbcgtTitHPs7zyT2P515L6cz0CgzgFX-ZDvMi4kxoCvysQAvD_BwE" class="faa faa-facebook"><img src="images/fac.png" height="25px" width="25px"></a>

 <a href="https://www.instagram.com/techmedicine/?hl=en" class="faa faa-facebook"><img src="images/inst.jpg" height="25px" width="37px"></a>

 <a href="twitter.com" class="faa faa-facebook"><img src="images/twt.png" height="25x" width="25px"></a> &nbsp;

 <a href="https://www.youtube.com/" class="faa faa-facebook"><img src="images/utube.png" height="25x" width="25px"></a>

 

 </div>

 </div>

</div>



<div class="footer">



 <a href="#" class="w3-button w3-black w3-margin" ><i class="fa fa-arrow-up w3-margin-right"></i>To the top</a>

 <div class="footer__addr">

 <h1 class="footer__logo">TeleHealthCare</h1>

 

 <h2>Contact</h2>

 

 <address>

 5534 Somewhere In. The World 22193-10212<br>

 

 <a class="footer__btn" href="mailto:example@gmail.com">Email Us</a>

 </address>

 </div>

 

 <ul class="footer__nav">

 <li class="nav__item">

 <h2 class="nav__title" style="margin-left: 90%">Media</h2>



 <ul class="nav__ul" style="margin-left: 90%">

 <li>

 <a href="#">Online</a>

 </li>



 <li>

 <a href="#">Print</a>

 </li>

 

 <li>

 <a href="#">Alternative Ads</a>

 </li>

 </ul>

 </li>

 

 <li class="nav__item nav__item--extra">



 

 <li class="nav__item">

 <h2 class="nav__title">Legal</h2>

 

 <ul class="nav__ul">

 <li>

 <a href="#">Privacy Policy</a>

 </li>

 

 <li>

 <a href="#">Terms of Use</a>

 </li>

 

 <li>

 <a href="#">Sitemap</a>

 </li>

 </ul>

 </li>

 </ul>

 

 <div class="legal">

 <p>&copy; 2019 Something. All rights reserved.</p>

 

 <div class="legal__links">

 <span>Made with <span class="heart">♥</span> remotely from Anywhere</span>

 </div>

 </div>

</div>



</body>

</html>

