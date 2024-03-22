package com.kh.semi.notice.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.semi.common.JDBCTemplate;
import com.kh.semi.notice.model.dao.NoticeDao;
import com.kh.semi.notice.model.vo.Notice;

public class NoticeService {

	public ArrayList<Notice> selectNoticeList() {
		
		Connection conn = JDBCTemplate.getConnection();
		
		ArrayList<Notice> list = new NoticeDao().selectNoticeList(conn);
		
		JDBCTemplate.close(conn);
		
		return list;
	}//
	
	
	
}//