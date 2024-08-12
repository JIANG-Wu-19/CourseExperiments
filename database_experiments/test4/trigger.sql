create trigger tr_updateprice
on XSQKB
for insert,update
as
declare
	@newXSSL int,
	@newJGCPH char(6)

set @newXSSL=(select XSSL from inserted)
set @newJGCPH=(select CPH from inserted)

update CPB
set JG=JG-@newXSSL
where CPH=@newJGCPH
