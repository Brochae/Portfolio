create or alter procedure dbo.DevToolGet(
@DevToolId int = 0,
@DevSubsectionCode varchar(25) = '',
@All bit = 0,
@Message varchar(1000) = '' output
)
as 
begin
    declare @DevSubsectionId int
    if ISNULL(@DevSubsectionCode, '') <> ''
        begin
            select @DevSubsectionId = ds.DevSubsectionId
            from DevSubsection ds
            where ds.DevSubsectionCode = @DevSubsectionCode
        end
print @DevSubsectionId
    select @DevSubsectionId = ISNULL(@DevSubsectionId, 0)
    if @DevSubsectionId <> 0
        begin
            select @All = 1
        end
    select  dtt.DevToolTypeName,
            dtt.DevToolTypeCode,
            dt.DevToolId,
            dt.DevToolCode,
            dt.DevToolName,
            dt.HasIcon,
            dt.DevToolSequenceNum
    from DevTool dt
    join DevToolType dtt 
    on dt.DevToolTypeId = dtt.DevToolTypeId
    left join DevSubsectionTool dst
        on dt.DevToolId = dst.DevToolId
        and dst.DevSubsectionId = @DevSubsectionId
    where 
    (dt.DevToolId = ISNULL(@DevToolId, 0) or ISNULL(@All,0) = 1)
    and (@DevSubsectionId = 0 or dst.DevSubsectionId is not null)

    order by dtt.DevToolTypeSequenceNum, dt.DevToolSequenceNum
end
go

exec DevToolGet @All = 1

exec DevToolGet @All = 0, @DevSubsectionCode = 'Framework'