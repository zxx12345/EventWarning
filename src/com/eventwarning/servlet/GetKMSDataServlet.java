package com.eventwarning.servlet;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;

import com.eventwarning.bean.FoodKms;
import com.eventwarning.bean.KeyWord;
import com.eventwarning.dbImpl.DBOperation;

public class GetKMSDataServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public GetKMSDataServlet() {
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
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setCharacterEncoding("UTF-8");
		response.setContentType("application/json;character=utf-8");
		response.setHeader("Cache-Control", "no-cache");
		int eventID = 0, curpage=0, pageSize=0;
		if(request.getParameter("eid")!=null)
			eventID = Integer.parseInt(request.getParameter("eid").toString());
		if(request.getParameter("curpage")!=null)
			curpage = Integer.parseInt(request.getParameter("curpage").toString());
		if(request.getParameter("pageSize")!=null)
			pageSize = Integer.parseInt(request.getParameter("pageSize").toString());
		List<KeyWord> keywordlist =DBOperation.GetKeyWordList(0, eventID, 1);
		List<FoodKms> kmslist = DBOperation.GetFoodKms(keywordlist,curpage,pageSize);
		
	  	JSONArray json = null;
	  	Map result = new HashMap();

	  	result.put("kmslist", kmslist);
	  	json = JSONArray.fromObject(result);
		response.getWriter().write(json.toString());
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
