package com.DTO;

public class PackagePermissionDTO {
	int PackagePermissionID;
	String Description;
	int PackageID;
	String RoleRights;
	int TenantID;

	public int getPackagePermissionID() {
		return PackagePermissionID;
	}

	public void setPackagePermissionID(int packagePermissionID) {
		PackagePermissionID = packagePermissionID;
	}

	public String getDescription() {
		return Description;
	}

	public void setDescription(String description) {
		Description = description;
	}

	public int getPackageID() {
		return PackageID;
	}

	public void setPackageID(int packageID) {
		PackageID = packageID;
	}

	public String getRoleRights() {
		return RoleRights;
	}

	public void setRoleRights(String roleRights) {
		RoleRights = roleRights;
	}

	public int getTenantID() {
		return TenantID;
	}

	public void setTenantID(int tenantID) {
		TenantID = tenantID;
	}

}
