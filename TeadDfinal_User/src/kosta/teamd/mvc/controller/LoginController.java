package kosta.teamd.mvc.controller;

import java.security.Principal;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kosta.teamd.mvc.dao.MemberDao;
import kosta.teamd.mvc.inter.MemRolesSelectInter;
import kosta.teamd.vo.MemRolesVO;

@Controller
public class LoginController {
	
	@Autowired
	private MemberDao mdao;

	// -- 로그인 페이지 연결 --
	@RequestMapping(value="/login")
	public String loginFormView(Principal prcp, HttpServletRequest request) {
		
		// 이미 로그인 한 회원이 로그인 페이지에 접근하려 할 시 처리
		if (prcp == null) {
			return "member/login";
		}
		else {
			return "index";
		}
	}
	
	// -- 로그인 시 제재 상태 체크 --
	@Autowired
	private MemRolesSelectInter mrselect;
	
	@RequestMapping(value="/mfreetimecheck")
	public String checkFreeTime(Principal mid) throws Exception {
		
		String freetime = mdao.selectFreetime(mid.getName());
		MemRolesVO mrvo = mrselect.memrolesSelect(mid.getName());
		
		if (mrvo.getRole().equals("Criminal")) {
			
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmm");
			String now = sdf.format(new Date());
			
			System.out.println("Log: Now [" + now + "]");
			System.out.println("Log: FreeTime [" + freetime + "]");
			
			long chk = Long.parseLong(now) - Long.parseLong(freetime.trim());

			if (chk >= 0) {
				mdao.updateRoleUp(mid.getName());
			}
		}
		
		return "index";
	}
}
