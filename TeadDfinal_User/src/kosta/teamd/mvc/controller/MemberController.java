package kosta.teamd.mvc.controller;

import java.io.File;
import java.io.IOException;
import java.security.Principal;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import kosta.teamd.mvc.inter.MemRolesSelectInter;
import kosta.teamd.mvc.inter.MemberDeleteInter;
import kosta.teamd.mvc.inter.MemberInsertInter;
import kosta.teamd.mvc.inter.MemberSelectInter;
import kosta.teamd.mvc.inter.MemberUpdateInter;
import kosta.teamd.vo.MemRolesVO;
import kosta.teamd.vo.MemberVO;

@Controller
public class MemberController {

	// -- 회원 정보, 권한 등록 --
	@Autowired
	private MemberInsertInter minsert;
	
	@RequestMapping(value="/minsert", method=RequestMethod.POST)
	public ModelAndView insertDB(MemberVO mvo, MemRolesVO mrvo) throws Exception {
		
		mvo.setMimg("default.jsp"); // 디폴트 프로필 사진 설정
		mvo.setMintro("안녕하세요 ^^"); // 디폴트 프로필 인사말 설정
		
		// 전화번호 변환
//		StringBuffer tel = new StringBuffer();
//		tel.append(mvo.getMtelf()).append("-");
//		
//		int len = mvo.getMtelb().length();
//		
//		if (len == 7) {
//			tel.append(mvo.getMtelb().substring(0, 3)).append("-");
//			tel.append(mvo.getMtelb().substring(3, 7));
//		}
//		if (len == 8) {
//			tel.append(mvo.getMtelb().substring(0, 4)).append("-");
//			tel.append(mvo.getMtelb().substring(4, 8));
//		}
//		
//		mvo.setMtel(tel.toString());
		
		minsert.memberInsert(mvo, mrvo);
		
		System.out.println("Log: [" + mvo.getMid() + "] 가입");
		
		return new ModelAndView("index");
	}
	
	// -- 회원 정보, 권한 삭제 --
	@Autowired
	private MemberDeleteInter mdelete;
	
	@RequestMapping(value="/mdelete", method=RequestMethod.GET)
	public ModelAndView deleteDB(Principal mid, HttpServletRequest request) throws Exception {
		
		// 세션에서 해당 아이디 제거
		HttpSession session = request.getSession();
		session.removeAttribute(mid.getName());
		
		mdelete.memberDelete(mid.getName());
		
		System.out.println("Log: [" + mid.getName() + "] 탈퇴");
		
		return new ModelAndView("index");
	}
	
	// -- 회원 정보 수정 --
	@Autowired
	private MemberUpdateInter mupdate;
	
	@RequestMapping(value="/mupdate", method=RequestMethod.POST)
	public ModelAndView updateDB(MemberVO mvo, HttpServletRequest request) throws Exception {
		
		// 프로필 이미지 파일이 있으면 수행
		if (mvo.getMfile() != null) {
			// ----- 이미지 경로 설정 및 업로드 처리 -----
			// 이미지 저장 절대 경로
			HttpSession session = request.getSession();
			String r_path = session.getServletContext().getRealPath("/");
			
			// 시스템에 맞는 DocumentRoot 안에 img폴더 경로 설정
			String img_path = "\\img\\";
			
			// 최상위 경로와 결합
			StringBuffer path = new StringBuffer();
			path.append(r_path).append(img_path);
			
			// upload된 파일의 이름과 결합
			String oriFn = mvo.getMfile().getOriginalFilename();
			path.append(oriFn);
			
			// upload 이미지의 경로 출력
			System.out.println("Log: [ProfileImgPath] " + path);
					
			// 이미지 upload
			File f = new File(path.toString());
			try {
				mvo.getMfile().transferTo(f);
			}
			catch (IllegalStateException | IOException e) {
				e.printStackTrace();
			}
			
			mvo.setMimg(oriFn);
		}
		
		mupdate.memberUpdate(mvo);
		
		System.out.println("Log: [" + mvo.getMid() + "] 정보 수정");
		
		return new ModelAndView("index"); // ---------------------------- 어디로 보낼지 결정해야 한다(정보보기 페이지로)
	}
	
	// -- 회원 정보 검색 --
	@Autowired
	private MemberSelectInter mselect;
	
	@RequestMapping(value="/mselect", method=RequestMethod.GET)
	public ModelAndView selectDB(Principal mid) throws Exception {
		
		MemberVO mvo = mselect.memberSelect(mid.getName());
		
		ModelAndView mav = new ModelAndView("member/update"); // ------------ 여기는 주소를 어떻게 줄지 생각해 봐야 할 듯
		mav.addObject("mvo", mvo);                            // ------------ 정보 수정 페이지와 정보 보여주기 페이지 있으니..
		
		System.out.println("Log: [" + mid.getName() + "] 정보 검색");
		
		return mav;
	}
	
}
