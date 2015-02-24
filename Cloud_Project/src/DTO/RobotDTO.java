package DTO;

import java.io.Serializable;
import java.util.Date;

import javax.xml.bind.annotation.XmlRootElement;

@XmlRootElement
public class RobotDTO implements Serializable {

	private Integer RobotId;
	private String RobotName;
	private String RobotCode;
	private String PackageId;
	private String UserId;
	private String TenantId;
	public String getTenantId() {
		return TenantId;
	}
	public void setTenantId(String tenantId) {
		TenantId = tenantId;
	}
	private String RobotDescription;
	private Integer RobotRanking;
	private Date CreatedDate;
	private Date UpdatedDate;
	public Integer getRobotId() {
		return RobotId;
	}
	public void setRobotId(Integer robotId) {
		RobotId = robotId;
	}
	public String getRobotName() {
		return RobotName;
	}
	public void setRobotName(String robotName) {
		RobotName = robotName;
	}
	public String getRobotCode() {
		return RobotCode;
	}
	public void setRobotCode(String robotCode) {
		RobotCode = robotCode;
	}
	
	public String getPackageId() {
		return PackageId;
	}
	public void setPackageId(String packageId) {
		PackageId = packageId;
	}
	public String getUserId() {
		return UserId;
	}
	public void setUserId(String userId) {
		UserId = userId;
	}
	public String getRobotDescription() {
		return RobotDescription;
	}
	public void setRobotDescription(String robotDescription) {
		RobotDescription = robotDescription;
	}
	public Integer getRobotRanking() {
		return RobotRanking;
	}
	public void setRobotRanking(Integer robotRanking) {
		RobotRanking = robotRanking;
	}
	public Date getCreatedDate() {
		return CreatedDate;
	}
	public void setCreatedDate(Date createdDate) {
		CreatedDate = createdDate;
	}
	public Date getUpdatedDate() {
		return UpdatedDate;
	}
	public void setUpdatedDate(Date updatedDate) {
		UpdatedDate = updatedDate;
	}
	
	
	
}
