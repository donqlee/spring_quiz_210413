package com.quiz.lesson03;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.quiz.lesson03.bo.RealEstateBO;
import com.quiz.lesson03.model.RealEstate;

@RestController
public class RealEstateRestController {
	
	// 1. id 로 select 하기 
	@Autowired
	RealEstateBO realEstateBO;
	@RequestMapping("/lesson03/quiz01/1")
	public RealEstate quiz01(
			@RequestParam(value="id", defaultValue="1")int id
	) {
		return realEstateBO.getRealEstate(id);
	}
	
	// 2. 월세 조건 select
	@RequestMapping("/lesson03/quiz01/2")
	public List<RealEstate> quiz01_2(
			@RequestParam("rentPrice") int rentPrice
			) {
		return realEstateBO.getRealEstateListByRentPrice(rentPrice);
	}
	
	// 3. 복합조건 select
	@RequestMapping("/lesson03/quiz01/3")
	public List<RealEstate> quiz01_3(
			@RequestParam("area") int area, 
			@RequestParam("price") int price 
			){
		return realEstateBO.getRealEstateListByAreaAndPrice(area, price);
	}
	
	// insert 1. 객체로 insert 하기
	@RequestMapping("/lesson03/quiz02/1")
	public String quiz02_1() {
		RealEstate realEstate = new RealEstate();
		realEstate.setRealtorId(3);
		realEstate.setAddress("푸르지용 리버 303동 1104호");
		realEstate.setArea(89);
		realEstate.setType("매매");
		realEstate.setPrice(100000);

		int row = realEstateBO.insertRealEstate(realEstate);
		return "입력 성공 : " + row;
	}
	
	// insert 2. field 로 insert 하기
	@RequestMapping("/lesson03/quiz02/2")
	public String quiz02_2(
			@RequestParam("realtorId") int realtorId) {
		int row = realEstateBO.insertRealEstateAsField(realtorId, "썅떼빌리버 오피스텔 814호", 45, "월세", 100000, 120);
		return "입력 성공 : " + row;
	}
	
}
