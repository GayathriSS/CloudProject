package com.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.PackageDAO;
import com.DTO.HierarchyMapDTO;

public class EditHierarchyMapServlet extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException
			  {
		// TODO Auto-generated method stub
		HttpSession session = req.getSession();
		resp.setContentType("text/html;charset=UTF-8");
        PrintWriter out = resp.getWriter();
        String message = "";
			
        String numOfRows = req.getParameter("rowcount");
        System.out.println("Number of Rows:"+numOfRows);
        List<HierarchyMapDTO> hierarchyMapList = new ArrayList<HierarchyMapDTO>();
        
        
        for(int i=1;i<=Integer.parseInt(numOfRows);i++)
        {
        	HierarchyMapDTO hierarchyMapDTO = new HierarchyMapDTO();
        	String role = req.getParameter("hier"+i);
        	System.out.println("Role:"+role);
        	String parentRole = req.getParameter("parenthierarchy"+i);
        	System.out.println("ParentRole:"+parentRole);
        	hierarchyMapDTO.setRole(role);        	
        	hierarchyMapDTO.setParentRole(parentRole);
        	hierarchyMapList.add(hierarchyMapDTO);
        }
        
		String tenantName = session.getAttribute("tenantId").toString();
		
		
		if(tenantName!= null)
		{
			System.out.println("tenant Name value:"+tenantName);
			PackageDAO packageDAO = new PackageDAO();
			message = packageDAO.updateHierarchy(hierarchyMapList);
			session.setAttribute("HeirarchyMessage", message);
		}
		
		RequestDispatcher rd=req.getRequestDispatcher("Edit_Hierarchy_Map.jsp");    
	    rd.include(req,resp);
	}

	
	
	
}
