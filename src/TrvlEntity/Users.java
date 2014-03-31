package TrvlEntity;

public class Users 
{
	
	private String 	userId;
	private String 	passwd;
	private Integer role;
	private Integer primaryKeyId;
	
	public Users()
	{
		
	}
	/**
	 * @return the userId
	 */
	public String getUserId()
	{
		return userId;
	}
	/**
	 * @param userId the userId to set
	 */
	public void setUserId(String userId) 
	{
		this.userId = userId;
	}
	/**
	 * @return the passwd
	 */
	public String getPasswd() {
		return passwd;
	}
	/**
	 * @param passwd the passwd to set
	 */
	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}
	/**
	 * @return the role
	 */
	public Integer getRole() 
	{
		return role;
	}
	/**
	 * @param role the role to set
	 */
	public void setRole(Integer role) 
	{
		this.role = role;
	}
	/**
	 * @return the primaryKeyId
	 */
	public Integer getPrimaryKeyId() 
	{
		return primaryKeyId;
	}
	/**
	 * @param primaryKeyId the primaryKeyId to set
	 */
	public void setPrimaryKeyId(Integer primaryKeyId) 
	{
		this.primaryKeyId = primaryKeyId;
	}
}
