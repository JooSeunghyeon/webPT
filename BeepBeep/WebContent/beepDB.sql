drop table member;
select * from member;
ALTER TABLE member DROP PRIMARY KEY;
drop table member cascade constraints;



-- constraint wmember_pk primary key(category)

create table member (
    category varchar2(50),
    id varchar2(50),
    pw varchar2(50) not null,
    name varchar2(50) not null ,
    age number not null,
    gender number not null,
    target varchar2(100) not null,
    tel varchar2(50) not null,
    height float not null,
    weight float not null,
    constraint members_pk_id primary key(id)
);
-- 포르필 사진 경로 저장을 위한 컬럼 추가
alter table member add profile varchar2(50);

insert into member values ('0', 'man', '123', 'kite', 20, '1', 60, 100, 100, 80);
insert into member values ('0', 'woman', '123', 'kite', 20, '2', 60, 100, 100, 80);
insert into member values ('3', 'men', '123', 'kite', 20, '1', 60, 100, 100, 80);
insert into member values ('3', 'women', '123', 'kite', 20, '2', 60, 100, 100, 80);



select * from member;

select * from youtube;

drop table youtube cascade constraints;
ALTER TABLE youtube DROP PRIMARY KEY;
-- 유튜버 종류 
select distinct youtuber from youtube;
select distinct part from youtube;

select distinct part from youtube where gender = '1';
select distinct part from youtube where gender = '2';



create table youtube(
 category varchar2(50),
 link varchar2(300),
 part varchar2(100) not null,
 gender varchar2(30) not null,
 constraint youtube_fk_category foreign key(category)
 references member(category)
);



select * from youtube where gender='2';



select * from all_constraints
where table_name = 'member';



drop table food;
select * from food;


create table food (
    product_name varchar2(100),
    product_cal number  not null,
    product_carb number  not null,
    product_prot number  not null,
    produc_fat number  not null,
    constraint food_product_name_pk primary key(product_name)
);


select * from food;

select * from member;




insert into member values ('a', 'kite', '123', 'kite', 20, '0203120', 'sdksf@#nag', 100, 100, 240);


insert into member values ('')




-- 커뮤니티

create table community (
	num number,
	title varchar2(200) not null,
	id varchar2(50) not null,
	filename varchar2(200) not null,
	content varchar2(500) not null,
	day date
	--constraint community_pk primary key(num)
  --  constraint community_fk_id foreign key(id)
  --  references member(id)
);

drop table community cascade constraints;

commit;

create sequence community_num start with 1 increment by 1;



drop sequence community_num;

insert into COMMUNITY values(1, 'test', 'man', 'abc', 'test', sysdate );


select * from COMMUNITY; 

delete from COMMUNITY;

create sequence num_board
start with 1
increment by 1;


select * from comment_board;

-- 댓글 테이블
create table comment_board (
  community_num number,
  COMMENT_NUM NUMBER NOT NULL,
  COMMENT_ID VARCHAR2(15),
  COMMENT_CONTENT VARCHAR2(1000) NOT NULL,
  COMMENT_DATE DATE,
  constraint comment_fk_id foreign key(COMMENT_ID)
  references member(id),
  constraint comment_fk_num foreign key(community_num)
  references community(num)
);


create sequence comment_num start with 1 increment by 1;

drop sequence comment_num;

select * from comment_board;

drop table comment_board;



drop table comment_board cascade constraints;
commit;


--캘린더--


create table calendar(
    calendar_id varchar2(50),
    calendar_title varchar2(100),
    calendar_start date,
    calendar_end date,
    calendar_description varchar2(500),
    calendar_type varchar2(100),
    calendar_userid varchar2(50),
    calendar_color varchar2(50),
    calendar_textcolor varchar2(50),
    constraint cal_fk_user foreign key(calendar_userid)
    references member(id)
);

--가데이터
insert into calendar values('kite', '우와', '21/12/03', '23/10/03', '내용', '타입', 'woman', '색깔', '텍스트색');

drop table calendar cascade constraints;

select * from calendar;

select * from comment_board;
delete from comment_board;


