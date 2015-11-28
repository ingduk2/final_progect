package kosta.teamd.mvc.imple;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kosta.teamd.mvc.dao.BoardDao;
import kosta.teamd.mvc.inter.BoardDeleteInter;

@Service
public class BoardImple implements BoardDeleteInter {

	@Autowired
	private BoardDao bdao;
	
	@Transactional
	@Override
	public void boardDelete(int bno) throws Exception {

		bdao.deleteAllComm(bno);
		bdao.deleteBoard(bno);
	}
}
