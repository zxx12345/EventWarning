package com.eventwarning.bean;

public class DynamicPoint {
	public String time;
	public String getTime(){
		return this.time;
	}
	public double value;
	public double getValue(){
		return this.getValue();
	}
	public DynamicPoint(String time, double value){
		if(time==null || time.length()<17)
			this.time = time;
		else
		this.time = time.substring(5,16);
		this.value= value;
	}
}
