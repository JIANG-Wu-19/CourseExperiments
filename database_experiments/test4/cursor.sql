declare
	abc_cursor2 cursor for
	select year(XSRQ),CPH
	from XSQKB
	group by year(XSRQ),CPH
open abc_cursor2

declare
	@YEAR int,
	@CPH char(6),
	@CPM varchar(20),
	@XSZL int,
	@ZXSJE float

create table #temp_cursor2
(
	[year] [int],
	[cph] [char](6),
	[cpm] [varchar](20),
	[xszl] [int],
	[zxsje] [float]
)on [primary]

fetch next from abc_cursor2
into @YEAR,@CPH

while @@FETCH_STATUS=0
begin
	set @XSZL=
	(
		select sum(XSSL)
		from XSQKB
		where CPH=@CPH and year(XSRQ)=@YEAR
	)

	set @CPM=
	(
		select CPM
		from CPB
		where CPH=@CPH
	)

	set @ZXSJE=
	(
		select JG*@XSZL
		from CPB
		where CPH=@CPH
	)
	insert into #temp_cursor2
	values(@YEAR,@CPH,@CPM,@XSZL,cast((@ZXSJE/10000) as varchar(10)))
	fetch next from abc_cursor2 into @YEAR,@CPH
end

close abc_cursor2
deallocate abc_cursor2

select year as '年',cph as '产品号',cpm as '产品名',xszl as '销售总量',zxsje as '总销售金额（万元）'
from #temp_cursor2

drop table #temp_cursor2
