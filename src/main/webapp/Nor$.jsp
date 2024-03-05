<%@page import="com.TeleCare.dbHandler.dataFetcher"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Normal Doctor</title>
  <link rel="icon" href="images/Telemedicine-Logo.png" type="image/x-icon">
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
    .doctors-grid {
      display: grid;
      grid-template-columns: repeat(3, 1fr);
      grid-gap: 20px;
    }
    .doctor-card {
      text-align: center;
      background-color: #f0f0f0;
      padding: 20px;
      border-radius: 10px;
    }
    .doctor-card img {
      width: 100px;
      height: 100px;
      border-radius: 50%;
      margin-bottom: 10px;
    }
    .doctor-card h2 {
      font-size: 24px;
      margin-bottom: 10px;
    }
    .doctor-card p {
      margin: 5px 0;
    }
    .footer {
      text-align: center;
      background-color: #f0f0f0;
      padding: 10px;
      margin-top: 30px;
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
      .formbold-main-wrapper {
    display: flex;
    align-items: center;
    justify-content: center;
    padding: 30px;
  }

  .formbold-form-wrapper {
    margin: 0 auto;
    max-width: 550px;
    width: 100%;
    background: silver;
    padding: 20px;
    border-radius: 15px;
    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
  }

  .formbold-form-label {
    display: block;
    font-weight: 500;
    font-size: 16px;
    color: #07074d;
    margin-bottom: 12px;
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
    
  </style>
  <!-- Add Bootstrap CSS and JavaScript files -->
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
  <div class="header">
    <a href="Patient_hp.jsp" style="text-decoration: none">
      <b><h2><img src="images/Telemedicine-Logo.png" width="40px">Tele Health Care</h2></b>
    </a>
  </div>
  <nav>
    <a href="Patient_hp.jsp" class="<%= request.getRequestURI().contains("Patient_hp.jsp") ? "active" : "" %>">Home</a>
    <a href="Normal.jsp" class="<%= request.getRequestURI().contains("Normal.jsp") ? "active" : "" %>">Normal-Doctors</a>
    <a href="Nor$.jsp" class="<%= request.getRequestURI().contains("Nor$.jsp") ? "active" : "" %>">Specialist-Doctors</a>
    <a href="search.jsp" class="<%= request.getRequestURI().contains("search.jsp") ? "active" : "" %>">Check Appointment Status</a>
    <a href="CHistory.jsp" class="<%= request.getRequestURI().contains("CHistory.jsp") ? "active" : "" %>">Consult History</a>
    <a href="P_Logout.jsp" style="margin-left: 700px;" class="<%= request.getRequestURI().contains("P_Logout.jsp") ? "active" : "" %>">Logout</a>
    <!-- Add more links if needed -->
  </nav>
  
  <div class="container">
  <h2>Specilist Doctors</h2>
    <div class="doctors-grid">
      <% 
        List<String> userlist = dataFetcher.getInfoPrfGridA();

        for (String doctorData : userlist) {
          String[] doctorInfo = doctorData.split(":");
      %>
      <div class="item1">
        <div class="doctor-card">
          <img src="images/docPrf.jpeg" alt="Doctor Avatar" style="width: 100px; height: 100px; border-radius: 50%;">
          <h2><%= doctorInfo[1] %></h2>
          <p>Specialty: <%= doctorInfo[5] %></p>
          <p>Experience: Not Availble</p>
          <!-- Button to trigger the modal -->
          <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#bookAppointmentModal<%= doctorInfo[0] %>">
            Book Appointment
          </button>

          <!-- Modal -->
          <div class="modal fade" id="bookAppointmentModal<%= doctorInfo[0] %>" tabindex="-1" role="dialog" aria-labelledby="bookAppointmentModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
              <div class="modal-content">
                <div class="modal-header">
                  <h5 class="modal-title" id="bookAppointmentModalLabel">Book Appointment with  <%= doctorInfo[1] %></h5>
                  <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                  </button>
                </div>
                <div class="modal-body">
                  <!-- Your appointment booking form goes here -->
                  <!-- Replace the form fields and submit button with your actual form -->
                 <div class="formbold-main-wrapper">
    <div class="formbold-form-wrapper">
      <form action="CAF.jsp" method="POST">
        <div class="formbold-mb-5">
          <label for="name" class="formbold-form-label"> Patient Name </label>
          <input
            type="text"
            name="pname"
            id="name"
            placeholder="Full Name"
            class="formbold-form-input"
            required="required"
          />
        </div>
        <div class="formbold-mb-5">
          <label for="name" class="formbold-form-label"> Doctor name </label>
          <input style="font-weight: bold;"
            type="text"
            value="<%=doctorInfo[1] %>"
            name="dname"
            id="name"
            placeholder="Full Name"
            class="formbold-form-input"
            readonly
          />
        </div>
        <div class="formbold-mb-5">
          <label for="name" class="formbold-form-label"> Appointment Type </label>
          <select name="at" class="formbold-form-input" required="required">
            <option>Select options</option>
            <option value="Checkup">Checkup</option>
            <option value="Emergency">Emergency</option>
            <option value="Follow Up">Follow Up</option>
            <option value="Routine">Routine</option>
            <option value="Walkin">Walkin</option>
          </select>
        </div>
        <div class="formbold-mb-5">
          <label for="name" class="formbold-form-label"> Service Type </label>
          <select name="st" class="formbold-form-input" required="required">
            <option>Select options</option>
            <option value="Checkup">Video Call</option>
            <option value="Emergency">Chat</option>
          </select>
        </div>
        <div class="formbold-mb-5">
          <label for="name" class="formbold-form-label">Priority </label>
          <select name="pr" class="formbold-form-input" required="required">
            <option>Select options</option>
            <option value="Checkup">Urgent</option>
            <option value="Emergency">Normal</option>
          </select>
        </div>
        <div class="formbold-mb-5">
          <label for="phone" class="formbold-form-label"> Phone Number </label>
          <input
            type="text"
            name="phone"
            id="phone"
            placeholder="Enter your phone number"
            class="formbold-form-input"
            required="required"
          />
        </div>
        <div class="flex flex-wrap formbold--mx-3">
          <div class="w-full sm:w-half formbold-px-3">
            <div class="formbold-mb-5 w-full">
              <label for="date" class="formbold-form-label"> Date </label>
              <input
                type="date"
                name="date"
                id="date"
                class="formbold-form-input"
                required="required"
              />
              <br>
            </div>
          </div>
          <div class="formbold-mb-5">
            <label for="phone" class="formbold-form-label"> Fees </label>
            <input style="font-weight: bold;"
              type="text"
              name="fees"
              value="<%=doctorInfo[7] %>"
              id="phone"
              placeholder=""
              class="formbold-form-input"
              readonly
            />
          </div>
          <div class="formbold-mb-3">
            <label for="message" class="formbold-form-label">Patient Health Description</label>
            <textarea
              rows="6"
              cols="100"
              name="message"
              id="message"
              class="formbold-form-input"
            ></textarea>
          </div>
          <hr>
          <button class="formbold-btn">E-Payment</button>
        </div>
      </form>
       </div>
  </div>
                </div>
               
              </div>
            </div>
          </div>
        </div>
      </div>
      <% } %>
    </div>
  </div>
  <div class="footer">
    <p>&copy; <%= new java.text.SimpleDateFormat("yyyy").format(new java.util.Date()) %> Tele HealthCare. All rights reserved.</p>
  </div>
</body>
</html>
