<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<title>TeleHealthCare</title>
<!-- Created By CodingLab - www.codinglabweb.com -->
<html lang="en" dir="ltr">
<head>
<script type="text/javascript">
	function preventBack() {
		window.history.forward();
	}
	setTimeout("preventBack()", 0);
	window.onunload = function() {
		null
	};
</script>
<style>
@import
	url('https://fonts.googleapis.com/css2?family=Poppins:wght@200;300;400;500;600;700&display=swap')
	;

* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
	font-family: 'Poppins', sans-serif;
}

.container {
	/* max-width: 700px; */
	width: 600px;
	background-color: #fff;
	padding: 10px 0 20px 170px;
	border-radius: 10px;
	box-shadow: 0 2px 15px rgba(0, 0, 0, 0.15);
	margin-left: 400px;
	margin-top: 50px;
}

.container .title {
	font-size: 25px;
	font-weight: 500;
	position: relative;
}

.container .title::before {
	content: "";
	position: absolute;
	left: 0;
	bottom: 0;
	height: 3px;
	width: 30px;
	border-radius: 5px;
	background: linear-gradient(135deg, #71b7e6, #9b59b6);
}

.content form .user-details {
	display: block;
	flex-wrap: wrap;
	justify-content: space-between;
	margin: 20px 0 12px 0;
}

form .user-details .input-box {
	margin-bottom: 15px;
	width: calc(100%/ 2 - 20px);
}

form .input-box span.details {
	display: block;
	font-weight: 500;
	margin-bottom: 5px;
}

.user-details .input-box input {
	height: 45px;
	width: 100%;
	outline: none;
	font-size: 16px;
	border-radius: 5px;
	padding-left: 15px;
	border: 1px solid #ccc;
	border-bottom-width: 2px;
	transition: all 0.3s ease;
}

.user-details .input-box input:focus, .user-details .input-box input:valid
	{
	border-color: #9b59b6;
}

form .gender-details .gender-title {
	font-size: 20px;
	font-weight: 500;
}

form .category {
	display: flex;
	width: 80%;
	margin: 14px 0;
	justify-content: space-between;
}

form .category label {
	display: flex;
	align-items: center;
	cursor: pointer;
}

form .category label .dot {
	height: 18px;
	width: 18px;
	border-radius: 50%;
	margin-right: 10px;
	background: #d9d9d9;
	border: 5px solid transparent;
	transition: all 0.3s ease;
}

#dot-1:checked ~ .category label .one, #dot-2:checked ~ .category label .two,
	#dot-3:checked ~ .category label .three {
	background: #9b59b6;
	border-color: #d9d9d9;
}

form input[type="radio"] {
	display: none;
}

form .button {
	height: 45px;
	margin: 35px 0
}

form .button input {
	height: 100%;
	width: 50%;
	border-radius: 5px;
	border: none;
	color: #fff;
	font-size: 18px;
	font-weight: 500;
	letter-spacing: 1px;
	cursor: pointer;
	transition: all 0.3s ease;
	background: linear-gradient(135deg, #71b7e6, #9b59b6);
}

form .button input:hover {
	/* transform: scale(0.99); */
	background: linear-gradient(-135deg, #71b7e6, #9b59b6);
}

@media ( max-width : 584px) {
	.container {
		max-width: 100%;
	}
	form .user-details .input-box {
		margin-bottom: 15px;
		width: 100%;
	}
	form .category {
		width: 100%;
	}
	.content form .user-details {
		max-height: 300px;
		overflow-y: scroll;
	}
	.user-details::-webkit-scrollbar {
		width: 5px;
	}
}

@media ( max-width : 459px) {
	.container .content .category {
		flex-direction: column;
	}
}
</style>
<meta charset="UTF-8">

<meta name="viewport" content="width=device-width, initial-scale=1.0">

</head>
<body>
	<!-- header code-->
	<!DOCTYPE html>
<html>
<head>
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
	align-items: center;
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

@
keyframes blinker { 50% {
	opacity: 0;
}

}
.dropdown {
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
	box-shadow: 0px 8px 16px 0px rgba(0, 0, 0, 0.2);
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

body {
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
	.sidebar {
		padding-top: 15px;
	}
	.sidebar a {
		font-size: 18px;
	}
}
</style>
</head>
<body>

	<div class="header">
		<a href="Index.jsp"><b><h1>
					<img src="images/Telemedicine-Logo.png" width="40px">Tele
					Health Care
				</h1></b></a>

	</div>

	<div class="topnav">
		<a class="active" href="Index.jsp"><i class="fa fa-fw fa-home"></i>
			Home</a>

		<div class="dropdown">
			<button class="dropbtn">
				Services <i class="fa fa-caret-down"></i>
			</button>
			<div class="dropdown-content">
				<a href="#">Normal Consult</a> <a href="#">Specilist Consult</a>

			</div>
		</div>
		<div class="dropdown">
			<button class="dropbtn">
				Treatment <i class="fa fa-caret-down"></i>
			</button>
			<div class="dropdown-content">
				<a href="#">Diabetes</a> <a href="#">Link 2</a> <a href="#">Link
					3</a>
			</div>
		</div>
		<a href="Contact_Us.jsp">Contact us</a>

	</div>
	<div class="container">
		<div class="title">Admin-Login</div>
		<div class="content">
			<form method="post" action="A">
				<div class="user-details">

					<!-- <div class="input-box">
            <span class="details">Qualification</span>
            <input type="text" placeholder="Enter your username" required>
          </div> -->
					<div class="input-box">
						<span class="details">Email</span> <input type="text" name="luser"
							placeholder="Enter your email" required>
					</div>

					<div class="input-box">
						<span class="details">Enter Password</span> <input type="text"
							name="lpass" placeholder="Enter your password" required>
					</div>



					<div class="button">
						<input type="submit" value="Login">
					</div>
			</form>
		</div>
	</div>

</body>
</html>