package kosta.teamd.mvc.dao;

import java.util.List;

import kosta.teamd.vo.SurveyLogVO;
import kosta.teamd.vo.SurveyVO;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;import org.springframework.web.bind.annotation.RequestMethod;
@Repository
public class SurveyDao {
	@Autowired
	private SqlSessionTemplate template;

	public void insert(SurveyLogVO sv){
		template.insert("surveylog.insert", sv);
	}
	
	public void surveyUpdate(SurveyVO v){
		template.update("survey.surveyUpdate", v);
	}
		
	public SurveyVO getDetail(int num){
		return template.selectOne("survey.surveyDetail",num);
	}

	// 아이피 중복 체크
		public int ipCheck(SurveyLogVO sv) {
			return template.selectOne("surveylog.ipCheck", sv);
		}

}
