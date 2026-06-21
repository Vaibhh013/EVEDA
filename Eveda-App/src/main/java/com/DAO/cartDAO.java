package com.DAO;

import java.util.List;

import com.entity.Cart;

public interface cartDAO {

	public boolean addCart(Cart cart);
	
	public List<Cart> getBookByUserId( int userId );
	
	public boolean deleteBookFromCart(int bookId, int userId);
	
}
