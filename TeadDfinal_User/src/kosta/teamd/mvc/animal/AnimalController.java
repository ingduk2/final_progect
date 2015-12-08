package kosta.teamd.mvc.animal;

import java.io.File;
import java.io.IOException;
import java.security.Principal;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kosta.teamd.mvc.dao.AnimalDao;
import kosta.teamd.mvc.dao.BoardDao;
import kosta.teamd.mvc.dao.CommBoardDao;
import kosta.teamd.mvc.service.AniboardImple;
import kosta.teamd.mvc.service.Paging;
import kosta.teamd.vo.AniBoardVO;
import kosta.teamd.vo.AnimalVO;
import kosta.teamd.vo.BoardVO;
import kosta.teamd.vo.CommBoardVO;

@Controller
public class AnimalController {
	
	//이미지게시판 dao
	@Autowired
	private AnimalDao adao;
	//댓글 dao
	@Autowired
	private CommBoardDao cbdao;
	@Autowired
	private BoardDao bdao;
	
	//이미지게시판 서비서(transactional용)
	@Autowired
	private AniboardImple abi;
	
	@Autowired
	private Paging page;
	
	
	
	// 이미지게시판 쓰기폼
	@RequestMapping(value="/formAnimal")
	public String formAnimal(){
		return "imgboard/imgboardwrite";
	}
	
