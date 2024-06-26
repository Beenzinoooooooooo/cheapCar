package com.kh.semi.event.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.kh.semi.common.JDBCTemplate;
import com.kh.semi.common.model.vo.PageInfo;
import com.kh.semi.event.model.vo.EventBoard;
import com.kh.semi.event.model.vo.EventPhoto;

public class EventDao {

	private Properties prop = new Properties();
	
	public EventDao() {
		
		String filePath = EventDao.class.getResource("/sql/event/event-mapper.xml").getPath();
	

		
		try {
			prop.loadFromXML(new FileInputStream(filePath));
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}//	
	
	public int insertEventBoard(Connection conn, EventBoard eBoard) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertEventBoard");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, eBoard.getEventTitle());
			pstmt.setString(2, eBoard.getEventContent());
			pstmt.setInt(3, eBoard.getMemberNo());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}
		
		
		return result;
	}//
	
	public int insertEventPhoto(Connection conn, EventPhoto ePhoto) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertEventPhoto");
		
		try {
				
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setString(1, ePhoto.getPhotoOname());
				pstmt.setString(2, ePhoto.getPhotoCname());
				pstmt.setString(3, ePhoto.getPhotoPath());
				pstmt.setInt(4, ePhoto.getFileLevel());
				
				result = pstmt.executeUpdate();
				
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}
		
		return result;
	}//
	
	
	public ArrayList<EventBoard> selectEventList(Connection conn, PageInfo pi){
		
		ArrayList<EventBoard> list = new ArrayList();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectEventList");
		
		
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				
				EventBoard eBoard = new EventBoard();
				
				eBoard.setEventNo(rset.getInt("EVENT_NO"));
				eBoard.setEventTitle(rset.getString("EVENT_TITLE"));
				eBoard.setCount(rset.getInt("COUNT"));
				eBoard.setTitleImg(rset.getString("TITLE_IMG"));
				
				list.add(eBoard);
				
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		
		
		return list;
	}//
	
	
	
	public int increaseCount(Connection conn, int eventNo) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("increaseCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, eventNo);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}
		
		
		
		
		return result;
	}
	
	
	
	public int selectListCount(Connection conn) {
		
		int listCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectListCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			rset = pstmt.executeQuery();
			rset.next();
			
			listCount = rset.getInt("COUNT(*)");
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		
		
		
		
		
		return listCount;
	}//
	
	
	
	public EventBoard selectEvent(Connection conn, int eventNo) {
		
		EventBoard eBoard = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectEvent");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, eventNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				
				eBoard = new EventBoard();
				eBoard.setEventNo(rset.getInt("EVENT_NO"));
				eBoard.setEventTitle(rset.getString("EVENT_TITLE"));
				eBoard.setEventContent(rset.getString("EVENT_CONTENT"));
				eBoard.setCreateDate(rset.getDate("CREATE_DATE"));
				eBoard.setEventWriter(rset.getString("MEMBER_NAME"));
				eBoard.setStatus(rset.getString("STATUS"));
				eBoard.setCount(rset.getInt("COUNT"));
				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		
		return eBoard;
	}
	
	
	public EventPhoto selectEventPhoto(Connection conn, int eventNo){
		
		EventPhoto ePhoto = new EventPhoto();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectEventPhoto");
		
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, eventNo);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				ePhoto.setPhotoNo(rset.getInt("EVENT_PHOTO_NO"));
				ePhoto.setPhotoOname(rset.getString("EVENT_PHOTO_ORIGINNAME"));
				ePhoto.setPhotoCname(rset.getString("EVENT_PHOTO_CHANGENAME"));
				ePhoto.setPhotoPath(rset.getString("EVENT_PHOTO_ADDRESS"));
				ePhoto.setEventNo(rset.getInt("EVENT_NO"));
				ePhoto.setStatus(rset.getString("STATUS"));
				ePhoto.setFileLevel(rset.getInt("FILELEVEL"));
			}	
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		
		
		return ePhoto;
	}//
	
	public int deleteEventBoard(Connection conn, int eventNo) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("deleteEventBoard");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, eventNo);
			
			result = pstmt.executeUpdate();
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}
		
		return result;
	}//
	
	
	
	public int deleteEventPhoto(Connection conn, int eventNo) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("deleteEventPhoto");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, eventNo);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}
		
		return result;
	}//
	
	
	
	public int updateBoard(Connection conn, EventBoard eBoard) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateBoard");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, eBoard.getEventTitle());
			pstmt.setString(2, eBoard.getEventContent());
			pstmt.setInt(3, eBoard.getEventNo());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}
		
		return result;
	}// 
	
	
	public int updatePhoto(Connection conn, EventPhoto ePhoto) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updatePhoto");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, ePhoto.getPhotoOname());
			pstmt.setString(2, ePhoto.getPhotoCname());
			pstmt.setInt(3, ePhoto.getPhotoNo());

			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}
		
		return result;
	}
	
		
	public ArrayList<EventBoard> eventevent(Connection conn){
		
		ArrayList<EventBoard> list = new ArrayList();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("eventevent");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				 
				EventBoard eBoard = new EventBoard();
				
				
				eBoard.setEventNo(rset.getInt("EVENT_NO"));
				eBoard.setEventTitle(rset.getString("EVENT_TITLE"));
				eBoard.setCount(rset.getInt("COUNT"));
				eBoard.setTitleImg(rset.getString("TITLE_IMG"));
				
				
				
				list.add(eBoard);
			}
			
	
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
		return list;
	}
		
		
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}//
