package cn.JBlog.bean;

import java.sql.Date;

public class Article {
	int id;
	String title;// 标题
	String tag;// 分类
	Date createDate;// 建立时间
	Date updateDate;// 更新时间
	String reads;// 阅读量
	String content;// 内容存储位置
	String type;// 分发布和草稿两种
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getTag() {
		return tag;
	}
	public void setTag(String tag) {
		this.tag = tag;
	}
	public Date getCreateDate() {
		return createDate;
	}
	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}
	public Date getUpdateDate() {
		return updateDate;
	}
	public void setUpdateDate(Date updateDate) {
		this.updateDate = updateDate;
	}
	public String getReads() {
		return reads;
	}
	public void setReads(String reads) {
		this.reads = reads;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
}
