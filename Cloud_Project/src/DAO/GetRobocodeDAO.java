package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import DTO.EditPermissionDTO;
import DTO.RobotDTO;

import com.DAO.ConnectionFactory_Robot;

public class GetRobocodeDAO {
	
	Connection connection = null;
	static PreparedStatement ptmt = null;
	ResultSet resultSet = null;

	
	private static Connection getConnection() throws SQLException {
		Connection conn;
		conn = ConnectionFactory_Robot.getInstance().getConnection();
		return conn;
	}
	

	public static EditPermissionDTO getRobocode(RobotDTO robotDTO) {
		// TODO Auto-generated method stub
		String robocode = "";
		String UserId = "";
		String query = "Select Robot_Code,User_Id from robot where Robot_name = '"+robotDTO.getRobotName()+"'";
		Connection connection1;
		EditPermissionDTO editPermissionDTO = new EditPermissionDTO();
		try {
			connection1 = getConnection();
			ptmt = connection1.prepareStatement(query);
			System.out.println("Query:"+ptmt);
			ResultSet resultSet = ptmt.executeQuery();
			while(resultSet.next())
			{
				robocode = resultSet.getString(1);
				UserId = resultSet.getString(2);
				
			}
			editPermissionDTO.setRobocode(robocode);
			editPermissionDTO.setUserId(UserId);
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return editPermissionDTO;
	}
	
	
	

}
