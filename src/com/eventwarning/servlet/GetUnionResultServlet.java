package com.eventwarning.servlet;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;

import com.eventwarning.bean.FoodFsn;
import com.eventwarning.bean.FoodKms;
import com.eventwarning.bean.FoodLims;
import com.eventwarning.bean.KeyWord;
import com.eventwarning.dbImpl.DBOperation;

public class GetUnionResultServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public GetUnionResultServlet() {
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
	  	int tg1 = -1, tg2 = -1,tg3 = -1,curPage = 0, pageSize=10, type=-1;
	  	String skey1 = "Key_Word_Needed",skey2 = "Key_Word_Needed",skey3 = "Key_Word_Needed";
	  	if(request.getParameter("curPage")!=null)
	  		curPage = Integer.parseInt(request.getParameter("curPage"));
	  	if(request.getParameter("type")!=null)
	  		type = Integer.parseInt(request.getParameter("type"));
	  	if(request.getParameter("pageSize")!=null)
	  		pageSize = Integer.parseInt(request.getParameter("pageSize"));
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
	    
	  	Pattern pattern = Pattern.compile("[0-9]*");
	  	Matcher isNum = pattern.matcher(skey1.split(" ")[0]);
	    if(isNum.matches())
	    	skey1 = skey1.split(" ")[1];
	    System.out.println(skey1);
	  	List<FoodFsn> fsnlist = null; 
	  	List<FoodKms> kmslist = null; 
	  	List<FoodLims> limslist = null; 
	  	int PageSize = 10;
	  	JSONArray json = null;
	  	try{
		  	switch(type){
		  		case 0:
			  		fsnlist = DBOperation.GetFoodFsnInfo(tg1,skey1,skey2,skey3,curPage,pageSize);
			  		break;
		  		case 1:
			  		kmslist = DBOperation.GetFoodKmsInfo(tg1,skey1,skey2,skey3,curPage,pageSize);
			  		break;
		  		case 2:
			  		limslist = DBOperation.GetFoodLimsInfo(tg1,skey1,skey2,skey3,curPage,pageSize);
			  		break;
			  	default:
			  		fsnlist = DBOperation.GetFoodFsnInfo(tg1,skey1,skey2,skey3,curPage,pageSize);
			  		kmslist = DBOperation.GetFoodKmsInfo(tg1,skey1,skey2,skey3,curPage,pageSize);
			  		limslist = DBOperation.GetFoodLimsInfo(tg1,skey1,skey2,skey3,curPage,pageSize);
		  		}
		  	Map result = new HashMap();
		  	result.put("curPage", curPage);
		  	result.put("fsnlist", fsnlist);
		  	result.put("kmslist", kmslist);
		  	result.put("limslist", limslist);
		  	json = JSONArray.fromObject(result);
		  	System.out.println(json.toString());
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
