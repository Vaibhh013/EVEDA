package com.user.servlet;

import java.io.IOException;

import com.DAO.UserDAOImpl;
import com.DB.DBConnect;
import com.entity.Users;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		try {
			String name= req.getParameter("fname");
			String email= req.getParameter("email");
			String phnno= req.getParameter("phnno");
			String password= req.getParameter("password");
			String check= req.getParameter("check");
			
			System.out.println(" RegisterServlet name= "+name+" email= "+email+" phnno= "+phnno+" password= "+password+" check= "+check);
			
			Users user= new Users();
			user.setName(name);
			user.setEmail(email);
			user.setPhoneno(phnno);
			user.setPassword(password);
			
			HttpSession session = req.getSession();
			
			if(check!=null && !check.equals("")) {
				System.out.println("passes null check");
				
				UserDAOImpl dao = new UserDAOImpl(DBConnect.getConnect());

				boolean registered = dao.userRegister(user);

				if (registered) {
					System.out.println("Registration success");
					session.setAttribute("succMsg", "User Registered Successfully......");
					resp.sendRedirect("login.jsp");
				} else {
					System.out.println("Registration failed. Try again.");
					session.setAttribute("failedMsg", "User is not registered, Kindly try after sometime.");
					resp.sendRedirect("register.jsp");
				}
			}else {
				System.out.println("Please Accept Terms and Conditions");
				session.setAttribute("failedMsg", "Please Accept Terms and Conditions.");
				resp.sendRedirect("register.jsp");
			}
			
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
	}

}
