package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entity.BookDtls;

public class BookDAOImpl implements BookDAO{
	
	private Connection connection;
	
	public BookDAOImpl(Connection connection) { //generate using source-->> generate constructor
		super();
		this.connection = connection;
	}

	@Override
	public boolean addBooks(BookDtls book) {
		boolean flag=false;
		try {
			String sql="Insert into book_dtls(bookName,Author,Book_Category,Status,photo,user_email,price) values(?,?,?,?,?,?,?)";
			PreparedStatement ps=connection.prepareStatement(sql);
			ps.setString(1, book.getBookName());
			ps.setString(2, book.getAuthor());
			ps.setString(3, book.getBookCategory());
			ps.setString(4, book.getStatus());
			ps.setString(5, book.getPhoto());
			ps.setString(6, book.getUserEmail());
			ps.setString(7, book.getPrice());
			
			int i= ps.executeUpdate();
			if(i==1) {
				flag=true;
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return flag;
	}

	@Override
	public List<BookDtls> getAllBooks() {
		BookDtls book=null;
		List<BookDtls> list=new ArrayList<BookDtls>();
		try {
			String sql="SELECT * FROM `eveda-app`.book_dtls";
			PreparedStatement ps=connection.prepareStatement(sql);

			ResultSet rs= ps.executeQuery();
			
			while(rs.next()) {
				book=new BookDtls();
				book.setBookId(rs.getInt(1));
				book.setBookName(rs.getString(2));
				book.setAuthor(rs.getString(3));
				book.setBookCategory(rs.getString(4));
				book.setStatus(rs.getString(5));
				book.setPhoto(rs.getString(6));
				book.setUserEmail(rs.getString(7));
				book.setPrice(rs.getString(8));
				list.add(book);
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}	
		return list;
	}

	@Override
	public BookDtls getBookById(int id) {
		BookDtls book=null;
		
		try {
			String sql="SELECT * FROM `eveda-app`.book_dtls where bookId=?";
			PreparedStatement ps=connection.prepareStatement(sql);
			ps.setInt(1, id);
			
			ResultSet rs= ps.executeQuery();
			
			while(rs.next()) {
				book=new BookDtls();
				book.setBookId(rs.getInt(1));
				book.setBookName(rs.getString(2));
				book.setAuthor(rs.getString(3));
				book.setBookCategory(rs.getString(4));
				book.setStatus(rs.getString(5));
				book.setPhoto(rs.getString(6));
				book.setUserEmail(rs.getString(7));
				book.setPrice(rs.getString(8));
			
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}	
		return book;
	}

	@Override
	public boolean updateEditBook(BookDtls b) {
		boolean flag=false;
		try {
			String sql="Update `eveda-app`.book_dtls set bookName=?, author=?, price=?, status=? where bookId=?"; 
			PreparedStatement ps=connection.prepareStatement(sql);
			
			ps.setString(1, b.getBookName());
			ps.setString(2, b.getAuthor());
			ps.setString(3, b.getPrice());
			ps.setString(4, b.getStatus());
			ps.setInt(5, b.getBookId());
			
			int i = ps.executeUpdate();
			if(i==1) {
				flag=true;
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return flag;
	}

	@Override
	public boolean deleteBooks(int id) {
		boolean flag=false;
		try {
			String sql="DELETE FROM `eveda-app`.book_dtls where bookId=?"; 
			PreparedStatement ps=connection.prepareStatement(sql);
			
			ps.setInt(1,id);
			
			int i = ps.executeUpdate();
			if(i==1) {
				flag=true;
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return flag;
	}

	@Override
	public List<BookDtls> getNewBooks() {
		List<BookDtls> list=new ArrayList<BookDtls>();
		try {
			
			BookDtls book=null;
			
			String sql="SELECT * FROM `eveda-app`.book_dtls where Book_Category=? and status=?"; 
			PreparedStatement ps=connection.prepareStatement(sql);
			ps.setString(1, "New");
			ps.setString(2, "Active");
			
			ResultSet rs= ps.executeQuery();
			int i=1;
			while(rs.next() && i<5) {
				book=new BookDtls();
				book.setBookId(rs.getInt(1));
				book.setBookName(rs.getString(2));
				book.setAuthor(rs.getString(3));
				book.setBookCategory(rs.getString(4));
				book.setStatus(rs.getString(5));
				book.setPhoto(rs.getString(6));
				book.setUserEmail(rs.getString(7));
				book.setPrice(rs.getString(8));
				list.add(book);
				i++;
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<BookDtls> getRecentBooks() {
		List<BookDtls> list=new ArrayList<BookDtls>();
		try {
			
			BookDtls book=null;
			
			String sql="SELECT * FROM `eveda-app`.book_dtls where status=?"; 
			PreparedStatement ps=connection.prepareStatement(sql);
			ps.setString(1, "Active");
			
			ResultSet rs= ps.executeQuery();
			int i=1;
			while(rs.next() && i<5) {
				book=new BookDtls();
				book.setBookId(rs.getInt(1));
				book.setBookName(rs.getString(2));
				book.setAuthor(rs.getString(3));
				book.setBookCategory(rs.getString(4));
				book.setStatus(rs.getString(5));
				book.setPhoto(rs.getString(6));
				book.setUserEmail(rs.getString(7));
				book.setPrice(rs.getString(8));
				list.add(book);
				i++;
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<BookDtls> getOldBooks() {
		List<BookDtls> list=new ArrayList<BookDtls>();
		try {
			
			BookDtls book=null;
			
			String sql="SELECT * FROM `eveda-app`.book_dtls where Book_Category=? and status=?"; 
			PreparedStatement ps=connection.prepareStatement(sql);
			ps.setString(1, "Old");
			ps.setString(2, "Active");
			
			ResultSet rs= ps.executeQuery();
			int i=1;
			while(rs.next() && i<5) {
				book=new BookDtls();
				book.setBookId(rs.getInt(1));
				book.setBookName(rs.getString(2));
				book.setAuthor(rs.getString(3));
				book.setBookCategory(rs.getString(4));
				book.setStatus(rs.getString(5));
				book.setPhoto(rs.getString(6));
				book.setUserEmail(rs.getString(7));
				book.setPrice(rs.getString(8));
				list.add(book);
				i++;
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<BookDtls> getAllNewBooks() {
		List<BookDtls> list=new ArrayList<BookDtls>();
		try {
			
			BookDtls book=null;
			
			String sql="SELECT * FROM `eveda-app`.book_dtls where Book_Category=? and status=?"; 
			PreparedStatement ps=connection.prepareStatement(sql);
			ps.setString(1, "New");
			ps.setString(2, "Active");
			
			ResultSet rs= ps.executeQuery();
			
			while(rs.next()) {
				book=new BookDtls();
				book.setBookId(rs.getInt(1));
				book.setBookName(rs.getString(2));
				book.setAuthor(rs.getString(3));
				book.setBookCategory(rs.getString(4));
				book.setStatus(rs.getString(5));
				book.setPhoto(rs.getString(6));
				book.setUserEmail(rs.getString(7));
				book.setPrice(rs.getString(8));
				list.add(book);
				
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<BookDtls> getAllRecentBooks() {
		List<BookDtls> list=new ArrayList<BookDtls>();
		try {
			
			BookDtls book=null;
			
			String sql="SELECT * FROM `eveda-app`.book_dtls where status=?"; 
			PreparedStatement ps=connection.prepareStatement(sql);
			ps.setString(1, "Active");
			
			ResultSet rs= ps.executeQuery();
			
			while(rs.next()) {
				book=new BookDtls();
				book.setBookId(rs.getInt(1));
				book.setBookName(rs.getString(2));
				book.setAuthor(rs.getString(3));
				book.setBookCategory(rs.getString(4));
				book.setStatus(rs.getString(5));
				book.setPhoto(rs.getString(6));
				book.setUserEmail(rs.getString(7));
				book.setPrice(rs.getString(8));
				list.add(book);
				
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<BookDtls> getAllOldBooks() {
		List<BookDtls> list=new ArrayList<BookDtls>();
		try {
			
			BookDtls book=null;
			
			String sql="SELECT * FROM `eveda-app`.book_dtls where Book_Category=? and status=?"; 
			PreparedStatement ps=connection.prepareStatement(sql);
			ps.setString(1, "Old");
			ps.setString(2, "Active");
			
			ResultSet rs= ps.executeQuery();
			
			while(rs.next()) {
				book=new BookDtls();
				book.setBookId(rs.getInt(1));
				book.setBookName(rs.getString(2));
				book.setAuthor(rs.getString(3));
				book.setBookCategory(rs.getString(4));
				book.setStatus(rs.getString(5));
				book.setPhoto(rs.getString(6));
				book.setUserEmail(rs.getString(7));
				book.setPrice(rs.getString(8));
				list.add(book);
				
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	

}
