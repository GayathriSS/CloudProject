package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;







import DAO.RobotDAO;
import DTO.RobotDTO;
import DTO.Robot_AccessDTO;
import DTO.UserDTO;
import Service.GetRobotRestClientService;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;






import com.mysql.jdbc.Statement;



/**
 * Servlet implementation class EditServlet
 */
@WebServlet("/EditServlet")
public class EditServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	Connection connection = null;
	PreparedStatement ptmt = null;
	ResultSet resultSet = null;


	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public EditServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**	
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		PrintWriter out = response.getWriter();
		
		HttpSession session = request.getSession();
		//UserDTO userDTO = (UserDTO) session.getAttribute("userDTO");
		String userName = (String) session.getAttribute("userx");
		
		if(userName !=null)
		{
			
			String tenantName = (String) session.getAttribute("tenantId");
			//System.out.println("tenant Name:"+tenantName);
			RobotDTO robotDTO = new RobotDTO();
			String selectedItem = null;
			if (request.getParameter("domain_name") != null) {
				selectedItem = request.getParameter("domain_name");
			}
			System.out.println("selectedItem:"+selectedItem);
		
		RobotDTO robotAccessDTO = new RobotDTO();
		robotAccessDTO.setUserId(userName);
		robotAccessDTO.setTenantId(tenantName);
		robotAccessDTO.setPackageId(selectedItem);
		
		
		List<String> robotList = RobotDAO.getRobotList(robotAccessDTO);
		
		session.setAttribute("RobObj", robotAccessDTO);
		
		if(robotList.size() == 0)
		{
			out.println(
					
					"<option selected = 'selected' disabled='disabled'>No Robots</option>"
					);

		}
		else
		{
			out.println(
			"<option selected = 'selected' disabled='disabled'>Select Robots</option>"
		);
		for(int i=0; i<robotList.size();i++)
		{
			out.println(
				
			"<option value='" + robotList.get(i) + "'>" + robotList.get(i) + "</option>"
			);
		}
		}
	}	
	}
		
}
