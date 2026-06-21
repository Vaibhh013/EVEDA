package com.admin.servlet;

import java.io.IOException;

import com.DAO.BookDAOImpl;
import com.DB.DBConnect;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/delete")
@MultipartConfig
public class BookDeleteServlet extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			int bookId= Integer.parseInt(req.getParameter("id"));
			
			BookDAOImpl bookDao= new BookDAOImpl(DBConnect.getConnect());
			
			boolean flag= bookDao.deleteBooks(bookId);
			
			HttpSession session= req.getSession();
			
			if(flag) {
				session.setAttribute("succMsg", "Book details deleted Successfully....");
				resp.sendRedirect("admin/all_Books.jsp");
			}else {
				session.setAttribute("failedMsg", "Some error occured, Please try again....");
				resp.sendRedirect("admin/all_Books.jsp");
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

	

}
