sp_depends 제품
sp_depends 제품_view1

--매개변수
create proc pb
@이름 varchar(10)
as
select 점수 from 성적 
where 이름=@이름

exec pb '박보검'

select 학번, 이름, 점수 from 성적
where 점수>= 90

drop proc grade

create proc grade
@점수 int
as
select 학번, 이름, 점수
from 성적
where 점수>=@점수

exec grade 90

create proc gg
@점수 int, @성별 char(2)
as
select *
from 성적
where 점수>=@점수 and 성별=@성별

exec gg 90, '여'

-- 워크북 7번
drop proc jj
alter proc jj
@종류 char(20)='셔츠' --기본값설정
as
select *
from 제품
where 종류=@종류

exec jj

--확인시점이 지연가능
create proc p8
as
select * from 배화 -- 존재하지 않는 테이블

exec p8

--워크북 9번
drop proc 인상p
create proc 인상p
@인상 int
as
select 제품명, 가격, 가격+(@인상/100.0*가격) 인상가격
from 제품

exec 인상p 10


create proc A
@이름 char(10), @점수 int output
as
select @점수=점수
from 성적
where 이름=@이름

declare @a int
exec A '박보검',@a output
select @a

--워크북 10번
drop proc qty
select*from 제품

create proc qty
@제품명 char(20), @판매수량 int output
as
select @판매수량=판매수량 
from 제품 join 판매
on 제품.제품번호=판매.판매번호
where 제품.제품명=@제품명

declare @판매수량 int
exec qty '롱코트', @판매수량 output
select @판매수량