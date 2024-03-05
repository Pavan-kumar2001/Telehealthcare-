<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Make Appointment</title>
<style>
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
</style>

</head>
<body>


	<% String doctor_name= request.getParameter("dn");
int fees= Integer.parseInt(request.getParameter("fees"));%>
	<div class="header">
		<a href="Index.jsp"><b><h1>
					<img src="images/Telemedicine-Logo.png" width="40px">Tele
					Health Care
				</h1></b></a>
	</div>
	<div class="topnav">
		<a class="navbar-brand" href="Patient_hp.jsp">Home</a> <a
			class="navbar-brand" href="Normal.jsp">Normal-Doctors</a> <a
			class="navbar-brand" href="Nor$.jsp">Specialist-Doctors</a> <a
			class="navbar-brand" href="search.jsp">Check Appointment Status</a> <a
			class="navbar-brand" href="CHistory.jsp">Consult History</a> <a
			class="navbar-brand" href="P_Logout.jsp" style="margin-left: 550px;">Logout</a>
	</div>
	<h2 style="margin-left: 30%; margin-top: 2%">Make Appointment</h2>
	<div class="formbold-main-wrapper">

		<!-- Author: FormBold Team -->
		<!-- Learn More: https://formbold.com -->
		<div class="formbold-form-wrapper">

			<form action="CAF.jsp" method="POST">

				<div class="formbold-mb-5">
					<label for="name" class="formbold-form-label"> Patient Name
					</label> <input type="text" name="pname" id="name" placeholder="Full Name"
						class="formbold-form-input" required="required" />
				</div>
				<div class="formbold-mb-5">
					<label for="name" class="formbold-form-label"> Doctor name
					</label> <input style="font-weight: bold;" type="text"
						value="<%=doctor_name %>" name="dname" id="name"
						placeholder="Full Name" class="formbold-form-input" readonly />
				</div>
				<div class="formbold-mb-5">
					<label for="name" class="formbold-form-label"> Appointment
						Type </label> <select name="at" class="formbold-form-input"
						required="required">
						<option>Select options</option>
						<option value="Checkup">Checkup</option>
						<option value="Emergency">Emergency</option>
						<option value="Follow Up">Follow Up</option>
						<option value="Routine">Routine</option>
						<option value="Walkin">Walkin</option>
					</select>
				</div>
				<div class="formbold-mb-5">
					<label for="name" class="formbold-form-label"> Service Type
					</label> <select name="st" class="formbold-form-input" required="required">
						<option>Select options</option>
						<option value="Checkup">Video Call</option>
						<option value="Emergency">Chat</option>

					</select>
				</div>
				<div class="formbold-mb-5">
					<label for="name" class="formbold-form-label">Priority </label> <select
						name="pr" class="formbold-form-input" required="required">
						<option>Select options</option>
						<option value="Checkup">Urgent</option>
						<option value="Emergency">Normal</option>

					</select>
				</div>
				<div class="formbold-mb-5">
					<label for="phone" class="formbold-form-label"> Phone
						Number </label> <input type="text" name="phone" id="phone"
						placeholder="Enter your phone number" class="formbold-form-input"
						required="required" />
				</div>



				<div class="flex flex-wrap formbold--mx-3">
					<div class="w-full sm:w-half formbold-px-3">
						<div class="formbold-mb-5 w-full">
							<label for="date" class="formbold-form-label"> Date </label> <input
								type="date" name="date" id="date" class="formbold-form-input"
								required="required" /> <br>
						</div>
					</div>
					<div class="formbold-mb-5">
						<label for="phone" class="formbold-form-label"> Fees </label> <input
							style="font-weight: bold;" type="text" name="fees"
							value="<%=fees %>" id="phone" placeholder=""
							class="formbold-form-input" readonly />
					</div>

					<div class="formbold-mb-3">
						<label for="message" class="formbold-form-label"> Patient
							Health Description </label>
						<textarea rows="6" cols="100" name="message" id="message"
							class="formbold-form-input"></textarea>
					</div>


					<hr>
					<button class="formbold-btn">E-Payment</button>

				</div>








			</form>
		</div>
	</div>
	<style>
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}

body {
	font-family: "Inter", Arial, Helvetica, sans-serif;
}

.formbold-mb-5 {
	margin-bottom: 20px;
}

.formbold-pt-3 {
	padding-top: 12px;
}

.formbold-main-wrapper {
	display: flex;
	align-items: center;
	justify-content: center;
	padding: 48px;
}

.formbold-form-wrapper {
	margin: 0 auto;
	max-width: 550px;
	width: 100%;
	background: white;
}

.formbold-form-label {
	display: block;
	font-weight: 500;
	font-size: 16px;
	color: #07074d;
	margin-bottom: 12px;
}

.formbold-form-label-2 {
	font-weight: 600;
	font-size: 20px;
	margin-bottom: 20px;
}

.formbold-form-input {
	width: 100%;
	padding: 12px 24px;
	border-radius: 6px;
	border: 1px solid #e0e0e0;
	background: white;
	font-weight: 500;
	font-size: 16px;
	color: #6b7280;
	outline: none;
	resize: none;
}

.formbold-form-input:focus {
	border-color: #6a64f1;
	box-shadow: 0px 3px 8px rgba(0, 0, 0, 0.05);
}

.formbold-btn {
	text-align: center;
	font-size: 16px;
	border-radius: 6px;
	padding: 14px 32px;
	border: none;
	font-weight: 600;
	background-color: #6a64f1;
	color: white;
	width: 100%;
	cursor: pointer;
	margin-top: 20px;
}

.formbold-btn:hover {
	box-shadow: 0px 3px 8px rgba(0, 0, 0, 0.05);
}

.formbold--mx-3 {
	margin-left: -12px;
	margin-right: -12px;
}

.formbold-px-3 {
	padding-left: 12px;
	padding-right: 12px;
}

.flex {
	display: flex;
}

.flex-wrap {
	flex-wrap: wrap;
}

.w-full {
	width: 100%;
}

@media ( min-width : 540px) {
	.sm\:w-half {
		width: 50%;
	}
}
</style>
</body>
</html>