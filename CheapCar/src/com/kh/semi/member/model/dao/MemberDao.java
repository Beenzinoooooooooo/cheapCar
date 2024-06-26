package com.kh.semi.member.model.dao;

import static com.kh.semi.common.JDBCTemplate.close;
import static com.kh.semi.common.JDBCTemplate.getConnection;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.kh.semi.car.model.vo.Car;
import com.kh.semi.common.model.vo.PageInfo;
import com.kh.semi.member.model.vo.Member;

public class MemberDao {
	
	private Properties prop = new Properties();
	
	public MemberDao() {
		
		String filePath = MemberDao.class.getResource("/sql/member/member-mapper.xml").getPath();
		
		try {
			prop.loadFromXML(new FileInputStream(filePath));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	/******************************** 근경 시작  ***************************************/
	
	public int selectMemberListCount(Connection conn) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectMemberListCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			rset = pstmt.executeQuery();
			rset.next();
			
			result = rset.getInt("COUNT(*)");
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return result;
	}
	
	public ArrayList<Member> selectMemberList(Connection conn, PageInfo pi) {
		
		ArrayList<Member> list = new ArrayList();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectMemberList");
		
		try{ 
			pstmt = conn.prepareStatement(sql);
			
			int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				
				Member m = new Member();
				m.setMemberNo(rset.getInt("MEMBER_NO"));
				m.setMemberId(rset.getString("MEMBER_ID"));
				m.setMemberName(rset.getString("MEMBER_NAME"));	
				m.setEmail(rset.getString("EMAIL"));
				m.setEnrollDate(rset.getDate("ENROLL_DATE"));
				m.setMemberStatus(rset.getString("MEMBER_STATUS"));
				
				list.add(m);
			}
		
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}

	public int searchedMemberCount(Connection conn, String searchId) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("searchedMemberCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, searchId);
			pstmt.setString(2, searchId);
			rset = pstmt.executeQuery();
			
			rset.next();
			
			result = rset.getInt("COUNT(*)");
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return result;
	}
	
	public ArrayList<Member> searchedMemberList(Connection conn, PageInfo pi, String searchId) {
		
		ArrayList<Member> list = new ArrayList();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("searchedMemberList");
		
		try{ 
			pstmt = conn.prepareStatement(sql);
			
			int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;
			
			pstmt.setString(1, searchId);
			pstmt.setString(2, searchId);
			pstmt.setInt(3, startRow);
			pstmt.setInt(4, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Member member = new Member(rset.getInt("MEMBER_NO"),
										   rset.getString("MEMBER_ID"),
										   rset.getString("MEMBER_NAME"),
										   rset.getString("MEMBER_PWD"),
										   rset.getString("BIRTHDAY"),
										   rset.getString("PHONE"),
										   rset.getString("EMAIL"),
										   rset.getDate("ENROLL_DATE"),
										   rset.getString("MEMBER_STATUS"));
				list.add(member);
			}
		
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
	
		return list;
	}
	
	public int adminUpdateMem(Connection conn, Member m) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("adminUpdateMem");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, m.getMemberName());
			pstmt.setString(2, m.getPhone());
			pstmt.setString(3, m.getBirthday());
			pstmt.setString(4, m.getEmail());
			pstmt.setString(5, m.getMemberStatus());
			pstmt.setString(6, m.getBlackReason());
			pstmt.setString(7, m.getMemberId());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
/////////////////// 여기까지 순서 완료! ////////////////////////////////
/////////////////// 일단 회원 현황 상세보기만 하면 됨 ////////////////////////////////
	
/////////////////// 블랙리스트 시작 ////////////////////////////////
	
	public int selectBlackListCount(Connection conn) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectBlackListCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			rset = pstmt.executeQuery();
			
			rset.next();
			
			result = rset.getInt("COUNT(*)");
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return result;
	}
	
	public ArrayList<Member> selectBlackList(Connection conn, PageInfo pi){
		
		ArrayList<Member> list = new ArrayList();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectBlackList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Member member = new Member(rset.getInt("MEMBER_NO"),
						   rset.getString("MEMBER_ID"),
						   rset.getString("MEMBER_NAME"),
						   rset.getString("MEMBER_PWD"),
						   rset.getString("BIRTHDAY"),
						   rset.getString("PHONE"),
						   rset.getString("EMAIL"),
						   rset.getDate("ENROLL_DATE"),
						   rset.getString("MEMBER_STATUS"));
				list.add(member);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}
	
