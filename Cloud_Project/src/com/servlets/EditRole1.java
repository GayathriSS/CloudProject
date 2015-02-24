package com.servlets;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.CreateRoleDAO;
import com.DAO.EditRoleDAO;
import com.DTO.PackagePermissionDTO;
import com.DTO.PackageRoleDTO;
import com.DTO.Package_Role_PermissionDTO;

/**
 * Servlet implementation class EditRole1
 */
@WebServlet("/EditRole1")
public class EditRole1 extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public EditRole1() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		EditRoleDAO edit = new EditRoleDAO();
		CreateRoleDAO r = new CreateRoleDAO();
		List<PackagePermissionDTO> permissionDescriptionList = new ArrayList<PackagePermissionDTO>();
		permissionDescriptionList = r.findAll();
		Package_Role_PermissionDTO List1 = new Package_Role_PermissionDTO();
		String perm = request.getParameter("pemission");
		perm=perm.trim();
		System.out.println("Permission is perm"+perm+"Hello");
		List1.setPackageRoleID(perm);
		List<Package_Role_PermissionDTO> PermissionIDList;
		PermissionIDList = edit.findAll1(List1);
		System.out.println("permissionIdList:"+PermissionIDList.size());
		for(int i=0; i< PermissionIDList.size() ;i++)
		{
			int j=i+1;
			System.out.println("value of permission "+j+ " "+PermissionIDList.get(i).getPackageRoleID());
		}
		session.setAttribute("PermissionId", PermissionIDList);
		session.setAttribute("permissionDescription", permissionDescriptionList);
		RequestDispatcher rd = request.getRequestDispatcher("EditRole1.jsp");
		rd.forward(request, response);
		
	}
}
