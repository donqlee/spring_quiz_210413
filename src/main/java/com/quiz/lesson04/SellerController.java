package com.quiz.lesson04;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.quiz.lesson04.BO.SellerBO;
import com.quiz.lesson04.model.Seller;

@RequestMapping("/lesson04/quiz01")
@Controller
public class SellerController {
	@Autowired
	private SellerBO sellerBO;
	
	@RequestMapping(path="/1", method = RequestMethod.GET)
	public String addSellerView() {
		return "lesson04/addSeller";
	}
	@PostMapping("/add_Seller")
	public String addSeller(
			@RequestParam("nickname") String nickname,
			@RequestParam(value = "profileImageUrl", required=false) String profileImageUrl,
			@RequestParam("temperature") double temperature
			) {
			sellerBO.addSeller(nickname, profileImageUrl, temperature);
			
			return "lesson04/afterAddSeller";
	}
	@GetMapping("/seller_info")
	public String getSellerView(
			Model model,
			@RequestParam(value = "id", defaultValue="1") Integer id
			) {
		Seller seller = sellerBO.getSeller(id);
		model.addAttribute("result", seller);
		return "lesson04/sellerInfo";
	}
}
