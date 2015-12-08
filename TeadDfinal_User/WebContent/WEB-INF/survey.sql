create table survey(
num number constraint survey_num_pk primary key,
content clob,
sub varchar2(300),
code number(3),
surveychk varchar2(50),
sub1 varchar2(100),
sub2 varchar2(100),
sub3 varchar2(100),
sub1cnt number(10) default 0,
sub2cnt number(10) default 0,
sub3cnt number(10) default 0,
sdate date
);


create sequence survey_seq
increment by 1
start with 1;

--drop table surveylog;
--drop table survey;

create table surveylog(
lognum number constraint surveylog_num_pk primary key,
sno number not null,
surip varchar2(30),
surdate date,
constraint surveylog_sno_fk foreign key(sno) references survey(num)
);
create sequence surveylo_seq
increment by 1
start with 1;


commit;


set define off;


desc survey;
insert into survey values(survey_seq.nextVal,
'<h3>동물등록제<small>여러분의 소중한 의견을 기다립니다.</small></h3>
	   <hr>
	   <font size="3px">&nbsp;
	   동물 등록 식별장치는 마이크로 칩을 목덜미에 삽입하는 내장형과 목걸이로 거는 외장형, 비전자적인 인식표가 있으며 특징은 아래와 같습니다.</font>
	   <table class="table">
	   	<tr>
	   		<td>구분</td><td>내장형</td><td>외장형, 인식표형</td>
	   	</tr>
	   	<tr>
	   		<td>장점</td>
	   		<td>
	   			<ul>
	   				<li>유실시 귀가율 향상</li>
	   				<li>소유권 증명 용이</li>
	   				<li>유기견 발생 방지</li>
	   			</ul>
	   		</td>
	   		<td>
	   			<ul>
	   				<li>부작용 없음</li>
	   				<li>처치 간단</li>
	   			</ul>
	   		</td>
	   	</tr>
	   	<tr>
	   		<td>단점</td>
	   		<td>
	   			<ul>
	   				<li>외과적 주사 시술 및 부작용</li>
	   				<li>18만건 시술 중 14건 (0.01%)</li>
	   			</ul>
	   		</td>
	   		<td>
	   			<ul>
	   				<li>의도적, 우발적 파손 용이</li>
	   				<li>제거 후 유기 시 소유자 확인 불가</li>
	   			</ul>
	   		</td>
	   	</tr>
	   </table>
	   
	   (14년 유기동물 : 8만여 마리, 처리비 104억원 사용)
<p>',
'현재는 반려견 소유자 선택사항이지만 유기견 발생 방지 등 동물등록제 실효성 제고를 위해 내장형으로 일원화하는 방안을 검토 중입니다. 귀하께서는 이에 대해 어떻게 생각하십니까?'
,3,'','내장형 일원화가 바람직하다','현행 선택방식 유지가 바람직하다','잘 모르겠다',0,0,0,sysdate);



insert into survey values(survey_seq.nextVal,'<h3>멸종위기동물 자진신고제<small>여러분의 소중한 의견을 기다립니다.</small></h3>
	   <hr>
	   <font size="3px">&nbsp;
	   멸종위기동물 자진신고제란 허가나 신고 없이 불법적으로 거래,사육,보관되고 있는 멸종위기 야생생물에 대하여 자진신고를 하면 신고자에게는벌칙(징역,벌금, 과태료, 몰수)
         을 면제 해주는 제도를 말한다
	   
	   자진신고제의 특징은 아래와 같습니다.
	  </font>
	   <table class="table">
	   	<tr>
	   		<td>장점</td>
	   		<td>
	   			<ul>
	   				<li>정부의 부족한 단속인력을 메울 수 있는 장치</li>
	   				<li>향후 불법개체가 확산되는 것을 방지</li>
	   				<li>멸종위기 야생생물을 적정하게 관리 가능</li>
	   			</ul>
	   		</td>
	   	</tr>
	   	<tr>
	   		<td>단점</td>
	   		<td>
	   			<ul>
	   				<li>자진신고를 하면 처벌을 면제받을 수 있다는 점을 악용해 이 기간에 맞춰 밀수하는 업자들이 발생</li>
	   				
	   			</ul>
	   		</td>
	   	</tr>
	   </table>
	    *CITES: 멸종위기에 처한 야생 동식물의 국제거래에 관한 협약
	       우리나라는 1993년에 CITES 가입함
<p>','현재 시행되고 있는 멸종위기동물 자진신고제는, 자진신고를 한 사람에 한해서는 법적인 처벌을 면제해주고 있습니다. 귀하께서는 이에 대해 어떻게 생각하십니까?'
,3,'','현행대로 유지되어야 한다','변화가 필요하다','잘 모르겠다',0,0,0,sysdate);


