package kosta.teamd.mvc.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kosta.teamd.vo.BoardVO;
import kosta.teamd.vo.MemberVO;

@Repository
public class BoardDao {
	
	@Autowired
	private SqlSessionTemplate template;
	
	public void insertBoard(BoardVO bvo){
		template.insert("board.insert", bvo);
	}
	public List<BoardVO> listBoard(BoardVO bvo){
		return template.selectList("board.getlist", bvo);
	}
	public BoardVO detailBoard(int bno){
		return template.selectOne("board.detail", bno);
	}
	public void deleteBoard(int bno){
		template.delete("board.delete", bno);
	}
	
	// --------------- 게시글 삭제 시 해당 글에 달린 댓글 모두 삭제 _ FK 처리
		public void deleteAllComm(int bno) {
			template.delete("board.deleteAllComm", bno);
		}
	// --------------- 게시글 삭제 시 해당 글에 달린 댓글 모두 삭제 _ FK 처리
	
	public BoardVO updateFormBoard(int bno){
		return template.selectOne("board.updateform", bno);
	}
	public void updateBoard(BoardVO bvo){
		template.selectOne("board.update", bvo);
	}
	public void hitBoard(int bno){
		template.update("board.hitBoard", bno);
	}
	public void replyBoard(BoardVO bvo){
		template.update("board.replyupdate", bvo);
		template.insert("board.insertreply", bvo);
	}
	public MemberVO namecard(String mid){
		return template.selectOne("board.namecard", mid);
	}

	
	//---------이미지게시판... 위에 일반게시판이랑 중복... 
		public void imgInsert(BoardVO bvo){
			template.insert("board.imgins", bvo);
		}
		
		public void imgDelete(int anino){
			template.delete("board.imgdelete", anino);
		}
		
		public void imgUpdate(BoardVO bvo){
			template.update("board.imgupdate", bvo);	
		}	
		
		// ======================================
		// 일반, 이미지 게시판  조회수 및 신고수 
//			
//		public void hit(int bno){
//			template.update("board.hit", bno);
//		}
//		
		
		
		
		
		
		
		//게시판 신고수
		public void boardRpt(BoardVO bvo){
			template.update("board.brpt", bvo);
		}
		
		// 유저 신고당한 수
		public void memberRpt(BoardVO bvo){
			template.update("board.mrpt", bvo);
		}
		
		// 유저 신고한 수 
		public void mrptUpdate(String mid){
			template.update("board.mrptlimit", mid);
		}
		
		// 신고한 수 출력
		public int cntrptLimit(String mid){
			return template.selectOne("board.cntrptlimit", mid);
		}
		
		// 게시판 블록 코드로 변경
		public void blockBoard(int bno){
			template.update("board.block", bno);
		}
		
		// 제한 초기화 
		public void resetLimit(){
			template.update("board.resetlimit");
		}
		
		// 해당 회원이 작성한, 해당 게시판의 마지막 글 (방금 쓴 글)의 글 번호 추출
		public String selectBno(BoardVO bvo) {
			return template.selectOne("board.selectBno", bvo);
		}
		
		
		//main에 나올 mini board
		public List<BoardVO> mainMiniBoard(BoardVO bvo){
			return template.selectList("board.mainminiboard", bvo);
		}
		
		
		
	
} //end BoardDao
