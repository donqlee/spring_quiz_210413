package com.quiz.lesson06;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.quiz.lesson06.bo.FavoriteBO;
import com.quiz.lesson06.model.Favorite;

@RequestMapping("/lesson06/quiz02")
@Controller
public class Lesson06Quiz02Controller {
	@Autowired
	private FavoriteBO favoriteBO;
	
	
	@RequestMapping("/add_favorite_view")
	public String addFavorite() {
		return "lesson06/add_favorite";
	}
	
	@RequestMapping("/add_favorite")
	@ResponseBody
	public Map<String, String> addFavoriteView(
			@RequestParam("name") String name,
			@RequestParam("url") String url
			){
			
		favoriteBO.addFavorite(name, url);
		
		Map<String, String> resultMap = new HashMap<>();
		return resultMap;
	}
	@GetMapping("/is_duplication")
	@ResponseBody
	public Map<String, Boolean> isDuplication(
			@RequestParam("url") String url){
		
		boolean isDuplication = favoriteBO.existUrl(url);
		
		Map<String, Boolean> result = new HashMap<>();
		result.put("is_duplication", isDuplication);
		return result;
		
	}
	@RequestMapping("/favorite_list")
	public String favoriteList(Model model) {
		List<Favorite> favoriteList = favoriteBO.getFavorite();
		model.addAttribute("favoriteList", favoriteList);
		return "lesson06/select_favorite_view";
	}
	@RequestMapping("/delete_favorite")
	@ResponseBody
	public String deleteFavorite(
			@RequestParam("favorite_id") int id) {
		//DB id로 delete
		int deleteRow = favoriteBO.deleteFavoriteById(id);
		
		return deleteRow == 1 ? "success" : "fail";
	}
	
}
