package kosta.teamd.mvc.animal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import kosta.teamd.mvc.dao.BoardDao;

@Component
public class CronQuartz1 {

	@Autowired
	private BoardDao bdao;
	
	@Scheduled(cron="0 52 13 * * ?")
	public void reset() throws Exception{
		System.out.println("24시 신고수 초기화  시작");
		bdao.resetLimit();
		System.out.println("24시 신고수 초기화  완료");
	}
}
