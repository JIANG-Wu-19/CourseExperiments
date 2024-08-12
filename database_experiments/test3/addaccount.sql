exec sp_addlogin 'FlightUser','123','FlightDB'
grant insert,select,update,delete on spb to public
grant select on hbb to public
grant select on ckb to public