package com.TeleCare.Patient;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.TeleCare.dbHandler.dataFetcher;

@WebServlet("/srch")

public class Ap_completion extends HttpServlet {

	public void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {

		int Ap = Integer.parseInt(req.getParameter("TD"));
		String name = req.getParameter("name");

		int b1 = dataFetcher.searchM(Ap, name);

		if (b1 != 0) {
			String message = "Appointed Successfully";
			res.sendRedirect("search.jsp?name=" + message + "&b1=" + b1);
		} else {
			res.sendRedirect("search.jsp?name= " + " Still Pending");
		}

	}
}
