package com.eventwarning.bean;

import java.util.HashMap;
import java.util.Map;


public class Article {

		long article_id = -1;
		int author_id = -1;
		String author_raw_id = "";
		String website_no = "";

		static String media_type_code = "";
		String article_url = "";
		String article_title = "";
		String article_abstract = "";
		String article_content = "";
		String article_author = "";
		static String article_source = "";
		int article_viewcount = -1;
		int article_replycount = -1;
		int article_forwardcount = -1;
		String article_pubtime_str = "";
		String province_name = "";
		String city_name = "";
		String country_name = "";
		String extracted_time = "";
		String created_time = "";
		static String content = "";
		
		public Article(){
			this.article_abstract="暂无数据";
			this.article_id=-1;
			this.article_content="暂无数据";
			this.article_title="暂无数据";
		}
		
		public Article(Map row) {
			this.article_id = Long.parseLong(row.get("articleid").toString());
			//this.author_id = Integer.parseInt(row.get("author_id").toString());
			//this.author_raw_id = row.get("authorraw_id").toString();
			//this.website_no = row.get("website_no").toString();
			this.article_url = row.get("article_url").toString();
			this.article_title = row.get("article_title").toString();
			if(row.get("article_abstract")!=null)
				this.article_abstract = row.get("article_abstract").toString();
			if(row.get("article_content")!=null)
				this.article_content = row.get("article_content").toString();
			if(row.get("article_author")!=null)
				this.article_author = row.get("article_author").toString();
			if(this.article_abstract==null || ("").equals(this.article_abstract))
				this.article_abstract = this.article_content;
			//this.article_viewcount = Integer.parseInt(row.get("article_viewcount").toString());
			//this.article_replycount = Integer.parseInt(row.get("article_replycount").toString());
			//this.article_forwardcount = Integer.parseInt(row.get("article_forwardcount").toString());
			//this.article_pubtime_str = row.get("article_pubtime_str").toString();
			//this.province_name = row.get("province_name").toString();
			//this.city_name = row.get("city_name").toString();
			//this.country_name = row.get("country_name").toString();
			this.extracted_time = row.get("extracted_time").toString();
			//this.created_time = row.get("created_time").toString();
		}
		
		public long getArticle_id() {
			return article_id;
		}
		public void setArticle_id(long article_id) {
			this.article_id = article_id;
		}
		public int getAuthor_id() {
			return author_id;
		}
		public void setAuthor_id(int author_id) {
			this.author_id = author_id;
		}
		public String getAuthor_raw_id() {
			return author_raw_id;
		}
		public void setAuthor_raw_id(String author_raw_id) {
			this.author_raw_id = author_raw_id;
		}
		public String getWebsite_no() {
			return website_no;
		}
		public void setWebsite_no(String website_no) {
			this.website_no = website_no;
		}
		public static String getMedia_type_code() {
			return media_type_code;
		}
		public static void setMedia_type_code(String media_type_code) {
			Article.media_type_code = media_type_code;
		}
		public String getArticle_url() {
			return article_url;
		}
		public void setArticle_url(String article_url) {
			this.article_url = article_url;
		}
		public String getArticle_title() {
			return article_title;
		}
		public void setArticle_title(String article_title) {
			this.article_title = article_title;
		}
		public String getArticle_abstract() {
			return article_abstract;
		}
		public void setArticle_abstract(String article_abstract) {
			this.article_abstract = article_abstract;
		}
		public String getArticle_content() {
			return article_content;
		}
		public void setArticle_content(String article_content) {
			this.article_content = article_content;
		}
		public String getArticle_author() {
			return article_author;
		}
		public void setArticle_author(String article_author) {
			this.article_author = article_author;
		}
		public static String getArticle_source() {
			return article_source;
		}
		public static void setArticle_source(String article_source) {
			Article.article_source = article_source;
		}
		public int getArticle_viewcount() {
			return article_viewcount;
		}
		public void setArticle_viewcount(int article_viewcount) {
			this.article_viewcount = article_viewcount;
		}
		public int getArticle_replycount() {
			return article_replycount;
		}
		public void setArticle_replycount(int article_replycount) {
			this.article_replycount = article_replycount;
		}
		public int getArticle_forwardcount() {
			return article_forwardcount;
		}
		public void setArticle_forwardcount(int article_forwardcount) {
			this.article_forwardcount = article_forwardcount;
		}
		public String getArticle_pubtime_str() {
			return article_pubtime_str;
		}
		public void setArticle_pubtime_str(String article_pubtime_str) {
			this.article_pubtime_str = article_pubtime_str;
		}
		public String getProvince_name() {
			return province_name;
		}
		public void setProvince_name(String province_name) {
			this.province_name = province_name;
		}
		public String getCity_name() {
			return city_name;
		}
		public void setCity_name(String city_name) {
			this.city_name = city_name;
		}
		public String getCountry_name() {
			return country_name;
		}
		public void setCountry_name(String country_name) {
			this.country_name = country_name;
		}
		public String getExtracted_time() {
			return extracted_time;
		}
		public void setExtracted_time(String extracted_time) {
			this.extracted_time = extracted_time;
		}
		public String getCreated_time() {
			return created_time;
		}
		public void setCreated_time(String created_time) {
			this.created_time = created_time;
		}
		public static String getContent() {
			return content;
		}
		public static void setContent(String content) {
			Article.content = content;
		}
		
		

		
	
}
