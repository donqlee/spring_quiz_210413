package com.quiz.lesson04;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.quiz.lesson04.BO.RealtorBO;
import com.quiz.lesson04.model.Realtor;

@RequestMapping("/lesson04/quiz02")
@Controller
public class RealtorController {
	@Autowired
	RealtorBO realtorBO;
	
	@GetMapping("/1")
	public String addRealtorView() {
		return "lesson04/addRealtor";
	}
	@PostMapping("/add_realtor")
	public String addRealtor(
			@ModelAttribute Realtor realtor,
			Model model) {
		
		// insert DB
		realtorBO.addRealtor(realtor);
		
		// select DB
		Realtor newRealtor;
		newRealtor = realtorBO.getNewRealtorById(realtor.getId());
		model.addAttribute("result", newRealtor);
		model.addAttribute("subject", "공인중개사 정보");
		
		return "/lesson04/afterAddRealtor";
	}
}
