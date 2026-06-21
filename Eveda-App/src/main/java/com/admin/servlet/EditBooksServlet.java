package com.admin.servlet;

import java.io.IOException;

import com.DAO.BookDAOImpl;
import com.DB.DBConnect;
import com.entity.BookDtls;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/editBooks")
@MultipartConfig
public class EditBooksServlet extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			int bookId= Integer.parseInt(req.getParameter("bookId"));
			String bookName=req.getParameter("bookName");
			String author= req.getParameter("author");
			String price = req.getParameter("price");
			String bookStatus= req.getParameter("bookStatus");
			
			System.out.println(" EditBooksServlet bookName= "+bookName+" author= "+author+" price= "+price+" bookId= "+bookId+" bookStatus= "+bookStatus);
			
			BookDtls b= new BookDtls();
			
			b.setBookId(bookId);
			b.setBookName(bookName);
			b.setAuthor(author);
			b.setPrice(price);
			b.setStatus(bookStatus);
			
			BookDAOImpl bookDao= new BookDAOImpl(DBConnect.getConnect());
			boolean flag= bookDao.updateEditBook(b);
			
			HttpSession session= req.getSession();
			
			if(flag) {
				session.setAttribute("succMsg", "Book Update Successfully....");
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
