package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import DTO.RobotDTO;
import DTO.Robot_AccessDTO;

import com.DAO.ConnectionFactory_Robot;

public class RobotDAO {
	
	Connection connection = null;
	static PreparedStatement ptmt = null;
	ResultSet resultSet = null;

	
	private static Connection getConnection() throws SQLException {
		Connection conn;
		conn = ConnectionFactory_Robot.getInstance().getConnection();
		return conn;
	}
	

	public static List<String> getRobotList(RobotDTO robotAccessDTO) {
		// TODO Auto-generated method stub
		List<String> RobotList = new ArrayList<String>();
		Connection connection1 = null;
		String QueryString = "select r.Robot_Name from robot r, robot_sharing rs where rs.robotId = r.Robot_Id and rs.tenantId = '"+robotAccessDTO.getTenantId()+"' and rs.userId='"+robotAccessDTO.getUserId()+"' and r.Package_Id='"+robotAccessDTO.getPackageId()+"' and rs.Edit_Access='1'";
		try {
			 connection1 = getConnection();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		try {
			ptmt = connection1.prepareStatement(QueryString);
			System.out.println("ptmt query:"+ptmt);
			ResultSet resultSet = ptmt.executeQuery();
			while(resultSet.next())
			{
				String robot_Name = resultSet.getString(1);
				RobotList.add(robot_Name);			
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return RobotList;
	}
	
	

	public static List<String> viewRobotList(RobotDTO robotAccessDTO) {
		// TODO Auto-generated method stub
		List<String> RobotList = new ArrayList<String>();
		Connection connection1 = null;
		String QueryString = "select r.Robot_Name from robot r, robot_sharing rs where rs.robotId = r.Robot_Id and rs.tenantId = '"+robotAccessDTO.getTenantId()+"' and rs.userId='"+robotAccessDTO.getUserId()+"' and r.Package_Id='"+robotAccessDTO.getPackageId()+"' and rs.View_Access='1'";
		try {
			 connection1 = getConnection();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		try {
			ptmt = connection1.prepareStatement(QueryString);
			System.out.println("ptmt query:"+ptmt);
			ResultSet resultSet = ptmt.executeQuery();
			while(resultSet.next())
			{
				String robot_Name = resultSet.getString(1);
				RobotList.add(robot_Name);			
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return RobotList;
	}

}
