package com.admin.servlet;


import java.io.File;
import java.io.IOException;

import com.DAO.BookDAOImpl;
import com.DAO.UserDAOImpl;
import com.DB.DBConnect;
import com.entity.BookDtls;
import com.entity.Users;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;


@WebServlet("/add_Book")
@MultipartConfig
public class AddBook extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
			String bookName= req.getParameter("bookName");
			String author= req.getParameter("author");
			String price = req.getParameter("price");
			String bookCategory= req.getParameter("bookCategory");
			String bookStatus= req.getParameter("bookStatus");
			
			System.out.println(" AddBook bookName= "+bookName+" author= "+author+" price= "+price+" bookCategory= "+bookCategory+" bookStatus= "+bookStatus);
			
			Part part=req.getPart("photoUpload");
			String fileName= part.getSubmittedFileName();
			
			System.out.println(" AddBook fileName= "+fileName);

			BookDtls bookDtls= new BookDtls(bookName, author, bookCategory, bookStatus, fileName, "admin013@gmail.com", price);
			System.out.println("bookDtls= "+bookDtls);
			
			String path=getServletContext().getRealPath("")+"book";
			System.out.println("path= "+path);
			
			File f=new File(path);
			part.write(path+File.separator+fileName);
			
			BookDAOImpl bookDAO = new BookDAOImpl(DBConnect.getConnect());
			boolean isBoodAdded = bookDAO.addBooks(bookDtls);
			HttpSession session = req.getSession();
			
			if(isBoodAdded) {
				System.out.println("book adding success");
				session.setAttribute("succMsg", "Book added successfully......");
				resp.sendRedirect("admin/add_Book.jsp");
			}else {
				System.out.println("Book is not added, Try again.");
				session.setAttribute("failedMsg", "Book is not added, Kindly try after sometime.");
				resp.sendRedirect("admin/add_Book.jsp");
			}	
			
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	
}
