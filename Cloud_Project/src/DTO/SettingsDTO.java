package DTO;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

public class SettingsDTO {
	/*
	 * Member variables:
	 * 1. Domain Name
	 * 2. USer name
	 * 3. View access
	 * 4. Edit Access
	 */
	
	public HashMap<String, String> getPermissions() {
		return permissions;
	}
	public void setPermissions(HashMap<String, String> permissions) {
		this.permissions = permissions;
	}
	//private String userName;
	private List<String> usersList = new ArrayList<String>();
	
	
	
	public List<String> getUsersList() {
		return usersList;
	}
	public void setUsersList(List<String> usersList) {
		this.usersList = usersList;
	}
	private HashMap<String, String> permissions = new HashMap<String, String>(); 
	
	private String domainName;
	
	
	public String getDomainName() {
		return domainName;
	}
	public void setDomainName(String domainName) {
		this.domainName = domainName;
	}
	public String getPermissions1(String key) {
		return permissions.get(key);
	}
	/*public void setPermissions(String key, Integer value) {
		this.permissions.put(key, value);
	}*/
	/*public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}*/
	
	
	

}
