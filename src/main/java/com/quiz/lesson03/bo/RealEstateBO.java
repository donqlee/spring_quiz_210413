package com.quiz.lesson03.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.quiz.lesson03.dao.RealEstateDAO;
import com.quiz.lesson03.model.RealEstate;

@Service
public class RealEstateBO {
	
	@Autowired
	private RealEstateDAO realEstateDAO;
	
	public RealEstate getRealEstate(int id) {
		return realEstateDAO.selectRealEstate(id);
	}
	
	@Autowired
	private RealEstateDAO realEstateDAO1;
	
	public List<RealEstate> getRealEstate1(Integer rentPrice){
		return realEstateDAO1.selectRealEstate1(rentPrice);
	}
	
	@Autowired
	private RealEstateDAO realEstateDAO2;
	
	public List<RealEstate> getRealEstate2(int area, int price){
		return realEstateDAO2.selectRealEstate2(area, price);
	}
}
