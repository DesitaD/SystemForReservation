package javaResources;

import java.sql.Date;

public class UsersLogin {
	private String username;
	private String password;
	private Date loginDate;

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public Date getLoginDate() {
		return loginDate;
	}

	public void setLoginDate(Date loginDate) {
		this.loginDate = loginDate;
	}

	public UsersLogin(String username, String password) {
		super();
		this.username = username;
		this.password = password;
	}

	public UsersLogin(String username, String password, String loginDate) {
		super();
		this.username = username;
		this.password = password;
		this.loginDate = java.sql.Date.valueOf(loginDate);
	}

}
