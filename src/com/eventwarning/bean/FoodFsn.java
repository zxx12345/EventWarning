package com.eventwarning.bean;

import java.util.Map;

public class FoodFsn {
	private String id;
	private String product_id;
	private String productName;
	private String status;
	private String format;
	private String des;
	private String cstm;
	private String expirationDate;
	private String category;
	private String name;
	private String result;
	private String unit;
	private String techIndicator;
	private String assessment;
	private String testType;
	private String test_date;
	private String end_date;
	private String production_time;
	private String regularity;
	private String ingredient;
	private String back_result;
	private String organization_name;
	private String producer_name;
	public FoodFsn(Map row){//从数据库读出数据，通过数据行建立事件对象
		if(row.get("ID")!=null)
		this.id = row.get("ID").toString();
		if(row.get("PRODUCT_ID")!=null)
		this.product_id = row.get("PRODUCT_ID").toString();
		if(row.get("PRODCUT_NAME")!=null)
		this.productName = row.get("PRODCUT_NAME").toString();
		if(row.get("STATUS")!=null)
		this.status = row.get("STATUS").toString();
		if(row.get("FORMAT")!=null)
		this.format =row.get("FORMAT").toString();
		if(row.get("DES")!=null)
		this.des = row.get("DES").toString();
		if(row.get("CSTM")!=null)
		this.cstm =row.get("CSTM").toString();
		if(row.get("EXPIRATION_DATE")!=null)
		this.expirationDate = row.get("EXPIRATION_DATE").toString();
		this.category ="";
		if(row.get("CATEGORY")!=null)
		this.category = row.get("CATEGORY").toString();
		if(row.get("NAME")!=null)
		this.name = row.get("NAME").toString();
		if(row.get("RESULT")!=null)
		this.result = row.get("RESULT").toString();
		if(row.get("UNIT")!=null)
		this.unit = row.get("UNIT").toString();
		if(row.get("TECH_INDICATOR")!=null)
		this.techIndicator = row.get("TECH_INDICATOR").toString();
		if(row.get("ASSESSMENT")!=null)
		this.assessment = row.get("ASSESSMENT").toString();
		if(row.get("TESTTYPE")!=null)
		this.testType = row.get("TESTTYPE").toString();
		if(row.get("TEST_DATE")!=null)
		this.test_date = row.get("TEST_DATE").toString();
		if(row.get("END_DATE")!=null)
		this.end_date = row.get("END_DATE").toString();
		if(row.get("PRODUCTION_TIME")!=null)
		this.production_time = row.get("PRODUCTION_TIME").toString();
		if(row.get("REGULARITY")!=null)
		this.regularity = row.get("REGULARITY").toString();
		if(row.get("INGREDIENT")!=null)
		this.ingredient = row.get("INGREDIENT").toString();
		if(row.get("BACK_RESULT")!=null)
		this.back_result = row.get("BACK_RESULT").toString();
		if(row.get("ORGANIZATION_NAME")!=null)
		this.organization_name = row.get("ORGANIZATION_NAME").toString();
		if(row.get("PRODUCER_NAME")!=null)
		this.producer_name = row.get("PRODUCER_NAME").toString();
	}
	
	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getTest_date() {
		return test_date;
	}
	
	public String getProduct_id() {
		return product_id;
	}
	public void setProduct_id(String product_id) {
		this.product_id = product_id;
	}
	public void setTest_date(String test_date) {
		this.test_date = test_date;
	}
	public String getEnd_date() {
		return end_date;
	}
	public void setEnd_date(String end_date) {
		this.end_date = end_date;
	}
	public String getProduction_time() {
		return production_time;
	}
	public void setProduction_time(String production_time) {
		this.production_time = production_time;
	}
	public String getRegularity() {
		return regularity;
	}
	public void setRegularity(String regularity) {
		this.regularity = regularity;
	}
	public String getIngredient() {
		return ingredient;
	}
	public void setIngredient(String ingredient) {
		this.ingredient = ingredient;
	}
	public String getBack_result() {
		return back_result;
	}
	public void setBack_result(String back_result) {
		this.back_result = back_result;
	}
	public String getOrganization_name() {
		return organization_name;
	}
	public void setOrganization_name(String organization_name) {
		this.organization_name = organization_name;
	}
	public String getProducer_name() {
		return producer_name;
	}
	public void setProducer_name(String producer_name) {
		this.producer_name = producer_name;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getFormat() {
		return format;
	}
	public void setFormat(String format) {
		this.format = format;
	}
	public String getDes() {
		return des;
	}
	public void setDes(String des) {
		this.des = des;
	}
	public String getCstm() {
		return cstm;
	}
	public void setCstm(String cstm) {
		this.cstm = cstm;
	}
	public String getExpirationDate() {
		return expirationDate;
	}
	public void setExpirationDate(String expirationDate) {
		this.expirationDate = expirationDate;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getResult() {
		return result;
	}
	public void setResult(String result) {
		this.result = result;
	}
	public String getUnit() {
		return unit;
	}
	public void setUnit(String unit) {
		this.unit = unit;
	}
	public String getTechIndicator() {
		return techIndicator;
	}
	public void setTechIndicator(String techIndicator) {
		this.techIndicator = techIndicator;
	}
	public String getAssessment() {
		return assessment;
	}
	public void setAssessment(String assessment) {
		this.assessment = assessment;
	}
	public String getTestType() {
		return testType;
	}
	public void setTestType(String testType) {
		this.testType = testType;
	}
}

