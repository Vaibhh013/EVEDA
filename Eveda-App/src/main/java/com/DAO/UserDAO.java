package com.DAO;

import com.entity.Users;

public interface UserDAO {

	public boolean userRegister(Users user);
	
	public Users userLogin(String email, String password);
	
}
