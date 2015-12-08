package kosta.teamd.mvc.service;
//현업에서도 페이징 할 때 계속 사용 할 코드이다.  

import org.springframework.stereotype.Service;

@Service
public class Paging {
	//View 로 돌려줄 페이징 값
	private String pagingCode;

	public String getPagingCode() {
		return pagingCode;
	}

	public void setPagingCode(String pagingCode) {
		this.pagingCode = pagingCode;
	}
	
	public void Paging_D(int totalRecord, int nowPage, int numPerPage,
			int numPerBlock, String url, String param){
		//TotalRecord : 총 데이터 수를 저장
		//nowPage: 현재 페이지
		//numperPage: 페이지당 몇 줄 씩 보여 줄 것인지.... --한페이지당 보여줄 줄 (게시글 수)
		//numPerBlock: 페이지 [1][2]... 블록을 몇개로 제한할 값 -- 아래의 페이지 1.2.3.4.5 6 7 8 9 10 -1블록
																	//  1. 2. 3. 4. 5. --10 - 2블
		//url: 페이지 이동경로를 저장
		//전체 페이지 값 및 전체 블록 값 구하기.
		
		//전체 페이지가 2페이지가 있으면
		//1.1->2페이지 10/6=1.111 ->2 페이지 가 되기 위해서는
		//Math.ceil()를 사용하면 된다.
		int totalPage=(int) Math.ceil((double)totalRecord / numPerPage); // 전체 / 페이지당 수 30/15=2페이지
			//전체 블록값을 구한 값
			//연산결과 : 1페이지부터 1 1 1 1 1->6페이지 1.1 1.2 1.3
		int totalBlock = (int) Math.ceil((double)totalPage/numPerBlock); // 전체 / 블록 수 
			//현재 페이지 값에서 페이지 제한수를 나누어서 현재 블록의 값을 구해야 한다.
		int nowBlock=(int) Math.ceil((double)nowPage/numPerBlock); // 지금페이지/ 블록 수 현재블록의 값.
		
		//페이징을 구하기 위한 태그공식을 저장하기 위한 자료
			//이전 페이지를 구현
		StringBuffer prev= new StringBuffer();
			//다음 페이지를 구현
		StringBuffer next= new StringBuffer();
			//페이지 값 구현
		StringBuffer paging= new StringBuffer();
			
		
		//▶ 
		//◀ 
		//이전 페이지 구하는 공식
		//nowBlock>1 이면 이전 페이지의 링크를 구현. 인데 <a href='url?nowPage=(nowBlock -2)*numPerBlock +1'>◀</a>&nbsp;&nbsp;
		//										  ◀&nbsp;&nbsp;
		
		if(nowBlock > 1){ //nowBlock 이 1보다 크다면 이전페이지의 링크를 구현
			prev.append("<a href='").append(url);
			prev.append("?nowPage=");
			prev.append((nowBlock - 2) * numPerBlock +1);
			prev.append(param); //추가
			prev.append("'>◀</a>&nbsp;&nbsp;");
		}else{
			prev.append("◀&nbsp;&nbsp;");
		}
		
		if(totalRecord!=0){
		//페이지 출력
		for(int i=0; i<numPerBlock; i++){
			//출력되는 페이지 값
			int printPage=((nowBlock-1)* numPerBlock)+i+1; //현재 페이지 값-처음에는 0인데 1페이지를 출력하기 위해 +1
			
			if(printPage==nowPage){// 현재 페이지일 경우 (링크를 걸면 안됨.
				paging.append("<font color='olive'>");
				paging.append(printPage).append("</font>");
				
			}else{
				//현재 페이지가 아닐 경우에는 페이지의차이를 두면 된다.
				paging.append("<a href='").append(url);
				paging.append("?nowPage=");
				paging.append(printPage).append(param).append("'>");
				paging.append(printPage).append("</a>&nbsp;&nbsp;");
			}
			
			//전체 페이지와 같다면, 페이지 출력문을 빠져 나와야 한다.
			
			if(printPage==totalPage){
				break;
			}
		}//for문 종료
		}
		//다음 페이지를 구현: totalBlock 이 nowBlock보다 클경우 (블록보다 많아지면 넘어가게 링크.)
		//페이지를 하나 더 만들어야 하므로 <a href='url?nowPage=nowBlock*numPerBlock+1'>▶</a>
		if(totalBlock > nowBlock){
			next.append("<a href='").append(url);
			next.append("?nowPage=").append(nowBlock * numPerBlock +1);
			next.append(param);
			next.append("'>▶").append("</a>");
		}else{
			next.append("&nbsp;&nbsp;▶"); //이거 없애버리면 숨겨지게된다. 링크
		}
		//페이지가 완성 되었으면 조합된 페이지 코드에 저장
		pagingCode=prev.toString() + paging.toString()
				+next.toString();
		
		}	
}
