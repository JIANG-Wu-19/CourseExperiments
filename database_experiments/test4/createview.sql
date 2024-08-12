create view view1
as
select CPM as '产品名',JG as '价格',SCCJ as '生产厂家'
from CPB
where SCCJ='北京' and JG<(select AVG(JG) from CPB where SCCJ='北京')

select *
from view1
