package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;
import java.util.List;

import com.DTO.HierarchyMapDTO;

public class PackageDAO {
	
	Connection connection = null;
	PreparedStatement ptmt = null;
	ResultSet resultSet = null;
	
	private Connection getConnection() throws SQLException {
		Connection conn;
		conn = ConnectionFactory.getInstance().getConnection();
		return conn;
	}
	

	public String createPackage(String tenantName, String packageName) {
		// TODO Auto-generated method stub
		String message = "";
		System.out.println("tenantName:"+tenantName+" with packageName:"+packageName);
		
		try {
			if(!duplicatePackageName(packageName,tenantName))
			{
				String queryString = "INSERT INTO domain(DomainName,CreatedDate, TenantId) VALUES(?,?,?)";
				try {
					Connection connection1 = getConnection();
					ptmt = connection1.prepareStatement(queryString);
					ptmt.setString(1, packageName);
					Date d = new Date();
					System.out.println("date: "+d);
					java.sql.Date sqlDate = new java.sql.Date(d.getTime());
					System.out.println("sqlDate:"+sqlDate);
					ptmt.setDate(2, sqlDate);
					ptmt.setString(3, tenantName);
					ptmt.executeUpdate();
					message = packageName+ " has been added successfully to the tenant "+tenantName;
					
				} catch (SQLException e) {
				// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			else
			{
				message = packageName+" already exists";
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
				
		return message;
	}


	private boolean duplicatePackageName(String packageName, String tenantName) throws SQLException {
		// TODO Auto-generated method stub
		boolean flag = false;
		Integer count = 0;
		String queryString = "Select count(*) from  domain where DomainName=? and TenantId = ?";
		Connection connection1 = getConnection();
		ptmt = connection1.prepareStatement(queryString);
		
		ptmt.setString(1, packageName);
		ptmt.setString(2, tenantName);
		System.out.println("QUERY:"+ptmt);
		resultSet = ptmt.executeQuery();
		while(resultSet.next())
		{
		  count = resultSet.getInt(1);
			
		}
		System.out.println("count value:"+count);
		if(count==0)
			return false;
		else
		
		return true;
	}


	public String updateHierarchy(List<HierarchyMapDTO> hierarchyMapList) {
		// TODO Auto-generated method stub
		String message = "";
		for(int i=0;i<hierarchyMapList.size();i++)
		{
			HierarchyMapDTO hierarchyMapDTO = hierarchyMapList.get(i);
			String queryString = "Update Hierarchy set ParentHierarchicalRoleId =? where HierarchicalRoleId = ?";
			
			try {
				Connection connection1 = getConnection();
				ptmt = connection1.prepareStatement(queryString);
				ptmt.setString(1, hierarchyMapDTO.getParentRole());
				ptmt.setString(2, hierarchyMapDTO.getRole());
				System.out.println("QUERY:"+ptmt);
				ptmt.executeUpdate();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}
		message = "Hierarchies updated Successfully";
		
		return message;
	}

}
