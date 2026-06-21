package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.entity.BookDtls;
import com.entity.Cart;

public class cartDAOImpl implements cartDAO{
	
	private Connection connection;

	public cartDAOImpl(Connection connection) { //generate using source-->> generate constructor
//		super();
		this.connection = connection;
	}

	@Override
	public boolean addCart(Cart cart) {
		boolean flag=false;
		try {
			String sql="Insert into cart(book_id,user_id,bookName,author,price,total_price) values(?,?,?,?,?,?)";
			PreparedStatement ps=connection.prepareStatement(sql);
			ps.setInt(1, cart.getBookId());
			ps.setInt(2, cart.getUserId());
			ps.setString(3, cart.getBookName());
			ps.setString(4, cart.getAuthor());
			ps.setDouble(5, cart.getPrice());
			ps.setDouble(6, cart.getTtlPrice());
			
			int i= ps.executeUpdate();
			if(i==1) {
				flag=true;
			}
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		return flag;
	}

	@Override
	public List<Cart> getBookByUserId(int userId) {
		List<Cart> list= new ArrayList<Cart>();
		Cart c=null;
		double totalPrice=0.0;
		try {
			String sql="Select * from cart where user_id=?";
			PreparedStatement ps=connection.prepareStatement(sql);
			ps.setInt(1, userId);
			
			ResultSet res= ps.executeQuery();
			while(res.next()) {
			    c = new Cart();
			    
			    // Use names instead of numbers to prevent mapping errors
			    c.setCartId(res.getInt("cart_id"));     // Match your DB column name
			    c.setBookId(res.getInt("book_id"));
			    c.setUserId(res.getInt("user_id"));
			    c.setBookName(res.getString("bookName"));
			    c.setAuthor(res.getString("author"));
			    c.setPrice(res.getDouble("price"));
			    
			    // Calculate total price based on the 'price' column, not column index 7
			    totalPrice = totalPrice + res.getDouble("price");
			    c.setTtlPrice(totalPrice); // Ensure your Cart entity has setTotalPrice
			    
			    list.add(c);
			}
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		return list;
		
	}

	@Override
	public boolean deleteBookFromCart(int bookId, int userId) {
		
		boolean flag=false;
		try {
			String sql="Delete from cart where book_id=? and user_id=?";
			PreparedStatement ps=connection.prepareStatement(sql);
			
			ps.setInt(1, bookId);
			ps.setInt(2, userId);
			
			int i=ps.executeUpdate();
			if(i>0) {
				flag=true;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return flag;
	}

}
