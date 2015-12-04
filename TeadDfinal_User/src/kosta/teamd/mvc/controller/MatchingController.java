package kosta.teamd.mvc.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.Date;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kosta.teamd.mvc.dao.AnimalDao;
import kosta.teamd.mvc.dao.MatchingDao;
import kosta.teamd.vo.AniBoardVO;
import kosta.teamd.vo.AnimalVO;

@Controller
public class MatchingController {
	
	@Autowired
	private MatchingDao mcdao;
	@Autowired
	private AnimalDao anidao;

	@RequestMapping(value="/matchingAnimal")
	public ModelAndView matchingAnimal(AnimalVO anivo, int bno, String mid) throws ParseException {

		// 동물 종, 지역, 날짜로 걸러낸 1차 리스트 생성
		List<AnimalVO> matchlist = mcdao.machingdata(anivo);
		
		// anino와 count를 담을 map
		HashMap<Integer, Double> cntres = new HashMap<>();
		
		// 날짜 계산을 위한 SimpleDateFormat
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy/mm/dd");
		// 실종 날짜 Date 객체로 변환
		Date disappear = sdf.parse(anivo.getAnidate());
		
		int len = matchlist.size();
		
		for(int i=0; i<len; i++) {
			
			double count = 0; // 좀 더 유사성이 높은 정보를 뽑기 위한 카운트
			
			// 품종 체크
			if (!matchlist.get(i).getAnibreed().equals(" ")) {
				if (matchlist.get(i).getAnibreed().equals(anivo.getAnibreed())) {
					count += 2;
				}
			}
			
			// 성별 체크
			if (!matchlist.get(i).getAnisex().equals("모름")) {
				if (matchlist.get(i).getAnisex().equals(anivo.getAnisex())) {
					count += 2;
				}
			}
			
			// 중성화 체크
			if (!matchlist.get(i).getAnineutral().equals("모름")) {
				
				if (matchlist.get(i).getAnineutral().equals(anivo.getAnineutral())) {
					count += 2;
				}
			}
			
			// 나이 체크
			double age = matchlist.get(i).getAniage();
			if (age != 0) {
				if (age >= anivo.getAniage()-3 && age <= anivo.getAniage()+3) {
					count += 0.5;
				}
			}
			
			// 몸무게 체크
			double weight = matchlist.get(i).getAniweight();
			if (weight != 0) {
				if (weight >= anivo.getAniweight()-2 && weight <= anivo.getAniweight()+2) {
					count += 1;
				}
			}
			
			// 날짜 체크 _ 1주일 이내, 1~2주 이내, 2주 이상
			// 발견, 보호 날짜 Date 객체로 변환
			Date matchingdate = sdf.parse(matchlist.get(i).getAnidate());
			
			// 두 날짜 차이 계산
			long difftime = matchingdate.getTime() - disappear.getTime();
			long diffdays = difftime / (24 * 60 * 60 * 1000);
			
			if (diffdays <= 7) {
				count += 1.5;
			}
			else if (diffdays <= 14) {
				count += 1;
			}
			
			// 이미지 존재 여부
			if (!matchlist.get(i).getAniimg().equals("puppydefault.png")) {
				count += 0.5;
			}
			
			// 특징 체크 _ 특정 단어들이 함께 존재하는지 체크 : 타 사이트 보며 빈도수 높은 단어들로 선택
			if (!matchlist.get(i).getAnifeature().equals(" ")) {
				if (anivo.getAnifeature().contains("목줄")) {
					if (matchlist.get(i).getAnifeature().contains("목줄")) {
						count += 1;
					}
				}
				if (anivo.getAnifeature().contains("옷")) {
					if (matchlist.get(i).getAnifeature().contains("옷")) {
						count += 1;
					}
				}
				if (anivo.getAnifeature().contains("점")) {
					if (matchlist.get(i).getAnifeature().contains("점")) {
						count += 1;
					}
				}
				if (anivo.getAnifeature().contains("상처")) {
					if (matchlist.get(i).getAnifeature().contains("상처")) {
						count += 1;
					}
				}
				if (anivo.getAnifeature().contains("자국")) {
					if (matchlist.get(i).getAnifeature().contains("자국")) {
						count += 1;
					}
				}
				if (anivo.getAnifeature().contains("털")) {
					if (matchlist.get(i).getAnifeature().contains("털")) {
						count += 1;
					}
				}
			} // 최고점 : 15.5
			
			// 해당 동물 번호(anino)와 동물의 count 맵에 put
			cntres.put(matchlist.get(i).getAnino(), count);
		}
		
		// ============================== 출력 테스트
		for (Map.Entry<Integer, Double> e : cntres.entrySet()) {
			System.out.println("Anino : " + e.getKey() + " / Count" + e.getValue());
		}
		// ==============================
		
		// value를 기준으로, cntres 정렬
		List<Map.Entry<Integer, Double>> sortlist = 
				new ArrayList<Map.Entry<Integer, Double>>(cntres.entrySet());
		
		Collections.sort(sortlist, new Comparator<Map.Entry<Integer, Double>>() {
			
			public int compare(Map.Entry<Integer, Double> map1, 
								  Map.Entry<Integer, Double> map2) {
				
				if (map1.getValue() == map2.getValue()) {
					return map1.getKey().compareTo(map2.getKey());
				}
				else {
					return map2.getValue().compareTo(map1.getValue());
				}
			}
		});
		
		// 정렬된 결과 순서 보장을 위해 LinkedHashMap에 저장
		LinkedHashMap<Integer, Double> cntsortres = new LinkedHashMap<>();
		
		for (Map.Entry<Integer, Double> e : sortlist) {
			cntsortres.put(e.getKey(), e.getValue());
		}
		
		// ============================== 출력 테스트
		System.out.println();
		for (Map.Entry<Integer, Double> e : cntsortres.entrySet()) {
			System.out.println("Anino : " + e.getKey() + " / Count" + e.getValue());
		}
		// ==============================

		// 상위 3개 결과 추출
//		List<AniBoardVO> matchres = new LinkedList<>();
		AniBoardVO[] matchres = new AniBoardVO[3];
		
//		for (int i=0; i<3; i++) {
//			matchres.add(i, anidao.imgDetail(sortlist.get(i).getKey()));
//		}
		for (int i=0; i<3; i++) {
			matchres[i] = anidao.imgDetail(sortlist.get(i).getKey());
		}
		
		// ============================== 출력 테스트
//		System.out.println();
//		System.out.println("size: " + matchres.size());
//		for (int i=0; i<matchres.size(); i++) {
//			System.out.println(i+" : "+matchres.get(i).getAnino());
//		}
		System.out.println();
		System.out.println("size: " + matchres.length);
		for (int i=0; i<matchres.length; i++) {
			System.out.println(i+" : "+matchres[i].getAnino());
		}
		// ==============================
		
		// 매칭 결과 출력 스위치 켬
		int matchswitch = 1;
		
		// 결과 전달 _ 상위 3개 결과 목록
		ModelAndView mav = new ModelAndView("redirect:/selectoneAnimal");
//		mav.addObject("matchres", matchres);
		mav.addObject("matchswitch", matchswitch);
		mav.addObject("anino", anivo.getAnino());
		mav.addObject("bno", bno);
		mav.addObject("mid", mid);
		
		// ============================== 출력 테스트
		System.out.println();
		System.out.println(anivo.getAnino());
		System.out.println(bno);
		System.out.println(mid);
		System.out.println(matchswitch);
		// ==============================
		
		// ====================================================== 씨발 내가 병신이라 그런거지 어쩔수 있나
		int first = sortlist.get(0).getKey();
		int second = sortlist.get(1).getKey();
		int third = sortlist.get(2).getKey();
		mav.addObject("first", first);
		mav.addObject("second", second);
		mav.addObject("third", third);
		// ====================================================== 씨발 내가 병신이라 그런거지 어쩔수 있나
		
		return mav;
	}
}
