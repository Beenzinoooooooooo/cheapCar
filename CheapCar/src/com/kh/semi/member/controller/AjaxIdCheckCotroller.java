package com.kh.semi.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.semi.member.model.service.MemberService;

/**
 * Servlet implementation class AjaxIdCheckCotroller
 */
@WebServlet("/idCheck.do")
public class AjaxIdCheckCotroller extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxIdCheckCotroller() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String checkId = request.getParameter("checkId");
		
		int count = new MemberService().idCheck(checkId);
		
		response.setContentType("text/html; charset=UTF-8");
		
		String responseData = "";
		
		if(count > 0) {
			responseData = "NNN";
		} else {
			responseData = "NNY";
		}
		
		response.getWriter().print(count > 0 ? "NNN" : "NNY");
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
