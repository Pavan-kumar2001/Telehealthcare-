package com.TeleCare.dbHandler;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class dataFetcher {
	public static List viewProd() {
		String driver="oracle.jdbc.driver.OracleDriver";
		String url="jdbc:oracle:thin:@localhost:1521:xe";
		String user="system";
		String pass="system";
		String sql="SELECT ID,PNAME,PDES,PRICE,PIMG FROM PRODUCT ORDER BY ID";
		String str="";
		List ulist=new ArrayList<>();
		try {
			Class.forName(driver);
			Connection con=DriverManager.getConnection(url,user,pass);
			Statement st=con.createStatement();		
			ResultSet rs=st.executeQuery(sql);
			while(rs.next()) {
				String temp=rs.getInt(1)+":"+rs.getString(2)+":"+rs.getString(3)+":"+rs.getInt(4)+":"+rs.getString(5);
				ulist.add(temp);
				
			}
		
		
		}catch(Exception e) {
			e.printStackTrace();
		}
		return ulist;
		
	}
	
	
	public static List getInfo() {
		//String driver="oracle.jdbc.driver.OracleDriver";
		String url=("jdbc:oracle:thin:@localhost:1521:xe");
		String user="system";
		String pass="system";
		String sql="SELECT * FROM TEMPDOC_REG ORDER BY TD_ID ASC ";

		List ulist=new ArrayList<>();
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection con=DriverManager.getConnection(url,user,pass);
			Statement st=con.createStatement();		
			ResultSet rs=st.executeQuery(sql);
			while(rs.next()) {
				String temp=rs.getInt(1)+":"+rs.getString(2)+":"+rs.getString(3)+":"+rs.getString(4)+":"+rs.getString(5)+":"+rs.getString(6)+":"+rs.getString(7)+":"+rs.getString(8)+":"+rs.getInt(9);
				ulist.add(temp);
				
			}
		
		
		}catch(Exception e) {
			e.printStackTrace();
		}
		return ulist;
		
	}
	
	public static List getInfoPrf(String email) {
		//String driver="oracle.jdbc.driver.OracleDriver";
		String url=("jdbc:oracle:thin:@localhost:1521:xe");
		String user="system";
		String pass="system";
		String sql="SELECT D_ID,NAME,QUALIFICATION,EMAIL,P_NUMBER ,EMERGENCY FROM DOCTOR_REG WHERE EMAIL=? ";

		List ulist=new ArrayList<>();
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection con=DriverManager.getConnection(url,user,pass);
			PreparedStatement ps=con.prepareStatement(sql);
			ps.setString(1,email);	
		
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				String temp=rs.getInt(1)+":"+rs.getString(2)+":"+rs.getString(3)+":"+rs.getString(4)+":"+rs.getString(5)+":"+rs.getString(6);
				ulist.add(temp);
				
			}
	
		
		}catch(Exception e) {
			e.printStackTrace();
		}
		return ulist;
		
	}
	
	public static List getInfoPrfGrid() {
		//String driver="oracle.jdbc.driver.OracleDriver";
		String url=("jdbc:oracle:thin:@localhost:1521:xe");
		String user="system";
		String pass="system";
		String sql="SELECT * FROM DOCTOR_REG  ";

		List ulist=new ArrayList<>();
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection con=DriverManager.getConnection(url,user,pass);
			Statement st=con.createStatement();
			
		
			ResultSet rs=st.executeQuery(sql);
			while(rs.next()) {
				String temp=rs.getInt(1)+":"+rs.getString(2)+":"+rs.getString(3)+":"+rs.getString(4)+":"+rs.getString(5)+":"+rs.getString(7)+":"+rs.getString(8)+":"+rs.getInt(9);
				ulist.add(temp);
				
			}
		
		
		}catch(Exception e) {
			e.printStackTrace();
		}
		return ulist;
		
	}
	
	public static List getInfoPrfGridEmg() {
		//String driver="oracle.jdbc.driver.OracleDriver";
		String url=("jdbc:oracle:thin:@localhost:1521:xe");
		String user="system";
		String pass="system";
		String sql="SELECT * FROM DOCTOR_REG WHERE EMERGENCY='Yes'";

		List ulist=new ArrayList<>();
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection con=DriverManager.getConnection(url,user,pass);
			Statement st=con.createStatement();
			
		
			ResultSet rs=st.executeQuery(sql);
			while(rs.next()) {
				String temp=rs.getInt(1)+":"+rs.getString(2)+":"+rs.getString(3)+":"+rs.getString(4)+":"+rs.getString(5)+":"+rs.getString(7)+":"+rs.getString(8)+":"+rs.getInt(9);
				ulist.add(temp);
				
			}
		
		
		}catch(Exception e) {
			e.printStackTrace();
		}
		return ulist;
		
	}
	
	
	
	
	public static List getInfoPrfGridopen(String id) {
		//String driver="oracle.jdbc.driver.OracleDriver";
		String url=("jdbc:oracle:thin:@localhost:1521:xe");
		String user="system";
		String pass="system";
		String sql="SELECT * FROM DOCTOR_REG WHERE D_ID=? ";
   
		List ulist=new ArrayList<>();
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection con=DriverManager.getConnection(url,user,pass);
		PreparedStatement ps=con.prepareStatement(sql);
		ps.setString(1, id);
			
		
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				String temp=rs.getInt(1)+":"+rs.getString(2)+":"+rs.getString(3)+":"+rs.getString(4)+":"+rs.getString(5)+":"+rs.getString(7)+":"+rs.getString(8)+":"+rs.getInt(9);
				ulist.add(temp);
				
			}
		
		
		}catch(Exception e) {
			e.printStackTrace();
		}
		return ulist;
		
	}
	
	
	public static List getInfoPrfGridA() {
		//String driver="oracle.jdbc.driver.OracleDriver";
		String url=("jdbc:oracle:thin:@localhost:1521:xe");
		String user="system";
		String pass="system";
		String sql="SELECT * FROM DOCTOR_REG WHERE QUALIFICATION='GENERAL-MD' OR QUALIFICATION='DENTAL' ";

		List ulist=new ArrayList<>();
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection con=DriverManager.getConnection(url,user,pass);
			Statement st=con.createStatement();
			
		
			ResultSet rs=st.executeQuery(sql);
			while(rs.next()) {
				String temp=rs.getInt(1)+":"+rs.getString(2)+":"+rs.getString(3)+":"+rs.getString(4)+":"+rs.getString(5)+":"+rs.getString(7)+":"+rs.getString(8)+":"+rs.getInt(9);
				ulist.add(temp);
				
			}
		
		
		}catch(Exception e) {
			e.printStackTrace();
		}
		return ulist;
		
	}
	
	public static List getInfoPrfATODAY(String email,String pas ) {
		//String driver="oracle.jdbc.driver.OracleDriver";
		String url=("jdbc:oracle:thin:@localhost:1521:xe");
		String user="system";
		String pass="system";
		String sql="SELECT * FROM APPOINT WHERE DOCTOR_NAME=? AND DATE_COLUMN=? ";

		List ulist=new ArrayList<>();
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection con=DriverManager.getConnection(url,user,pass);
			PreparedStatement ps=con.prepareStatement(sql);
			ps.setString(1,email);	
			ps.setString(2,pas);
		
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				String temp=rs.getInt(1)+":"+rs.getString(2)+":"+rs.getString(3)+":"+rs.getString(4)+":"+rs.getString(5)+":"+rs.getString(6)+":"+rs.getString(7)+":"+rs.getString(8);
				ulist.add(temp);
				
			}
		
		
		}catch(Exception e) {
			e.printStackTrace();
		}
		return ulist;
		
	}
	public static List<String> getInfotodayAA(String date, String name) {
	    String url = "jdbc:oracle:thin:@localhost:1521:xe";
	    String user = "system";
	    String pass = "system";
	    String sql = "SELECT * FROM APPOINT WHERE DATE_COLUMN = ? AND PATIENT_NAME = ?";

	    List<String> ulist = new ArrayList<>();
	    try {
	        Class.forName("oracle.jdbc.driver.OracleDriver");
	        Connection con = DriverManager.getConnection(url, user, pass);
	        PreparedStatement ps = con.prepareStatement(sql);
	        ps.setString(1, date);
	        ps.setString(2, name);

	        ResultSet rs = ps.executeQuery();
	        while (rs.next()) {
	            String temp = rs.getString(9) + ":" + rs.getString(10) + ":" + rs.getString(8) + ":" + rs.getString(14);
	            ulist.add(temp);
	            System.out.println(temp);
	        }

	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return ulist;
	}

	
	public static int getInfoPrfAFEES(String email ) {
		//String driver="oracle.jdbc.driver.OracleDriver";
		String url=("jdbc:oracle:thin:@localhost:1521:xe");
		String user="system";
		String pass="system";
		String sql="SELECT SUM(FEES) AS total_amount FROM APPOINT WHERE doctor_name = ?";

		int fees=0;
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection con=DriverManager.getConnection(url,user,pass);
			PreparedStatement ps=con.prepareStatement(sql);
			ps.setString(1,email);	
		
			ResultSet rs=ps.executeQuery();
			
			if(rs.next()) {
				fees=rs.getInt(1);
				return fees;
				
			}
			
		
		}catch(Exception e) {
			e.printStackTrace();
		}
		return fees;
		
	}
	
	public static List getInfoPrfCon(String email ) {
		//String driver="oracle.jdbc.driver.OracleDriver";
		String url=("jdbc:oracle:thin:@localhost:1521:xe");
		String user="system";
		String pass="system";
		String sql="SELECT COUNT(*) AS count FROM HISTORY WHERE DOCTOR_NAME = ?";
		List ulist=new ArrayList<>();
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection con=DriverManager.getConnection(url,user,pass);
			PreparedStatement ps=con.prepareStatement(sql);
			ps.setString(1,email);	
		
			ResultSet rs=ps.executeQuery();
			if(rs.next()) {
				String temp=rs.getString(1);
				ulist.add(temp);
				
			}
		
		
		}catch(Exception e) {
			e.printStackTrace();
		}
		return ulist;
		
	}
	
	public static List getInfoPrfA(String email ) {
		//String driver="oracle.jdbc.driver.OracleDriver";
		String url=("jdbc:oracle:thin:@localhost:1521:xe");
		String user="system";
		String pass="system";
		String sql="SELECT * FROM APPOINT WHERE DOCTOR_NAME=? ";

		List ulist=new ArrayList<>();
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection con=DriverManager.getConnection(url,user,pass);
			PreparedStatement ps=con.prepareStatement(sql);
			ps.setString(1,email);	
		
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				String temp=rs.getInt(1)+":"+rs.getString(2)+":"+rs.getString(3)+":"+rs.getString(4)+":"+rs.getString(5)+":"+rs.getString(6)+":"+rs.getString(7)+":"+rs.getString(8)+":"+rs.getString(9)+":"+rs.getString(10)+":"+rs.getInt(11)+":"+rs.getString(14);
				ulist.add(temp);
				
			}
	
		
		}catch(Exception e) {
			e.printStackTrace();
		
		}
		return ulist;
		
	}
	
	public static List getInfoPrfM(int email ) {
		//String driver="oracle.jdbc.driver.OracleDriver";
		String url=("jdbc:oracle:thin:@localhost:1521:xe");
		String user="system";
		String pass="system";
		String sql="SELECT PATIENT_NAME,DOCTOR_NAME,PATIENT_INSTRUCTIONS FROM APPOINT WHERE AP_ID=? ";

		List ulist=new ArrayList<>();
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection con=DriverManager.getConnection(url,user,pass);
			PreparedStatement ps=con.prepareStatement(sql);
			ps.setInt(1,email);	
		
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				String temp=rs.getString(1)+":"+rs.getString(2)+":"+rs.getString(3);
				ulist.add(temp);
				
			}
		
		
		}catch(Exception e) {
			e.printStackTrace();
		}
		return ulist;
		
	}

	public static List getInfoPrfTemp(String email) {
		//String driver="oracle.jdbc.driver.OracleDriver";
		String url=("jdbc:oracle:thin:@localhost:1521:xe");
		String user="system";
		String pass="system";
		String sql="SELECT TAP_ID,PATIENT_NAME,SERVICE_TYPE,PATIENT_INSTR,DATE_COLUMN,FEES,PAYSTATUS FROM APPOINT_TEMP WHERE DOCTOR_NAME=? ";

		List ulist=new ArrayList<>();
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection con=DriverManager.getConnection(url,user,pass);
			PreparedStatement ps=con.prepareStatement(sql);
			ps.setString(1,email);	
		
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				String temp=rs.getInt(1)+":"+rs.getString(2)+":"+rs.getString(3)+":"+rs.getString(4)+":"+rs.getString(5)+":"+rs.getInt(6)+":"+rs.getString(7);
				ulist.add(temp);
				
			}
		
		
		}catch(Exception e) {
			e.printStackTrace();
		}
		return ulist;
		
	}
	
	
	public static List getInfoPrfe(String email) {
		//String driver="oracle.jdbc.driver.OracleDriver";
		String url=("jdbc:oracle:thin:@localhost:1521:xe");
		String user="system";
		String pass="system";
		String sql="SELECT P_ID,NAME,EMAIL,P_NUMBER FROM PATIENT_REG WHERE EMAIL=? ";

		List ulist=new ArrayList<>();
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection con=DriverManager.getConnection(url,user,pass);
			PreparedStatement ps=con.prepareStatement(sql);
			ps.setString(1,email);	
		
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				String temp=rs.getInt(1)+":"+rs.getString(2)+":"+rs.getString(3)+":"+rs.getString(4);
				ulist.add(temp);
				
			}
		
		
		}catch(Exception e) {
			e.printStackTrace();
		}
		return ulist;
		
	}
	

	public static List getInfoPrfeSECH(String email) {
		//String driver="oracle.jdbc.driver.OracleDriver";
		String url=("jdbc:oracle:thin:@localhost:1521:xe");
		String user="system";
		String pass="system";
		String sql="SELECT NAME FROM PATIENT_REG WHERE EMAIL=? ";

		List ulist=new ArrayList<>();
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection con=DriverManager.getConnection(url,user,pass);
			PreparedStatement ps=con.prepareStatement(sql);
			ps.setString(1,email);	
		
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				String temp=rs.getString(1);
				ulist.add(temp);
				
			}
		
		
		}catch(Exception e) {
			e.printStackTrace();
		}
		return ulist;
		
	}
	
	public static String getAdmin(String uname,String pwd) {
		
		
//		String Driver="oracle.jdbc.driver.OracleDriver";
		String url=("jdbc:oracle:thin:@localhost:1521:xe");
		String user="system";
		String pass="system";
		String sql="(SELECT PASSWORD FROM ADMIN WHERE EMAIL=?)";
		String dbpass="";
	
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection con=DriverManager.getConnection(url,user,pass);
			PreparedStatement ps=con.prepareStatement(sql);
			ps.setString(1,uname);
			ResultSet rs=ps.executeQuery();
			rs.next();
			 dbpass=rs.getString(1);
			 
			 //System.out.println(dbpass);
			
		}catch(Exception ex) {
			ex.printStackTrace();
		}
		
		return dbpass;
		
	}
	
