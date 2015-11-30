package kosta.teamd.mvc.dao;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kosta.teamd.vo.AdoptApplyVO;

@Repository
public class AdoptApplyDao {
	
	@Autowired
	private SqlSessionTemplate template;
	
	public void insertAdopt(AdoptApplyVO adavo){
		template.insert("adopt.insertadopt", adavo);
	}
}
