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

import com.eventwarning.bean.FoodFsn;
import com.eventwarning.bean.FoodKms;
import com.eventwarning.bean.FoodLims;
import com.eventwarning.bean.KeyWord;
import com.eventwarning.dbImpl.DBOperation;

public class GetDataServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public GetDataServlet() {
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
	/*
		String category = null;
		if(request.getParameter("category")!=null)
			category = request.getParameter("category").toString();
		List<FoodFsn> foodfsnlist = new ArrayList<FoodFsn>();
		foodfsnlist=DBOperation.GetFoodFsn("小米");
		for(int i=0;i<foodfsnlist.size();i++){
			System.out.println(foodfsnlist.get(i).getCstm());
		}
		//数据读取完毕，跳转至首页显示
		ServletContext servletContext = getServletContext();
		request.setAttribute("category",category);
		RequestDispatcher dispather = servletContext.getRequestDispatcher("/fsn.jsp");
		dispather.forward(request, response);
	*/
		response.setCharacterEncoding("UTF-8");
		response.setContentType("application/json;character=utf-8");
		response.setHeader("Cache-Control", "no-cache");
		int eventID = 0, curpage=0, pageSize=0, type = 0, productID=-1;
		if(request.getParameter("eid")!=null)
			eventID = Integer.parseInt(request.getParameter("eid").toString());
		if(request.getParameter("pid")!=null)
			productID = Integer.parseInt(request.getParameter("pid").toString());
		if(request.getParameter("type")!=null)
			type = Integer.parseInt(request.getParameter("type").toString());
		if(request.getParameter("curpage")!=null)
			curpage = Integer.parseInt(request.getParameter("curpage").toString());
		if(request.getParameter("pageSize")!=null)
			pageSize = Integer.parseInt(request.getParameter("pageSize").toString());
		System.out.println(curpage+" " +pageSize);
	  	JSONArray json = null;
	  	Map result = new HashMap();
		if(productID<0){
		  	List<KeyWord> keywordlist =DBOperation.GetKeyWordList(0, eventID, 1);
			switch(type){
			case 0:
				List<FoodFsn> fsnlist = DBOperation.GetFoodFsn(keywordlist,curpage,pageSize);
			  	result.put("fsnlist", fsnlist);
				break;
			case 1:
				List<FoodKms> kmslist = DBOperation.GetFoodKms(keywordlist,curpage,pageSize);
			  	result.put("kmslist", kmslist);
				break;
			case 2:
				List<FoodLims> limslist = DBOperation.GetFoodLims(keywordlist,curpage,pageSize);
			  	result.put("limslist", limslist);
			}
		}
		else{
			switch(type){
			case 0:
				List<FoodFsn> fsnlist = DBOperation.GetProductFsn(productID,curpage,pageSize);
			  	result.put("fsnlist", fsnlist);
				break;
			case 1:
				List<FoodKms> kmslist  = DBOperation.GetProductKms(productID,curpage,pageSize);
			  	result.put("kmslist", kmslist);
				break;
			case 2:
				List<FoodLims> limslist  = DBOperation.GetProductLims(productID,curpage,pageSize);
			  	result.put("limslist", limslist);
			}
		}
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
