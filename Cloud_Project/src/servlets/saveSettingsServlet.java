package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DAO.GetUsersListDAO;
import DTO.SettingsDTO;

public class saveSettingsServlet extends HttpServlet {

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
					List<SettingsDTO> UserSettingsDTO = new ArrayList<SettingsDTO>();
					Integer rowCount = Integer.parseInt(request.getParameter("rowcount"));
					String[] permissions = new String[2];
					
					for(int i= 0; i<rowCount;i++)
					{
						SettingsDTO settingsDTO = new SettingsDTO();
						int counter = i+1;
						//System.out.println("listUser"+counter);
						//String user = request.getParameter("listUser"+counter);
						String[] users = request.getParameterValues("listUser"+counter);
									
						
						String domainName = request.getParameter("select"+counter);
						System.out.println("user:"+users);
						System.out.println("domain:"+domainName);
						settingsDTO.setDomainName(domainName);
						
						if(request.getParameterValues("permission"+counter)!=null)
						{
							 permissions = request.getParameterValues("permission"+counter);
							 if(permissions.length!=3)
							 {
								 if(permissions[0].equalsIgnoreCase("Edit")){
									 settingsDTO.getPermissions().put(permissions[0], "checked");
									 settingsDTO.getPermissions().put("View", "unchecked");
									 settingsDTO.getPermissions().put("Play", "unchecked");
								 }
								 else if(permissions[0].equalsIgnoreCase("View")){
									 settingsDTO.getPermissions().put(permissions[0], "checked");
									 settingsDTO.getPermissions().put("Edit", "unchecked");
									 settingsDTO.getPermissions().put("Play", "unchecked");
								 }
								 else if(permissions[0].equalsIgnoreCase("Play")){
									 settingsDTO.getPermissions().put(permissions[0], "checked");
									 settingsDTO.getPermissions().put("Edit", "unchecked");
									 settingsDTO.getPermissions().put("View", "unchecked");
								 }
							 }
							 else{
								 settingsDTO.getPermissions().put("Edit", "checked");
								 settingsDTO.getPermissions().put("View", "checked");
								 settingsDTO.getPermissions().put("Play", "checked");
							 }
							 
						}
						else
						{
							settingsDTO.getPermissions().put("Edit", "unchecked");
							 settingsDTO.getPermissions().put("View", "unchecked");
							 settingsDTO.getPermissions().put("Play", "unchecked");
						}
					
						List<String> userList = new ArrayList<String>();
						for(int i1=0;i1<users.length;i1++)
							userList.add(users[i1]);
						 settingsDTO.setUsersList(userList);
						//settingsDTO.setUserName(users);
						
						UserSettingsDTO.add(settingsDTO);
					}
					System.out.println("data for permissions");
					System.out.println(Arrays.toString(UserSettingsDTO.toArray()));
					System.out.println(UserSettingsDTO.get(0).getPermissions1("View"));
					System.out.println(UserSettingsDTO.get(0).getPermissions1("Edit"));
					session.setAttribute("saveSettings",UserSettingsDTO);
					//System.out.println("rowcount:"+rowCount);
					
					out.println("Settings Saved...");
			}
			
		
	}
	
}
