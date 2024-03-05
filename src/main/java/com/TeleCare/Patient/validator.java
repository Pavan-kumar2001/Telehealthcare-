package com.TeleCare.Patient;
import com.TeleCare.dbHandler.dataFetcher;
public class validator {
	public static boolean isValid(String uname,String pwd) {
		String dbpass=dataFetcher.getData(uname, pwd);
		
		if(pwd.equals(dbpass)) {
			return true;
		}else {
			return false;
		}
		
	}

	public static boolean isAdmin(String user, String pass) {
		
	
     String dbpass=dataFetcher.getAdmin(user, pass);
		
		if(pass.equals(dbpass)) {
			return true;
		}else {
			return false;
		}
		

	}
	public static boolean isDoctor(String user, String pass) {
		
		
	     String dbpass=dataFetcher.getDoctor(user, pass);
			
			if(pass.equals(dbpass)) {
				return true;
			}else {
				return false;
			}
			

		}
}