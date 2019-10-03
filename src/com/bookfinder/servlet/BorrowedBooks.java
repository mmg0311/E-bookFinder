package com.bookfinder.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.time.LocalDateTime;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/BorrowedBooks")
public class BorrowedBooks extends HttpServlet {
	private static final long serialVersionUID = 1L;
	String url = "jdbc:mysql://localhost:3307/sl1_mini";
	String username = "root";
	String password = "12345678";
	private Connection con;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String book_id = request.getParameter("book_id");
		String enroll;
		HttpSession session = request.getSession();
		try {
			Class.forName("com.mysql.jdbc.Driver");

			con = DriverManager.getConnection(url, username, password);
			System.out.print("connecting ");

			enroll = session.getAttribute("enroll_id").toString();
			int b_id = Integer.parseInt(book_id);
			LocalDateTime today = LocalDateTime.now();
			PreparedStatement pt = con.prepareStatement("insert into books_borrowed values(?,?,?,?,?)");
			pt.setInt(1, b_id);
			pt.setString(2, enroll);
			pt.setString(3, today.toString());
			pt.setString(4, today.plusDays(7).toString());
			pt.setInt(5, 1);
			int check = pt.executeUpdate();
			if(check > 0) {
				
			}
			else {
				
			}
			response.sendRedirect("UserHome.jsp");

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
