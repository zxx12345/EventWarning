package com.eventwarning.bean;

import java.util.Map;

public class FoodKms {
	private String id;
	private String product_id;
	private String name;
	private String srName;
	private String itemName;
	private String testStandard;
	private String standard_id;
	private String serial_Number;
	private String state;
	private String tsOrganization_Name;
	private String boolean_value;
	private String double_low_value;
	private String double_high_value;
	private String text_value;
	private String vuName;
	private String relName;
	private String amName;
	private String create_time;
	private String last_modified_time;
	public String getStandard_id() {
		return standard_id;
	}

	public void setStandard_id(String standard_id) {
		this.standard_id = standard_id;
	}
	private String category;
	public FoodKms(Map row){//从数据库读出数据，通过数据行建立事件对象

		if(row.get("id")!=null)
		this.id = row.get("id").toString();
		if(row.get("productID")!=null)
		this.product_id = row.get("productID").toString();
		if(row.get("STANDARD_ID")!=null)
		this.standard_id = row.get("STANDARD_ID").toString();
		if(row.get("NAME")!=null)
		this.name = row.get("NAME").toString();
		if(row.get("srNAME")!=null)
		this.srName = row.get("srNAME").toString();
		if(row.get("tiNAME")!=null)
		this.itemName =row.get("tiNAME").toString();
		if(row.get("tsname")!=null)
		this.testStandard = row.get("tsname").toString();
		if(row.get("serial_number")!=null)
		this.serial_Number =row.get("serial_number").toString();
		if(row.get("STATE")!=null)
		this.state = row.get("STATE").toString();
		if(row.get("tsORGANIZATION_NAME")!=null)
		this.tsOrganization_Name = row.get("tsORGANIZATION_NAME").toString();
		if(row.get("BOOLEAN_VALUE")!=null)
		this.boolean_value = row.get("BOOLEAN_VALUE").toString();
		if(row.get("DOUBLE_LOW_VALUE")!=null)
		this.double_low_value = row.get("DOUBLE_LOW_VALUE").toString();
		if(row.get("DOUBLE_HIGH_VALUE")!=null)
		this.double_high_value = row.get("DOUBLE_HIGH_VALUE").toString();
		if(row.get("TEXT_VALUE")!=null)
		this.text_value = row.get("TEXT_VALUE").toString();
		if(row.get("vuNAME")!=null)
		this.vuName = row.get("vuNAME").toString();
		if(row.get("relNAME")!=null)
		this.relName = row.get("relNAME").toString();
		if(row.get("amNAME")!=null)
		this.amName = row.get("amNAME").toString();
		if(row.get("CREATE_TIME")!=null)
		this.create_time = row.get("CREATE_TIME").toString();
		if(row.get("LAST_MODIFIED_TIME")!=null)
		this.last_modified_time = row.get("LAST_MODIFIED_TIME").toString();
		if(row.get("CATEGORY")!=null)
		this.category = row.get("CATEGORY").toString();

	}
	
	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getProduct_id() {
		return product_id;
	}
	public void setProduct_id(String product_id) {
		this.product_id = product_id;
	}
	public String getCreate_time() {
		return create_time;
	}
	public void setCreate_time(String create_time) {
		this.create_time = create_time;
	}
	public String getLast_modified_time() {
		return last_modified_time;
	}
	public void setLast_modified_time(String last_modified_time) {
		this.last_modified_time = last_modified_time;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getSrName() {
		return srName;
	}
	public void setSrName(String srName) {
		this.srName = srName;
	}
	public String getItemName() {
		return itemName;
	}
	public void setItemName(String itemName) {
		this.itemName = itemName;
	}
	public String getTestStandard() {
		return testStandard;
	}
	public void setTestStandard(String testStandard) {
		this.testStandard = testStandard;
	}
	public String getSerial_Number() {
		return serial_Number;
	}
	public void setSerial_Number(String serial_Number) {
		this.serial_Number = serial_Number;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public String getTsOrganization_Name() {
		return tsOrganization_Name;
	}
	public void setTsOrganization_Name(String tsOrganization_Name) {
		this.tsOrganization_Name = tsOrganization_Name;
	}
	public String getBoolean_value() {
		return boolean_value;
	}
	public void setBoolean_value(String boolean_value) {
		this.boolean_value = boolean_value;
	}
	public String getDouble_low_value() {
		return double_low_value;
	}
	public void setDouble_low_value(String double_low_value) {
		this.double_low_value = double_low_value;
	}
	public String getDouble_high_value() {
		return double_high_value;
	}
	public void setDouble_high_value(String double_high_value) {
		this.double_high_value = double_high_value;
	}
	public String getText_value() {
		return text_value;
	}
	public void setText_value(String text_value) {
		this.text_value = text_value;
	}
	public String getVuName() {
		return vuName;
	}
	public void setVuName(String vuName) {
		this.vuName = vuName;
	}
	public String getRelName() {
		return relName;
	}
	public void setRelName(String relName) {
		this.relName = relName;
	}
	public String getAmName() {
		return amName;
	}
	public void setAmName(String amName) {
		this.amName = amName;
	}
	
}