	// 이미지게시판 insert 
	@RequestMapping(value="insertAnimal", method=RequestMethod.POST)	
	public ModelAndView insertAnimal(AnimalVO avo,BoardVO bvo ,HttpServletRequest request) {
		//세션에 request로 넘오온 세션 갑을 저장
		HttpSession session = request.getSession();
		//세션에서 실제경로를 받음
		String r_path= session.getServletContext().getRealPath("/");
		//이미지 저장폴더 이름
		
		//img가 있어서 upload로 바꿈
		String img_path = "\\img\\";

		// 이미지 전체경로를 저장하기 위해 버퍼를 생성
		StringBuffer path = new StringBuffer();
		path.append(r_path).append(img_path);
		System.out.println(path);
		// mutipartfile의 파일 이름을 가져옴
		String ofile = avo.getManiimg().getOriginalFilename();
		path.append(ofile);
		System.out.println(path);
		//file io 생성해서 이미지 경체 경로를 지정
		File f = new File(path.toString());
		try {
			//mutipartfile에 file을 넣어 전송
			avo.getManiimg().transferTo(f);
		} catch (IllegalStateException | IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		// file 이미지 이름을 저장
		avo.setAniimg(ofile);
		//insert 함
		abi.insert(bvo, avo);
		StringBuffer inspath = new StringBuffer();
		//폴더 경로 보고 바꿔주어야 함.
		///Users/ingduk2/git/final/TeamDfinal
		//선생님이랑 얘기를 해봐야할듯.. 파일이름겹치면 날라가버리고 사진 다 바뀌게 됨.
//		inspath.append("C:\\Users\\kosta\\git\\final\\TeamDfinal\\WebContent\\upload\\").append(ofile);
//		
//	     try {
//	    	 FileInputStream fis = new FileInputStream(path.toString()); 
//	    	 FileOutputStream fos = new FileOutputStream(inspath.toString()); 
//	    	 BufferedInputStream bis = new BufferedInputStream(fis); 
//	    	 BufferedOutputStream bos = new BufferedOutputStream(fos);
//	            int res = 0;
//	            while((res = bis.read()) != -1){
//	            bos.write(res);
//	        }
//	         if(bis != null)   bis.close();
//	         if(bos != null)   bos.close();
//	         if(fis != null)   fis.close();
//	         if(fos != null)   fos.close();
//	        } catch (FileNotFoundException ex) {
//	            ex.printStackTrace();  
//	        } catch(IOException ex){
//	            ex.printStackTrace();  
//	        }
//	     
		
		ModelAndView mav = new ModelAndView("redirect:/selectallAnimal?nowPage=1&searchType=");
    return mav;
	}
	
	@RequestMapping(value="/selectallAnimal")
	public ModelAndView selectallAnimal(AniBoardVO abvo ,int nowPage){
		
		int numPerPage=9;
		int numPerBlock=5;
		//bcode 로 쿼리 추가해야함.
		
		System.out.println(abvo.getSearchType());
		
		String url="selectallAnimal";
		StringBuffer param=new StringBuffer();
		if(abvo.getSearchType().equals("")){
			//null
			param.append("&bcode=").append(abvo.getBcode());
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
			
			param.append("&bcode=").append(abvo.getBcode());
			param.append("&searchType=");
			param.append(abvo.getSearchType()).append("&");
			param.append("searchValue=").append(abvo.getSearchValue());
		}
		System.out.println("1:"+abvo.getSearchType());
		System.out.println("2:"+abvo.getSearchValue());
		System.out.println("3:"+abvo.getBcode());
		int total=adao.imgCnt(abvo);
		System.out.println("Total: "+total);
		
		page.Paging_D(total, nowPage, numPerPage, numPerBlock, url, param.toString());
		
		
		String pagingCode=page.getPagingCode();
		System.out.println(pagingCode);
		
		System.out.println("-----------------");
		
		int start=(nowPage-1)* numPerPage+1;
		int end=start+ numPerPage-1;
		System.out.println("Start : "+start);
		System.out.println("End : " + end);
		System.out.println(abvo.getSearchType());
		System.out.println(abvo.getSearchValue());
		abvo.setStart(start);
		abvo.setEnd(end);
		//////
		List<AniBoardVO> alist = adao.getImgList(abvo);
		ModelAndView mav = new ModelAndView("imgboard/imgboardlist");
		mav.addObject("alist", alist);
		mav.addObject("size",alist.size());
		mav.addObject("pagingCode", pagingCode);
		mav.addObject("bcode", abvo.getBcode());
		
		
	
		
//		int total = adao.imgCnt();
//		System.out.println(total);
//		String url = "selectallAnimal";
//		String pagecode = page.Paging(total, nowPage, 5, 5, url);
		
		return mav;
	}
	
	@RequestMapping(value="/selectoneAnimal")
	public ModelAndView selectoneAnimal(AniBoardVO abvo, Principal prcp){

		// 조회수 처리
		if (prcp != null) {
			
			if (!prcp.getName().equals(abvo.getMid())) {
				bdao.hitBoard(abvo.getBno());
			}
		}
		else {
			bdao.hitBoard(abvo.getBno());
		}
		
		AniBoardVO avo = adao.imgDetail(abvo.getAnino());
		
		ModelAndView mav = new ModelAndView("imgboard/imgboarddetail");
		
		List<CommBoardVO> cbvo = cbdao.commList(abvo.getBno());
		
		// ====================================================== 씨발 내가 병신이라 그런거지 어쩔수 있나

//		if (abvo.getMatchswitch() == 1) {
//		mav.addObject("matchres", abvo.getMatchres());
//		mav.addObject("matchswitch", abvo.getMatchswitch());
//		}
		
		// 매칭 결과 전달 시작
		avo.setMatchswitch(abvo.getMatchswitch());
		
		if(abvo.getMatchswitch() == 1) {
			
			avo.setMatchmsg("<h4>이 아이들 중에 찾으시는 아이가 있나요?</h4>");
			
			System.out.println("Log: First - " + abvo.getFirst());
			System.out.println("Log: Second - " + abvo.getSecond());
			System.out.println("Log: Third - " + abvo.getThird());

			List<AniBoardVO> top = new LinkedList<>();
			if (abvo.getFirst() != 313048) top.add(0, adao.imgDetail(abvo.getFirst()));
			if (abvo.getSecond() != 313048) top.add(1, adao.imgDetail(abvo.getSecond()));
			if (abvo.getThird() != 313048) top.add(2, adao.imgDetail(abvo.getThird()));
		
			mav.addObject("top", top);
			mav.addObject("size", top.size());
		}
		else if (abvo.getMatchswitch() == 313048) {
			avo.setMatchmsg("<h4>죄송합니다. 매칭 정보가 없습니다.</h4>");
		}
		// 매칭 결과 전달 끝
		
		// ====================================================== 씨발 내가 병신이라 그런거지 어쩔수 있나
		
		mav.addObject("avo", avo);
		mav.addObject("cbvo", cbvo);
		
		return mav;
	}
	
	
	@RequestMapping(value="/deleteAnimal")
	public ModelAndView deleteAnimal(int anino,int bcode){
		System.out.println(anino);
		abi.delete(anino);
		//게시판도 삭제
		//댓글도 삭제
		
		ModelAndView mav= new ModelAndView("redirect:/selectallAnimal");
		mav.addObject("bcode",bcode);
		mav.addObject("nowPage",1);
		mav.addObject("searchType","");
		return mav;
		
	}
	
	//////수정
	//이미지폼 실행
	@RequestMapping(value="/updateformAnimal")
	public ModelAndView updateformAnimal(int anino){
		AniBoardVO avo = adao.imgDetail(anino);
		ModelAndView mav = new ModelAndView("imgboard/imgupdate");
		mav.addObject("avo", avo);
		return mav;
	}
	
	/////수장
	//이미지 업로드 실행 
	@RequestMapping(value="/updateAnimal", method=RequestMethod.POST)
	public ModelAndView updateAnimal(AnimalVO avo,  BoardVO bvo, HttpServletRequest request){
		
		HttpSession session = request.getSession();
		String r_path = session.getServletContext().getRealPath("/");
		String img_path = "\\img\\";
		String ofile = avo.getManiimg().getOriginalFilename();
		StringBuffer path = new StringBuffer();
		path.append(r_path).append(img_path).append(ofile);
		System.out.println(path);
		File f = new File(path.toString());
		try {
			avo.getManiimg().transferTo(f);
		} catch (IllegalStateException | IOException e) {		
			e.printStackTrace();
		}
		avo.setAniimg(ofile);
		abi.update(bvo, avo);
		return new ModelAndView("redirect:/selectoneAnimal?anino="+avo.getAnino()+"&bno="+bvo.getBno());
	}
	
	
	
	//신고수 업데이트
	@RequestMapping(value="/updateRptAnimal")
	public ModelAndView updaterptAnimal(int bno ,String mid, int rpt){
		System.out.println("p : "+mid);
		int cnt = bdao.cntrptLimit(mid); //3
		System.out.println("cnt : "+ cnt);
		ModelAndView mav = new ModelAndView("checkpage/rptchk");
		if(cnt>0){ //신고 가능 >0
		BoardVO bvo = bdao.detailBoard(bno);
		String id = bvo.getMid();
		System.out.println("test : " +id);
		int rptcnt = 15; //신고제한수 
		abi.rptUpdate(bvo, mid); // -1 2,
		int brpt= bvo.getBrpt(); // 게시글 신고수 업데이트 후 
		mav.addObject("rpt", brpt);
		System.out.println("rpt : " + brpt);
		if(brpt >= rptcnt){
			bdao.blockBoard(bno);
		}
		return mav;
		}else{ //<=0
		BoardVO bvo = bdao.detailBoard(bno);
			System.out.println("-cnt : "+cnt);
			mav.addObject("rpt", rpt);
			System.out.println("rpt : " + rpt);
			return mav;
		}
	}
	
	
}
