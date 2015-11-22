package kosta.teamd.mvc.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kosta.teamd.vo.MemRolesVO;
import kosta.teamd.vo.MemberVO;

@Repository
public class MemberDao {

	@Autowired
	private SqlSessionTemplate template;
	
	// 회원 정보 등록
	public void insertMember(MemberVO mvo) {
		
		template.insert("member.insertMember", mvo);
	}
	
	// 회원 권한 등록
	public void insertMemRoles(MemRolesVO mrvo) {
		
		template.insert("member.insertMemRoles", mrvo);
	}
	
	// 회원 정보 삭제
	public void deleteMember(String mid) {
		
		template.delete("member.deleteMember", mid);
	}
	
	// 회원 권한 삭제
	public void deleteMemRoles(String mid) {
		
		template.delete("member.deleteMemRoles", mid);
	}
	
	// 회원 정보 검색
	public MemberVO selectMember(String mid) {
		
		return template.selectOne("member.selectMember", mid);
	}
	
	// 회원 권한 검색
	public MemRolesVO selectMemRoles(String mid) {
		
		return template.selectOne("member.selectMemRoles", mid);
	}
	
	// 회원 정보 수정
	public void updateMember(MemberVO mvo) {
		
		template.update("member.updateMember", mvo);
	}
	
}
