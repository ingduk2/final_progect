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
	public ModelAndView matchingAnimal(AnimalVO anivo, int bno, String mid, String nowPage) throws ParseException {

		ModelAndView mav = new ModelAndView("redirect:/selectoneAnimal");
		// 글로 돌아가기 위한 기본 정보 등록
		mav.addObject("anino", anivo.getAnino());
		mav.addObject("bno", bno);
		mav.addObject("mid", mid);
		mav.addObject("nowPage", nowPage);
		// 동물 종, 지역, 날짜로 걸러낸 1차 리스트 생성
		List<AnimalVO> matchlist = mcdao.machingdata(anivo);
		
		// anino와 count를 담을 map
		HashMap<Integer, Double> cntres = new HashMap<>();
		
		// 날짜 계산을 위한 SimpleDateFormat
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy/mm/dd");
		// 실종 날짜 Date 객체로 변환
		Date disappear = sdf.parse(anivo.getAnidate());
		
		int len = matchlist.size();
		
		// 유사성 count 시작
		for(int i=0; i<len; i++) {
			
			double count = 0; // 좀 더 유사성이 높은 정보를 뽑기 위한 카운트
			
			// 품종 체크
			if (!matchlist.get(i).getAnibreed().equals(" ")) {
				if (matchlist.get(i).getAnibreed().equals(anivo.getAnibreed())) {
					count += 2;
				}
				else {
					System.out.println("Log: 품종이 달라서 아웃! - " + matchlist.get(i).getAnino());
					continue;
				}
			}
			
			// 성별 체크
			if (!matchlist.get(i).getAnisex().equals("모름")) {
				if (matchlist.get(i).getAnisex().equals(anivo.getAnisex())) {
					count += 2;
				}
				else {
					System.out.println("Log: 성별이 달라서 아웃! - " + matchlist.get(i).getAnino());
					continue;
				}
			}
			
			// 중성화 체크
			if (!matchlist.get(i).getAnineutral().equals("모름")) {
				
				if (matchlist.get(i).getAnineutral().equals(anivo.getAnineutral())) {
					count += 2;
				}
				else {
					System.out.println("Log: 중성화가 달라서 아웃! - " + matchlist.get(i).getAnino());
					continue;
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
			}
			
			// 개인 보호, 센터 보호, 입양 대기 중이면 점수 더 주기 (소재지가 확실 하니까)
			if (matchlist.get(i).getAnistate() == 0 || matchlist.get(i).getAnistate() == 1 || 
				matchlist.get(i).getAnistate() == 5) {
				count += 0.5;
			} // 최고점 : 16.0
			
			// 해당 동물 번호(anino)와 동물의 count 맵에 put
			cntres.put(matchlist.get(i).getAnino(), count);
		}
		// 유사성 count 끝
		
		// 유사성 count 결과 있을 때만 동작
		if (cntres.size() != 0) {
			System.out.println("Log: 매칭 결과 갯수 - " + cntres.size());
			
			// ============================== 매칭 결과 출력 테스트
			System.out.println("-매칭 결과 출력-");
			for (Map.Entry<Integer, Double> e : cntres.entrySet()) {
				System.out.println("Anino : " + e.getKey() + " / Count" + e.getValue());
			}
			// ==============================
			
			// value를 기준으로, cntres 정렬
			List<Map.Entry<Integer, Double>> cntresSortlist = 
					new ArrayList<Map.Entry<Integer, Double>>(cntres.entrySet());
			
			Collections.sort(cntresSortlist, new Comparator<Map.Entry<Integer, Double>>() {
				
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
			
			// ============================== 정렬 결과 출력 테스트
			System.out.println("-정렬 결과 출력-");
			for (int i=0; i<cntresSortlist.size(); i++) {
				System.out.println("Anino : " + cntresSortlist.get(i).getKey()
									+ " / Count" + cntresSortlist.get(i).getValue());
			}
			// ==============================
			
			// 상위 3개 결과 추출 시작
			int top3 = 3;
			
			// 결과 3개 안되면 값 변경
			if (cntresSortlist.size() < 3) {
				top3 = cntresSortlist.size();
			}
			
//			List<AniBoardVO> matchres = new LinkedList<>();
//			for (int i=0; i<top3; i++) {
//				matchres.add(i, anidao.imgDetail(cntresSortlist.get(i).getKey()));
//			}
			
			AniBoardVO[] matchres = new AniBoardVO[top3];
			for (int i=0; i<top3; i++) {
				matchres[i] = anidao.imgDetail(cntresSortlist.get(i).getKey());
			}
			// 상위 3개 결과 추출 끝
			
			// ============================== Top3 출력 테스트
//			System.out.println("-Top3 추출 결과 출력-");
//			System.out.println("list size: " + matchres.size());
//			for (int i=0; i<matchres.size(); i++) {
//				System.out.println(i+" : "+matchres.get(i).getAnino());
//			}
			System.out.println("-Top3 추출 결과 출력-");
			System.out.println("array length: " + matchres.length);
			for (int i=0; i<matchres.length; i++) {
				System.out.println(i+" : "+matchres[i].getAnino());
			}
			// ==============================
			
			// 매칭 결과 출력 스위치 켬 (기존 값: 0)
			int matchswitch = 1;
			
			// 결과 전달 _ 상위 3개 결과 목록 + 매칭 결과 스위치
			mav.addObject("matchswitch", matchswitch);
//			mav.addObject("matchres", matchres);

			// ====================================================== 씨발 내가 병신이라 그런거지 어쩔수 있나
			// list or array 대신에 보낸다... 원래 담아서 보내려고 했는데.. 씨발..
			
			int first = 313048;
			int second = 313048;
			int third = 313048;
			
			if (top3 != 0) {first = cntresSortlist.get(0).getKey(); top3--;}
			if (top3 != 0) {second = cntresSortlist.get(1).getKey(); top3--;}
			if (top3 != 0) {third = cntresSortlist.get(2).getKey();}

			mav.addObject("first", first);
			mav.addObject("second", second);
			mav.addObject("third", third);
			
			// ====================================================== 씨발 내가 병신이라 그런거지 어쩔수 있나
			
			return mav;
		}
		else {
			System.out.println("Log: 매칭 결과 없음");
			
			// 매칭 결과 출력 스위치 오류 전달 (기존 값: 0)
			int matchswitch = 313048;
			
			mav.addObject("matchswitch", matchswitch);
			
			return mav;
		}
	}
}
