sp_depends ��ǰ
sp_depends ��ǰ_view1

--�Ű�����
create proc pb
@�̸� varchar(10)
as
select ���� from ���� 
where �̸�=@�̸�

exec pb '�ں���'

select �й�, �̸�, ���� from ����
where ����>= 90

drop proc grade

create proc grade
@���� int
as
select �й�, �̸�, ����
from ����
where ����>=@����

exec grade 90

create proc gg
@���� int, @���� char(2)
as
select *
from ����
where ����>=@���� and ����=@����

exec gg 90, '��'

-- ��ũ�� 7��
drop proc jj
alter proc jj
@���� char(20)='����' --�⺻������
as
select *
from ��ǰ
where ����=@����

exec jj

--Ȯ�ν����� ��������
create proc p8
as
select * from ��ȭ -- �������� �ʴ� ���̺�

exec p8

--��ũ�� 9��
drop proc �λ�p
create proc �λ�p
@�λ� int
as
select ��ǰ��, ����, ����+(@�λ�/100.0*����) �λ󰡰�
from ��ǰ

exec �λ�p 10


create proc A
@�̸� char(10), @���� int output
as
select @����=����
from ����
where �̸�=@�̸�

declare @a int
exec A '�ں���',@a output
select @a

--��ũ�� 10��
drop proc qty
select*from ��ǰ

create proc qty
@��ǰ�� char(20), @�Ǹż��� int output
as
select @�Ǹż���=�Ǹż��� 
from ��ǰ join �Ǹ�
on ��ǰ.��ǰ��ȣ=�Ǹ�.�ǸŹ�ȣ
where ��ǰ.��ǰ��=@��ǰ��

declare @�Ǹż��� int
exec qty '����Ʈ', @�Ǹż��� output
select @�Ǹż���