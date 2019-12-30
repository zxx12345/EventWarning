package com.eventwarning.servlet;

import java.io.IOException;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;

import com.eventwarning.bean.Article;
import com.eventwarning.bean.Event;
import com.eventwarning.bean.EventDynamic;
import com.eventwarning.dbImpl.DBOperation;

public class GetArticlesServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public GetArticlesServlet() {
		super();
	}

	/**
	 * Destruction of the servlet. <br>
	 */
	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}

	/**
	 * The doGet method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to get.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doPost(request, response);
	}

	/**
	 * The doPost method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to post.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse resp)
			throws ServletException, IOException {

		resp.setCharacterEncoding("UTF-8");
	  	resp.setContentType("application/json;character=utf-8");
	  	resp.setHeader("Cache-Control", "no-cache");
	  	int eid=0, curPage = 1;
	  	if(request.getParameter("eid")!=null)
	  		eid = Integer.parseInt(request.getParameter("eid"));
	  	if(request.getParameter("curPage")!=null)
	  		curPage = Integer.parseInt(request.getParameter("curPage"));
	  	List<Article> elist = null;
	  	int PageSize = 10;
	  	JSONArray json = null;
	  	Map result = new HashMap();
	  	result.put("curPage", curPage);
	  	try{
	  		elist = DBOperation.GetArticles(eid, curPage, PageSize);
	  		result.put("articles", elist);
	  		json = JSONArray.fromObject(result);
		  	resp.getWriter().write(json.toString());
	  	}
	  	catch(Exception e){e.printStackTrace();}
	}

	/**
	 * Initialization of the servlet. <br>
	 *
	 * @throws ServletException if an error occurs
	 */
	public void init() throws ServletException {
		// Put your code here
	}

}
