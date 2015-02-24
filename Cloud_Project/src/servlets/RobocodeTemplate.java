package servlets;

public class RobocodeTemplate {

	public static String getRobocode(String robotName, String packageName, String userName) {
		// TODO Auto-generated method stub

		StringBuilder templateRobocode = new StringBuilder();
		templateRobocode.append("package " + packageName + "\n");
		templateRobocode.append("import robocode.*;" + "\n");
		templateRobocode.append("//import java.awt.Color;" + "\n");
		templateRobocode
				.append("// API help : http://robocode.sourceforge.net/docs/robocode/robocode/Robot.html"
						+ "\n");
		templateRobocode.append("/**" + "\n");
		templateRobocode.append("* "+ robotName + "- a robot by "+ userName +"\n");
		templateRobocode.append("*/" + "\n");
		templateRobocode.append("public class "+ robotName + " extends Robot" + "\n");
		templateRobocode.append("{" + "\n");
		templateRobocode.append("/**" + "\n");
		templateRobocode.append("* run: "+ robotName + " default behavior" +"\n");
		templateRobocode.append("*/" + "\n");
		templateRobocode.append("public void run() {" + "\n");
		templateRobocode.append("// Initialization of the robot should be put here" + "\n");
		templateRobocode.append("\n");
		templateRobocode.append("// After trying out your robot, try uncommenting the import at the top," + "\n");
		templateRobocode.append("// and the next line:" + "\n");
		templateRobocode.append("\n");
		templateRobocode.append("// setColors(Color.red,Color.blue,Color.green); // body,gun,radar" + "\n");
		templateRobocode.append("\n");
		templateRobocode.append("// Robot main loop" + "\n");
		templateRobocode.append("while(true) {" + "\n");
		templateRobocode.append("// Replace the next 4 lines with any behavior you would like" + "\n");
		templateRobocode.append("ahead(100);" + "\n");
		templateRobocode.append("turnGunRight(360);" + "\n");
		templateRobocode.append("back(100);" + "\n");
		templateRobocode.append("turnGunRight(360);" + "\n");
		templateRobocode.append("}" + "\n");
		templateRobocode.append("}" + "\n");
		templateRobocode.append("/**" + "\n");
		templateRobocode.append(" * onScannedRobot: What to do when you see another robot" + "\n");
		templateRobocode.append(" */" + "\n");
		templateRobocode.append("public void onScannedRobot(ScannedRobotEvent e) {" + "\n");
		templateRobocode.append("// Replace the next line with any behavior you would like" + "\n");
		templateRobocode.append("fire(1);" + "\n");
		templateRobocode.append("}" + "\n");
		templateRobocode.append("\n");
		templateRobocode.append("/**" + "\n");
		templateRobocode.append(" * onHitByBullet: What to do when you're hit by a bullet" + "\n");
		templateRobocode.append(" */" + "\n");
		templateRobocode.append("public void onHitByBullet(HitByBulletEvent e) {" + "\n");
		templateRobocode.append("// Replace the next line with any behavior you would like" + "\n");
		templateRobocode.append("back(10);" + "\n");
		templateRobocode.append("}" + "\n");
		templateRobocode.append("/**" + "\n");
		templateRobocode.append(" * onHitWall: What to do when you hit a wall" + "\n");
		templateRobocode.append(" */" + "\n");
		templateRobocode.append("public void onHitWall(HitWallEvent e) {" + "\n");
		templateRobocode.append("// Replace the next line with any behavior you would like" + "\n");
		templateRobocode.append("back(20);" + "\n");
		templateRobocode.append("}" + "\n");
		templateRobocode.append("}" + "\n");

		return templateRobocode.toString();
	}

}