insert into survey values(survey_seq.nextVal,'<h3>캣맘<small>여러분의 소중한 의견을 기다립니다.</small></h3>
	   <hr>
	   <font size="3px">&nbsp;
	   캣맘은 길고양이에게 정기적으로 물과 먹이를 주거나 자발적으로 보호활동을 하는 사람을 뜻한다
	   </font>
	   <table class="table">
	   	<tr>
			<td>서울시가 동물보호와 공원 환경 청결 유지, 중성화수술을 통한 길고양이 증가 억제를 위해 ‘길고양이 급식소’ 27개를 공원 4개에 설치한다.
	                  급식소의 전반적인 운영과 시민자원봉사자 교육, 중성화수술 지원은 동물관련 시민단체가 맡고, 먹이주기와 급식소 청소 등 실질적인 관리는 ‘캣맘’들이 중심이 된 시민자원봉사자가 담당한다.
	                  시는 길고양이 급식소 설치를 통해 길고양이들에게 먹이를 주고 중성화수술도 지원해 2016년 상반기까지 공원 내 길고양이 중성화율을 70% 이상 높인다는 계획이다
	        </td>
	   	</tr>
	   </table>
	   
	   *2015년 서울시 12곳에서 조사한 결과로 추정한 서울의 길고양이 개체수는 최대 20만마리다<p>','현재의 캣맘 활동이 고양이와 사람의 공존에 어떤 영향을 미친다고 생각하십니까?'
,3,'','긍정적 영향','부정적 영향','모른다',0,0,0,sysdate);


insert into survey values(survey_seq.nextVal,'<h3>TNR<small>여러분의 소중한 의견을 기다립니다.</small></h3>
	   <hr>
	   <font size="3px">&nbsp;
	  TNR(Trap-Neuter-Release) 이란 길고양이를 포획한 후 중성화 수술을 시켜 포획한 장소에 다시 방사하는 것으로, 인도적인 차원에서 길고양이의 개체 수를 조절할 수 있는 방법이다</font>
	   <table class="table">
	   	<tr>
	   		<td>장점</td>
	   		<td>
	   			<ul>
	   				<li>중성화가 된 길고양이는 발정음 소리를 내지 않아 소음이 줄어든다</li>
	   				<li>타지역 고양이의 유입을 막아준다</li>
	   				<li>적절한 길고양이의 개체수 유지는 쥐의 과도한 번식도 예방한다</li>
	   			</ul>
	   		</td>
	   	</tr>
	   	<tr>
	   		<td>단점</td>
	   		<td>
	   			<ul>
	   				<li>중성화 수술 비용이 마리당 14만원이 발생한다</li>
	   				<li>인위적인 개체수 조절은 생태계 교란을 야기한다</li>
	   			</ul>
	   		</td>
	   	</tr>
	   </table>
	   
	   <p>','현재 서울에만 20만 마리의 길고양이가 있는 것으로 추정됩니다. 중성화 수술 비용도 마리당 14만 원 정도로 적지 않은데요. 늘어나는 길고양이, 어떻게 해결해야 할까요?'
,3,'','일정 개체수를 넘어설 경우 포획해서 안락사시킨다','중성화 수술을 통해 장기적으로 개체수를 조절한다','기타',0,0,0,sysdate);

---------------------------------------------------------------
------------동일 IP투표 방지----------------
create table surveylog(
num number constraint surveylog_num_pk primary key,
sno number not null,
surip varchar2(30),
surdate date);
create sequence surveylog_seq
increment by 1
start with 1;

insert into surveylog values(surveylog_seq.nextVal,0,'',sysdate);


