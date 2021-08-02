package com.quiz.lesson06;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.quiz.lesson06.bo.FavoriteBO;
import com.quiz.lesson06.model.Favorite;

@RequestMapping("/lesson06/quiz01")
@Controller
public class Lesson06Quiz01Controller {
	@Autowired
	private FavoriteBO favoriteBo;
	
	@RequestMapping("/add_favorite_view")
	public String addFavoriteView() {
		return "lesson06/AddFavoriteView";
	}
	@RequestMapping("/favorite_view")
	public String getFavoriteView(Model model) {
		List<Favorite> favoriteList = favoriteBo.getFavorite();
		model.addAttribute("favoriteList", favoriteList);
		
		return "lesson06/SelectFavoriteView";
	}
	@PostMapping("add_favorite")
	public String addFavorite(
			@ModelAttribute Favorite favorite, 
			Model model){

		favoriteBo.addFavorite(favorite);
		return "redirect:/lesson06/quiz01/favorite_view";
	}
}
