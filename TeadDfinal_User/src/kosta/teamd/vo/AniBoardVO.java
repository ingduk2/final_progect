package kosta.teamd.vo;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class AniBoardVO {
	private int anino;          // 동물 등록 번호
	private String anispecies;  // 동물 분류(동물종)
	private String anibreed;    // 동물 분류(품종)
	private String aniname;     // 이름
	private int aniage;         // 나이
	private String anisex;      // 성별 _ 남아, 여아
	private String anisize;     // 크기 분류 _ 소, 중, 대
	private int aniweight;      // 몸무게
	private String anifeature;  // 특징
	private String aniregion;   // (실종, 발견)지역
	private String anidate;     // (실종, 발견)날짜
	
	
	private int anireward;          // 사례금
	private int anistate;           // 동물 등록 상태(실종, 발견, 개인 보호)
	
	private String anineutral;      // 추가 : 중성화 여부
	
	private String aniimg;      // 동물 사진 파일 이름
	private MultipartFile maniimg; //이미지 업로드용
	
	private int bcode;        // 분류코드 (1,2,3,4,5)
	private int boricode;     // 원래 분류코드 (1,2,3,4,5)
	private int bno;          // 글 번호
	private String btitle;    // 제목
	private String mid;       // 작성자(회원 아이디)
	private String bcontent;  // 내용
	private String bdate;     // 작성 일자
	private int bhit;         // 조회수
	private int bref;         // 답글_원본 글 번호
	private int bseq;         // 답글_답글 순서
	private int blvl;         // 답글_트리 단계
	private String bip;       // 작성자 IP
	private String bfile;     // 첨부 파일 이름
	private int brpt;         // 신고당한 횟수
	
	//페이징 , 검색
	private String searchType, searchValue;
	private int start, end;
	
	// 매칭 결과
//	private AniBoardVO[] matchres;
	private int matchswitch;
	private String matchmsg;
	
	public String getMatchmsg() {
		return matchmsg;
	}
	public void setMatchmsg(String matchmsg) {
		this.matchmsg = matchmsg;
	}
	
	// ====================================================== 씨발 내가 병신이라 그런거지 어쩔수 있나
	private int first, second, third;

	public int getFirst() {
		return first;
	}
	public void setFirst(int first) {
		this.first = first;
	}
	public int getSecond() {
		return second;
	}
	public void setSecond(int second) {
		this.second = second;
	}
	public int getThird() {
		return third;
	}
	public void setThird(int third) {
		this.third = third;
	}
	
	// ====================================================== 씨발 내가 병신이라 그런거지 어쩔수 있나
	
	

	//	public AniBoardVO[] getMatchres() {
//		return matchres;
//	}
//	public void setMatchres(AniBoardVO[] matchres) {
//		this.matchres = matchres;
//	}
	public int getMatchswitch() {
		return matchswitch;
	}
	public void setMatchswitch(int matchswitch) {
		this.matchswitch = matchswitch;
	}

	public String getSearchType() {
		return searchType;
	}
	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}
	public String getSearchValue() {
		return searchValue;
	}
	public void setSearchValue(String searchValue) {
		this.searchValue = searchValue;
	}
	public int getStart() {
		return start;
	}
	public void setStart(int start) {
		this.start = start;
	}
	public int getEnd() {
		return end;
	}
	public void setEnd(int end) {
		this.end = end;
	}
	public int getAnireward() {
		return anireward;
	}
	public void setAnireward(int anireward) {
		this.anireward = anireward;
	}
	public int getAnistate() {
		return anistate;
	}
	public void setAnistate(int anistate) {
		this.anistate = anistate;
	}
	
	public int getBrpt() {
		return brpt;
	}
	public void setBrpt(int brpt) {
		this.brpt = brpt;
	}
	public int getAnino() {
		return anino;
	}
	public void setAnino(int anino) {
		this.anino = anino;
	}
	public String getAnispecies() {
		return anispecies;
	}
	public void setAnispecies(String anispecies) {
		this.anispecies = anispecies;
	}
	public String getAnibreed() {
		return anibreed;
	}
	public void setAnibreed(String anibreed) {
		this.anibreed = anibreed;
	}
	public String getAniname() {
		return aniname;
	}
	public void setAniname(String aniname) {
		this.aniname = aniname;
	}
	public int getAniage() {
		return aniage;
	}
	public void setAniage(int aniage) {
		this.aniage = aniage;
	}
	public String getAnisex() {
		return anisex;
	}
	public void setAnisex(String anisex) {
		this.anisex = anisex;
	}
	public String getAnisize() {
		return anisize;
	}
	public void setAnisize(String anisize) {
		this.anisize = anisize;
	}
	public int getAniweight() {
		return aniweight;
	}
	public void setAniweight(int aniweight) {
		this.aniweight = aniweight;
	}
	public String getAnifeature() {
		return anifeature;
	}
	public void setAnifeature(String anifeature) {
		this.anifeature = anifeature;
	}
	public String getAniregion() {
		return aniregion;
	}
	public void setAniregion(String aniregion) {
		this.aniregion = aniregion;
	}
	public String getAnidate() {
		return anidate;
	}
	public void setAnidate(String anidate) {
		this.anidate = anidate;
	}
	public String getAniimg() {
		return aniimg;
	}
	public void setAniimg(String aniimg) {
		this.aniimg = aniimg;
	}
	public MultipartFile getManiimg() {
		return maniimg;
	}
	public void setManiimg(MultipartFile maniimg) {
		this.maniimg = maniimg;
	}
	public int getBcode() {
		return bcode;
	}
	public void setBcode(int bcode) {
		this.bcode = bcode;
	}
	public int getBoricode() {
		return boricode;
	}
	public void setBoricode(int boricode) {
		this.boricode = boricode;
	}
	public int getBno() {
		return bno;
	}
	public void setBno(int bno) {
		this.bno = bno;
	}
	public String getBtitle() {
		return btitle;
	}
	public void setBtitle(String btitle) {
		this.btitle = btitle;
	}
	public String getMid() {
		return mid;
	}
	public void setMid(String mid) {
		this.mid = mid;
	}
	public String getBcontent() {
		return bcontent;
	}
	public void setBcontent(String bcontent) {
		this.bcontent = bcontent;
	}
	public String getBdate() {
		return bdate;
	}
	public void setBdate(String bdate) {
		this.bdate = bdate;
	}
	public int getBhit() {
		return bhit;
	}
	public void setBhit(int bhit) {
		this.bhit = bhit;
	}
	public int getBref() {
		return bref;
	}
	public void setBref(int bref) {
		this.bref = bref;
	}
	public int getBseq() {
		return bseq;
	}
	public void setBseq(int bseq) {
		this.bseq = bseq;
	}
	public int getBlvl() {
		return blvl;
	}
	public void setBlvl(int blvl) {
		this.blvl = blvl;
	}
	public String getBip() {
		return bip;
	}
	public void setBip(String bip) {
		this.bip = bip;
	}
	public String getBfile() {
		return bfile;
	}
	public void setBfile(String bfile) {
		this.bfile = bfile;
	}
	public String getAnineutral() {
		return anineutral;
	}
	public void setAnineutral(String anineutral) {
		this.anineutral = anineutral;
	}
}
