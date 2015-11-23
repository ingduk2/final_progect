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

import kosta.teamd.mvc.dao.MemberDao;
import kosta.teamd.mvc.inter.MemberDeleteInter;
import kosta.teamd.mvc.inter.MemberInsertInter;
import kosta.teamd.mvc.inter.MemberSelectInter;
import kosta.teamd.mvc.inter.MemberUpdateInter;
import kosta.teamd.vo.MemRolesVO;
import kosta.teamd.vo.MemberVO;

@Controller
public class MemberController {

	@Autowired
	private MemberDao mdao;
	
	// -- 회원 가입 페이지 연결 --
	@RequestMapping(value="/join")
	public String joinFormView(Principal prcp) {
			
		// 이미 로그인 한 회원이 회원가입 페이지에 접근하려 할 시 처리
		if (prcp == null) {
			return "member/join";
		}
		else {
			return "index";
		}
	}
	
	// -- 아이디 존재유무 체크 --
	@RequestMapping(value="/midchk")
	public ModelAndView midExistCheck(String mid) {
		
		int check = mdao.midCntCheck(mid);
		String resMsg = "";
		
		if (check > 0) {
			resMsg = "이미 존재하는 아이디 입니다.";
		}
		else {
			resMsg = "사용 가능한 아이디 입니다.";
		}
		
		ModelAndView mav = new ModelAndView("checkpage/midchkres");
		mav.addObject("resMsg", resMsg);
		
		return mav;
	}
	
	// -- 이메일 존재유무 체크 --
	@RequestMapping(value="/memailchk")
	public ModelAndView memailExistCheck(String memail) {
		
		int check = mdao.memailCntCheck(memail);
		String resMsg = "";
		
		if (check > 0) {
			resMsg = "이미 존재하는 메일 주소 입니다.";
		}
		else {
			resMsg = "사용 가능한 메일 주소 입니다.";
		}
		
		ModelAndView mav = new ModelAndView("checkpage/memailchkres");
		mav.addObject("resMsg", resMsg);
		
		return mav;
	}
	
	// -- 회원가입 시 비밀번호 동일성 여부 체크 --
	@RequestMapping(value="/mpwdchk")
	public String pwdchkPage() {
		
		return "checkpage/mpwdchk";
	}
	
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
	
	@RequestMapping(value="/mdelete")
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
		if (mvo.getMfile().getSize() > 0) {
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
		
		return new ModelAndView("redirect:/mselectview");
	}
	
	// -- 회원 정보 검색 --
	@Autowired
	private MemberSelectInter mselect;
	
	// --- 회원 정보 보기로 연결 ---
	@RequestMapping(value="/mselectview")
	public ModelAndView selectViewDB(Principal mid) throws Exception {
		
		MemberVO mvo = mselect.memberSelect(mid.getName());
		
		ModelAndView mav = new ModelAndView("member/userinfo");
		mav.addObject("mvo", mvo);
		
		System.out.println("Log: [" + mid.getName() + "] 정보 검색");
		
		return mav;
	}
	
	// --- 회원 정보 수정으로 연결 ---
	@RequestMapping(value="/mselectupdate")
	public ModelAndView selectUpdateDB(Principal mid) throws Exception {
		
		MemberVO mvo = mselect.memberSelect(mid.getName());
		
		ModelAndView mav = new ModelAndView("member/userupdate");
		mav.addObject("mvo", mvo);
		
		System.out.println("Log: [" + mid.getName() + "] 정보 검색");
		
		return mav;
	}
}