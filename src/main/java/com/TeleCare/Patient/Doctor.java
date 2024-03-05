package com.TeleCare.Patient;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class Doctor {
    private int id;
    private String name;
    private String email;
    private String phoneNumber;

    // Constructor
    public Doctor(int id, String name, String email, String phoneNumber) {
        this.id = id;
        this.name = name;
        this.email = email;
        this.phoneNumber = phoneNumber;
    }

    // Getters (and setters if needed)
    public int getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public String getEmail() {
        return email;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public static List<Doctor> getDoctorsFromDatabase() throws SQLException, ClassNotFoundException {
        List<Doctor> doctorData = new ArrayList<>();

        // Establish a database connection
        String url = "jdbc:oracle:thin:@localhost:1521:xe";
        String user = "system";
        String pass = "system";
        Class.forName("oracle.jdbc.driver.OracleDriver");
        Connection con = DriverManager.getConnection(url, user, pass);

        // Prepare and execute the SQL query
        String query = "SELECT * FROM DOCTOR_REG";
        PreparedStatement statement = con.prepareStatement(query);
        ResultSet rs = statement.executeQuery();

        // Process the query result and populate the doctorData list
        while (rs.next()) {
            int id = rs.getInt(1);
            String name = rs.getString(2);
            String email = rs.getString(3);
            String phoneNumber = rs.getString(4);

            Doctor doctor = new Doctor(id, name, email, phoneNumber);
            doctorData.add(doctor);
        }

        // Close the database connection
        rs.close();
        statement.close();
        con.close();

        return doctorData;
    }
}
