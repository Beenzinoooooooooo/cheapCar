package com.kh.semi.report.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.semi.common.model.vo.PageInfo;
import com.kh.semi.report.model.service.ReportService;
import com.kh.semi.report.model.vo.Report;

/**
 * Servlet implementation class reportListController
 */
@WebServlet("/reportList")
public class ReportListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReportListController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int listCount = new ReportService().selectListCount();
		int currentPage = Integer.parseInt(request.getParameter("currentPage"));
		int pageLimit = 10;
		int boardLimit = 5;
		int maxPage = (int)Math.ceil((double)(listCount / boardLimit));
		int startPage = (currentPage - 1) / pageLimit * pageLimit + 1;
		int endPage = startPage + pageLimit - 1;
		
		if(endPage > maxPage) {
			endPage = maxPage;
		}
		
		PageInfo pi = new PageInfo(listCount, currentPage, pageLimit, boardLimit, maxPage, startPage, endPage);
		ArrayList<Report> list = new ReportService().selectList(pi);
		
		request.setAttribute("reportList", list);
		request.setAttribute("pageInfo", pi);
		
		request.getRequestDispatcher("views/admin/admin_user/reportList.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
