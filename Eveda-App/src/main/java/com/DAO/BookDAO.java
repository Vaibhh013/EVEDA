package com.DAO;

import java.util.List;

import com.entity.BookDtls;

public interface BookDAO {
	
	public boolean addBooks(BookDtls book);
	
	public List<BookDtls> getAllBooks();
	
	public BookDtls getBookById(int id);
	
	public boolean updateEditBook(BookDtls b);
	
	public boolean deleteBooks (int id);
	
	public List<BookDtls> getNewBooks();
	
	public List<BookDtls> getRecentBooks();
	
	public List<BookDtls> getOldBooks();
	
	public List<BookDtls> getAllNewBooks();
	
	public List<BookDtls> getAllRecentBooks();
	
	public List<BookDtls> getAllOldBooks();
	
}
