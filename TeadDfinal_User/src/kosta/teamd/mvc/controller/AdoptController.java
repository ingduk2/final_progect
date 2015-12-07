package kosta.teamd.mvc.controller;

import java.security.Principal;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import kosta.teamd.mvc.dao.AdoptApplyDao;
import kosta.teamd.mvc.dao.MemberDao;
import kosta.teamd.vo.AdoptApplyVO;
import kosta.teamd.vo.MemberVO;

@Controller
public class AdoptController {
	
	@Autowired
	private MemberDao mdao;
	@Autowired
	private AdoptApplyDao adadao;

	// 입양 신청 페이지 연결 및 신청 여부 체크
	@RequestMapping(value="/adoptquspage")
	public ModelAndView adoptapplyView(int anino, Principal prcp) {
		
		System.out.println("Log : 입양 신청 페이지 연결 및 신쳥 여부 체크 시작");
		
		AdoptApplyVO adavo = new AdoptApplyVO();
		adavo.setAnino(anino);
		adavo.setMid(prcp.getName());
		
		ModelAndView mav = new ModelAndView();
		
		int cnt = adadao.selectCntCheck(adavo);
		
		if (cnt > 0) {
			
			String msg = " 님, 감사합니다.<br/>이미 해당 아이의 입양에 신청하셨습니다.<br/>잠시 후 메인 페이지로 이동합니다.";
			
			mav.setViewName("redirect:/adoptRes");
			mav.addObject("mid", prcp.getName());
			mav.addObject("msg", msg);
			
			System.out.println("Log : 입양 신청 페이지 연결 및 신쳥 여부 체크 끝");
			
			return mav;
		}
		else {
			
			System.out.println("Log : 입양 신청 페이지로 이동");
		
			mav.setViewName("adopt/adoptapply");
			mav.addObject("anino", anino);
			
			System.out.println("Log : 입양 신청 페이지 연결 및 신쳥 여부 체크 끝");
			
			return mav;
		}
	}
	
