package com.quiz.lesson06.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.quiz.lesson06.model.Favorite;

@Repository
public interface FavoriteDAO {
	public List<Favorite> selectFavorite();
	public void insertFavorite(Favorite favorite);
}
