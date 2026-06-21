package com.user.servlet;

import java.io.IOException;

import com.DAO.cartDAOImpl;
import com.DB.DBConnect;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/remove_book")
public class RemoveBookCart extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		int bookId=Integer.parseInt(req.getParameter("bid"));
		int userId=Integer.parseInt(req.getParameter("uid"));
		
		cartDAOImpl cartDaoImpl = new cartDAOImpl(DBConnect.getConnect());
		
		boolean flag=cartDaoImpl.deleteBookFromCart(bookId, userId);
		
		HttpSession session=req.getSession();
		
		if(flag) {
			session.setAttribute("succMsg", "Book removed from cart.");
			resp.sendRedirect("checkout.jsp");
		}else {
			session.setAttribute("failedMsg", "Something wrong on server.");
			resp.sendRedirect("checkout.jsp");
		}
		
	}

}
