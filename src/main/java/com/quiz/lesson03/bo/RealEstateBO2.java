package com.quiz.lesson03.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.quiz.lesson03.dao.RealEstateDAO2;
import com.quiz.lesson03.model.RealEstate;

@Service
public class RealEstateBO2 {
	@Autowired
	private RealEstateDAO2 realEstateDAO2;
	
	public List<RealEstate> getRealEstate(int area, int price){
		return realEstateDAO2.selectRealEstate2(area, price);
	}
}
