package com.eventwarning.bean;

import java.util.Map;

public class FoodLims {
	private String id;
	private String sample_id;
	private String sampleNo;
	private String sample_Name;
	private String work_SheetNo;
	private String status;
	private String sheetNo;
	private String clent;
	private String test_itemname;
	private String measurement_unit;
	private String qualification;
	private String value_result;
	private String individual_evaluation;
	private String create_time;
	private String end_time;
	private String category;
	public FoodLims(Map row){//从数据库读出数据，通过数据行建立事件对象
		if(row.get("ID")!=null)
		this.id = row.get("ID").toString();
		if(row.get("SAMPLE_ID")!=null)
		this.sample_id = row.get("SAMPLE_ID").toString();
		if(row.get("SAMPLE_NO")!=null)
		this.sampleNo = row.get("SAMPLE_NO").toString();
		if(row.get("SAMPLE_NAME")!=null)
		this.sample_Name = row.get("SAMPLE_NAME").toString();
		if(row.get("WORK_SHEET_NO")!=null)
		this.work_SheetNo =row.get("WORK_SHEET_NO").toString();
		if(row.get("STATUS")!=null)
		this.status = row.get("STATUS").toString();
		if(row.get("SHEET_NO")!=null)
		this.sheetNo =row.get("SHEET_NO").toString();
		if(row.get("CLIENT")!=null)
		this.clent = row.get("CLIENT").toString();
		if(row.get("TEST_ITEM_NAME")!=null)
		this.test_itemname = row.get("TEST_ITEM_NAME").toString();
		if(row.get("MEASUREMENT_UNIT")!=null)
		this.measurement_unit = row.get("MEASUREMENT_UNIT").toString();
		if(row.get("QUALIFICATION")!=null)
		this.qualification = row.get("QUALIFICATION").toString();
		if(row.get("VALUE_RESULT")!=null)
		this.value_result = row.get("VALUE_RESULT").toString();
		if(row.get("INDIVIDUAL_EVALUATION")!=null)
		this.individual_evaluation = row.get("INDIVIDUAL_EVALUATION").toString();
		if(row.get("CREATE_TIME")!=null)
		this.create_time= row.get("CREATE_TIME").toString();
		if(row.get("END_TIME")!=null)
		this.end_time = row.get("END_TIME").toString();
		if(row.get("CATEGORY")!=null)
	    this.category = row.get("CATEGORY").toString();
	}
	
	public String getId() {
		return id;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getSample_id() {
		return sample_id;
	}
	public void setSample_id(String sample_id) {
		this.sample_id = sample_id;
	}
	public String getCreate_time() {
		return create_time;
	}
	public void setCreate_time(String create_time) {
		this.create_time = create_time;
	}
	public String getEnd_time() {
		return end_time;
	}
	public void setEnd_time(String end_time) {
		this.end_time = end_time;
	}
	public String getSampleNo() {
		return sampleNo;
	}
	public void setSampleNo(String sampleNo) {
		this.sampleNo = sampleNo;
	}
	public String getSample_Name() {
		return sample_Name;
	}
	public void setSample_Name(String sample_Name) {
		this.sample_Name = sample_Name;
	}
	public String getWork_SheetNo() {
		return work_SheetNo;
	}
	public void setWork_SheetNo(String work_SheetNo) {
		this.work_SheetNo = work_SheetNo;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getSheetNo() {
		return sheetNo;
	}
	public void setSheetNo(String sheetNo) {
		this.sheetNo = sheetNo;
	}
	public String getClent() {
		return clent;
	}
	public void setClent(String clent) {
		this.clent = clent;
	}
	public String getTest_itemname() {
		return test_itemname;
	}
	public void setTest_itemname(String test_itemname) {
		this.test_itemname = test_itemname;
	}
	public String getMeasurement_unit() {
		return measurement_unit;
	}
	public void setMeasurement_unit(String measurement_unit) {
		this.measurement_unit = measurement_unit;
	}
	public String getQualification() {
		return qualification;
	}
	public void setQualification(String qualification) {
		this.qualification = qualification;
	}
	public String getValue_result() {
		return value_result;
	}
	public void setValue_result(String value_result) {
		this.value_result = value_result;
	}
	public String getIndividual_evaluation() {
		return individual_evaluation;
	}
	public void setIndividual_evaluation(String individual_evaluation) {
		this.individual_evaluation = individual_evaluation;
	}
}
