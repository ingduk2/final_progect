--동물 관리
create table animalmanage(
amno number constraint anumalmanage_amno_pk primary key,
mid varchar2(20),
anino number,
amrice number,
amspo number,
ambath number,
constraint animalmanage_mid_fk foreign key(mid) references member(mid),
constraint animalmanage_anino_fk foreign key(anino) references animal(anino)
);
--동물 관리 seq
create sequence am_seq
increment by 1
start with 1;

