create procedure proc_abc
@myzgh char(6)
as declare @count int
set @count=
(
select count(*)
from XSRYB
where ZGH=@myzgh
)
if @count>0
begin
	select XSRYB.XM as '姓名',CPB.CPM as '产品名',XSQKB.XSRQ as '销售日期',XSQKB.XSSL as '销售数量'
	from XSRYB inner join XSQKB on XSRYB.ZGH=XSQKB.ZGH
	inner join CPB on CPB.CPH=XSQKB.CPH
	where XSRYB.ZGH=@myzgh
end
else
begin
	print '查询职工号不存在！'
end
