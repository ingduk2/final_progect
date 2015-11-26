-- KOSTA 108 Final Project DB / 최종 업데이트 : 15/11/13 _ 회원, 동물, 게시판, 댓글 게시판 테이블 추가
-- KOSTA 108 Final Project DB / 최종 업데이트 : 15/11/14 _ 전용 아이디, 비밀번호, 권한 설정 방법 추가
-- 15/11/19 봉사 , 센터 일단 추가함.

-- -----------------------------------------------------------------------------

-- Final Project용 아이디 / 비밀번호 / 권한 설정
-- 아이디 : teamd
-- 비밀전호 : teamd

-- cmd > sqlplus / as sysdba
-- create user teamd identified by teamd default tablespace users;
-- grant connect, resource to teamd;
-- grant create view to teamd;

-- -----------------------------------------------------------------------------

-- 회원(member) 테이블 생성 _ 컬럼 m으로 시작
create table member
(
mid varchar2(20) constraint member_mid_pk primary key,       -- 01.아이디
mname varchar2(20) constraint member_mname_nn not null,      -- 02.이름
memail varchar2(50) constraint member_memail_nn not null,    -- 03.이메일
mpwd varchar2(20) constraint member_mpwd_nn not null,        -- 04.비밀번호
mpwdkey varchar2(200) constraint member_mpwdkey_nn not null, -- 05.비밀번호 찾기 질문
mpwdval varchar2(200) constraint member_mpwdval_nn not null, -- 06.비밀번호 찾기 답변
mbirth varchar2(20) constraint member_mbirth_nn not null,    -- 07.생년월일
mtel varchar2(20) constraint member_mtel_nn not null,        -- 08.전화번호
mpost varchar2(10) constraint member_mpost_nn not null,      -- 09.우편번호
mroad varchar2(300) constraint member_mroad_nn not null,     -- 10.도로명 주소
mjibun varchar2(300),                                        -- 11.지번 주소
mimg varchar2(50),                                           -- 12.프로필 사진 파일 이름
mintro clob,                                                 -- 13.프로필 인사말
mrptlimit number constraint member_mrptlimit_nn not null,    -- 14.하루 신고 제한수
mrpt number constraint member_mrpt_nn not null,              -- 15.신고당한 횟수
mfreetime date,                                              -- 16.제재 종료 시간
enabled number constraint member_enabled_nn not null,        -- 17.아이디 활성화 여부
constraint member_memail_uq unique(memail)
);

-- Spring Security를 이용하기 위한 회원의 권한(memroles) 테이블 생성
create table memroles
(
mid varchar2(20) constraint memroles_mid_nn not null,        -- 01.회원 아이디
role varchar2(20) constraint memroles_role_nn not null,      -- 02.회원 등급
constraint memroles_mid_role_pk primary key(mid, role)
);

-- -----------------------------------------------------------------------------

-- 동물(animal) 테이블 생성 _ 컬럼 ani로 시작
create table animal
(
anino number constraint animal_anino_pk primary key,         -- 01.동물 등록 번호
anispecies varchar2(20),                                     -- 02.동물 분류(동물종)
anibreed varchar2(50),                                       -- 03.동물 분류(품종)
aniname varchar2(20),                                        -- 04.이름
aniage number,                                               -- 05.나이
anisex varchar2(10),                                         -- 06.성별
anisize varchar2(10),                                        -- 07.크기 분류
aniweight number,                                            -- 08.몸무게
anifeature varchar2(400),                                    -- 09.특징
aniregion varchar2(100),                                     -- 10.(실종,발견)지역
anidate date,                                                -- 11.(실종,발견)날짜
aniimg varchar2(50),                                         -- 12.동물 사진 파일 이름
constraint animal_anisex_ck check(anisex='남아' or anisex='여아'),
constraint animal_anisize_ck check(anisize='소' or anisize='중' or anisize='대')
);

-- 동물 테이블 / 동물 등록 번호 시퀀스 생성
create sequence animal_seq
increment by 1
start with 1;

-- -----------------------------------------------------------------------------

-- 게시판(board) 테이블 생성 _ 컬럼 b로 시작
create table board
(
bcode number constraint board_bcode_nn not null,             -- 01.분류코드
boricode number,                                             -- 02.원래 분류코드
bno number constraint board_bno_pk primary key,              -- 03.글 번호
btitle varchar2(100) constraint board_btitle_nn not null,    -- 04.제목
mid varchar2(20) constraint board_mid_nn not null,           -- 05.작성자(회원 아이디)
bcontent clob,                                               -- 06.내용
bdate date constraint board_bdate_nn not null,               -- 07.작성 일자
bhit number constraint board_bhit_nn not null,               -- 08.조회수
anino number,                                                -- 09.연관 동물 번호
bref number constraint board_bref_nn not null,               -- 10.답글_원본 글 번호
bseq number constraint board_bseq_nn not null,               -- 11.답글_답글 순서
blvl number constraint board_blvl_nn not null,               -- 12.답글_트리 단계
bip varchar2(50) constraint board_bip_nn not null,           -- 13.작성자 IP
bfile varchar2(50),                                          -- 14.첨부 파일 이름
brpt number constraint board_brpt_nn not null,               -- 15.신고당한 횟수
constraint board_mid_fk foreign key(mid) references member(mid),
constraint board_anino_fk foreign key(anino) references animal(anino)
);

