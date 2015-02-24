<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@include file="includes/cachecheck.jsp"%>
<%@page import="java.sql.*"%>
<%@include file="includes/SessionValidation.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Robocode</title>
<%@include file="includes/header.jsp"%>
<script src="http://code.jquery.com/jquery.min.js"></script>
</head>
<BODY>
<div style="position:absolute; left:1250px;top:60px;"><a href="welcome.jsp">back to main</a></div>
<h2 style="position:absolute; left:300px;top:50px;">Admin Manual</h2>
<textarea style="position:absolute; left:300px;top:120px;" rows="25" cols="130">
SAAS ON PAAS 

Services of the system:
1.Create service:
	* Under package select the tenant Id and domain of you robot tobe created and enter the name of the robot and click next.
	* Here default java code for robot creation will be given, if you want to change nay functionalities change and click save.
	* now you have created the new robot
2.View service:
	*Select the tenant,domain and name of the robot to view. Once you selected, you will see the Java code for the robot selected.<BR><BR>
3.Edit service:
	*select the tenant,domain and name if the robot to be edited. After selection, you can see the java code. Edit and click save button.
	*Now the new functionalities have been saved.
4.Play Battle:
	*Once you click the play battle in the side pane, you will see the robots that have the access to the user.
	*select the robots which you want to play in the battle and click add. Selected Robot will be seen in the list box.
	*If you want to remove any robot,select robot and click remove.It will be removed.
	* specify the number of rounds to play and click play battle button.
	*now can you see the robots playing the battle.
	*In the bottom, You may see the start,stop and pause button where you can start ,stop and pause the battle whenever you want.
	*In the bottom,there is horrizontal bar where you can move the bar to increase or decrease the speed of the battle.
	*once the battle is done, the dialog box appears which provide the score points of the robots which played.
	*Below, you have the robot ranking button. click it and pop-up dialog box appears.
	*In the robot ranking pop-up dialog box appears, you can see the ranking the robots in the specific tenant of the user.

5.Create User Service:
	*This specific service only available to the admin where he can create the new user.
	*fill the forms in the page and all the required fields should be completed to register as user.
	*once you filled,click create user. Now the user will be register and have right tologin into system

6.Create package permission:
	*This also available to admin only where he can edit package permission:
	*enter the package permissionID,description of the permission, package Id,role rights and tenant id.
	*click submit to save the package permission.

7.Edit package permission:
	*Select the pacakge permission id and you will see package id,description,role rights and tenant id. Enter the corresponding details in the text box
	*click submit.

8.Create hierarchy permission:
	*Enter hierarchy permission id and permission list.
	*if you want add more,click add row. You can add as many hierarchy you want.
	*finally,click save button.You hierarchy permission will be added.

9.Edit Hierarchy Permission:
	*Here first select hierarchy permission id which you want to edit.
	*select the hierarchy which you want add under select to add table.
	*select the heirarchy which you want to delete under select to delete.
	*click save to button save the changes which you have made.

10.Help.
	*help will porvide the information about the system.

Intsructions to login:
* User should provide thier username and password to enter into the system.
* Once the user logged on,they should provide the role of the user in the top left corner of the home.

Instructions to Admin:

*admin has the rights to create,edit,view,create and edit package permissions ,create and edit hierarchy permissions and create new user.
*for Each services, Refer services in this manual.

Instructions to Manager:
*manager has the right to create,view,edit the robot and play the battle.
*for Each services, Refer services in this manual.

Instructions to developer:
*Developer has the right to view,edit the robot and play the battle.
*for Each services, Refer services in this manual.

Instructions to player:
*Player has the right to play the battle.
*for Each services, Refer services in this manual.

If you have any doubt,refer Robocode website.

Enjoy the system........

Good Luck.....

</textarea>
</BODY>
<%@include file="includes/fotter.jsp"%>
</html>