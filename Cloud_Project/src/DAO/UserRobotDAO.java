package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;


import com.DAO.ConnectionFactory_Robot;

import DTO.RobotDTO;

public class UserRobotDAO {

	Connection connection = null;
	static PreparedStatement ptmt = null;
	ResultSet resultSet = null;

	
	private static Connection getConnection() throws SQLException {
		Connection conn;
		conn = ConnectionFactory_Robot.getInstance().getConnection();
		return conn;
	}
	
	
	
	public static boolean saveRobotUserTenant(RobotDTO robotDTO) throws SQLException {
		// TODO Auto-generated method stub
		boolean flag = false;
		String query = "INSERT INTO robot_sharing values(?,?,?,?,?,?,?)";
		Connection connection1 = getConnection();
		ptmt = connection1.prepareStatement(query);
		ptmt.setInt(1, robotDTO.getRobotId());
		ptmt.setString(2, robotDTO.getTenantId());
		ptmt.setString(3, robotDTO.getUserId());
		ptmt.setBoolean(4, true);
		ptmt.setBoolean(5, true);
		ptmt.setBoolean(6, true);
		ptmt.setBoolean(7, true);
		System.out.println("ptmt Query:"+ptmt);
		ptmt.executeUpdate();
		flag = true;
		return flag;
	}

}
