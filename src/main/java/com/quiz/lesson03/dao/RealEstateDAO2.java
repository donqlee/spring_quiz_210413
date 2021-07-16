package com.quiz.lesson03.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.quiz.lesson03.model.RealEstate;

@Repository
public interface RealEstateDAO2 {
	public List<RealEstate> selectRealEstate2(@Param(value="area") int area, @Param(value="price") int price);
}
