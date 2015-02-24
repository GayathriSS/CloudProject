package servlets;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DAO.SettingsDAO;
import DTO.RobotDTO;
import DTO.SettingsDTO;
import DTO.UserDTO;
import Service.SaveRobotRestClientService;

/**
 * Servlet implementation class SaveRobot
 */
@WebServlet("/SaveRobot")
public class SaveRobotServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SaveRobotServlet() {
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
		
			
		String robotCode = request.getParameter("editor");
		
		HttpSession session = request.getSession();
		RobotDTO robotDTO = null;
		String userName = (String) session.getAttribute("userx");
		System.out.println(userName);
		String tenantId=null;
		String message = null;
		if(userName!=null){
				
			if(session.getAttribute("tenantId")!=null)
			{
				tenantId = (String) session.getAttribute("tenantId");
			}
				
			
			
			if(session.getAttribute("saveSettings")==null)
			{
			
			robotDTO = (RobotDTO) session.getAttribute("objCurrentRobot");
		
			robotDTO.setRobotCode(robotCode);
			robotDTO.setUserId(userName);
		
	
			SaveRobotRestClientService saveRobotRestClientService = new SaveRobotRestClientService();
		
		
			message = saveRobotRestClientService.saveRobot(robotDTO);
		
			message = message.split(":")[0];
			}
			else
			{
				List<SettingsDTO> UserSettingsDTO = (List<SettingsDTO>) session.getAttribute("saveSettings");
				if(session.getAttribute("message")==null)
				{
				
				
				robotDTO = (RobotDTO) session.getAttribute("objCurrentRobot");
				
				robotDTO.setRobotCode(robotCode);
				robotDTO.setUserId(userName);
			
		
				SaveRobotRestClientService saveRobotRestClientService = new SaveRobotRestClientService();
			
			
				message = saveRobotRestClientService.saveRobot(robotDTO);
				}
				System.out.println("message...."+message);
				String[] test = message.split(":");
				String message1 = test[1];
				message = test[0];
				
				if(SettingsDAO.saveSettings(message1,UserSettingsDTO,tenantId,userName)==true)
				{
					System.out.println("Success");
				}
				
				
				
			}
			System.out.println("Message:"+message);
			request.setAttribute("message", message);
			session.setAttribute("saveSettings", null);
			RequestDispatcher rd=request.getRequestDispatcher("Robo_creation.jsp");    
		     rd.include(request,response);
			
		}
		
	}

}
