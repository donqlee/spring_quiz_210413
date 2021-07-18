package com.quiz.lesson03;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.quiz.lesson03.bo.RealEstateBO;
import com.quiz.lesson03.model.RealEstate;

@RestController
@RequestMapping("/lesson03/quiz01")
public class RealEstateRestController {
	
	// 1. id 로 select 하기 
	@Autowired
	RealEstateBO realEstateBO;
	@RequestMapping("/1")
	public RealEstate quiz01(
			@RequestParam(value="id", defaultValue="1")int id
	) {
		return realEstateBO.getRealEstate(id);
	}
	
	// 2. 월세 조건 select
	@Autowired
	private RealEstateBO realEstateBO1;
	@RequestMapping("/2")
	public List<RealEstate> quiz02(
			@RequestParam(value="rentPrice", required=false) Integer rentPrice
			) {
		if (rentPrice == null) {
			return null;
		}
		return realEstateBO1.getRealEstate1(rentPrice);
	}
	
	// 3. 복합조건 select
	@Autowired
	private RealEstateBO realEstateBO2;
	@RequestMapping("/3")
	public List<RealEstate> quiz03(
			@Param(value="area") int area, @Param(value="price") int price 
			){
		return realEstateBO2.getRealEstate2(area, price);
	}
	
}
