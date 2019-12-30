package com.eventwarning.servlet;

import java.io.IOException;
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
import com.eventwarning.bean.KeyWord;
import com.eventwarning.dbImpl.DBOperation;

public class WordCloudServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public WordCloudServlet() {
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
	 * @param resp the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse resp)
			throws ServletException, IOException {
		int WordNum = 50, tg=1;
		if(request.getParameter("tg")!=null)
			tg = Integer.parseInt(request.getParameter("tg"));
		List<KeyWord> wlist = KeyWord.GetKeyWordList(WordNum, tg);
		resp.setCharacterEncoding("UTF-8");
	  	resp.setContentType("application/json;character=utf-8");
	  	resp.setHeader("Cache-Control", "no-cache");
	  	try{
				  List<Map> list =new ArrayList<Map>();
				  List<Integer> idlist = new ArrayList();
				  List<String> keylist = new ArrayList();
				  for(int i=0;i<wlist.size();i++){
					  Map map = new HashMap(); 
					  map.put("text", wlist.get(i).keyword);
				        map.put("weight",wlist.get(i).sumcount);  
				        map.put("link", "union.jsp?tg=3&skey="+wlist.get(i).keyword);  
					  list.add(map);
					  Event keyevent = DBOperation.GetEvent(wlist.get(i).eventID);
					  if(keyevent==null)
						  continue;
					  idlist.add(wlist.get(i).eventID);
					  keylist.add(keyevent.eventKey());
				  }
				  try{
					  	Map result = new HashMap();
					  	result.put("ids", idlist);
					  	result.put("keys", keylist);
					  	result.put("wordlist", list);
					  	JSONArray json = JSONArray.fromObject(result);
					  	resp.getWriter().write(json.toString());
				  }
				  catch(IOException e){
					  	e.printStackTrace();
				  }
		  }
		  catch(Exception e){
			  	e.printStackTrace();
		  }
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
