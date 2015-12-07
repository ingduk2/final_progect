package kosta.teamd.mvc.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.security.Principal;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kosta.teamd.mvc.dao.BoardDao;
import kosta.teamd.mvc.dao.CommBoardDao;
import kosta.teamd.mvc.inter.BoardDeleteInter;
import kosta.teamd.mvc.service.Paging;
import kosta.teamd.vo.BoardVO;
import kosta.teamd.vo.CommBoardVO;
import kosta.teamd.vo.MemberVO;

@Controller
public class BoardController {
	
	@Autowired
	private BoardDao bdao;
	@Autowired
	private CommBoardDao cbdao;
	
	@Autowired
	private Paging page;
	
	@RequestMapping(value="/formBoard")
	public ModelAndView formBoard(String bcode, String nowPage){
		ModelAndView mav=new ModelAndView("board/boardwrite");
		mav.addObject("bcode", bcode);
		mav.addObject("nowPage", nowPage);
		System.out.println("nowPage="+nowPage);
		return mav;
	}
	
	@RequestMapping(value="/insertBoard", method=RequestMethod.POST)
	public ModelAndView insertBoard(BoardVO bvo, String nowPage, HttpServletRequest request) {
		
		HttpSession session=request.getSession();
		String r_path=session.getServletContext().getRealPath("/");
		
		StringBuffer sb=new StringBuffer();
		sb.append(r_path).append("\\img\\");
		
		String originalFile=bvo.getMfile().getOriginalFilename();
		sb.append(originalFile);
		
		File file=new File(sb.toString());
		
		try {
			bvo.getMfile().transferTo(file);
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
		}
		
		bvo.setBfile(originalFile);
		int a=bdao.insertBoard(bvo);
		
//		String bno = bdao.selectBno(bvo);
		
		
		ModelAndView mav=new ModelAndView("redirect:/selectoneBoard?bno="+a+"&mid="+bvo.getMid()+"&nowPage="+nowPage);

		return mav;
	}
	
	@RequestMapping(value="/selectallBoard")
	public ModelAndView selectallBoard(BoardVO bvo, int nowPage) {
		System.out.println("getBcode "+bvo.getBcode());
		System.out.println("getSearchType "+bvo.getSearchType());
		System.out.println("getSearchValue "+bvo.getSearchValue());
		
		 
		
		//paging
		int numPerPage=10;
		int numPerBlock=5;
		
		String url="selectallBoard";
		StringBuffer param=new StringBuffer();
		if(bvo.getSearchType().equals("")){
			//null
			param.append("&bcode=").append(bvo.getBcode());
			param.append("&searchType=");
			
		}else{
			//search
//			String[] temp=abvo.getSearchType().split(",");
//			
//			try {
//				abvo.setSearchType(temp[1]);
//				System.out.println("searchType : "+temp[1]);
//			} catch (Exception e) {
//				// TODO: handle exception
//				e.printStackTrace();
//			}
			
			param.append("&bcode=").append(bvo.getBcode());
			param.append("&searchType=");
			param.append(bvo.getSearchType()).append("&");
			param.append("searchValue=").append(bvo.getSearchValue());
		}
		System.out.println("1:"+bvo.getSearchType());
		System.out.println("2:"+bvo.getSearchValue());
		System.out.println("3:"+bvo.getBcode());
		int total=bdao.boardCnt(bvo);
		System.out.println("Total: "+total);
		
		page.Paging_D(total, nowPage, numPerPage, numPerBlock, url, param.toString());
		String pagingCode=page.getPagingCode();
		System.out.println(pagingCode);
		System.out.println("-----------------");
		int start=(nowPage-1)* numPerPage+1;
		int end=start+ numPerPage-1;
		System.out.println("Start : "+start);
		System.out.println("End : " + end);
		System.out.println(bvo.getSearchType());
		System.out.println(bvo.getSearchValue());
		bvo.setStart(start);
		bvo.setEnd(end);
		
		
		
		List<BoardVO> list=bdao.listBoard(bvo);
		ModelAndView mav=new ModelAndView("board/boardlist");
		mav.addObject("list", list);
		mav.addObject("pagingCode", pagingCode);
		mav.addObject("bcode", bvo.getBcode());
		mav.addObject("nowPage", nowPage);
		return mav;
	}
	
