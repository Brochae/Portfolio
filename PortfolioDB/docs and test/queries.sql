use PortfolioDB
go
select * from Profile p 
select * from DevSection d order by d.DevSectionSequenceNum
select * from  DevTool

select d.DevSectionName, ds.DevSubsectionName, t.DevToolName
from DevSection d
join DevSubsection ds
on d.DevSectionId = ds.DevSectionId
join DevSubsectionTool dst
on ds.DevSubsectionId = dst.DevSubsectionId
join DevTool t
on t.DevToolId = dst.DevToolId
order by d.DevSectionSequenceNum,ds.DevSubsectionName, t.DevToolSequenceNum

select distinct DevSectionName, DevToolName
from DevSubsectionTool dsst 
join DevSubsection dss 
on dsst.DevSubsectionId = dss.DevSubsectionId
join DevSection ds 
on dss.DevSectionId = ds.DevSectionId
join DevTool dt 
on dsst.DevToolId = dt.DevToolId
order by DevSectionName, DevToolName
