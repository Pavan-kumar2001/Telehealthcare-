<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <title>Appointment Success</title>
    <!-- Include necessary libraries for PDF generation -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/html2pdf.js/0.10.1/html2pdf.bundle.min.js"></script>
    <style>
        /* Add some basic CSS styles for the success message */
        body {
            font-family: Arial, sans-serif;
            text-align: center;
            margin-top: 50px;
        }
    </style>
</head>
<body>
<%
String tempId = request.getParameter("temp_id"); %>
<div id="pdfContent">
<img src="images/pdf.png" alt="Your Company Logo" style="width: 500px; height: 150px;">
        <h1>Appointment Successfully Completed!</h1>
        <p>Your appointment details have been saved.</p>
        <h4>Your Appointment Temporary ID Is :<%=tempId %></h4>
        <h2>Thank You for Using Tele Health Service</h2>
    </div>
    <button id="downloadButton">Download PDF</button>
    <button onclick="goBack()">Back</button>

    <!-- Include your script for PDF generation -->
    <script>// This function generates the PDF and initiates the download
    function generateAndDownloadPDF() {
        const element = document.getElementById("pdfContent");

        // Use html2pdf.js to generate the PDF
        html2pdf()
            .from(element)
            .save("appointment_success.pdf");
    }

    // Attach the function to the download button after the DOM is ready
    document.addEventListener("DOMContentLoaded", function () {
        document.getElementById("downloadButton").addEventListener("click", generateAndDownloadPDF);
    });
    function goBack() {
        history.back();
    }

</script>

</body>
</html>