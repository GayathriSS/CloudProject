package com.servlets;

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

import com.DAO.CreateRoleDAO;
import com.DAO.EditRoleDAO;
import com.DTO.PackagePermissionDTO;
import com.DTO.PackageRoleDTO;

/**
 * Servlet implementation class EditRole
 */
@WebServlet("/EditRole")
public class EditRole extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditRole() {
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
		HttpSession session = request.getSession();
		EditRoleDAO r = new EditRoleDAO();
		PackageRoleDTO role = new PackageRoleDTO();
		List<PackageRoleDTO> permissionDescriptionList = new ArrayList<PackageRoleDTO>();
		permissionDescriptionList = r.findAll();
		session.setAttribute("RoleID", permissionDescriptionList);
		RequestDispatcher rd = request.getRequestDispatcher("EditRole.jsp");
		rd.forward(request, response);
	}

}
