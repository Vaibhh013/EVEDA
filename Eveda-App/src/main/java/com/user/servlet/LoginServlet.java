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

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			UserDAOImpl dao = new UserDAOImpl(DBConnect.getConnect());
			
			HttpSession session = req.getSession();
			
			
			String email = req.getParameter("email");
			String password = req.getParameter("password");

			System.out.println(" LoginServlet email= " + email + " password= " + password);

			if("admin013@gmail.com".equals(email) && ("admin@1234".equals(password))) {
				Users user=new Users();
				user.setName("Sanjeev");
				session.setAttribute("userObj", user);
				resp.sendRedirect("admin/home.jsp");
				return;
			}else {
				
				Users user=dao.userLogin(email, password);
				if(user!=null && !user.equals("")) {
					session.setAttribute("userObj", user);
					resp.sendRedirect("index.jsp");
				}else {
					session.setAttribute("failedMsg", "Invalid email and password");
					resp.sendRedirect("login.jsp");
				}
				return;
				
//				resp.sendRedirect("home.jsp");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