	@RequestMapping(value="/selectoneBoard")
	public ModelAndView selectoneBoard(int bno, String mid, String nowPage, Principal prcp){
		
		if (prcp != null) {
			
			if (!prcp.getName().equals(mid)) {
				//hit
				bdao.hitBoard(bno);
			}
		}
		else {
			bdao.hitBoard(bno);
		}
		
		MemberVO mvo= bdao.namecard(mid);
		
		BoardVO bvo=bdao.detailBoard(bno);
		List<CommBoardVO> list=cbdao.selectCommBoard(bno);
		
		ModelAndView mav=new ModelAndView("board/boarddetail");
		mav.addObject("bvo", bvo);
		mav.addObject("list", list);
		mav.addObject("namecard", mvo);
		mav.addObject("nowPage", nowPage);
		
		return mav;
	}
	
	@Autowired
	private BoardDeleteInter bdelete;
	
	@RequestMapping(value="/deleteBoard")
	public ModelAndView deleteBoard(int bno, int bcode) throws Exception{
		
		bdelete.boardDelete(bno);
		
		return new ModelAndView("redirect:/selectallBoard?bcode="+bcode+"&nowPage=1&searchType=");
	}
	
	@RequestMapping(value="/updateformBoard")
	public ModelAndView updateformBoard(int bno, String nowPage){
		BoardVO bvo=bdao.updateFormBoard(bno);
		ModelAndView mav=new ModelAndView("board/boardupdate");
		mav.addObject("bvo", bvo);
		mav.addObject("nowPage", nowPage);
		return mav;
	}
	@RequestMapping(value="/updateBoard", method=RequestMethod.POST)
	public ModelAndView updateBoard(BoardVO bvo, String nowPage){
		System.out.println(bvo.getBtitle());
		System.out.println("log ex");
		bdao.updateBoard(bvo);
		ModelAndView mav=new ModelAndView("redirect:/selectoneBoard?bno="+String.valueOf(bvo.getBno())+"&mid="+bvo.getMid()+"&nowPage="+nowPage);
		return mav;
	}
	
	private static final int BUFFER_SIZE=4096;
	@RequestMapping(value="/fileDown")
	public void filedownBoard(@RequestParam("fileName") String fileName, HttpSession session, HttpServletRequest request, HttpServletResponse response) throws IOException{
		System.out.println("log1");
		System.out.println("log2");
		System.out.println("log2");
		ServletContext context = request.getServletContext();
		String path=session.getServletContext().getRealPath("/img/")+fileName;
		File downloadFile=new File(path);
		FileInputStream inputStream=new FileInputStream(downloadFile);
		String mineType=context.getMimeType(path);
		if (mineType==null) {
			mineType="application/octet-stream";
		}
		response.setContentType(mineType);
		response.setContentLength((int) downloadFile.length());
		
		String headerkey="Content-Disposition";
		String headerValue=String.format("attachment; filename=\"%s\"", downloadFile.getName());
		response.setHeader(headerkey, headerValue);
		OutputStream outStream=response.getOutputStream();
		byte[] buffer=new byte[BUFFER_SIZE];
		int bytesRead=-1;
		while((bytesRead=inputStream.read(buffer))!=-1){
			outStream.write(buffer, 0, bytesRead);
		}
		inputStream.close();
		outStream.close();
	}
	
	
	@RequestMapping(value="/formReply")
	public ModelAndView formReply(BoardVO bvo, String nowPage){
		System.out.println("Bref "+bvo.getBref());
		System.out.println("Bseq "+bvo.getBseq());
		System.out.println("Blvl "+bvo.getBlvl());
		System.out.println("Bcode "+bvo.getBcode());
		ModelAndView mav=new ModelAndView("board/boardreply");
		mav.addObject("reply", bvo);
		mav.addObject("nowPage", nowPage);
		return mav;
	}
	
	
	@RequestMapping(value="/insertReply", method=RequestMethod.POST)
	public ModelAndView insertReply(BoardVO bvo, String nowPage, HttpServletRequest request){
		
		HttpSession session=request.getSession();
		String r_path=session.getServletContext().getRealPath("/");
		
		StringBuffer sb=new StringBuffer();
		sb.append(r_path).append("\\img\\");
		
		String originalFile=bvo.getMfile().getOriginalFilename();
		sb.append(originalFile);
		
		File file=new File(sb.toString());
		
		try {
			bvo.getMfile().transferTo(file);
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
		}
		
		bvo.setBfile(originalFile);
		bdao.replyBoard(bvo);
		
		String bno = bdao.selectBno(bvo);
		
		ModelAndView mav=new ModelAndView("redirect:/selectoneBoard?bno="+bno+"&mid="+bvo.getMid()+"&nowPage="+nowPage);
		
		return mav;
	}
	
	// -- 게시글 및 글 작성자 신고 카운트 --
	
}