	// 입양 신청서 답변 점수화 및 DB 저장
	@RequestMapping(value="/adoptapply", method=RequestMethod.POST)
	public ModelAndView adoptApply(Principal prcp, AdoptApplyVO aavo) {
		
		boolean bool = true; // 입양 신청 허용 여부 체크용
		
		// 입양 신청서 답변 점수화 및 값 DB에 넣을 형태로 가공---------------------------------------------------START
		int score = 10;
		
		// Q1. 동물을 키워본 경험이 있으십니까?
		if (aavo.getQus1().equals("yes")) {
			score += 2;
			aavo.setQus1("양육 경험 유");
			
			// Q1-1. 가장 최근에 함께했던 동물은 어떻게 되었습니까?
			if (aavo.getQus1sup1().equals("1")) {  // 현재 함께 살고있다
				score += 1;
				aavo.setQus1sup1("현재 함께 살고 있음");
			}
			else if (aavo.getQus1sup1().equals("2")) {  // 무지개 다리
				score += 2;
				aavo.setQus1sup1("무지개 다리");
			}
			else if (aavo.getQus1sup1().equals("3")) {  // 파양
				score -= 2;
				aavo.setQus1sup1("파양");
			}
			else if (aavo.getQus1sup1().equals("4")) {  // 분실
				score -= 1;
				aavo.setQus1sup1("분실");
			}
			else if (aavo.getQus1sup1().equals("5")) {  // 유기
				bool = false;
			}
		}
		else {
			score -= 1;
			aavo.setQus1("양육 경험 무");
			aavo.setQus1sup1("");
		}
		
		// Q2. 현재 혼자 거주중 이십니까?
		if (aavo.getQus2().equals("yes")) {
			score -= 1;
			aavo.setQus2("혼자 거주");
			aavo.setQus2sup1("");
		}
		else {
			aavo.setQus2("가족과 거주");
			
			// Q2-1. 모든 가족이 입양에 찬성했습니까?
			if (aavo.getQus2sup1().equals("yes")) {
				score += 1;
				aavo.setQus2sup1("가족 모두 동의");
			}
			else if (aavo.getQus2sup1().equals("nope")) {
				score -= 2;
				aavo.setQus2sup1("가족 동의 안함");
			}
		}
		
		// Q3. 하루에 집이 완전히 비는 시간이 얼마나 됩니까?
		int empty = Integer.parseInt(aavo.getQus3());
		
		if (empty == 0) {
			score += 3;
			aavo.setQus3("집 빔: 0시간");
		}
		else if (empty > 0 && empty <= 5) {
			score += 1;
			aavo.setQus3("집 빔: 1~5시간");
		}
		else if (empty > 5 && empty <= 9) {
			score -= 1;
			aavo.setQus3("집 빔: 6~9시간");
		}
		else if (empty == 10) {
			score -= 3;
			aavo.setQus3("집 빔: 10시간 이상");
		}
		
		// Q4. 한 달 수입이 어느 정도 되십니까?
		int income = Integer.parseInt(aavo.getQus4());
		
		if (income < 100) {
			score += 1;
			aavo.setQus4("수입: 100이하");
		}
		else if (income >= 100 && income < 200) {
			score += 2;
			aavo.setQus4("수입: 100~200");
		}
		else if (income >= 200 && income < 300) {
			score += 3;
			aavo.setQus4("수입: 200~300");
		}
		else {
			score += 4;
			aavo.setQus4("수입: 300이상");
		}
		
		// Q5. 주거형태가 어떻게 되십니까?
		if (aavo.getQus5().equals("1")) {  // 단독 주택
			score += 1;
			aavo.setQus5("주거형태: 단독주택");
		}
		else if (aavo.getQus5().equals("2")) {  // 전원 주택
			score += 2;
			aavo.setQus5("주거형태: 전원주택");
		}
		else if (aavo.getQus5().equals("3")) {  // 다세대 주택
			score -= 1;
			aavo.setQus5("주거형태: 다세대주택");
		}
		else if (aavo.getQus5().equals("4")) {  // 아파트
			score -= 1;
			aavo.setQus5("주거형태: 아파트");
		}
		
		// Q6. 향후 이사 계획이 있으십니까?
		if (aavo.getQus6().equals("yes")) {
			score -= 1;
			aavo.setQus6("이사계획 있음");
			
			// Q6-1. 약 얼마 후 이사를 계획하고 계십니까?
			int plan = Integer.parseInt(aavo.getQus6sup1());
			
			if (plan < 6) {
				score -= 2;
				aavo.setQus6sup1("계획: 6개월 이내");
			}
			else if (plan >= 6 && plan < 12) {
				score -= 1;
				aavo.setQus6sup1("계획: 6~12개월 이내");
			}
			else if (plan >= 12 && plan < 18) {
				aavo.setQus6sup1("계획: 12~18개월 이내");
			}
			else if (plan >= 18 && plan < 24) {
				score += 1;
				aavo.setQus6sup1("계획: 18~24개월 이내");
			}
			else {
				score += 2;
				aavo.setQus6sup1("계획: 24개월 이후");
			}
		}
		else {
			score += 3;
			aavo.setQus6("이사계획 없음");
			aavo.setQus6sup1("");
		}
		
		// Q7. 유기동물을 위한 봉사활동에 참여한 경험이 있으십니까?
		if (aavo.getQus7().equals("yes")) {
			score += 3;
			aavo.setQus7("봉사경험 유");
		}
		else {
			aavo.setQus7("봉사경험 무");
		}
		
		// Q8. 입양 후 동물 등록제에 참여하시겠습니까?
		if (aavo.getQus8().equals("yes")) {
			aavo.setQus8("동물 등록제 참여");
		}
		else {
			bool = false;
		}
		
		// Q9. 입양 후 중성화 수술을 하시겠습니까?
		if (aavo.getQus9().equals("yes")) {
			score += 1;
			aavo.setQus9("중성화 수술 참여");
		}
		else {
			score -= 3;
			aavo.setQus9("중성화 수술 불참");
		}
		
		// Q10. 입양 후 아이의 모습을 주기적으로 전해주실 수 있으십니까?
		if (aavo.getQus10().equals("yes")) {
			score += 2;
			aavo.setQus10("피드백 참여");
		}
		else {
			score -= 2;
			aavo.setQus10("피드백 불참");
		}
		// 입양 신청서 답변 점수화 및 값 DB에 넣을 형태로 가공---------------------------------------------------END
		
		// 입양 신청자 정보에서 생년월일 통해 나이대 점수화 추가--------------------------------------------------START
		MemberVO mvo = mdao.selectMember(prcp.getName());
		int bornyear = Integer.parseInt(mvo.getMbirth().substring(0, 4));
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy");
		int thisyear = Integer.parseInt(sdf.format(new Date()));
		
		int age = thisyear - bornyear+1;
		
		if (age < 20) {
			bool = false;
		}
		else if (age >= 20 && age < 25) {
			score += 0;
			aavo.setMage("나이: 20~25");
		}
		else if (age >= 25 && age < 30) {
			score += 1;
			aavo.setMage("나이: 25~30");
		}
		else if (age >= 30 && age < 35) {
			score += 2;
			aavo.setMage("나이: 30~35");
		}
		else {
			score += 3;
			aavo.setMage("나이: 35이상");
		}
		// 입양 신청자 정보에서 생년월일 통해 나이대 점수화 추가 --------------------------------------------------END
		
		if (bool) {
			aavo.setMid(prcp.getName()); // vo에 입양 신청자 아이디 추가
			aavo.setScore(score); // vo에 점수 추가
			
			// 테스트 ----------------------------------------------------------------
			System.out.println("신청 성공");
			System.out.println("신청자: "+aavo.getMid());
			System.out.println("점수: "+aavo.getScore());
			System.out.println("동물 번호: "+aavo.getAnino());
			System.out.println("Q1: "+aavo.getQus1());
			System.out.println("Q1-1: "+aavo.getQus1sup1());
			System.out.println("Q2: "+aavo.getQus2());
			System.out.println("Q2-1: "+aavo.getQus2sup1());
			System.out.println("Q3: "+aavo.getQus3());
			System.out.println("Q4: "+aavo.getQus4());
			System.out.println("Q5: "+aavo.getQus5());
			System.out.println("Q6: "+aavo.getQus6());
			System.out.println("Q6-1: "+aavo.getQus6sup1());
			System.out.println("Q7: "+aavo.getQus7());
			System.out.println("Q8: "+aavo.getQus8());
			System.out.println("Q9: "+aavo.getQus9());
			System.out.println("Q10: "+aavo.getQus10());
			System.out.println("나이대: "+aavo.getMage());
			System.out.println();
			// 테스트 ----------------------------------------------------------------
			
			adadao.insertAdoptApply(aavo);
			
			String msg = " 님, 감사합니다. 입양 신청이 성공적으로 신청됐습니다.<br/>곧 담당 직원을 통해 연락드리겠습니다.<br/>잠시 후 메인 페이지로 이동합니다.";
			
			ModelAndView mav = new ModelAndView("redirect:/adoptRes");
			mav.addObject("mid", prcp.getName());
			mav.addObject("msg", msg);
			
			return mav;
		}
		else {
			// ModelAndView 생성 및 입양 신청에 조건이 되지 않아 실패했다는 메세지(?) 이미지(?) 뿌려주는 페이지로 연결
			System.out.println("신청 실패");
			
			String msg = " 님, 죄송합니다.<br/>자격 요건 미달로 입양 신청에 실패했습니다.<br/>잠시 후 메인 페이지로 이동합니다.";
			
			ModelAndView mav = new ModelAndView("redirect:/adoptRes");
			mav.addObject("mid", prcp.getName());
			mav.addObject("msg", msg);
			
			return mav;
		}
	}
	
	// 입양 신청 결과 페이지 연결
	@RequestMapping(value="/adoptRes")
	public ModelAndView adoptSuccess(String mid, String msg) {
		
		ModelAndView mav = new ModelAndView("adopt/adoptres");
		mav.addObject("mid", mid);
		mav.addObject("msg", msg);
		
		return mav;
	}
}
