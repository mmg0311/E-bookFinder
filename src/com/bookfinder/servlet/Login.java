package com.bookfinder.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/Login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
	String url = "jdbc:mysql://localhost:3307/sl1_mini";
	String username = "root";
	String password = "12345678";
	private Connection con;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String enrollid = request.getParameter("enroll_id");
		String pass = request.getParameter("password");
		HttpSession session = request.getSession();
		try {
			Class.forName("com.mysql.jdbc.Driver");

			con = DriverManager.getConnection(url, username, password);
			System.out.print("connecting ");
			PreparedStatement pt = con.prepareStatement("select * from students where enroll_id = ? and password = ?");
			pt.setString(1, enrollid);
			pt.setString(2, pass);
			ResultSet rs = pt.executeQuery();

			if (rs.absolute(1)) {
				session.setAttribute("name", rs.getString(2));
				session.setAttribute("enroll_id", rs.getString(1));
				session.setAttribute("last_name", rs.getString(4));
				session.setAttribute("phone", rs.getString(6));
				session.setAttribute("email", rs.getString(7));
				response.sendRedirect("UserHome.jsp");
			} else {
				response.sendRedirect("login.jsp");
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}
}
