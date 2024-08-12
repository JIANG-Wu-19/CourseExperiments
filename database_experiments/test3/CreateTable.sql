use FlightDB
create table hbb
(
hbh char(6) primary key check(hbh like 'CZ%' or hbh like 'CA%' or hbh like'FM%'),
sfd varchar(20) not null,
mdd varchar(20) not null,
yj int not null check(yj>=0)
)

create table Ckb
(
sfzh varchar(20) primary key,
xm varchar(10)
)

create table spb
(
hbh char(6) references hbb(hbh) on delete cascade,
sfzh varchar(20) references Ckb(sfzh) on delete cascade,
qfrq date not null,
sprq date not null default getdate(),
sj int not null,

primary key(hbh,sfzh)
)
