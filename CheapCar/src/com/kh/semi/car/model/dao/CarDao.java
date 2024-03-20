package com.kh.semi.car.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.kh.semi.car.model.vo.Car;
import com.kh.semi.car.model.vo.Option;
import com.kh.semi.common.JDBCTemplate;

public class CarDao {

	private Properties prop = new Properties();
	
	public CarDao() {
		String filePath = CarDao.class.getResource("/sql/car/car-mapper.xml").getPath();
		
		try {
			prop.loadFromXML(new FileInputStream(filePath));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public ArrayList<Car> selectCarList(Connection conn) {
		
		ArrayList<Car> carList = new ArrayList<Car>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectCarList"); 
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Car car = new Car();
				car.setManagementNo(rset.getInt("MANAGEMENT_NO"));
				car.setStatus(rset.getString("STATUS"));
				car.setCarNo(rset.getString("CAR_No"));
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
				
				carList.add(car);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(conn);
		}
		return carList;
	}
	
	public ArrayList<Option> selectOptionList(Connection conn){
		
		ArrayList<Option> optionList = new ArrayList<Option>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectOptionList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Option option = new Option();
				option.setOptionNo(rset.getInt("OPTION_NO"));
				option.setOptionName(rset.getString("OPTION_NAME"));
				option.setOptionPrice(rset.getInt("OPTION_PRICE"));
				
				optionList.add(option);
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return optionList;
	}
}
