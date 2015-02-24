package DAO;

import java.sql.SQLException;
import java.util.Date;


import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;




import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import org.hibernate.service.ServiceRegistry;
import org.hibernate.service.ServiceRegistryBuilder;

import DTO.RobotDTO;
import DTO.UserDTO;
import Entity.Robots;
import Entity.Users;

public class SaveRobotDAO {

	private static final SessionFactory sessionFactory;
	private static ServiceRegistry serviceRegistry;
	
	 static {

         try {

                 Configuration configuration = new Configuration();
                 configuration.configure("hibernate.xml");
                 serviceRegistry = new ServiceRegistryBuilder().applySettings(configuration.getProperties()).buildServiceRegistry();
                 sessionFactory = configuration.buildSessionFactory(serviceRegistry);

         } 
         catch (Throwable th) {

                 System.err.println("Enitial SessionFactory creation failed" + th);
                 throw new ExceptionInInitializerError(th);

         }

	 }
	
	public String saveRobot(RobotDTO robotDTO) throws SQLException {
		
		String message = "";
		Integer robotId;
			RobotDTO robot1DTO = getRobocode(robotDTO);
			Session session = sessionFactory.openSession();
			if(robot1DTO==null)
			{
			
			session.beginTransaction();
			
			Robots robot = new Robots();
			robot.setRobotName(robotDTO.getRobotName());
			robot.setTenantId(robotDTO.getTenantId());
			robot.setPackageId(robotDTO.getPackageId());
			robot.setRobotCode(robotDTO.getRobotCode());
			robot.setUserId(robotDTO.getUserId());
			robot.setRobotDescription(robotDTO.getRobotDescription());
			robot.setCreatedDate(new Date());
			robot.setUpdatedDate(new Date());
			robot.setRobotRanking(0);
			
			session.save(robot);
			session.getTransaction().commit();
			robotDTO.setRobotId(robot.getRobotId());
			
			boolean x = UserRobotDAO.saveRobotUserTenant(robotDTO);
				if(x==true)
				{
					message = "Robot Saved Successfully:"+ robotDTO.getRobotId();
					System.out.println("IN DAO:"+message);
				}
			
			
			}
			else if(robot1DTO.getRobotCode().equalsIgnoreCase(robotDTO.getRobotCode()))
			{
				message = "File already saved successfully:"+robot1DTO.getRobotId();
			}
		
			session.close();
		return message;
	}
	
	
	public static boolean AlreadyExisting(RobotDTO robotDTO) {
		// TODO Auto-generated method stub
		boolean filePresent =false;
		Session session = sessionFactory.openSession();
		String robotList = " from Robots r where r.RobotName = ?";
		Query robotListQuery = session.createQuery(robotList);
		robotListQuery.setString(0, robotDTO.getRobotName());
		if(robotListQuery.list().size() == 0)
		{
			filePresent =  false;
		}
		else
		{
			filePresent =  true;
		}
		session.close();
		return filePresent;
	}


	public List<RobotDTO> getRobotList(RobotDTO robotDTO){
		
		Session session = sessionFactory.openSession();
		System.out.println("Robot Details:"+robotDTO.getUserId()+" with domainId:"+robotDTO.getPackageId());
		String robotListString = " from Robots r where r.UserId = ? and r.PackageId = ?";
		Query robotListQuery = (Query) session.createQuery(robotListString);
		robotListQuery.setParameter(0, robotDTO.getUserId());
		robotListQuery.setParameter(1, robotDTO.getPackageId());
		final List<RobotDTO> robotList = new LinkedList<RobotDTO>();
		Robots robot = null;
		for(int counter=0;counter<robotListQuery.list().size();counter++)
		{
			robot = (Robots) robotListQuery.list().get(counter);
			RobotDTO robot_DTO = new RobotDTO();
			robot_DTO.setRobotDescription(robot.getRobotDescription());
			robotList.add(robot_DTO);
			
		}
			
		return robotList;
		
	}


	public RobotDTO getRobocode(RobotDTO robotDTO) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.openSession();
		System.out.println("Robot Details:"+robotDTO.getUserId()+" with domainId:"+robotDTO.getPackageId()+" with description "+robotDTO.getRobotDescription());
		String robotListString = " from Robots r where r.PackageId = ? and r.RobotDescription=?";
		Query robotListQuery = (Query) session.createQuery(robotListString);
		robotListQuery.setParameter(0, robotDTO.getPackageId());
		robotListQuery.setParameter(1, robotDTO.getRobotDescription());
		RobotDTO robotList = new RobotDTO();
		if(robotListQuery.list().isEmpty())
		{
			return null;
		}
		Robots robot = (Robots)robotListQuery.list().get(0);
		robotList.setRobotId(robot.getRobotId());
		robotList.setRobotCode(robot.getRobotCode());
		return robotList;
	}


	public String updateRobot(RobotDTO robotDTO) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.openSession();
		session.beginTransaction();
		String message = "Robocode Updated successfully for "+robotDTO.getRobotDescription();
		String robotUpdateString = "Update Robots r set r.RobotCode=? where r.PackageId = ? and r.RobotDescription = ? and r.TenantId =?";
		Query robotUpdateQuery = session.createQuery(robotUpdateString);
		robotUpdateQuery.setParameter(0, robotDTO.getRobotCode());
		robotUpdateQuery.setParameter(1, robotDTO.getPackageId());
		robotUpdateQuery.setParameter(2, robotDTO.getRobotDescription());
		robotUpdateQuery.setParameter(3, robotDTO.getTenantId());
		int result = robotUpdateQuery.executeUpdate();
		System.out.println(result+" rows updated....");
		session.getTransaction().commit();
		return message;
	}
	
	public RobotDTO getRoboCodeforBattle(String robotName) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.openSession();
		//System.out.println("RobotName:"+robotName);
		String robotListString = " from Robots r where r.RobotName=?";
		Query robotListQuery = (Query) session.createQuery(robotListString);
		robotListQuery.setParameter(0, robotName);
		//System.out.println(robotListQuery.list().size());
		RobotDTO robotList = new RobotDTO();
		Robots robot = (Robots)robotListQuery.list().get(0);
		//System.out.println(robot.getRobotDescription());
		robotList.setRobotDescription(robot.getRobotDescription());
		robotList.setRobotCode(robot.getRobotCode());
		robotList.setPackageId(robot.getPackageId());
		robotList.setTenantId(robot.getPackageId());
		robotList.setRobotId(robot.getRobotId());
		robotList.setRobotName(robot.getRobotName());
		robotList.setRobotRanking(robot.getRobotRanking());
		robotList.setUserId(robot.getUserId());
		return robotList;
		
	}
	

}
