package com.servlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mysql.jdbc.Statement;

/**
 * Servlet implementation class EditRole3
 */
@WebServlet("/EditRole3")
public class EditRole3 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditRole3() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String permission1 = request.getParameter("pemission1");
		String[] permission2 = request.getParameterValues("pemission2");
		String permission3 = request.getParameter("pemission3");
		String value;
		System.out.println("permission1= "+permission1+"permission2= "+permission2[1]+permission2[0]+"permission3= "+permission3);
		for(int i =0; i<permission2.length;i++){
			try {
				Connection connection = DriverManager
						.getConnection("jdbc:mysql://robocodedb.cloudapp.net:3306/Role?user=naren&password=naren");
	System.out.println("Hi");
				Statement statement = (Statement) connection.createStatement();
				String newstmt = "Delete from Package_Role_Permission where PackagePermissionID='"+permission2[i]+"' and PackageRoleid='"+permission1+"'";
	System.out.println(newstmt);
				int resultSet = statement.executeUpdate(newstmt);
				System.out.println("swxwxdedx");
						 
		}
		catch (Exception e) {
			System.out.println("wrong entry" + e);
			//out.println("wrong entry" + e);
		}
		}	
		RequestDispatcher rd = request.getRequestDispatcher("EditRole.jsp");
		rd.forward(request, response);
	}

}
