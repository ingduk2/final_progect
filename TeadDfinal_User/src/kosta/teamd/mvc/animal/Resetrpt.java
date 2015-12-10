package kosta.teamd.mvc.animal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import kosta.teamd.mvc.dao.BoardDao;

@Component
public class Resetrpt {

	@Autowired
	private BoardDao bdao;
	
	// 24시 실행
//	@Scheduled(cron="0/20 * * * * ?")
	public void reset() throws Exception{
		System.out.println("00시 신고수 초기화  시작");
		bdao.resetLimit();  // rpt 초기화 
		System.out.println("00시 신고수 초기화  완료");
		}
}