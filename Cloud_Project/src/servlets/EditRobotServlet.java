package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DAO.GetRobocodeDAO;
import DTO.RobotDTO;
import DTO.UserDTO;
import Service.GetRobocodeRestClientService;
import DTO.EditPermissionDTO;

/**
 * Servlet implementation class EditRobotServlet
 */

public class EditRobotServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditRobotServlet() {
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
		String flag = null;
		PrintWriter out = response.getWriter();
		RobotDTO robotDTO = null;
		HttpSession session = request.getSession();
		//System.out.println("in hello world....");
		String userName = (String) session.getAttribute("userx");
		String selectedItem = null;
		String roboCode = null;
		EditPermissionDTO editPermissionDTO = null; 
		if(userName!=null){
			robotDTO = (RobotDTO) session.getAttribute("RobObj");
			
			if (request.getParameter("robot_name") != null) {
				selectedItem = request.getParameter("robot_name");
			}
			System.out.println("selected robotName:"+selectedItem);
			robotDTO.setRobotName(selectedItem);
			robotDTO.setRobotDescription(selectedItem+".java");	
			editPermissionDTO = GetRobocodeDAO.getRobocode(robotDTO);
			roboCode = editPermissionDTO.getRobocode();
			session.setAttribute("Robocode", roboCode);
			if(userName.equalsIgnoreCase(editPermissionDTO.getUserId()))
			{
				flag = "set";
			}
		}
		System.out.println("permissionflag:"+flag);
		
		session.setAttribute("permissionflag", flag);
		 
		session.setAttribute("RobObj1", robotDTO);
		
		out.println(roboCode);
		
		
		
		/*UserDTO userDTO = (UserDTO) session.getAttribute("userDTO");
		RobotDTO robotDTO  = null;
		String selectedItem = null;
		if (request.getParameter("selectfrom") != null) {
			selectedItem = request.getParameter("selectfrom");
		}
		if(userDTO!=null){
			robotDTO = (RobotDTO) session.getAttribute("LoadRobotobj");
			robotDTO.setRobotDescription(selectedItem);
			session.setAttribute("SaveRobotObj", robotDTO);
		}
		GetRobocodeRestClientService robocodeRestClientService = new GetRobocodeRestClientService();
		RobotDTO robot_DTO = robocodeRestClientService.getRobocode(robotDTO);
		
		if(robot_DTO != null){
			String robocode = robot_DTO.getRobotCode();
			session.setAttribute("robocode", robocode);
			RequestDispatcher requestDispatcher = request.getRequestDispatcher("Edit_Robo3.jsp");
			requestDispatcher.forward(request, response);
		}
		//System.out.println("value of java file:"+selectedItem);
		
	}*/

}
}
