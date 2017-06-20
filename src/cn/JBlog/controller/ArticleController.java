package cn.JBlog.controller;

import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import cn.JBlog.bean.Article;
import cn.JBlog.service.ArticleService;

@Controller
public class ArticleController {

	Logger logger = Logger.getLogger(this.getClass());
	@Autowired
	private ArticleService as;

	@RequestMapping("/articles")
	@ResponseBody
	public String getArticles(HttpServletResponse response) throws JSONException {
		JSONArray jsonArray = new JSONArray();
		JSONObject jsonObject = new JSONObject();
		List<Article> articles = as.SelectAll();
		int i = 0;
		if (articles != null)
			for (Article a : articles) {
				JSONObject ob = new JSONObject();
				ob.put("seq", ++i);
				ob.put("id", a.getId());
				ob.put("title", a.getTitle());
				ob.put("tag", a.getTag());
				ob.put("createDate", a.getCreateDate());
				ob.put("updateDate", a.getUpdateDate());
				ob.put("type", a.getType());
				jsonArray.put(ob);
			}
		jsonObject.put("total", i);
		jsonObject.put("rows", jsonArray);
		logger.info("获取文章数量" + i + "条记录");
		return jsonObject.toString();
	}

	@RequestMapping("/updateArticle")
	@ResponseBody
	String updateArticle(Article article, HttpServletResponse response) {
		if (article.getTitle().trim().length() == 0) {
			return "illegal";
		}
		if (article.getId() == 0) {
			return "wrong";
		}

		if (as.update(article) == 1) {
			return "success";
		} else {
			logger.info("更新或删除文章失败：" + article.getTitle());
			return "wrong";
		}
	}

	// @RequestMapping("/article")
	// @ResponseBody
	// String getArticleById(){
	//
	// }
	//
	@RequestMapping("/getArticleByTag")
	@ResponseBody
	String getArticleByTag(@RequestParam("tag") String tag, HttpServletResponse response) throws JSONException {
		JSONArray jsonArray = new JSONArray();
		JSONObject jsonObject = new JSONObject();

		List<Article> articles = as.getArticleByTag(tag);
		int i = 0;
		for (Article a : articles) {
			JSONObject ob = new JSONObject();
			ob.put("seq", ++i);
			ob.put("id", a.getId());
			ob.put("title", a.getTitle());
			ob.put("tag", a.getTag());
			ob.put("createDate", a.getCreateDate());
			ob.put("updateDate", a.getUpdateDate());
			ob.put("type", a.getType());
			jsonArray.put(ob);
		}
		jsonObject.put("total", i);
		jsonObject.put("rows", jsonArray);
		logger.info("获取" + tag + "文章数量" + i + "条记录");
		return jsonObject.toString();
	}

	@RequestMapping("/delete")
	@ResponseBody
	String DeleteArticle(@RequestParam("id") int id, HttpServletResponse response) {

		if (as.Delete(id)) {
			return "success";
		} else {
			return "wrong";
		}
	}

}
