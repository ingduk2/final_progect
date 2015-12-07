package kosta.teamd.mvc.animal;

import org.quartz.JobExecutionException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import kosta.teamd.mvc.dao.BoardDao;

@Component
public class CronQuartz1 {

	private int count=0;
	@Autowired
	private BoardDao bdao;
	
	//20초마다 실행 
//	@Scheduled(cron="0/20 * * * * ?")
	public void reset() throws Exception{
		
		try{
		System.out.println("24시 신고수 초기화  시작");
		bdao.resetLimit();
		System.out.println("24시 신고수 초기화  완료");
				}catch(Exception e){
						count++;;
				JobExecutionException jex = new JobExecutionException();
				 System.out.println("예외 재시도 전 : " + jex.refireImmediately());
				if(count < 3){
					jex.setRefireImmediately(true);
				}
				System.out.println("count : " + count);
				System.out.println("예외 재시도 후 : " + jex.refireImmediately());
				
				}
	}
}
