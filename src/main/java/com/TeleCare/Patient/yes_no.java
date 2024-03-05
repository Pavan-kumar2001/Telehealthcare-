
package com.TeleCare.Patient;

import java.io.IOException;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.TeleCare.dbHandler.dataInjector;
@WebServlet("/yes")
public class yes_no extends HttpServlet{
	public void doPost(HttpServletRequest req,HttpServletResponse res) throws IOException {
		String emg_Val=req.getParameter("approval-status");
	int id=Integer.parseInt(req.getParameter("entry-id"));
		
		boolean b1=dataInjector.updateemgValue(emg_Val, id);
	
		if(b1) {
		res.sendRedirect("Doctor_HP.jsp");
		}else {
			System.out.println("oops");
		}
	}
}
