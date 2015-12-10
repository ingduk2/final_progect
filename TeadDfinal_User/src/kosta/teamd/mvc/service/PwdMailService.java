package kosta.teamd.mvc.service;

import java.util.Random;

import javax.mail.MessagingException;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import kosta.teamd.mvc.dao.MemberDao;
import kosta.teamd.vo.MemberVO;

@Service
public class PwdMailService {
	
	@Autowired
	private JavaMailSender mailSender;
	@Autowired
	private MemberDao mdao;
	
	//메일 보내기  
	public void loginMail(String mid, String email) throws AddressException, MessagingException{
		MimeMessage message = mailSender.createMimeMessage();
		String adEmail = "teamD<ggamagu100@gmail.com>";// 관리자 메일 
		String subject = "비밀번호 변경 안내 이메일 입니다.";  // 메일 제목
		StringBuffer sendpwd = new StringBuffer();
		System.out.println(adEmail);
		System.out.println(subject);
		Random rpwd = new Random(); //자바 랜덤
		int pass = 0; // 숫자
		int passA = 0; // 알파벳 소문자 용
		System.out.println("랜덤수");
		for(int i =0; i<=6; i++){ //변경 비밀번호 구하기
		pass = rpwd.nextInt(9)+49; //0~9  
		passA =rpwd.nextInt(25)+98; // a~z
		sendpwd.append((char)pass).append((char)passA);
		}
		System.out.println(sendpwd.toString());
		System.out.println(pass);
		StringBuffer sb = new StringBuffer();
		sb.append(mid).append("님 ").append("변경된 비밀번호는 ").append(sendpwd.toString()).append("입니다.");
		sb.append("변경된 비밀번호로 접속해 주세요!"); // 메일 내용.. 
		message.setFrom(new InternetAddress(adEmail)); // 보내는 메일  메세지에 저장
		StringBuffer recmail = new StringBuffer();
		recmail.append(mid).append("<").append(email).append(">");
		message.addRecipient(RecipientType.TO, new InternetAddress(recmail.toString())); // 받는 메일 메세지에 저장
		message.setSubject(subject); //메일 제목 메세지에 저장
		message.setText(sb.toString(),"utf-8");  //메일 내용  저장
		mailSender.send(message);  //메일 보낼 내용을 담은... 메세지를 mailsender로 전송
		MemberVO mvo = new MemberVO();
		mvo.setMid(mid); mvo.setMpwd(sendpwd.toString());;
		mdao.updatePwd(mvo); // 변경된 비밀번호 db에 저장
		System.out.println("비밀번호 변경 완료.!!");
	}

}
