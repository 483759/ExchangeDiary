drop table board;

create table board(
   num NUMBER(4) PRIMARY KEY,
   author VARCHAR2(20),
   title  VARCHAR2(50),
   content VARCHAR2(100),
   writeday DATE  DEFAULT SYSDATE,
   readCnt  NUMBER(4) DEFAULT 0,
   repRoot  NUMBER(4),
   repStep  NUMBER(4),
   repIndent NUMBER(4)
 );
 
drop sequence board_seq;
create sequence board_seq;

insert into board( num, author, title, content, repRoot, repStep, repIndent )
values ( board_seq.NEXTVAL , '홍길동', '테스트' , '테스트입니다.' , board_seq.CURRVAL, 0 , 0 );
commit;