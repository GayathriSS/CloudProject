package servlets;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
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

public class SaveAsRobotServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SaveAsRobotServlet() {
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
		String PackageName = request.getParameter("packageName");
		String robotName = "";
		
		if(request.getParameter("saveFileName")!=null)
		{
			robotName = request.getParameter("saveFileName");
		}
		
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
				System.out.println("TenantID:"+tenantId);
			
			
			if(session.getAttribute("saveSettings")==null)
			{
			System.out.println("userId:"+userName);
			System.out.println("package Id:"+PackageName);
			robotDTO = new RobotDTO();
			robotDTO.setCreatedDate(new Date());
			robotDTO.setPackageId(PackageName);
			robotDTO.setTenantId(tenantId);
			robotDTO.setRobotCode(robotCode);
			robotDTO.setRobotName(robotName);
			robotDTO.setRobotRanking(0);
			robotDTO.setRobotDescription(robotDTO.getRobotName()+".java");
			robotDTO.setUserId(userName);
			robotDTO.setUpdatedDate(new Date());
	
			SaveRobotRestClientService saveRobotRestClientService = new SaveRobotRestClientService();
		
		
			message = saveRobotRestClientService.saveRobot(robotDTO);
		
			message = message.split(":")[0];
			}
			
			System.out.println("Message:"+message);
			request.setAttribute("Updatedmessage", message);
			
			RequestDispatcher rd=request.getRequestDispatcher("Edit_Robot.jsp");    
		    rd.include(request,response);
			
		}
		
	}

}
