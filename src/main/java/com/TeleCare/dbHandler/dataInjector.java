package com.TeleCare.dbHandler;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

public class dataInjector {
	public static String addDoctor(String NAME, String PASSWORD, String EMAIL, String GENDER, String pnumber,
			String age, String quali, String fees) {

		String driver = "oracle.jdbc.driver.OracleDriver";
		String url = "jdbc:Oracle:thin:@localhost:1521:xe";
		String user = "system";
		String passworda = "system";
		String sql = "insert into TEMPDOC_REG values(TD_ID.nextval,?,?,?,?,?,?,?,?,?)";
		String str = "";

		try {
			Class.forName(driver);
			Connection con = DriverManager.getConnection(url, user, passworda);
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, NAME);
			ps.setString(2, EMAIL);
			ps.setString(3, pnumber);
			ps.setString(4, age);
			ps.setString(5, PASSWORD);
			ps.setString(6, quali);
			ps.setString(7, GENDER);
			ps.setString(8, fees);
			ps.setString(9, "No");
			ps.executeUpdate();
			return str = "Success";

		} catch (Exception e) {
			e.printStackTrace();
		}

		finally {
			System.out.println("done bro");
			return str;
		}
	}

	public static String addPDoctor(String NAME, String PASSWORD, String EMAIL, String GENDER, String pnumber,
			String age, String quali) {

		String driver = "oracle.jdbc.driver.OracleDriver";
		String url = "jdbc:Oracle:thin:@localhost:1521:xe";
		String user = "system";
		String passworda = "system";
		String sql = "insert into DOCTOR_REG values(D_ID.nextval,?,?,?,?,?,?,?)";
		String str = "";

		try {
			Class.forName(driver);
			Connection con = DriverManager.getConnection(url, user, passworda);
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, NAME);
			ps.setString(2, EMAIL);
			ps.setString(3, pnumber);
			ps.setString(4, age);
			ps.setString(5, PASSWORD);
			ps.setString(6, quali);
			ps.setString(7, GENDER);
			ps.executeUpdate();
			return str = "Success";

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			System.out.println("done bro");
			return str;
		}
	}

	public static boolean addP(int pid, String pname, String pdes, int ppric, String pimg) {
		String driver = "oracle.jdbc.driver.OracleDriver";
		String url = ("jdbc:oracle:thin:@localhost:1521:xe");
		String user = "system";
		String pass = "system";
		String sql = "INSERT INTO PRODUCT VALUES(?,?,?,?,?)";

		try {
			Class.forName(driver);
			Connection con = DriverManager.getConnection(url, user, pass);
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, pid);
			ps.setString(2, pname);
			ps.setString(3, pdes);
			ps.setInt(4, ppric);
			ps.setString(5, pimg);
			ps.executeUpdate();
			return true;

		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}

	}

	public static String addPatient(String NAME, String PASSWORD, String EMAIL, String GENDER, String pnumber,
			String age) {

		String driver = "oracle.jdbc.driver.OracleDriver";
		String url = "jdbc:Oracle:thin:@localhost:1521:xe";
		String user = "system";
		String passworda = "system";
		String sql = "insert into PATIENT_REG values(P_id.nextval,?,?,?,?,?,?)";
		String str = "";

		try {
			Class.forName(driver);
			Connection con = DriverManager.getConnection(url, user, passworda);
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, NAME);
			ps.setString(2, EMAIL);
			ps.setString(3, pnumber);
			ps.setString(4, age);
			ps.setString(5, PASSWORD);
			ps.setString(6, GENDER);
			ps.executeUpdate();
			return str = "Success";

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			System.out.println("done bro");
			return str;
		}
	}

	public static boolean updateemgValue(String emg, int id) {
		String drive = "oracle.jdbc.driver.OracleDriver";
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String sql = "UPDATE DOCTOR_REG SET EMERGENCY=? WHERE D_ID=? ";
		try {
			Class.forName(drive);
			Connection con = DriverManager.getConnection(url, "system", "system");
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, emg);
			ps.setInt(2, id);

			ps.executeUpdate();
			return true;

		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

}
