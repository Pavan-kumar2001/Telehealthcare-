package com.TeleCare.Patient;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.TeleCare.dbHandler.dataFetcher;

@WebServlet("/editDocPrf")
public class editDoctorprofile extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int id = Integer.parseInt(req.getParameter("id"));
		String name = req.getParameter("name");

		String email = req.getParameter("email");
		String Quali = req.getParameter("quali");

		System.out.println(email);
		boolean bl = dataFetcher.editDoc(name, email, Quali, id);

		if (bl == true) {
			resp.sendRedirect("Doctor_HP.jsp");
		} else {
			resp.getWriter().print("OOps try again");
		}

	}

}
