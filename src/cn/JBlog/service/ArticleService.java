package cn.JBlog.service;

import java.util.List;

import cn.JBlog.bean.Article;

public interface ArticleService {
    	public List<Article> SelectAll();
		public boolean Delete(int id);
		public List<Article> getArticleByTag(String tag);
		public int update(Article article) ;
}
