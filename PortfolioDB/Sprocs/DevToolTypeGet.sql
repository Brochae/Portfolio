create or alter procedure dbo.DevToolTypeGet(
    @DevToolTypeId int = 0,
    @All bit = 0,
    @Message varchar(1000) = '' output
)
as
begin
    declare @Return int = 0

    select @DevToolTypeId = ISNULL(@DevToolTypeId, 0), @All = ISNULL(@All, 0)

    select dtt.DevToolTypeId, dtt.DevToolTypeName, dtt.DevToolTypeCode, dtt.DevToolTypeSequenceNum, dtt.ShowOnHomePage
    from DevToolType dtt
    where dtt.DevToolTypeId = @DevToolTypeId
        or @All = 1
    order by dtt.DevToolTypeSequenceNum

    return @Return
end
go

exec DevToolTypeGet @All = 1
