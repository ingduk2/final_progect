package kosta.teamd.mvc.websocket;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.ArrayList;

import org.springframework.stereotype.Component;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import kosta.teamd.vo.ChatVO;

@Component("sampleWebSocketHandler")
public class SampleWebSocketHandler extends TextWebSocketHandler {
	private List<WebSocketSession> sessionList;
	private List<ChatVO> list;

	public List<ChatVO> getList() {
		return list;
	}

	public void setList(List<ChatVO> list) {
		this.list = list;
	}

	public SimpleDateFormat timeFormat;

	public SampleWebSocketHandler() {
		super();
		setSessionList(new ArrayList<WebSocketSession>());
		// list=new ArrayList<ChatVO>();
		setList(new ArrayList<ChatVO>());
		setTimeFormat(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss"));
		// TODO 자동 생성된 생성자 스텁
	}

	@Override
	/**
	 * 접속시 실행되는 메소드
	 */
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {

		System.out.println("-------connect--------");

		Map<String, Object> map = session.getAttributes();
		String id = (String) map.get("usrId");
		String code = (String) map.get("code");
		System.out.println("ididid : " + id);
		
		//로그인 안했으면 그냥 id를 id로 집어넣음
		if (id.equals("")) {
			System.out.println("id is null");
			id = session.getId();
		}
		System.out.println("code : " + code);

		String[] temp = code.split("/");
		ChatVO cvo = new ChatVO();
		cvo.setUser(id); // 각각 아이디
		cvo.setRoom(temp[0]); // 각각 룸
		cvo.setCode(temp[1]); // 각각 룸 코드
		cvo.setSession(session); // 각각 세션..
		list.add(cvo);

		for (ChatVO e : list) {
			System.out.println(e.getUser() + "/" + e.getRoom() + "/" + e.getCode() + "/" + e.getSession());
		}

		String broadCastMessage = id + "님께서 입장하셨습니다[" + getTimeFormat().format(new Date()) + "]";
		// for(WebSocketSession user: getSessionList()){
		// user.sendMessage(new TextMessage(broadCastMessage));
		// }

		if (cvo.getRoom().equals("animal") && cvo.getCode().equals("4")) {
			for (ChatVO e : list) {
				if (e.getRoom().equals("animal") && e.getCode().equals("4")) {
					e.getSession().sendMessage(new TextMessage(broadCastMessage));
				}
				// code 추가되면 늘려야함 일단 동물게시판 하나랑 게시판들 분리시킬거임!
			}
		} else if (cvo.getRoom().equals("animal") && cvo.getCode().equals("5")) {
			for (ChatVO e : list) {
				if (e.getRoom().equals("animal") && e.getCode().equals("5")) {
					e.getSession().sendMessage(new TextMessage(broadCastMessage));
				}
				// code 추가되면 늘려야함 일단 동물게시판 하나랑 게시판들 분리시킬거임!
			}
		}

		else if (cvo.getRoom().equals("board") && cvo.getCode().equals("2")) {
			for (ChatVO e : list) {
				if (e.getRoom().equals("board") && e.getCode().equals("2")) {
					e.getSession().sendMessage(new TextMessage(broadCastMessage));
				}
			}
		} else if (cvo.getRoom().equals("board") && cvo.getCode().equals("3")) {
			for (ChatVO e : list) {
				if (e.getRoom().equals("board") && e.getCode().equals("3")) {
					e.getSession().sendMessage(new TextMessage(broadCastMessage));
				}
			}
		}

		session.sendMessage(new TextMessage("당신의 아이디는 " + id + " 입니다."));
		System.out.println("-----------------------");

	}

	/**
	 * 메시지 핸들러
	 */
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {

		System.out.println("Log------");
		System.out.print(message.getPayload());
		System.out.println("--msg end---");
		
		
		
		
		// for(WebSocketSession user: getSessionList()){
		// user.sendMessage(new TextMessage(broadCastMessage));
		// }
		String id = session.getId();
		String user="";
		String room = "";
		String code = "";
		// 검색.. 리스트 뒤짐
		for (ChatVO e : list) {
			if (id.equals(e.getSession().getId())) {
				user=e.getUser();
				room = e.getRoom();
				code = e.getCode();
				break;
			}
		}
		
		String broadCastMessage = user + ":" + message.getPayload() + "["
				+ getTimeFormat().format(new Date()) + "]";
		
		if (room.equals("animal") && code.equals("4")) {
			for (ChatVO e : list) {
				if (e.getRoom().equals("animal") && e.getCode().equals("4")) {
					e.getSession().sendMessage(new TextMessage(broadCastMessage));
				}
				// code 추가되면 늘려야함 일단 동물게시판 하나랑 게시판들 분리시킬거임!
			}
		} else if (room.equals("animal") && code.equals("5")) {
			for (ChatVO e : list) {
				if (e.getRoom().equals("animal") && e.getCode().equals("5")) {
					e.getSession().sendMessage(new TextMessage(broadCastMessage));
				}
				// code 추가되면 늘려야함 일단 동물게시판 하나랑 게시판들 분리시킬거임!
			}
		}

		else if (room.equals("board") && code.equals("2")) {
			for (ChatVO e : list) {
				if (e.getRoom().equals("board") && e.getCode().equals("2")) {
					e.getSession().sendMessage(new TextMessage(broadCastMessage));
				}
			}
		} else if (room.equals("board") && code.equals("3")) {
			for (ChatVO e : list) {
				if (e.getRoom().equals("board") && e.getCode().equals("3")) {
					e.getSession().sendMessage(new TextMessage(broadCastMessage));
				}
			}
		}
	}

	@Override
	/**
	 * 접속종료시 실행되는 메소드
	 */
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		System.out.println("퇴장퇴장.....지워야함,,,");
		getSessionList().remove(session);

		for (ChatVO e : list) {
			if (e.getSession().getId().equals(session.getId())) {
				getList().remove(e);
				break;
			}
		}
		// 아.. 얘 어케지워야하지..?

		String broadCastMessage = session.getId() + "님이 퇴장하였습니다" + "[" + getTimeFormat().format(new Date()) + "]";
		for (WebSocketSession user : getSessionList()) {
			user.sendMessage(new TextMessage(broadCastMessage));
		}
	}

	/**
	 * @return sessionList
	 */
	public List<WebSocketSession> getSessionList() {
		return sessionList;
	}

	/**
	 * @param sessionList
	 *            설정할 sessionList
	 */
	public void setSessionList(List<WebSocketSession> sessionList) {
		this.sessionList = sessionList;
	}

	/**
	 * @return timeFormat
	 */
	public SimpleDateFormat getTimeFormat() {
		return timeFormat;
	}

	/**
	 * @param timeFormat
	 *            설정할 timeFormat
	 */
	public void setTimeFormat(SimpleDateFormat timeFormat) {
		this.timeFormat = timeFormat;
	}

}