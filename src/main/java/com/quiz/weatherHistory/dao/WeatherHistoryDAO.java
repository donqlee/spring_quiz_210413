package com.quiz.weatherHistory.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.quiz.weatherHistory.model.WeatherHistory;

@Repository
public interface WeatherHistoryDAO {
	public List<WeatherHistory> selectWeatherHistoryList();
	public void insertWeather(WeatherHistory weatherHistory);

}
