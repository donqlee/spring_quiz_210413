package com.quiz.lesson03.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.quiz.lesson03.dao.RealEstateDAO1;
import com.quiz.lesson03.model.RealEstate;

@Service
public class RealEstateBO1 {
	@Autowired
	private RealEstateDAO1 realEstateDAO1;
	
	public List<RealEstate> getRealEstate1(Integer rentPrice){
		return realEstateDAO1.selectRealEstate1(rentPrice);
	}
}
