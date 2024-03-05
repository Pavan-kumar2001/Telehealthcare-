package com.TeleCare.Patient;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/D")

public class D_LoginServlet extends HttpServlet {

	public void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {

		String mail = req.getParameter("luser");
		String pass = req.getParameter("lpass");

		HttpSession session = req.getSession();
		session.setAttribute("username", mail);

		// res.getWriter().print(user+ pass);
		boolean valid = validator.isDoctor(mail, pass);
		if (valid == true) {
			res.sendRedirect("Doctor_HP.jsp");

		} else {
			res.sendRedirect("Doctor_Login.jsp");
		}

	}
}
