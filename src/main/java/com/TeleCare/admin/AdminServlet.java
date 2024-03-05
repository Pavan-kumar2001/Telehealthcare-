package com.TeleCare.admin;

import java.io.IOException;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.TeleCare.Patient.validator ;
@WebServlet("/A")

public class AdminServlet extends HttpServlet{
	
	public void doPost(HttpServletRequest req,HttpServletResponse res) throws IOException {
		
		String user=req.getParameter("luser");
		String pass=req.getParameter("lpass");

		//res.getWriter().print(user+ pass);
		boolean valid=validator.isAdmin(user, pass);
	     if(valid==true ) {
			res.sendRedirect("Admin_HP.jsp");
		}else {
			res.sendRedirect("Admin_Login.jsp");
		}
		
		
		
	}
}
