package kosta.teamd.mvc.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import kosta.teamd.mvc.inter.ImgBoardInsertInter;
import kosta.teamd.mvc.service.Paging;
import kosta.teamd.vo.AnimalVO;
import kosta.teamd.vo.BoardVO;
import kosta.teamd.vo.ImgBoardVO;

@Controller
public class ImgBoardController {

	@Autowired
	private Paging page;
	
	// -- 이미지 게시판 쓰기 폼 연결 --
	@RequestMapping(value="/formImgBoardWrite")
	public ModelAndView formImgBoardWrite(String bcode, String nowPage) {
		
		ModelAndView mav = new ModelAndView("imgboard/imgboardwrite");
		mav.addObject("bcode", bcode);
		mav.addObject("nowPage", nowPage);
		
		return mav;
	}
	
	// -- 동물 정보, 게시글 내용 등록 --
	@Autowired
	private ImgBoardInsertInter ibinsert;
	
	@RequestMapping(value="/insertImgBoard", method=RequestMethod.POST)
	public ModelAndView insertImgBoard(AnimalVO anivo, BoardVO bvo, HttpServletRequest req) throws Exception {
		
		// 이미지 파일이 있으면 수행
		if (anivo.getManiimg().getSize() > 0) {
			// ----- 이미지 경로 설정 및 업로드 처리 -----
			// 이미지 저장 절대 경로
			HttpSession session = req.getSession();
			String r_path = session.getServletContext().getRealPath("/");
			
			// 시스템에 맞는 DocumentRoot 안에 img폴더 경로 설정
			String img_path = "\\img\\";
			
			// 최상위 경로와 결합
			StringBuffer path = new StringBuffer();
			path.append(r_path).append(img_path);
			
			// upload된 파일의 이름과 결합
			String oriFn = anivo.getManiimg().getOriginalFilename();
			path.append(oriFn);
			
			// upload 이미지의 경로 출력
			System.out.println("Log: [AnimalImgPath] " + path);
					
			// 이미지 upload
			File f = new File(path.toString());
			try {
				anivo.getManiimg().transferTo(f);
			}
			catch (IllegalStateException | IOException e) {
				e.printStackTrace();
			}
			
			anivo.setAniimg(oriFn);
		}
		// 이미지 파일이 없으면 디폴트 이미지 등록
		else {
			anivo.setAniimg("puppydefault.png");
		}
		
		// anistate 4, 5인 경우, 모든 정보 기입 안한경우 디폴트 처리
//		if (anivo.getAnistate() == 4 || anivo.getAnistate() == 5) {
//			if (anivo.getAnisex().equals("모름")) {
//				System.out.println("전: " + anivo.getAnisex());
//				anivo.setAnisex(" ");
//				System.out.println("후: " + anivo.getAnisex());
//			}
//			
//		}
		
		ibinsert.imgBoardInsert(bvo, anivo);
		
		return new ModelAndView("redirect:/selectallAnimal?bcode="+bvo.getBcode()+"&nowPage=1&searchType=");
	}
	
	// -- 이미지 게시판 리스트 불러오기 --
}
