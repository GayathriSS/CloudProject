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

public class createpackageservlet extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException
			  {
		// TODO Auto-generated method stub
		HttpSession session = req.getSession();
		resp.setContentType("text/html;charset=UTF-8");
        PrintWriter out = resp.getWriter();
        String message = "";
			
		String packageName = req.getParameter("packageName");
		String tenantName = session.getAttribute("tenantId").toString();
		
		
		if(tenantName!= null)
		{
			System.out.println("tenant Name value:"+tenantName);
			PackageDAO packageDAO = new PackageDAO();
			message = packageDAO.createPackage(tenantName,packageName);
			session.setAttribute("domainMessage", message);
		}
		System.out.println("message:"+message);
		RequestDispatcher rd=req.getRequestDispatcher("createpackage.jsp");    
	     rd.include(req,resp);
		
		
	}

	
	
	
}
