package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DAO.GetUsersListDAO;
import DTO.RobotDTO;
import Service.SaveRobotRestClientService;

public class GetUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
			HttpSession session = request.getSession();
			String userName = (String) session.getAttribute("userx");
			PrintWriter out = response.getWriter();
			String message = null;
			
			String selectedValue = "";
			if(userName!=null)
			{
				String rowCount = request.getParameter("rowcount");
				System.out.println("rowcount:"+rowCount);
				if(request.getParameter("getRoles")!=null)
				{
					
					selectedValue = request.getParameter("getRoles");
					
				}
					System.out.println("selectedvalue:"+selectedValue);
					List<String> userList = GetUsersListDAO.getUserList(selectedValue);
					message = rowCount;
					System.out.println("message value:"+message);
					
					if(userList.size()==0)
					{
						out.println(
								
								"<option selected = 'selected' disabled='disabled'>No Users</option>"
								);

					}
					else
					{
						out.println(
								"<option selected = 'selected' disabled='disabled'>Select Users</option>"
							);
						out.println(
								"<option>All Users</option>"
								);
						for(int i=0; i< userList.size();i++)
						{
							out.println(
									
									"<option value='" + userList.get(i) + "'>" + userList.get(i) + "</option>"
									);
						}
						
						
					}
					
			}
			
		
	}

}
