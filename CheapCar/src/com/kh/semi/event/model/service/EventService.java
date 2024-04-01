package com.kh.semi.event.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.semi.common.JDBCTemplate;
import com.kh.semi.common.model.vo.PageInfo;
import com.kh.semi.event.model.dao.EventDao;
import com.kh.semi.event.model.vo.EventBoard;
import com.kh.semi.event.model.vo.EventPhoto;

public class EventService {

	
	public int insert(EventBoard eBoard, ArrayList<EventPhoto> list) {
	
		Connection conn = JDBCTemplate.getConnection();
		
		int eBoardResult = new EventDao().insertEventBoard(conn, eBoard);
		
		int ePhotoResult = new EventDao().insertEventPhoto(conn, list);
		
		if(eBoardResult * ePhotoResult > 0) {
			JDBCTemplate.commit(conn);
		} else {
			JDBCTemplate.rollback(conn);
		}
			
		return (eBoardResult * ePhotoResult);
	}//
	
	public int selectListCount() {
		
		Connection conn = JDBCTemplate.getConnection();
		
		int listCount = new EventDao().selectListCount(conn);
		
		JDBCTemplate.close(conn);
		
		
		return listCount;
	}//
	
	public ArrayList<EventBoard> selectEventList(PageInfo pi) {
		
		Connection conn = JDBCTemplate.getConnection();
		
		ArrayList<EventBoard> list = new EventDao().selectEventList(conn, pi);
		
		JDBCTemplate.close(conn);
		
		return list;
	}//
	
	
	public int increaseCount(int eventNo) {
		
		Connection conn = JDBCTemplate.getConnection();
		
		int result = new EventDao().increaseCount(conn, eventNo);
		
		JDBCTemplate.close(conn);
		
		
		return result;
		
	}//
	
	
	public EventBoard selectEvent(int eventNo) {
		
		Connection conn = JDBCTemplate.getConnection();
		
		EventBoard eBoard = new EventDao().selectEvent(conn, eventNo);
		
		JDBCTemplate.close(conn);
		
		return eBoard;
	}//
	
	
	public ArrayList<EventPhoto> selectEventPhoto(int eventNo) {
		
		Connection conn = JDBCTemplate.getConnection();
		
		ArrayList<EventPhoto> list = new EventDao().selectEventPhoto(conn, eventNo);
		
		JDBCTemplate.close(conn);
		
		return list;
		
		
	}//
	
	
	public int deleteEvent(int eventNo) {
		
		Connection conn = JDBCTemplate.getConnection();
		
		int boardResult = new EventDao().deleteEventBoard(conn, eventNo);
		int photoResult = new EventDao().deleteEventPhoto(conn, eventNo);
		
		if((boardResult * photoResult) > 0) {
			JDBCTemplate.commit(conn);
		} else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		
		
		return (boardResult * photoResult);
	}
	
	
	public int updateBoard(EventBoard eBoard) {
		
		Connection conn = JDBCTemplate.getConnection();
		
		int result = new EventDao().updateBoard(conn, eBoard);
		
		if(result > 0) {
			JDBCTemplate.commit(conn);
		} else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		
		
		return result;
		
	}//
	
	public int update(EventBoard eBoard, ArrayList<EventPhoto> list) {
		
		Connection conn = JDBCTemplate.getConnection();
		
		int result = new EventDao().insertEventPhoto(conn, list);
		
		
		
		return result;
		
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
		
		
		
		
		
	
}
