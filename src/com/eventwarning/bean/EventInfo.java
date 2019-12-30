package com.eventwarning.bean;

import java.util.Map;

import com.eventwarning.dbImpl.DBOperation;

public class EventInfo {
	public int eventID;
	public int getEventID(){
		return this.eventID;
	}
	public String startTime;
	public String getStartTime(){
		return this.startTime;
	}
	public String location;
	public String getLocation(){
		return this.location;
	}
	public String category;
	public String getCategory(){
		return this.category;
	}
	public String keyWord;
	public String getKeyWord(){
		return this.keyWord;
	}
	public Article centuralArticle; //<-- 修改
	public Article getCenturalArticle(){
		return this.centuralArticle;
	}
	
	public EventInfo(){
		this.eventID=-1;
		this.centuralArticle=null;
	}
	public EventInfo(Map row){
		//从数据库读出数据，通过数据行建立事件对象
		this.eventID = Integer.parseInt(row.get("eventID").toString());
		this.startTime = row.get("startTime").toString();
		this.location = row.get("location")==null?"missed":row.get("location").toString();
		if(this.location.equals(""))
			this.location="暂无地理位置信息";
		else{
			String[] locations = this.location.split(" \\| ");
			String lastLoc = "";
			this.location = "";
			for(String loc : locations){
				if(loc.equals(lastLoc))
					continue;
				lastLoc = loc;
				this.location += loc + " ";
				if(this.location.length() > 20)
					break;
			}
		}
		this.category = row.get("category")==null?"missed":row.get("category").toString();
		this.centuralArticle = DBOperation.GetArticleData(row.get("centuralWeiboID").toString());
		this.keyWord = "";
		if(this.location!=null && !this.location.equals(""))
			this.keyWord += "." + this.location;
		if(this.category!=null && !("").equals(this.category))
			this.keyWord += "." + this.category;
		if(this.centuralArticle!=null && !("").equals(this.centuralArticle.getArticle_title()))
			this.keyWord = this.centuralArticle.getArticle_title();
		if(("").equals(this.keyWord))
			this.keyWord = "点击获取更多详情";
	}
}
