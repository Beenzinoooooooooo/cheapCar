package com.kh.semi.member.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.semi.car.model.vo.Car;
import com.kh.semi.member.model.service.MemberService;
import com.kh.semi.member.model.vo.Member;

/**
 * Servlet implementation class MypageController
 */
@WebServlet("/myPage")
public class MypageController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MypageController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		HttpSession session = request.getSession();
		
		
		Member loginUser = (Member)session.getAttribute("loginUser");
		
		//System.out.println(loginUser);
		
		
		ArrayList<Car> carlist = new MemberService().reservation(loginUser);
		
		//System.out.println(carlist);
		//System.out.println("열심히 해라");
//		if(carlist.isEmpty()) {
//			Car car = new Car();
//			
//			carlist.add(car);
//			request.setAttribute("list", arg1);
//		} else {
//			
//			request.setAttribute("list", carlist);
//			
//		}
		
		request.setAttribute("list", carlist);
		
		
		
		
		RequestDispatcher view = request.getRequestDispatcher("views/member/myPage.jsp");
		view.forward(request, response);
	
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
