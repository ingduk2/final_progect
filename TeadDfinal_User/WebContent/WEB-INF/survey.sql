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
desc survey;
insert into survey values(survey_seq.nextVal,'현재는 반려견 소유자 선택사항이지만 유기견 발생 방지 등 동물등록제 실효성 제고를 위해 내장형으로 일원화하는 방안을 검토 중입니다. 귀하께서는 이에 대해 어떻게 생각하십니까?'
,3,'','내장형 일원화가 바람직하다','현행 선택방식 유지가 바람직하다','잘 모르겠다',0,0,0,sysdate);
insert into survey values(survey_seq.nextVal,'현재 시행되고 있는 멸종위기동물 자진신고제는, 자진신고를 한 사람에 한해서는 법적인 처벌을 면제해주고 있습니다. 귀하께서는 이에 대해 어떻게 생각하십니까?'
,3,'','현행대로 유지되어야 한다','변화가 필요하다','잘 모르겠다',0,0,0,sysdate);
insert into survey values(survey_seq.nextVal,'현재의 캣맘 활동이 고양이와 사람의 공존에 어떤 영향을 미친다고 생각하십니까?'
,3,'','긍정적 영향','부정적 영향','모른다',0,0,0,sysdate);
insert into survey values(survey_seq.nextVal,'현재 서울에만 20만 마리의 길고양이가 있는 것으로 추정됩니다. 중성화 수술 비용도 마리당 14만 원 정도로 적지 않은데요. 늘어나는 길고양이, 어떻게 해결해야 할까요?'
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


