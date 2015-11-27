package kosta.teamd.mvc.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kosta.teamd.vo.AniBoardVO;
import kosta.teamd.vo.AnimalVO;
import kosta.teamd.vo.BoardVO;

@Repository
public class AnimalDao{
	

	@Autowired
	private SqlSessionTemplate ss;
	
	// insert 이미지게시판 내용
	public void imgInsert(AnimalVO avo) {
		ss.insert("animal.imgins", avo);
	}
	
	//  이미지게시판 리스트 출력
	public List<AniBoardVO> getImgList(){
		return ss.selectList("animal.imglist");
	}
	
	// 이미지게시판 상세보기 출력
	public AniBoardVO imgDetail(int anino){
		return ss.selectOne("animal.imgdetail", anino);
	}
	
	// 이미지게시판 삭제
	public void imgDelete(int anino){
		ss.delete("animal.imgdelete", anino);
	}
	
	//이미지게시판 업데이트
	public void imgUpdate(AnimalVO avo){
		ss.update("animal.imgupdate", avo);
	}
	
	//서치값이랑 합쳐야함.
	public int imgCnt(){
	  return ss.selectOne("animal.imgcnt");
	}
	
	
}
