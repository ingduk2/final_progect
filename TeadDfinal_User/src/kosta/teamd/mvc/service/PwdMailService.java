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
	
	
	
	//메일 보내기  메소드
	public void loginMail(String mid, String email) throws AddressException, MessagingException{
		MimeMessage message = mailSender.createMimeMessage();
		String adEmail = "ggamagu100@gmail.com";
		String subject = "비밀번호 변경 안내 이메일 입니다.";
		StringBuffer sendpwd = new StringBuffer();
		System.out.println(adEmail);
		System.out.println(subject);
		Random rpwd = new Random();
		int pass = 0;
		int passA = 0;
		System.out.println("랜덤수");
		
		for(int i =0; i<=6; i++){
		pass = rpwd.nextInt(9)+49;
		passA =rpwd.nextInt(25)+98;
		sendpwd.append((char)pass).append((char)passA);
		}
		System.out.println(sendpwd.toString());
		System.out.println(pass);
		StringBuffer sb = new StringBuffer();
		sb.append(mid).append("님 ").append("변경된 비밀번호는 ").append(sendpwd.toString()).append("입니다.");
		sb.append("변경된 비밀번호로 접속해 주세요!");
		message.setFrom(new InternetAddress(adEmail));
		message.addRecipient(RecipientType.TO, new InternetAddress(email));
		message.setSubject(subject);
		message.setText(sb.toString(),"utf-8");
		mailSender.send(message);
		MemberVO mvo = new MemberVO();
		mvo.setMid(mid); mvo.setMpwd(sendpwd.toString());;
		mdao.updatePwd(mvo);
		System.out.println("비밀번호 변경 완료.!!");
	}

}