-- 게시판 테이블 / 글 번호 시퀀스 생성
create sequence board_seq
increment by 1
start with 1;

-- -----------------------------------------------------------------------------

-- 댓들 게시판(commboard) 테이블 생성 _ 컬럼 cb로 시작
create table commboard
(
cbno number constraint commboard_cbno_pk primary key,               -- 01.댓글 번호
bno number constraint commboard_bno_nn not null,                    -- 02.원본 글 번호
cbcontent varchar2(300) constraint commboard_cbcontent_nn not null, -- 03.댓글 내용
mid varchar2(20) constraint commboard_mid_nn not null,              -- 04.댓글 작성자(회원 아이디)
cbip varchar2(50) constraint commboard_cbip_nn not null,            -- 05.작성자 IP
cbdate date constraint commboard_cbdate_nn not null,                -- 06.댓글 작성 일자
cbrpt number constraint commboard_cbrpt_nn not null,                -- 07.신고당한 횟수
constraint commboard_bno_fk foreign key(bno) references board(bno),
constraint commboard_mid_fk foreign key(mid) references member(mid)
);

-- 댓글 게시판 / 댓글 번호 시퀀스 생성
create sequence commboard_seq
increment by 1
start with 1;

-- -----------------------------------------------------------------------------


--봉사활동 테이블
create table volunteer
(
volunteerno number constraint volunteer_volunteerno_pk primary key,
volunteertitle varchar2(100) constraint member_volunteertitle_nn not null,
volunteerstart date constraint member_volunteerstart_nn not null,
volunteerend date constraint member_volunteerend_nn not null
);
-- 봉사활동 seq
create sequence volunteer_seq
increment by 1
start with 1;



--봉사신청목록들 테이블
create table vapply 
(
vapplyno number constraint vapply_vapplyno_pk primary key,
memid varchar2(20),
volunteerno number,
vapplydate date constraint vapply_vapplydate_nn not null,
--constraint vapply_memid_fk foreign key(memid) references member(memid),
constraint vapply_volunteerno_fk foreign key(volunteerno) references volunteer(volunteerno)
);
-- 봉사신청 seq
create sequence vapply_seq
increment by 1
start with 1;


----센터 테이블
create table center(
cnum number constraint center_cnum_pk primary key,
cname varchar2(40),
caddr varchar2(100),
cxy varchar2(30)
);
--센터 seq
create sequence center_seq
increment by 1
start with 1;



줄바꿈 함수!!---------------------
select replace(replace(bcontent,chr(10),'<br>'),chr(13),'') from board;

create or replace function new_line(bcontent clob)
  return clob
  is
    v_bcontent clob;
  begin
    v_bcontent:=replace(replace(bcontent,chr(10),'<br>'),chr(13),'');
    return v_bcontent;
end;

select new_line(bcontent) from board;


--chart 예비
create table chart(
cdate date,
a number,
b number,
c number,
d number);
--chart data
insert into chart values('2011-01-01',10,10,10,10);
insert into chart values('2011-02-01',10,10,10,10);
insert into chart values('2011-03-01',10,10,10,10);
insert into chart values('2011-04-01',10,10,10,10);
insert into chart values('2011-05-01',10,10,10,10);
insert into chart values('2011-06-01',10,10,10,10);
insert into chart values('2011-07-01',10,10,10,10);
insert into chart values('2011-08-01',10,10,10,10);
insert into chart values('2011-09-01',10,10,10,10);
insert into chart values('2011-10-01',10,10,10,10);
insert into chart values('2011-11-01',10,10,10,10);
insert into chart values('2011-12-01',10,10,10,10);

insert into chart values('2012-01-01',20,20,20,20);
insert into chart values('2012-02-01',20,20,20,20);
insert into chart values('2012-03-01',20,20,20,20);
insert into chart values('2012-04-01',20,20,20,20);
insert into chart values('2012-05-01',20,20,20,20);
insert into chart values('2012-06-01',20,20,20,20);
insert into chart values('2012-07-01',20,20,20,20);
insert into chart values('2012-08-01',20,20,20,20);
insert into chart values('2012-09-01',20,20,20,20);
insert into chart values('2012-10-01',20,20,20,20);
insert into chart values('2012-11-01',20,20,20,20);
insert into chart values('2012-12-01',20,20,20,20);

insert into chart values('2013-01-01',30,30,30,30);
insert into chart values('2013-02-01',30,30,30,30);
insert into chart values('2013-03-01',30,30,30,30);
insert into chart values('2013-04-01',30,30,30,30);
insert into chart values('2013-05-01',30,30,30,30);
insert into chart values('2013-06-01',30,30,30,30);
insert into chart values('2013-07-01',30,30,30,30);
insert into chart values('2013-08-01',30,30,30,30);
insert into chart values('2013-09-01',30,30,30,30);
insert into chart values('2013-10-01',30,30,30,30);
insert into chart values('2013-11-01',30,30,30,30);
insert into chart values('2013-12-01',30,30,30,30);

commit;

