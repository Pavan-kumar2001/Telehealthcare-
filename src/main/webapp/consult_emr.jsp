<%@page import="com.TeleCare.dbHandler.dataFetcher"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <title>Approval/Rejection Form</title>
  <style>
    /* CSS styles for the form */
    .form-container {
      max-width: 400px;
      margin: 0 auto;
      padding: 20px;
      background-color: #f2f2f2;
    }

    .form-group {
      margin-bottom: 20px;
    }

    .form-group label {
      display: block;
      margin-bottom: 5px;
      font-weight: bold;
    }

    .form-group input[type="text"] {
      width: 100%;
      padding: 10px;
      border: 1px solid #ccc;
      border-radius: 4px;
    }

    .form-group select {
      width: 100%;
      padding: 10px;
      border: 1px solid #ccc;
      border-radius: 4px;
    }

    .form-group button[type="submit"] {
      background-color: #4CAF50;
      color: #fff;
      padding: 10px 20px;
      border: none;
      border-radius: 4px;
      cursor: pointer;
    }

    .form-group button[type="submit"]:hover {
      background-color: #45a049;
    }
  </style>
</head>
<body>
<% String id =request.getParameter("Id"); %>
  <div class="form-container">
    <h2>Consult Emergency Form</h2>
    <form action="yes" method="POST">
      <div class="form-group">
        <label for="entry-id">ID:</label>
        <input type="text" id="entry-id" name="entry-id" placeholder="Enter ID" value="<%=id %>" readonly>
      </div>
      <div class="form-group">
        <label for="approval-status">Ready to Consult Emergency:</label>
        <select id="approval-status" name="approval-status" required>
          <option value="">Select Status</option>
          <option value="Yes">Yes</option>
          <option value="No">No</option>
        </select>
      </div>
      <div class="form-group">
        <button type="submit">Submit</button>
      </div>
    </form>
  </div>
</body>
</html>
    