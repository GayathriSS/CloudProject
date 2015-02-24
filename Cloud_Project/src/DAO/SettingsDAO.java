package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;

import com.DAO.ConnectionFactory_Robot;

import DTO.SettingsDTO;

public class SettingsDAO {
	
	Connection connection = null;
	static PreparedStatement ptmt = null;
	static ResultSet resultSet = null;
	
	
	private static Connection getConnection() throws SQLException {
		Connection conn;
		conn = ConnectionFactory_Robot.getInstance().getConnection();
		return conn;
	}
	

	public static boolean saveSettings(String robot_Id,
			List<SettingsDTO> userSettingsDTO, String tenantId, String userName) {
		// TODO Auto-generated method stub
		boolean flag = false;
		Integer robotId = Integer.parseInt(robot_Id);
		try {
			Connection connection1 = getConnection();
		System.out.println("userSettingsDTO size"+userSettingsDTO.size());
		
		
		
		for(int i=0;i<userSettingsDTO.size();i++)
		{
			List<String> userPermission = new ArrayList<String>();
			userPermission = userSettingsDTO.get(i).getUsersList();
			String userList = Arrays.toString(userPermission.toArray());
			if(userList.contains("All Users"))
			{
				userPermission = getAllUsers(userName);
			}
						
			String query = "INSERT INTO robot_sharing values (?,?,?,?,?,?,?)";
			ptmt = connection1.prepareStatement(query);
			for(int j=0;j<userPermission.size();j++)
			{
				
				
				ptmt.setInt(1, robotId.intValue());
				ptmt.setString(2, tenantId);
				ptmt.setString(3, userPermission.get(j));
				ptmt.setInt(4, 0);
				System.out.println("Query:"+ptmt);
				HashMap<String, String> hashMap = userSettingsDTO.get(i).getPermissions();
				if(hashMap.get("View").equals("checked"))
				{
					ptmt.setInt(5, 1);
				}
				else
				{
					ptmt.setInt(5, 0);
				}
				if(hashMap.get("Edit").equals("checked"))
				{
					ptmt.setInt(6, 1);
				}
				else
				{
					ptmt.setInt(6, 0);
				}
				if(hashMap.get("Play").equals("checked"))
				{
					ptmt.setInt(7, 1);
				}
				else
				{
					ptmt.setInt(7, 0);
				}
				ptmt.executeUpdate();
			}
		}
		flag= true;
		
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return flag;
	}


	private static List<String> getAllUsers(String userName) throws SQLException {
		// TODO Auto-generated method stub
		List<String> AllUsers = new ArrayList<String>();
		Connection connection1 = getConnection();
		
		String query = "Select UserID from Users";
		
		ptmt = connection1.prepareStatement(query);
		resultSet = ptmt.executeQuery();
		
		while(resultSet.next())
		{
			if(!resultSet.getString(1).contains(userName))
				AllUsers.add(resultSet.getString(1));
		}
		
		return AllUsers;
	}

}
