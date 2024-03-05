<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Patient Profile</title>
  <link rel="icon" href="images/Telemedicine-Logo.png" type="image/x-icon">
  <style>
    /* Reset CSS */
    body, h1, h2, p, ul, li, a {
      margin: 0;
      padding: 0;
    }

    body {
      font-family: 'Helvetica', Arial, sans-serif;
      line-height: 1.6;
      background-color: #f7f7f7;
    }

    header {
      background-color: #fff;
      color: #110a0a;
      padding: 10px;
    }

    .header-content {
      display: flex;
      align-items: center;
    }

    .logo-link {
      text-decoration: none;
      color: #060606;
      display: flex;
      align-items: center;
    }

    .logo-link img {
      margin-right: 10px;
    }

    nav {
      background-color: #54595e;
      color: #fff;
      padding: 10px;
      display: flex;
      flex-wrap: wrap;
      justify-content: center;
    }

    nav a {
      background-color: #007bff;
      color: #fff;
      text-decoration: none;
      margin-right: 20px;
      padding: 5px 15px;
      border-radius: 5px;
      transition: background-color 0.3s ease;
    }

    nav a:hover {
      background-color: #0056b3;
    }

    main {
      padding: 200px;
    }

    .widgets {
      display: flex;
      flex-wrap: wrap;
      justify-content: space-between;
      margin-bottom: 20px;
    }

    .widget {
      background-color: #fff;
      padding: 20px;
      flex-basis: calc(50% - 20px);
      margin-bottom: 20px;
      box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
      border-radius: 10px;
    }

    @media screen and (min-width: 768px) {
      .widget {
        flex-basis: calc(25% - 20px);
      }
    }

    .charts {
      /* Add styling for charts section */
    }

    .chart {
      /* Add styling for individual charts */
    }

    footer {
      text-align: center;
      background-color: #54595e;
      color: #fff;
      padding: 10px;
    }

  </style>
</head>
<body>
  <header>
    <div class="header-content">
      <a href="Patient_hp.jsp" class="logo-link">
        <img src="images/Telemedicine-Logo.png"  width="40px">
        <h2>Tele Health Care</h2>
      </a>
    </div>
    <nav>
      <a href="Admin_Home.jsp" class="active">Dashboard</a>
      <a href="Doctors-List.jsp">Doctors List</a>
      <a href="Patients-List.jsp">Patients List</a>
      <a href="#">Appointments</a>
      <a href="Admin_HP.jsp">ApproveDoctors</a>
      <a href="Index.jsp">Logout</a>
    </nav>
  </header>
  <main>
    <section class="widgets">
      <!-- Add widgets or data visualization components here -->
      <div class="widget">
        <h2>Doctors</h2>
        <p>Total Doctors: 50</p>
      </div>
      <div class="widget">
        <h2>Patients</h2>
        <p>Total Patients: 1000</p>
      </div>
    
      <div class="widget">
        <h2>Revenue</h2>
        <p>Total Revenue: $50,000</p>
      </div>
    </section>
    <section class="charts">
      <!-- Add charts or graphs here -->
      <div class="chart">
        <!-- Your chart goes here -->
      </div>
    </section>
  </main>
  <footer>
    <p>&copy; 2023 Tele Health Care. All rights reserved.</p>
  </footer>
</body>
</html>
