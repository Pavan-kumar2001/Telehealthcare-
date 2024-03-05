              <%@page import="java.sql.*"%>
<%@page import="javax.servlet.ServletException"%>
<%@page import="javax.servlet.http.HttpServletRequest"%>
<%@page import="javax.servlet.http.HttpServletResponse"%>
<%@page import="javax.servlet.http.HttpSession"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Database Example</title>
</head>
<body>
    <%-- Establish a database connection --%>
    <%
    Connection connection = null;
    PreparedStatement insertStatement = null;
    
    try {
    	Class.forName("oracle.jdbc.driver.OracleDriver");
        String jdbcUrl = "jdbc:oracle:thin:@localhost:1521:xe";
        String username = "system";
        String password = "system";
        connection = DriverManager.getConnection(jdbcUrl, username, password);
        
        // Prepare the insert statement
        String insertQuery = "INSERT INTO mytable (temp_id) VALUES (?)";
        insertStatement = connection.prepareStatement(insertQuery);
    } catch (Exception e) {
        throw new ServletException("Unable to connect to the database.", e);
    }
    %>
    
    <%-- Add data to the database --%>
    <%
    String tempId = session.getAttribute("tapId").toString();
    
    if (tempId != null && !tempId.isEmpty()) {
        try {
            insertStatement.setString(1, tempId);
            insertStatement.executeUpdate();

            response.sendRedirect("idKnow.jsp?message=Appointment successful");

        } catch (Exception e) {
            throw new ServletException("Error adding data to the database.", e);
        }
    }
    %>

</body>
</html>
