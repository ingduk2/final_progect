package kosta.teamd.mvc.inter;

import kosta.teamd.vo.AniBoardVO;
import kosta.teamd.vo.AnimalVO;
import kosta.teamd.vo.BoardVO;

public interface ImgBoardInsertInter {

	public AniBoardVO imgBoardInsert(BoardVO bvo, AnimalVO anivo) throws Exception;
}