	public int searchedBlackCount(Connection conn, String searchId) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("searchedBlackCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, searchId);
			pstmt.setString(2, searchId);
			rset = pstmt.executeQuery();
			
			rset.next();
			
			result = rset.getInt("COUNT(*)");
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return result;
	}
	
	
	
	public ArrayList<Member> searchedBlackList(Connection conn, PageInfo pi, String searchId){
		
		ArrayList<Member> list = new ArrayList();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("searchedBlackList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;
			
			pstmt.setString(1, searchId);
			pstmt.setString(2, searchId);
			pstmt.setInt(3, startRow);
			pstmt.setInt(4, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Member member = new Member(rset.getInt("MEMBER_NO"),
						   rset.getString("MEMBER_ID"),
						   rset.getString("MEMBER_NAME"),
						   rset.getString("MEMBER_PWD"),
						   rset.getString("BIRTHDAY"),
						   rset.getString("PHONE"),
						   rset.getString("EMAIL"),
						   rset.getDate("ENROLL_DATE"),
						   rset.getString("MEMBER_STATUS"));
				list.add(member);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}
	
	public Member selectBlack(Connection conn, String memberId) {
		
		Member m = new Member();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectBlack");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, memberId);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				m.setMemberNo(rset.getInt("MEMBER_NO"));
				m.setMemberId(rset.getString("MEMBER_ID"));
				m.setMemberName(rset.getString("MEMBER_NAME"));
				m.setBirthday(rset.getString("BIRTHDAY"));
				m.setPhone(rset.getString("PHONE"));
				m.setEmail(rset.getString("EMAIL"));
				m.setEnrollDate(rset.getDate("ENROLL_DATE"));
				m.setMemberStatus(rset.getString("MEMBER_STATUS"));
				m.setBlackReason(rset.getString("BLACK_REASON"));
				m.setBlackDate(rset.getDate("BLACK_DATE"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return m;
	}
	
	public int updateBlack(Connection conn, int memberNo) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateBlack");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, memberNo);
			
			result = pstmt.executeUpdate();
						
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	public Member login(Connection conn, String memberId) {
		
		Member m = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("login1");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, memberId);
			
			rset = pstmt.executeQuery();
			if(rset.next()) {
				m = new Member(rset.getInt("MEMBER_NO"),
							   rset.getString("MEMBER_ID"),
							   rset.getString("MEMBER_NAME"),
							   rset.getString("MEMBER_PWD"),
							   rset.getString("BIRTHDAY"),
							   rset.getString("PHONE"),
							   rset.getString("EMAIL"),
							   rset.getDate("ENROLL_DATE"),
							   rset.getString("MEMBER_STATUS"));
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		
		return m;
	}
	
	
	
	
	
	
	
	
	////////////////////////////////////////////////////////////////////////
	
	
	
	
	
	
public Member login(Connection conn, String memberId, String memberPwd) {
		
		Member m = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("login");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, memberId);
			pstmt.setString(2, memberPwd);
			
			rset = pstmt.executeQuery();
			if(rset.next()) {
				m = new Member(rset.getInt("MEMBER_NO"),
							   rset.getString("MEMBER_ID"),
							   rset.getString("MEMBER_NAME"),
							   rset.getString("MEMBER_PWD"),
							   rset.getString("BIRTHDAY"),
							   rset.getString("PHONE"),
							   rset.getString("EMAIL"),
							   rset.getDate("ENROLL_DATE"),
							   rset.getString("MEMBER_STATUS"));
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		
		return m;
	}
	
	public int insertMember(Connection conn, Member member) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("insertTBMember");
		
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, member.getMemberId());
			pstmt.setString(2, member.getMemberName());
			pstmt.setString(3, member.getMemberPwd());
			pstmt.setString(4, member.getBirthday());
			pstmt.setString(5, member.getPhone());
			pstmt.setString(6, member.getEmail());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		
		return result;
	}
	
	public int updatemember(Connection conn, Member member) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updatemember");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, member.getMemberName());
			pstmt.setString(2, member.getBirthday());
			pstmt.setString(3, member.getPhone());
			pstmt.setString(4, member.getEmail());
			pstmt.setString(5, member.getMemberId());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		
		
		return result;
	}
	
	
	public int idCheck(Connection conn, String checkId) {
		
		int count = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("idCheck");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, checkId);
			rset = pstmt.executeQuery();
			rset.next();
			count = rset.getInt("COUNT(*)");
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		
		return count;
	}
	
