package com.TeleCare.Patient;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.TeleCare.dbHandler.dataFetcher;




@WebServlet("/UpdateProfileServlet")
public class editServlet extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	int id=Integer.parseInt(req.getParameter("id"));
		String name=req.getParameter("name");
	
		String email=req.getParameter("email");
		String P_no=req.getParameter("pno");
		
		
		System.out.println(email);
		boolean bl=dataFetcher.edit(name, email, P_no, id);
		
		if(bl==true) {
			resp.sendRedirect("Patient_hp.jsp");
		}else {
			resp.getWriter().print("OOps try again");
		}
		
		
	}

}
