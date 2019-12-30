package com.eventwarning.bean;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.eventwarning.dbImpl.DBOperation;

public class Event {
	public boolean needKeyWord = true;
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
	public WeiboData centuralWeibo; //<-- 修改
	public WeiboData getCenturalWeibo(){
		return this.centuralWeibo;
	}
	
	public Article centuralArticle; //<-- 修改
	public Article getCenturalArticle(){
		return this.centuralArticle;
	}
	//private List<WeiboData> weiboList;
	private List<KeyWord> keywordList;
//	public String centuralTF;
//	public String getCenturalTF(){
//		return this.centuralTF;
//	}
	public Event(){
		this.eventID=-1;
		this.centuralWeibo=null;
		//this.weiboList = null;
		this.keywordList = null;
	}
	public Event(Map row, boolean n){
		Init(row);
		this.needKeyWord = n;
	}
	public void Init(Map row){
		//从数据库读出数据，通过数据行建立事件对象
		this.eventID = Integer.parseInt(row.get("eventID").toString());
		this.startTime = row.get("startTime").toString();
		this.location = row.get("location")==null?"missed":row.get("location").toString();
		if(this.location.equals(""))
			this.location="暂无地理位置信息";
		else{
			String[] locations = this.location.split(" \\| ");
			this.location = "";
			for(String loc : locations){
				if(this.location.contains(loc))
					continue;
				this.location += loc + " ";
				if(this.location.length()>20)
					break;
			}
		}
		this.category = row.get("category")==null?"missed":row.get("category").toString();
		this.centuralArticle = DBOperation.GetArticleData(row.get("centuralWeiboID").toString());
		//this.weiboList = null;
		this.keywordList = null;
		//this.centuralTF = row.get("centuralTF").toString();
		
	}
	public Event(Map row){ 
		Init(row);
	}
	
//	public List<WeiboData> getWeiboList(){
//		if(this.weiboList==null)
//			this.weiboList = DBOperation.GetWeiboList(eventID); //从数据库读取并创建微博列表
//		return this.weiboList;
//	}
	public String eventKey(){
		if(this.keywordList!=null)
			return getKeyWord();
		String keys = "";
		if(this.location!=null && !("").equals(this.location))
			keys += "." + this.location;
		if(this.category!=null && !("").equals(this.category))
			keys += "." + this.category;
		if(this.centuralArticle!=null && !("").equals(this.centuralArticle.getArticle_title()))
			keys = this.centuralArticle.getArticle_title();
		if(("").equals(keys))
			keys = "点击获取更多详情";
		return keys;
	}
	public String getKeyWord(){
		if(!this.needKeyWord)
			return "";
		String kw = "";
		if(this.keywordList==null)
			getKeyWordList();
		if(this.keywordList.size()>0)
			kw += this.keywordList.get(0).keyword;
		if(this.keywordList.size()>1)
			kw += "." + this.keywordList.get(1).keyword;
		if(this.keywordList.size()>2)
			kw += "." + this.keywordList.get(2).keyword;
		if(this.keywordList.size()>3)
			kw += "." + this.keywordList.get(3).keyword;
		return kw;
	}
	public List<KeyWord> getKeyWordList(){
		if(!this.needKeyWord)
			return null;
		if(this.keywordList==null)
			this.keywordList = DBOperation.GetKeyWordList(20, eventID,-1); //从数据库读取并创建微博对象
		return this.keywordList;
	}
	public List<Double> getHotDegreeList(){
		List<Double> hlist = new ArrayList<Double>();
		
		return hlist;
	}
	public static List<EventDynamic> GetEventDynamicList(int eventid, int num){
		return DBOperation.GetEventDyanmicList(eventid, num);
	}
	public static List<DynamicPoint> GetHotPoints(List<EventDynamic> eds){
		List<DynamicPoint> points = new ArrayList<DynamicPoint>();
		EventDynamic ed = new EventDynamic();
		double hd;
		String t;
		for(int i=0; i<eds.size(); i++){
			t = eds.get(i).updateTime;
			hd = eds.get(i).getHotDegree(ed);
			ed = eds.get(i);
			points.add(new DynamicPoint(t,hd));
		}
		return points;
	}
}
