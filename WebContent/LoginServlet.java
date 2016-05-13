package com.sjsu.cmpe282project;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.sql.*;
import javax.sql.*;
import java.util.*;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public LoginServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		
		System.out.println("username from loginform " + username);
		System.out.println("password from loginform " + password);
		

		String driver = "com.mysql.jdbc.Driver";
		String dburl="jdbc:mysql://nirupama.crudiwrw1ffm.us-west-1.rds.amazonaws.com:3306/classicmodels";
		String dbusername = "aws";
		String dbpassword = "mysql123";

		HttpSession session = request.getSession();

		Connection con = null;
		ResultSet rs = null;
		PreparedStatement ps = null;
		String query = "select * from employees where firstName=? and lastName=?";
		try {

			Class.forName(driver).newInstance();

			con = DriverManager.getConnection(dburl, dbusername, dbpassword);
			ps = con.prepareStatement(query);

			ps.setString(1, username);
			ps.setString(2, password);
		
			rs = ps.executeQuery();

			int count = 0;
			// db user & pwd

			String user_name = new String("");
			String pwd = new String("");
			
			if ((username != null && !username.trim().isEmpty()) && (password != null && !password.trim().isEmpty()))
			// ||(user_type!=null && !user_type.trim().isEmpty()))
			{
				if (rs.next()) {
					count++;
					user_name = rs.getString("firstName");
					pwd = rs.getString("lastName");
				
				if (count > 0) {

					try {
						if (password.equals(pwd)) {

							session.setAttribute("user", username);
							session.setAttribute("password", password);
							
							System.out.println("username from db " + user_name);
							System.out.println("password from db " + pwd);
									
								RequestDispatcher dispatcher = request.getRequestDispatcher("homepage.jsp");
								dispatcher.forward(request, response);
						}
						else {
							//session.invalidate();
							System.out.println("coming into else part ");
							session.setAttribute("errorMessage", "Invalid user or password !!!");
							response.sendRedirect(request.getContextPath() + "/index.html");

						}
					}

					catch (Exception e) {
						System.out.println(e.getMessage());
					}
				}
			}
			}
			else {
				//session.invalidate();
				session.setAttribute("errorMessage", "Invalid user or password !!!");
				response.sendRedirect(request.getContextPath() + "/index.html");

			}
		}
				
		 catch (Exception e) {
			System.out.println("Unable to make connection with DB" + e);
			e.printStackTrace();

		}
	}

}