	public int updatePwd(Connection conn, String memberPwd, String changePwd, int memberNo) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updatePwd");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, changePwd);
			pstmt.setInt(2, memberNo);
			pstmt.setString(3, memberPwd);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		
		return result;
	}

	public Member selectMember(Connection conn, String memberId) {
		
		Member member = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectMember1");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, memberId);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				member = new Member(rset.getInt("MEMBER_NO"),
									rset.getString("MEMBER_ID"),
									rset.getString("MEMBER_NAME"),
									rset.getString("MEMBER_PWD"),
									rset.getString("BIRTHDAY"),
									rset.getString("PHONE"),
									rset.getString("EMAIL"),
									rset.getDate("ENROLL_DATE"),
									rset.getString("MEMBER_STATUS"));
									
				member.setBlackReason(rset.getString("BLACK_REASON"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			close(rset);
			close(pstmt);
		}
		
		return member;
	}
	
	
	public int deleteMember(Connection conn, String memberPwd, int memberNo) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("deleteMember");
		
		
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, memberNo);
			pstmt.setString(2, memberPwd);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			
			close(pstmt);
			
		}
		
		return result;
	}
	
	
	public ArrayList<Car> reservation(Connection conn, Member loginUser){
		
		ArrayList<Car> list = new ArrayList();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		
		String sql = prop.getProperty("reservation");
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, loginUser.getMemberNo());
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Car car = new Car();
				car.setManagementNo(rset.getInt("MANAGEMENT_NO"));
				car.setStatus(rset.getString("STATUS"));
				car.setCarNo(rset.getString("CAR_NO"));
				car.setLocationNo(rset.getInt("LOCATION_NO"));
				car.setLocationName(rset.getString("LOCATION_NAME"));
				car.setModelName(rset.getString("MODEL_NAME"));
				car.setFuelName(rset.getString("FUEL_NAME"));
				car.setBrandName(rset.getString("BRAND_NAME"));
				car.setGradeName(rset.getString("GRADE_NAME"));
				car.setYear(rset.getInt("YEAR"));
				car.setGradePrice(rset.getInt("GRADE_PRICE"));
				car.setModelPrice(rset.getInt("MODEL_PRICE"));
				car.setYearPrice(rset.getInt("YEAR_PRICE"));
				car.setStartDate(rset.getDate("START_DATE"));
				car.setEndDate(rset.getDate("END_DATE"));
				car.setMileage(rset.getInt("MILEAGE"));
				car.setMileageDate(rset.getDate("MILEAGE_DATE"));
				car.setCsNo(rset.getInt("CS_NO"));
				car.setCsTitle(rset.getString("CS_TITLE"));
				car.setCsContent(rset.getString("CS_CONTENT"));
				car.setCreateDate(rset.getDate("CREATE_DATE"));
				car.setReplyYn(rset.getString("REPLY_YN"));
				
				list.add(car);
			}
		
			
		
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		
		return list;
	}
	
	
	public String findId(Connection conn, Member member) {
		
		String memId = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("findId");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, member.getMemberName());
			pstmt.setString(2, member.getBirthday());
			pstmt.setString(3, member.getPhone());
			
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				memId = rset.getString("MEMBER_ID");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			
			close(rset);
			close(pstmt);
		}
				
		
		
		
		return memId;
	}
	

public String findPwd(Connection conn, Member member) {
		
		String memPwd = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("findPwd");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, member.getMemberId());
			pstmt.setString(2, member.getMemberName());
			pstmt.setString(3, member.getBirthday());
			pstmt.setString(4, member.getPhone());
			
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				memPwd = rset.getString("MEMBER_PWD");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			
			close(rset);
			close(pstmt);
		}
		return memPwd;
	}

	

	
	
	
	
	
	
	
	
	
	
	
	
}