create or alter procedure dbo.DevSubsectionToolGet(
    @DevSubsectionToolId int = 0,
    @All bit = 0,
    @Message varchar(1000) = '' output

)
as
begin
    select 
        dst.DevSubsectionToolId, 
        ds.DevSectionId,  
        dt.DevToolId,
        ds.DevSubsectionName,  
        dt.DevToolCode,
        dt.DevToolSequenceNum, 
        dt.HasIcon
    from DevSubsectionTool dst
    join DevSubSection ds
    on dst.DevSubsectionId = ds.DevSubsectionId
    join DevTool dt 
    on dst.DevToolId = dt.DevToolId
    join DevToolType dtt
    on dt.DevToolTypeId = dtt.DevToolTypeId
    where dst.DevSubsectionToolId = ISNULL(@DevSubsectionToolId,0)
        or ISNULL(@All, 0) = 1
    order by ds.DevSubsectionSequenceNum, ds.DevSubsectionCode, dt.DevToolSequenceNum
end
go

exec DevSubsectionToolGet @All = 1