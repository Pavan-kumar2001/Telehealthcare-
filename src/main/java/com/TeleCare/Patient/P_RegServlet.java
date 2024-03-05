package com.TeleCare.Patient;

import java.io.IOException;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.TeleCare.dbHandler.dataInjector;
@WebServlet("/x")
public class P_RegServlet extends HttpServlet{
	public void doPost(HttpServletRequest req,HttpServletResponse res) throws IOException {
		String user=req.getParameter("fname");
		String Pnumber=req.getParameter("Pno");
		String email=req.getParameter("Email");
		String gend=req.getParameter("gender");
		String Age=req.getParameter("age");
		String pass=req.getParameter("psw");
		res.getWriter().print(user+ pass + email + gend + Pnumber + Age);
		
		
		String status=dataInjector.addPatient(user, pass, email, gend, Pnumber, Age);
		
		res.getWriter().print(status);
		res.sendRedirect("Patient_Login.jsp");
	}
}
