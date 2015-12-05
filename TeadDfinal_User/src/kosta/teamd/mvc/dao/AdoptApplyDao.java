package kosta.teamd.mvc.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kosta.teamd.vo.AdoptApplyVO;

@Repository
public class AdoptApplyDao {
	
	@Autowired
	private SqlSessionTemplate template;
	
	public void insertAdoptApply(AdoptApplyVO adavo) {
		template.insert("adopt.insertAdoptApply", adavo);
	}
	
	public int selectCntCheck(AdoptApplyVO adavo) {
		return template.selectOne("adopt.selectCntCheck", adavo);
	}
}
