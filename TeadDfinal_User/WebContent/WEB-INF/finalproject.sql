-- KOSTA 108 Final Project DB
-- 최종 업데이트 : 15/11/13 _ 회원, 동물, 게시판, 댓글 게시판 테이블 추가
-- 최종 업데이트 : 15/11/14 _ 전용 아이디, 비밀번호, 권한 설정 방법 추가
-- 최종 업데이트 : 15/11/19 _ 봉사 , 센터 일단 추가함.
-- 최종 업데이트 : 15/11/27 _ 동물 테이블 : 크기 컬럼 삭제, 사례금 컬럼 추가, 현재 상태 컬럼 추가, 더미 데이터 추가
--                       회원 테이블 : 신분 컬럼 추가, 관리자 데이터 추가

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
mstatus number constraint member_mstatus_nn not null,        -- 17.가입자의 신분(일반 회원, 직원 등)
-- mstatus: 1-일반 회원 / 2-직원
enabled number constraint member_enabled_nn not null,        -- 18.아이디 활성화 여부
constraint member_memail_uq unique(memail)
);

-- Spring Security를 이용하기 위한 회원의 권한(memroles) 테이블 생성
create table memroles
(
mid varchar2(20) constraint memroles_mid_nn not null,        -- 01.회원 아이디
role varchar2(20) constraint memroles_role_nn not null,      -- 02.회원 등급
-- role: User-일반 회원 / Restrict-제재 회원 / Admin-관리자 / employee-직원
constraint memroles_mid_role_pk primary key(mid, role)
);

-- 관리자 아이디 등록
insert into member(mid, mname, memail, mpwd, mpwdkey, mpwdval, mbirth, mtel,
mpost, mroad, mimg, mintro, mrptlimit, mrpt, mfreetime, mstatus, enabled) 
values('admin', '관리자', 'admin@admin.com', 'teamdadmin', '우리 조 막내 이름은 무엇일까요?', 'winni',
'1984-03-13', '01000000000', '283', '유스페이스2 KOSTA 3강의실', 'UnknownProfile.png', '안녕하세요 ^^',
0, 0, sysdate, 2, 1);
insert into memroles values('admin', 'Admin');
commit;

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
aniweight number,                                            -- 07.몸무게
anifeature varchar2(400),                                    -- 08.특징
aniregion varchar2(100),                                     -- 09.(실종,발견)지역
anidate date,                                                -- 10.(실종,발견)날짜
anireward number,                                            -- 11.사례금
anistate number,                                             -- 12.현재 상태(실종,보호,입양대기,입양완료 등)
-- anistate: (admin용)0-보호중 / 1-입양대기 / 2-입양완료
--           (일반 회원용)3-실종 / 4-발견 / 5-개인 보호중
aniimg varchar2(50),                                         -- 13.동물 사진 파일 이름
constraint animal_anisex_ck check(anisex='남아' or anisex='여아')
);

-- 동물 테이블 / 동물 등록 번호 시퀀스 생성
create sequence animal_seq
increment by 1
start with 1;

-- 일반 게시판 용 더미 데이터 anino 0 등록
insert into animal(anino) values(0);
commit;

-- 일반 게시판 용 더미 데이터 anino 0 등록
insert into animal(anino) values(0);
commit;

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


--------입양신청 임시------
create table adoptapply(
adopno number constraint adoptapply_adoptno_pk primary key,
mid varchar2(20),
anino number,
eid varchar2(20),
memage varchar2(20),
score number,
qus1 varchar2(50),
qus1sup1 varchar2(50),
qus2 varchar2(50),
qus2sup1 varchar2(50),
qus3 varchar2(50),
qus4 varchar2(50),
qus5 varchar2(50),
qus6 varchar2(50),
qus6sup1 varchar2(50),
qus7 varchar2(50),
qus8 varchar2(50),
qus9 varchar2(50),
qus10 varchar2(50));

create sequence adopt_seq
increment by 1
start with 1;

