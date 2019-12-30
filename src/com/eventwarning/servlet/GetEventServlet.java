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

import com.eventwarning.bean.Event;
import com.eventwarning.bean.EventDynamic;
import com.eventwarning.dbImpl.DBOperation;

public class GetEventServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public GetEventServlet() {
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
	  	int tg1 = 0,tg2 = 0,tg3 = 0, curPage = 1;
	  	String skey1 = "KeyWordNeeded",skey2 = "KeyWordNeeded",skey3 = "KeyWordNeeded";
	  	if(request.getParameter("tg1")!=null)
	  		tg1 = Integer.parseInt(request.getParameter("tg1"));
	  	if(request.getParameter("tg2")!=null)
	  		tg2 = Integer.parseInt(request.getParameter("tg2"));
	  	if(request.getParameter("tg3")!=null)
	  		tg3 = Integer.parseInt(request.getParameter("tg3"));
	  	if(request.getParameter("curPage")!=null)
	  		curPage = Integer.parseInt(request.getParameter("curPage"));
	  	if(request.getParameter("skey1")!=null)
	  		skey1 = request.getParameter("skey1");
	  	if(request.getParameter("skey2")!=null)
	  		skey2 = request.getParameter("skey2");
	  	if(request.getParameter("skey3")!=null)
	  		skey3 = request.getParameter("skey3");
	  	List<Event> elist = null;
	  	int PageSize = 10;
	  	JSONArray json = null;
	  	Map result = new HashMap();
	  	result.put("curPage", curPage);
	  	try{
		  	
	  		/*switch(tg){
		  	case 0: //取最热事件
		  	case 1: //取最新更新事件
		  		elist = DBOperation.GetEventsDynamicList(tg, curPage, PageSize);
			  	result.put("eventlist", elist);
		  		break;
		  	case 2: //按关键字查找
		  	case 3: //按地区查找
		  	case 4: //按类别查找
		  		elist = DBOperation.GetEventsDynamicList(tg, skey, curPage, PageSize);
			  	result.put("eventlist", elist);
		  		break;
		  	default:
		  		eventlist = DBOperation.GetEventsList(skey, curPage, PageSize);
			  	result.put("eventlist", eventlist);
		  	}*/
	  		elist = DBOperation.GetEvents(tg1, skey1, tg2, skey2, tg3, skey3, curPage, PageSize);
	  		result.put("eventlist", elist);
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
