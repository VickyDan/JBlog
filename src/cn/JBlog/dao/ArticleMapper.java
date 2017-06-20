package cn.JBlog.dao;

import java.util.List;

import cn.JBlog.bean.Article;

public interface ArticleMapper {
    List<Article> SelectAll();
    boolean Delete(int id);
    List<Article> getArticlesByTag(String tag);
	int updateArticle(Article article);
    int insertArticle(Article article);
}
