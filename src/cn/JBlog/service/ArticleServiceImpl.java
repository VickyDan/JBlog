package cn.JBlog.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cn.JBlog.bean.Article;
import cn.JBlog.dao.ArticleMapper;

@Service("ArticleService")
@Transactional
public class ArticleServiceImpl implements ArticleService{
	@Autowired
	private ArticleMapper ad;
		
    public List<Article> SelectAll(){
//    	ApplicationContext ac = 
//               new ClassPathXmlApplicationContext("classpath:config/applicationContext.xml");
//        ad = (ArticleMapper)ac.getBean("ArticleMapper");
		return ad.SelectAll();
    }

	public boolean Delete(int id) {
		return ad.Delete(id);
	}

	public List<Article> getArticleByTag(String tag) {
		return ad.getArticlesByTag(tag);
	}


	public int update(Article article) {
		if(article.getId()==-1)
		return ad.updateArticle(article);
		else
			return ad.insertArticle(article);
	}

	

}
