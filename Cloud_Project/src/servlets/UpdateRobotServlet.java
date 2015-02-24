package servlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DTO.RobotDTO;
import DTO.UserDTO;
import Service.UpdateRobotRestClientService;

/**
 * Servlet implementation class UpdateRobotServlet
 */

public class UpdateRobotServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateRobotServlet() {
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
	
		String Updatedmessage = null;
		HttpSession session = request.getSession();
		RobotDTO robotDTO = null;
		String userName = session.getAttribute("userx").toString();
		String robotCode = null;
		
		if(userName!=null){
				
			robotDTO = (RobotDTO) session.getAttribute("RobObj1");
			
			if(request.getParameter("editor")!=null){
			 robotCode = request.getParameter("editor");
			}
			robotDTO.setRobotCode(robotCode);
			UpdateRobotRestClientService updateRobot = new UpdateRobotRestClientService();
			 Updatedmessage = updateRobot.updateRobot(robotDTO);
		}
		
		System.out.println("updated message:"+Updatedmessage);
		session.setAttribute("Updatedmessage", Updatedmessage);
		RequestDispatcher rd=request.getRequestDispatcher("Edit_Robot.jsp");    
	    rd.include(request,response);
	}

}
