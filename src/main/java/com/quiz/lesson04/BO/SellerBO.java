package com.quiz.lesson04.BO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.quiz.lesson04.DAO.SellerDAO;
import com.quiz.lesson04.model.Seller;

@Service
public class SellerBO {
	@Autowired
	private SellerDAO sellerDAO;
	
	public void addSeller(String nickname, String profileImageUrl, double temperature) {
			sellerDAO.insertSeller(nickname, profileImageUrl, temperature);
	}
	public Seller getSellerById(Integer id) {
		return sellerDAO.selectSellerById(id);
	}
	public Seller getLastSeller() {
		return sellerDAO.selectLastSeller();
	}
}
