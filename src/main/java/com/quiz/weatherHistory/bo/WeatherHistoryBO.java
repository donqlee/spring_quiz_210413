package com.quiz.weatherHistory.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.quiz.weatherHistory.dao.WeatherHistoryDAO;
import com.quiz.weatherHistory.model.WeatherHistory;

@Service
public class WeatherHistoryBO {
	@Autowired
	private WeatherHistoryDAO weatherHistoryDAO;
	public List<WeatherHistory> getWeatherHistoryList(){
		return weatherHistoryDAO.selectWeatherHistoryList();
	}
	public void addWeather(WeatherHistory weatherHistory) {
		weatherHistoryDAO.insertWeather(weatherHistory);
	}
}
