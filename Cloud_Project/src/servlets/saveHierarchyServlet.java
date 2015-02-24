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

import com.DAO.HierarchicalMapDAO;
import com.DTO.HierarchyMapDTO;

import DAO.SettingsDAO;
import DTO.RobotDTO;
import DTO.SettingsDTO;
import DTO.UserDTO;
import Service.SaveRobotRestClientService;

/**
 * Servlet implementation class SaveRobot
 */

public class saveHierarchyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public saveHierarchyServlet() {
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
		
		String rowCount = request.getParameter("rowcount");	
		Integer count = Integer.parseInt(rowCount);		
		HttpSession session = request.getSession();
		List<HierarchyMapDTO> hierarchyMapList = new ArrayList<HierarchyMapDTO>();		
		String message = null;
		
		for(int i=1;i<=count;i++)
		{
			HierarchyMapDTO hmapDTO = new HierarchyMapDTO();
			String roleId = request.getParameter("hier"+count);
			hmapDTO.setRole(roleId);
			String parentRoleId = request.getParameter("parenthierarchy"+count);
			hmapDTO.setParentRole(parentRoleId);
			hierarchyMapList.add(hmapDTO);
		}
		
		HierarchicalMapDAO hierarchicalMapDAO = new HierarchicalMapDAO();
		message = hierarchicalMapDAO.addHierarchy(hierarchyMapList);
		
					
			System.out.println("Message:"+message);
			session.setAttribute("hierarchyMessage", message);
			
			RequestDispatcher rd=request.getRequestDispatcher("Hierarchy_Map.jsp");    
		    rd.include(request,response);
			
		
		
	}

}
