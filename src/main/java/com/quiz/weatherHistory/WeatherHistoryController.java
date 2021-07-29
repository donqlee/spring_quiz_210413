package com.quiz.weatherHistory;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.quiz.weatherHistory.bo.WeatherHistoryBO;
import com.quiz.weatherHistory.model.WeatherHistory;

@RequestMapping("/lesson05/quiz05")
@Controller
public class WeatherHistoryController {
	@Autowired
	private WeatherHistoryBO weatherHistoryBO;
	
	@RequestMapping("/weather_history_view")
	public String weatherHistoryView(Model model) {
		List<WeatherHistory> weatherHistpryList = weatherHistoryBO.getWeatherHistoryList();
		model.addAttribute("weatherHistoryList", weatherHistpryList);
		
		return "weatherHistory/weatherHistory";
	}
	@GetMapping("/add_weather_view")
	public String addWeatherView() {
		return "weatherHistory/addWeatherView";
	}
	@PostMapping("/add_weather")
	public String addWeather(
			/*@RequestParam("date") String date,
			@RequestParam("weather") String weather,
			@RequestParam("microDust") String microDust,
			@RequstParam("temperatures") double temperatures,
			@RequestParam("precipitation") double precipitation,
			@RequestParam("windSpeed") double windSpeed){
			
			redirect: 새로운 request를 하는 것과 같으므로 RequestMapping에 있는 path를 써준다.
			return "redirect:/lesson05/quiz05/weather_history_view";
			
			
			*/
			@ModelAttribute WeatherHistory weatherHistory,
			Model model) {
		weatherHistoryBO.addWeather(weatherHistory);
		

		
		return "redirect:/lesson05/quiz05/weather_history_view";
	}
}
