package com.TeleCare.Patient;

import java.io.IOException;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
@WebServlet("/l")

public class P_LoginServlet extends HttpServlet{
	
	public void doPost(HttpServletRequest req,HttpServletResponse res) throws IOException {
		
		String user=req.getParameter("luser");
		String pass=req.getParameter("lpass");

		
		HttpSession session = req.getSession();
		session.setAttribute("username", user);
		//res.getWriter().print(user+ pass);
		boolean valid=validator.isValid(user, pass);
		 if(valid==true ) {
			res.sendRedirect("Patient_hp.jsp");
		}else {
			res.sendRedirect("Patient_Login.jsp?name= " +" Invalid User");
		}
		
		
		
	}
}

