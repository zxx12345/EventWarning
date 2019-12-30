package com.eventwarning.servlet;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;

import com.eventwarning.bean.FoodFsn;
import com.eventwarning.bean.FoodKms;
import com.eventwarning.bean.FoodLims;
import com.eventwarning.dbImpl.DBOperation;

public class GetDataDetailServlet extends HttpServlet {
	public GetDataDetailServlet() {
		// TODO Auto-generated constructor stub
	}
	
	@Override
	public void destroy() {
		// TODO Auto-generated method stub
		super.destroy();
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(req, resp);
	}
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setCharacterEncoding("UTF-8");
		response.setContentType("application/json;character=utf-8");
		response.setHeader("Cache-Control", "no-cache");
		int type=0, id=0;
		if(request.getParameter("type")!=null)
			type = Integer.parseInt(request.getParameter("type").toString());
		if(request.getParameter("id")!=null)
			id = Integer.parseInt(request.getParameter("id").toString());
	  	JSONArray json = null;
	  	Map result = new HashMap();
		switch(type){
		case 0:
			FoodFsn fsn = DBOperation.GetFoodFsn(id);
			result.put("data", fsn);
			break;
		case 1:
			FoodKms kms = DBOperation.GetFoodKms(id);
			result.put("data", kms);
			break;
		case 2:
			FoodLims lims = DBOperation.GetFoodLims(id);
			result.put("data", lims);
			break;
		}
	  	json = JSONArray.fromObject(result);
		response.getWriter().write(json.toString());
	}
}
