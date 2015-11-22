package kosta.teamd.mvc.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
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
import kosta.teamd.vo.BoardVO;
import kosta.teamd.vo.CommBoardVO;

@Controller
public class BoardController {
	
	@Autowired
	private BoardDao bdao;
	@Autowired
	private CommBoardDao cbdao;
	
	@RequestMapping(value="boardwrite")
	public ModelAndView writeBoard(String bcode){
		ModelAndView mav=new ModelAndView("board/boardwrite");
		mav.addObject("bcode", bcode);
		return mav;
	}
	
	@RequestMapping(value="/insertboard", method=RequestMethod.POST)
	public ModelAndView insertBoard(BoardVO bvo, HttpServletRequest request) {
		System.out.println("log1");
		String bcode=String.valueOf(bvo.getBcode());
		ModelAndView mav=new ModelAndView("redirect:/boardlist?bcode="+bcode);
		
		HttpSession session=request.getSession();
		String r_path=session.getServletContext().getRealPath("/");
		System.out.println("log2");
		
		StringBuffer sb=new StringBuffer();
		sb.append(r_path).append("\\img\\");
		
		String originalFile=bvo.getMfile().getOriginalFilename();
		sb.append(originalFile);
		
		File file=new File(sb.toString());
		System.out.println("log3");
		
		try {
			bvo.getMfile().transferTo(file);
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
		}
		System.out.println("log4");
		
		bvo.setBfile(originalFile);
		System.out.println("log5");
		bdao.insertBoard(bvo);
		System.out.println("log6");
		
		return mav;
	}
	
	@RequestMapping(value="/boardlist")
	public ModelAndView listBoard(int bcode) {
		List<BoardVO> list=bdao.listBoard(bcode);
		ModelAndView mav=new ModelAndView("board/boardlist");
		
		mav.addObject("list", list);
		mav.addObject("bcode", bcode);
		return mav;
	}
	
	@RequestMapping(value="/boarddetail")
	public ModelAndView detailBoard(int bno){
		//hit
		bdao.hitBoard(bno);
		
		BoardVO bvo=bdao.detailBoard(bno);
		List<CommBoardVO> list=cbdao.selectCommBoard(bno);
		
		ModelAndView mav=new ModelAndView("board/boarddetail");
		
//		System.out.println("--");
//		System.out.println("<br>");
//		System.out.println("<br>");
//		System.out.println("--");
//		
//		System.out.println(bvo.getBcontent().replaceAll("\n", "<br/>"));
//		bvo.setBcontent(bvo.getBcontent().replaceAll("\n", "<br/>"));
//		System.out.println(bvo.getBcontent());
		mav.addObject("bvo", bvo);
		mav.addObject("list", list);
		
		return mav;
	}
	
	@RequestMapping(value="/boarddelete")
	public ModelAndView deleteBoard(int bno, int bcode){
		bdao.deleteBoard(bno);
		return new ModelAndView("redirect:/boardlist?bcode="+bcode);
	}
	
	@RequestMapping(value="/boardupdateform")
	public ModelAndView updateFormBoard(int bno){
		BoardVO bvo=bdao.updateFormBoard(bno);
		ModelAndView mav=new ModelAndView("board/boardupdate");
		mav.addObject("bvo", bvo);
		return mav;
	}
	@RequestMapping(value="boardupdate", method=RequestMethod.POST)
	public ModelAndView updateBoard(BoardVO bvo){
		System.out.println(bvo.getBtitle());
		bdao.updateBoard(bvo);
		ModelAndView mav=new ModelAndView("redirect:/boarddetail?bno="+String.valueOf(bvo.getBno()));
		return mav;
	}
	
	private static final int BUFFER_SIZE=4096;
	@RequestMapping(value="/fileDown")
	public void fileDownBoard(@RequestParam("fileName") String fileName, HttpSession session, HttpServletRequest request, HttpServletResponse response) throws IOException{
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
	
	
}
