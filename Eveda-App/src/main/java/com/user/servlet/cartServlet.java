package com.user.servlet;

import java.io.IOException;

import com.DAO.BookDAOImpl;
import com.DAO.cartDAOImpl;
import com.DB.DBConnect;
import com.entity.BookDtls;
import com.entity.Cart;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/cart")
public class cartServlet extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
//		super.doGet(req, resp);
		
		try {
			int bId=Integer.parseInt(req.getParameter("bid"));
			int uId=Integer.parseInt(req.getParameter("uid"));
			
			BookDAOImpl bookDao=new BookDAOImpl(DBConnect.getConnect());
			BookDtls b=bookDao.getBookById(bId);
			
			Cart cart=new Cart();
			cart.setBookId(bId);
			cart.setUserId(uId);
			cart.setBookName(b.getBookName());
			cart.setAuthor(b.getAuthor());
			cart.setPrice(Double.parseDouble(b.getPrice()));
			cart.setTtlPrice(Double.parseDouble(b.getPrice()));
			
			cartDAOImpl cartDao= new cartDAOImpl(DBConnect.getConnect());
			boolean flag=cartDao.addCart(cart);
			
			HttpSession session = req.getSession();
			
			if(flag) {
				System.out.println("cart added successfully");
				
				session.setAttribute("addCart", "Book added to cart.");
				resp.sendRedirect("all_newBooks.jsp");
			}else {
				System.out.println("cart not added successfully");
				
				session.setAttribute("failed", "Something went wrong.");
				resp.sendRedirect("all_newBooks.jsp");
			}
			
		}catch (Exception e) {
			e.printStackTrace();
		}
	}

	
	
}
