package com.quiz.lesson06;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.quiz.lesson06.bo.FavoriteBO;
import com.quiz.lesson06.model.Favorite;

@RequestMapping("/lesson06/quiz01")
@Controller
public class Lesson06Quiz01Controller {
	@Autowired
	private FavoriteBO favoriteBo;
	
	@RequestMapping("/add_favorite_view")
	public String addFavoriteView() {
		return "lesson06/add_favorite";
	}
	@RequestMapping("/favorite_view")
	public String getFavoriteView(Model model) {
		List<Favorite> favoriteList = favoriteBo.getFavorite();
		model.addAttribute("favoriteList", favoriteList);
		
		return "lesson06/select_favorite_view";
	}
	//AJAX의 요청이 왔을때,
	// - 서버쪽에서 @ResponseBody 어노테이션을 사용해야한다.
	// - 리턴되는 값이 반드시 있어야 한다.
	@PostMapping("add_favorite")
	@ResponseBody
	public Map<String, String> addFavorite(
			@RequestParam("name") String name,
			@RequestParam("url") String url
			){
		//DB Insert
		favoriteBo.addFavorite(name, url);
		
		// 성공 했는지 여부 리턴
		// {"result":"success"}
		Map<String, String> resultMap = new HashMap<>();
		resultMap.put("result", "success");
	
		return resultMap;  //jackson 라이브러리 때문에 json리턴
	}
}
