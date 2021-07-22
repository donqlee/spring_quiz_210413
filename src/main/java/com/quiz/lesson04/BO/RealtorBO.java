package com.quiz.lesson04.BO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.quiz.lesson04.DAO.RealtorDAO;
import com.quiz.lesson04.model.Realtor;

@Service
public class RealtorBO {
	@Autowired
	RealtorDAO realtorDAO;
	
	public void addRealtor(Realtor realtor) {
		realtorDAO.insertRealtor(realtor);
	}
	
	public Realtor getNewRealtorById(int id) {
		return realtorDAO.selectNewRealtorById(id);
	}
}
