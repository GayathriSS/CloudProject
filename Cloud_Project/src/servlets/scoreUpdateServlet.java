package servlets;

import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import java.util.Arrays;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DTO.RobotDTO;

public class scoreUpdateServlet extends HttpServlet{

/*	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		super.doPost(req, resp);
		System.out.println("In testing phase");
		String robotsPlayInfo = req.getParameter("q");
		System.out.println(robotsPlayInfo);
		String[] RobotRankingsInfo = robotsPlayInfo.split(" ");
		ArrayList final_arraylist = new ArrayList();
		for (int i = 0; i < RobotRankingsInfo.length; i++) { 
		    String[] each_robot_info = RobotRankingsInfo[i].split(":");
		    String[] robot_domain_info = each_robot_info[0].split("\\.");
		    System.out.println("the each robot info is" + Arrays.toString(each_robot_info));
		    System.out.println("The robot domain info is" + Arrays.toString(robot_domain_info));
			try {
				Connection connection = DriverManager
						.getConnection("jdbc:mysql://robocodedb.cloudapp.net:3306/form?user=naren&password=naren");

				Statement statement = connection.createStatement();
				System.out.println("UPDATE robot SET Robot_Ranking = " + each_robot_info[1] +  " WHERE robot.Package_Id = '"	+ robot_domain_info[0] + "' AND robot.Robot_Name = '"	+ robot_domain_info[1] + "'");
				int resultset = statement.executeUpdate("UPDATE robot SET Robot_Ranking = " + each_robot_info[1] +  " WHERE robot.Package_Id = '"	+ robot_domain_info[0] + "' AND robot.Robot_Name = '"	+ robot_domain_info[1] + "'");
				ResultSet rs = statement
						.executeQuery("SELECT robot.Package_Id, robot.Robot_Name, robot.Robot_Ranking FROM robot");
				ArrayList<String> domains = new ArrayList<String>();
				ArrayList<String> robo_name = new ArrayList<String>();
				ArrayList<String> ranking = new ArrayList<String>();
				while(rs.next()){
					
					domains.add(rs.getString("robot.Package_Id"));
					robo_name.add(rs.getString("robot.Robot_Name"));
					ranking.add(rs.getString("robot.Robot_Ranking"));
				}
				final_arraylist.add(domains);
				final_arraylist.add(robo_name);
				final_arraylist.add(ranking);
				 }catch (Exception e) {
					 e.printStackTrace();
				}
			System.out.println("The array list size is"+ final_arraylist.size());
			HttpSession session = req.getSession();
			session.setAttribute("final_arraylist", final_arraylist);
			RequestDispatcher requestDispatcher = req.getRequestDispatcher("robocode_results.jsp");
			requestDispatcher.forward(req, resp);
			return;
		}



	}*/

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		// TODO Auto-generated method stub

		
		System.out.println("In testing phase");
		String robotsPlayInfo = req.getParameter("q");
		System.out.println(robotsPlayInfo);
		String[] RobotRankingsInfo = robotsPlayInfo.split(" ");
		ArrayList final_arraylist = new ArrayList();
		for (int i = 0; i < RobotRankingsInfo.length; i++) { 
		    String[] each_robot_info = RobotRankingsInfo[i].split(":");
		    String[] robot_domain_info = each_robot_info[0].split("\\.");
		    System.out.println("the each robot info is" + Arrays.toString(each_robot_info));
		    System.out.println("The robot domain info is" + Arrays.toString(robot_domain_info));
			try {
				Connection connection = DriverManager
						.getConnection("jdbc:mysql://robocodedb.cloudapp.net:3306/form?user=naren&password=naren");

				Statement statement = connection.createStatement();
				System.out.println("UPDATE robot SET Robot_Ranking = " + each_robot_info[1] +  " WHERE robot.Package_Id = '"	+ robot_domain_info[0] + "' AND robot.Robot_Name = '"	+ robot_domain_info[1] + "'");
				int resultset = statement.executeUpdate("UPDATE robot SET Robot_Ranking = " + each_robot_info[1] +  " WHERE robot.Package_Id = '"	+ robot_domain_info[0] + "' AND robot.Robot_Name = '"	+ robot_domain_info[1] + "'");
				ResultSet rs = statement
						.executeQuery("SELECT robot.Package_Id, robot.Robot_Name, robot.Robot_Ranking FROM robot");
				ArrayList<String> domains = new ArrayList<String>();
				ArrayList<String> robo_name = new ArrayList<String>();
				ArrayList<String> ranking = new ArrayList<String>();
				while(rs.next()){
					
					domains.add(rs.getString("robot.Package_Id"));
					robo_name.add(rs.getString("robot.Robot_Name"));
					ranking.add(rs.getString("robot.Robot_Ranking"));
				}
				final_arraylist.add(domains);
				final_arraylist.add(robo_name);
				final_arraylist.add(ranking);
				 }catch (Exception e) {
					 e.printStackTrace();
				}
			System.out.println("The array list size is"+ final_arraylist.size());
			
		}
		HttpSession session = req.getSession();
		session.setAttribute("final_arraylist", final_arraylist);
		req.getRequestDispatcher("robocode_results.jsp").forward(req,resp);
	}

	
	
}
