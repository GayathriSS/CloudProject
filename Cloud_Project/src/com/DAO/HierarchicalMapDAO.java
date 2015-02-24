package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import com.DTO.HierarchyMapDTO;

public class HierarchicalMapDAO {
	
	Connection connection = null;
	PreparedStatement ptmt = null;
	ResultSet resultSet = null;
	
	private Connection getConnection() throws SQLException {
		Connection conn;
		conn = ConnectionFactory.getInstance().getConnection();
		return conn;
	}
	
	
	public String addHierarchy(List<HierarchyMapDTO> hierarchyMapList) {
		// TODO Auto-generated method stub
		String message = "";
		
		for(int i=0;i<hierarchyMapList.size();i++)
		{
			String queryString = "INSERT INTO Hierarchy(HierarchicalRoleId,ParentHierarchicalRoleId) VALUES(?,?)";
			
			Connection connection1;
			try {
				connection1 = getConnection();
				ptmt = connection1.prepareStatement(queryString);
				System.out.println("Query:"+ptmt);
				HierarchyMapDTO hierarchyMapDTO = hierarchyMapList.get(i);
				ptmt.setString(1, hierarchyMapDTO.getRole());
				ptmt.setString(2, hierarchyMapDTO.getParentRole());
				
				ptmt.executeUpdate();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			
			
		}
		
		message = "Hierarchy has been added successfully...";
		return message;
	}
	
	

}
