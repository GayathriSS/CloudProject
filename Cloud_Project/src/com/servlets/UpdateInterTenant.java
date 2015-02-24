package com.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.*;
import java.sql.*;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class UpdateInterTenant extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException
			  {
		// TODO Auto-generated method stub
		HttpSession session = req.getSession();
		resp.setContentType("text/html;charset=UTF-8");
        PrintWriter out = resp.getWriter();
		try {
			
		String tenantName = req.getParameter("domain_name");
		
		

			System.out.println("tenant Name value:"+tenantName);
			String[] values = tenantName.split("_");
			try {
				Connection connection = DriverManager
						.getConnection("jdbc:mysql://robocodedb.cloudapp.net:3306/Role?user=naren&password=naren");

				Statement statement = connection.createStatement();
				//System.out.println("INSERT into Inter_Tenant_Mapping values()UPDATE robot SET Robot_Ranking = " + each_robot_info[1] +  " WHERE robot.Package_Id = '"	+ robot_domain_info[0] + "' AND robot.Robot_Name = '"	+ robot_domain_info[1] + "'");
				//int resultset = statement.executeUpdate("UPDATE robot SET Robot_Ranking = " + each_robot_info[1] +  " WHERE robot.Package_Id = '"	+ robot_domain_info[0] + "' AND robot.Robot_Name = '"	+ robot_domain_info[1] + "'");
				System.out.println("INSERT INTO  Role.Inter_Tenant_Mapping (FromTenantID ,FromPackagePermissionID ,ToTenantID ,ToPackagePermissionID)VALUES (" + values[0] + "," +  values[1] + "," +  values[2] + "," +  values[3] +")");;
				int rs = statement
						.executeUpdate("INSERT INTO  Role.Inter_Tenant_Mapping (FromTenantID ,FromPackagePermissionID ,ToTenantID ,ToPackagePermissionID)VALUES (" + "'" + values[0] + "'" +  "," +  "'" + values[1] + "'" + "," + "'" + values[2] + "'" + "," + "'" + values[3] + "'" + ")");
				System.out.println("rs is" + rs);
				if(rs > 0)
				{
					out.println("Permission is added");
					
				}
				else if(rs == 0){
					out.println("Insertion is not possible. Already the permission was set from " + values[0] + "to" + values[2]);
				}
			}catch (Exception e) {
				out.println("Insertion is not possible. Already the permission was set from " + values[0] +  " to " + values[2]);
			}

		
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		finally{
			out.close();
		}
		
	}

	
	
	
}
