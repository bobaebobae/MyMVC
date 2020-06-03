show user;
-- USER이(가) "MYORAUSER"입니다.

-- /memberRegister.do을 했을 때 회원가입을 위한 테이블 생성한다.
create table mymvc_member
(userid      varchar2(20)not null
,passwd      varchar2(20)not null
,name        varchar2(20) not null
,email       varchar2(50) not null
,gender      varchar2(1) not null -- m/f 하나만 써야해서 1
,interest    varchar2(80)
,registerday date default sysdate -- RR/MM/DD 날짜타입이지만 to_char(sysdate,'yyyy-mm-dd hh24:mi:ss' to_chat하면 문자로 돌려준다. 문자로 돌려줘야함.?
,constraint PK_mymvc_member primary key(userid)
,constraint UQ_mymvc_member_email unique(email)
);

select * from tabs;

select *
from mymvc_member;

select userid, name, email, gender, interest,
       to_char(registerday, 'yyyy-mm-dd hh24:mi:ss') As registerday
from mymvc_member
where userid ='Leess';
