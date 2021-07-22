package com.quiz.lesson04.DAO;

import org.springframework.stereotype.Repository;

import com.quiz.lesson04.model.Realtor;

@Repository
public interface RealtorDAO {
	public void insertRealtor(Realtor realtor);
	public Realtor selectNewRealtorById(int id);
}
