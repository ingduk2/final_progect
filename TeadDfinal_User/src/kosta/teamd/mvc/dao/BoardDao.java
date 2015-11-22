package kosta.teamd.mvc.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kosta.teamd.vo.BoardVO;

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
	
} //end BoardDao
