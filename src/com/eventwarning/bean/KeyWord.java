package com.eventwarning.bean;

import java.util.List;
import java.util.Map;

import com.eventwarning.dbImpl.DBOperation;

public class KeyWord {
	public int keywordID;
	public String keyword;
	public int count;
	public int eventID;
	public String wordType;
	public int sumcount;

	public KeyWord(){

	}

	public KeyWord(Map row){
		long startTime,endTime;
		startTime = System.nanoTime();//记录当前时间
		this.keywordID = Integer.parseInt(row.get("keywordID").toString());
		this.keyword = row.get("keyword").toString();
		this.count = Integer.parseInt(row.get("count").toString());
		this.eventID = Integer.parseInt(row.get("eventID").toString());
		this.wordType = row.get("wordType").toString();
		if(row.get("sum(count)")!=null)
			this.sumcount = Integer.parseInt(row.get("sum(count)").toString());
		else
			this.sumcount = count;
		endTime = System.nanoTime();
		System.out.println(endTime-startTime);
	}
	public static List<KeyWord> GetKeyWordList(int num, int tg){
		return DBOperation.GetKeyWordList(num, 0, tg);
	}
}
