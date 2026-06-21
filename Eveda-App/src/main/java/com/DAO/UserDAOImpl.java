package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.entity.Users;

public class UserDAOImpl implements UserDAO{
	
	private Connection connection;

	public UserDAOImpl(Connection connection) { //generate using source-->> generate constructor
//		super();
		this.connection = connection;
	}

	@Override
	public boolean userRegister(Users user) {
		boolean flag=false;
		try {
			String sql="Insert into eveda_users(username,email,phone_no,password) values(?,?,?,?)";
			PreparedStatement ps=connection.prepareStatement(sql);
			ps.setString(1, user.getName());
			ps.setString(2, user.getEmail());
			ps.setString(3, user.getPhoneno());
			ps.setString(4, user.getPassword());
			
			int i= ps.executeUpdate();
			if(i==1) {
				flag=true;
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return flag;
	}

	@Override
	public Users userLogin(String email, String password) {
		Users user=null;
		try {
			String sql="SELECT * FROM `eveda-app`.eveda_users where email=? and password=?";
			PreparedStatement ps=connection.prepareStatement(sql);
			
			ps.setString(1, email);
			ps.setString(2, password);
			
			ResultSet rs= ps.executeQuery();
			
			while(rs.next()) {
				user=new Users();
				user.setId(rs.getInt(1));
				user.setName(rs.getString(2));
				user.setEmail(rs.getString(3));
				user.setPhoneno(rs.getString(4));
				user.setPassword(rs.getString(5));
				user.setAddress(rs.getString(6));
				user.setLandmark(rs.getString(7));
				user.setCity(rs.getString(8));
				user.setState(rs.getString(9));
				user.setCountry(rs.getString(10));
				user.setPincode(rs.getString(11));
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return user;
	}
	
	
	
}
