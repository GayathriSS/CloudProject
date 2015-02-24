 package servlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



/**
 * Servlet implementation class CreateRobot
 */
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;

import javax.naming.NamingException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DAO.SaveRobotDAO;
import DTO.RobotDTO;
import DTO.Robot_DTO;
import DTO.UserDTO;

//import com.sun.xml.bind.v2.TODO;
//import com.utd.robocode.utils.DataStoreUtils;


/**
 * Servlet implementation class Login
 */

public class NewRobotServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		// TODO Auto-generated method stub

		PrintWriter out = resp.getWriter();
		
		String robotName = req.getParameter("roboName");
		String packageName = req.getParameter("package1");
		System.out.println("roboName:"+robotName+" with package:"+packageName);
		String msg = null;
			
		
		RobotDTO robotDTO = new RobotDTO();
		robotDTO.setRobotName(robotName);
		robotDTO.setPackageId(packageName);
		robotDTO.setRobotDescription(robotDTO.getRobotName()+".java");
		
		HttpSession session = req.getSession();
		String userName = (String) session.getAttribute("userx");
		System.out.println("userName:"+userName);
		if(userName != null){

			if(!(SaveRobotDAO.AlreadyExisting(robotDTO)))
			{
			
			robotDTO.setTenantId(session.getAttribute("tenantId").toString());
			System.out.println("robot get tenantid:"+robotDTO.getTenantId());
			robotDTO.setUserId(userName);
			System.out.println("roboNamefsdf:"+robotName+" with packagedsf:"+packageName);
			session.setAttribute("objCurrentRobot", robotDTO);
			session.setAttribute("message",msg);

			session.setAttribute("robotName1",robotName);
			session.setAttribute("packageName1",packageName);
			String templateRobocode = RobocodeTemplate.getRobocode(robotName,packageName,userName);
			System.out.println("templateRobocode:"+ templateRobocode);
			out.println(templateRobocode);
			//req.getRequestDispatcher("Robo_creation.jsp").forward(req,resp);
			
			//resp.sendRedirect("Robo_creation2.jsp");		
			}
			else
			{
				msg ="File name already exists";
				System.out.println(msg);
				session.setAttribute("message",msg);
				req.getRequestDispatcher("Robo_creation.jsp").forward(req, resp);
				
			}
		}
	}
}