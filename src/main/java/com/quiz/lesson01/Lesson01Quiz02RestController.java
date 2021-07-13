package com.quiz.lesson01;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RequestMapping("/lesson01/quiz02")
@RestController
public class Lesson01Quiz02RestController {
	@RequestMapping("/1")
	public List <Map<String, Object>> printJson(){
		List<Map<String, Object>> listMap = new ArrayList<>();
		Map<String, Object> map = new HashMap<>();
		map.put("rate", 15);
		map.put("director", "봉준호");
		map.put("time", 131);
		map.put("title", "기생충");
		listMap.add(map);
		
		Map<String, Object> map1 = new HashMap<>();
		map1.put("rate", 0);
		map1.put("director", "로베르토 베니니");
		map1.put("time", 116);
		map1.put("title", "인생은 아름다워");
		listMap.add(map1);
		
		Map<String, Object> map2 = new HashMap<>();
		map2.put("rate", 12);
		map2.put("director", "크리스토퍼 놀란");
		map2.put("time", 147);
		map2.put("title", "인셉션");
		listMap.add(map2);
		
		Map<String, Object> map3 = new HashMap<>();
		map3.put("rate", 19);
		map3.put("director", "윤종빈");
		map3.put("time", 133);
		map3.put("title", "범죄와의 전쟁 : 나쁜놈들 전성시대");
		listMap.add(map3);
		
		Map<String, Object> map4 = new HashMap<>();
		map4.put("rate", 15);
		map4.put("director", "프란시스 로렌스");
		map4.put("time", 137);
		map4.put("title", "헝거게임");
		listMap.add(map4);
		
		return listMap;
	}
	
	@RequestMapping("/2")
	public List<Data> printJson2() {
		List<Data> listClass = new ArrayList<Data>();
		Data data = new Data();
		data.setTitle("안녕하세요 가입인사 드립니다.");
		data.setUser("hagulu");
		data.setContent("안녕하세요. 가입했어요. 앞으로 잘 부탁 드립니다. 활동 열심히 하겠습니다.");
		listClass.add(data);
		
		data = new Data();
		data.setTitle("헐 대박");
		data.setUser("bada");
		data.setContent("오늘 목요일이 었어... 금요일인줄");
		listClass.add(data);
		
		data = new Data();
		data.setTitle("오늘 데이트 한 이야기 해드릴게요.");
		data.setUser("dulumary");
		data.setContent("....");
		listClass.add(data);
		
		return listClass;
		
	}
	
	@RequestMapping("/3")
	public ResponseEntity<Data> entity(){
		Data data = new Data();
		data.setTitle("안녕하세요 가입인사 드립니다.");
		data.setUser("hagulu");
		data.setContent("안녕하세요. 가입했어요. 앞으로 잘 부탁 드립니다. 활동 열심히 하겠습니다.");
		
		return new ResponseEntity<>(data, HttpStatus.INTERNAL_SERVER_ERROR);
	}
}
