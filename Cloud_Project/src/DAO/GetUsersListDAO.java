package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.DAO.ConnectionFactory_Robot;

public class GetUsersListDAO {

	Connection connection = null;
	static PreparedStatement ptmt = null;
	static ResultSet resultSet = null;
	
	
	private static Connection getConnection() throws SQLException {
		Connection conn;
		conn = ConnectionFactory_Robot.getInstance().getConnection();
		return conn;
	}
	
	
	public static List<String> getUserList(String selectedValue) {
		// TODO Auto-generated method stub
		List<String> userList = new ArrayList<String>();
		
		String QueryString = "Select UserId from UserHierarchicalRole where HierarchicalRoleId = '"+selectedValue+"'";
		Connection connection1;
		try {
			connection1 = getConnection();
			ptmt = connection1.prepareStatement(QueryString);
			System.out.println("Query:"+ptmt);
			resultSet = ptmt.executeQuery();
			while(resultSet.next())
			{
				userList.add(resultSet.getString(1));
			}
			
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
		
		return userList;
	}

}