public static int searchM(int ap,String name) {
		
		
//		String Driver="oracle.jdbc.driver.OracleDriver";
		String url=("jdbc:oracle:thin:@localhost:1521:xe");
		String user="system";
		String pass="system";
		String sql="SELECT AP_ID FROM APPOINT WHERE TD_ID=? AND PATIENT_NAME=?";
		int dbpass=0;
	
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection con=DriverManager.getConnection(url,user,pass);
			PreparedStatement ps=con.prepareStatement(sql);
			ps.setInt(1,ap);
			ps.setString(2,name);
			ResultSet rs=ps.executeQuery();
			rs.next();
			 dbpass=rs.getInt(1);
			 //System.out.println(dbpass);
			
		}catch(Exception ex) {
			ex.printStackTrace();
			return dbpass;
		}
		
		
		return dbpass;
	}
	
	
	
	
public static String getDoctor(String uname,String pwd) {
		
		
//		String Driver="oracle.jdbc.driver.OracleDriver";
		String url=("jdbc:oracle:thin:@localhost:1521:xe");
		String user="system";
		String pass="system";
		String sql="(SELECT PASSWORD FROM DOCTOR_REG WHERE EMAIL=?)";
		String dbpass="";
	
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection con=DriverManager.getConnection(url,user,pass);
			PreparedStatement ps=con.prepareStatement(sql);
			ps.setString(1,uname);
			ResultSet rs=ps.executeQuery();
			rs.next();
			 dbpass=rs.getString(1);
			 
			 //System.out.println(dbpass);
			
		}catch(Exception ex) {
			ex.printStackTrace();
		}
		
		return dbpass;
		
	}
	
		public static String getData(String uname,String pwd) {
		
			
//			String Driver="oracle.jdbc.driver.OracleDriver";
			String url=("jdbc:oracle:thin:@localhost:1521:xe");
			String user="system";
			String pass="system";
			String sql="(SELECT PASSWORD FROM PATIENT_REG WHERE EMAIL=?)";
			String dbpass="";
		
			try {
				Class.forName("oracle.jdbc.driver.OracleDriver");
				Connection con=DriverManager.getConnection(url,user,pass);
				PreparedStatement ps=con.prepareStatement(sql);
				ps.setString(1,uname);
				ResultSet rs=ps.executeQuery();
				rs.next();
				 dbpass=rs.getString(1);
				 
				 System.out.println(dbpass);
				
			}catch(Exception ex) {
				ex.printStackTrace();
			}
			
			return dbpass;
			
		}
	
		public static boolean edit(int pid,String pname,String pdes,int ppric,String pimg) {
			
		
			String sql="UPDATE PRODUCT SET PNAME=?,PDESC=?,PRICE=?,PIMG=? WHERE ID=?";
			String url=("jdbc:oracle:thin:@localhost:1521:xe");
			String user="system";
			String pass="system";

			try{
				Class.forName("oracle.jdbc.driver.OracleDriver");
				Connection con=DriverManager.getConnection(url,user,pass);
				PreparedStatement ps=con.prepareStatement(sql);
			
				ps.setString(1, pname);
				ps.setString(2, pdes);
				ps.setInt(3,ppric);
				ps.setString(4, pimg);
				ps.setInt(5, pid);
			
	

				ResultSet rs=ps.executeQuery();
			return true;
					
		}
				
			
		catch(Exception e){
			e.printStackTrace();
			System.out.print("not");
			return false;
		}
		 


}
		

		
		public static String valid(String email) {
			String drive="oracle.jdbc.driver.OracleDriver";
			
			String url="jdbc:oracle:thin:@localhost:1521:xe";
			String sql="SELECT EMAIL FROM SHOP WHERE EMAIL=?";
			
			String str="";
			try {
				Class.forName(drive);
				Connection con=DriverManager.getConnection(url,"system","system");
				PreparedStatement ps=con.prepareStatement(sql);
				ps.setString(1,email);
			
				ResultSet rs=ps.executeQuery();
				while(rs.next()) {
					str=rs.getString(1);
				
				
				}
				return str;
				
			}
			catch(Exception e){
				e.printStackTrace();
				System.out.print("not");
				return str="not";
			}
		
		}
		public static boolean edit(String name,String email,String phonenumber,int Id) {
			
			
			String sql="UPDATE PATIENT_REG SET NAME=?,EMAIL=?,P_NUMBER=? WHERE P_ID=?";
			String url=("jdbc:oracle:thin:@localhost:1521:xe");
			String user="system";
			String pass="system";

			try{
				Class.forName("oracle.jdbc.driver.OracleDriver");
				Connection con=DriverManager.getConnection(url,user,pass);
				PreparedStatement ps=con.prepareStatement(sql);
			
				ps.setString(1, name);
				ps.setString(2, email);
				ps.setString(3,phonenumber);
				ps.setInt(4, Id);
			
			
	

				ResultSet rs=ps.executeQuery();
			return true;
					
		}
				
			
		catch(Exception e){
			e.printStackTrace();
			System.out.print("not");
			return false;
		}
		 


}
		public static boolean editDoc(String name,String email,String quali,int Id) {
			
			
			String sql="UPDATE DOCTOR_REG SET NAME=?,EMAIL=?,QUALIFICATION=? WHERE D_ID=?";
			String url=("jdbc:oracle:thin:@localhost:1521:xe");
			String user="system";
			String pass="system";

			try{
				Class.forName("oracle.jdbc.driver.OracleDriver");
				Connection con=DriverManager.getConnection(url,user,pass);
				PreparedStatement ps=con.prepareStatement(sql);
			
				ps.setString(1, name);
				ps.setString(2, email);
				ps.setString(3,quali);
				ps.setInt(4, Id);
			
			
	

				ResultSet rs=ps.executeQuery();
			return true;
					
		}
				
			
		catch(Exception e){
			e.printStackTrace();
			System.out.print("not");
			return false;
		}
		 


}
		
		public static List emergency(String Id) {
			//String driver="oracle.jdbc.driver.OracleDriver";
			String url=("jdbc:oracle:thin:@localhost:1521:xe");
			String user="system";
			String pass="system";
			
			String sql="SELECT * FROM EMERGENCY WHERE D_Id=? ";

			List ulist=new ArrayList<>();
			try {
				Class.forName("oracle.jdbc.driver.OracleDriver");
				Connection con=DriverManager.getConnection(url,user,pass);
				PreparedStatement ps=con.prepareStatement(sql);
				ps.setString(1,Id);	
			
				ResultSet rs=ps.executeQuery();
				while(rs.next()) {
					String temp=rs.getString(1)+":"+rs.getString(2)+":"+rs.getInt(3)+":"+rs.getString(4);
					ulist.add(temp);
				
				}
			
			
			}catch(Exception e) {
				e.printStackTrace();
			}
			return ulist;
			
		}
		
		

		
}
