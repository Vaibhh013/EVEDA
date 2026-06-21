package com.entity;

public class Cart {
	
	private int cartId;
	private int userId;
	private int bookId;
	private String bookName;
	private String author;
	private Double price;
	private Double ttlPrice;
	
	public int getCartId() {
		return cartId;
	}
	public void setCartId(int cartId) {
		this.cartId = cartId;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public int getBookId() {
		return bookId;
	}
	public void setBookId(int bookId) {
		this.bookId = bookId;
	}
	public String getBookName() {
		return bookName;
	}
	public void setBookName(String bookName) {
		this.bookName = bookName;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public Double getPrice() {
		return price;
	}
	public void setPrice(Double price) {
		this.price = price;
	}
	public Double getTtlPrice() {
		return ttlPrice;
	}
	public void setTtlPrice(Double ttlPrice) {
		this.ttlPrice = ttlPrice;
	}
	
	
}
