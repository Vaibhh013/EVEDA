package com.entity;

public class BookDtls {
	
	private int bookId;
	private String bookName;
	private String author;
	private String bookCategory;
	private String Status;
	private String photo;
	private String userEmail;
	private String price;
	
	public BookDtls() {
		super();
	}
	
	
	public BookDtls(String bookName, String author, String bookCategory, String status, String photo, String userEmail,
			String price) {
		super();
		this.bookName = bookName;
		this.author = author;
		this.bookCategory = bookCategory;
		Status = status;
		this.photo = photo;
		this.userEmail = userEmail;
		this.price = price;
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


	public String getBookCategory() {
		return bookCategory;
	}


	public void setBookCategory(String bookCategory) {
		this.bookCategory = bookCategory;
	}


	public String getStatus() {
		return Status;
	}


	public void setStatus(String status) {
		Status = status;
	}


	public String getPhoto() {
		return photo;
	}


	public void setPhoto(String photo) {
		this.photo = photo;
	}


	public String getUserEmail() {
		return userEmail;
	}


	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}


	public String getPrice() {
		return price;
	}


	public void setPrice(String price) {
		this.price = price;
	}
	
	
	
	
	
}
