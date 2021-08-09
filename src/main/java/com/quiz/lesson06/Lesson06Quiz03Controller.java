package com.quiz.lesson06;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.quiz.lesson06.bo.BookingBO;
import com.quiz.lesson06.model.Booking;

@RequestMapping("/lesson06/quiz03")
@Controller
public class Lesson06Quiz03Controller {
	@Autowired
	private BookingBO bookingBO;
	
	@RequestMapping("/bookingList")
	public String getBookingList(Model model) {
		List<Booking> bookingList = bookingBO.getBookingList();
		model.addAttribute("booking", bookingList);
		return "lesson06/booking_list";
	}
	@RequestMapping("/delete_booking")
	@ResponseBody
	public String deleteBooking(
			@RequestParam("bookingId") int id
			) {
		int deleteRow = bookingBO.deleteBooking(id);
		return deleteRow == 1 ? "success" : "fail";
	}
	@RequestMapping("booking")
	public String booking() {
		return "lesson06/booking";
	}
	@PostMapping("add_booking")
	@ResponseBody
	public Map<String, String> addBooking(
			@RequestParam("name") String name,
			@RequestParam("date") Date date,
			@RequestParam("day") int day,
			@RequestParam("headcount") int headcount,
			@RequestParam("phoneNumber") String phoneNumber
			){
		bookingBO.addBooking(name, date, day, headcount, phoneNumber);
		Map<String, String> resultMap = new HashMap<>();
		resultMap.put("result", "success");
		return resultMap;
	}
	
}
