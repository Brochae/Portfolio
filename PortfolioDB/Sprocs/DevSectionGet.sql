create or alter procedure dbo.DevSectionGet(
    @DevSectionId int = 0,
    @DevSectionCode varchar(50) = '',
    @All bit = 0,
    @Message varchar(1000) = '' output

)
as 
begin
    declare @Return int = 0

        select @DevSectionCode = ISNULL(@DevSectionId, 0)

        select ds.DevSectionId, ds.DevSectionCode, ds.DevSectionName, ds.DevSectionOverview, ds.DevSectionBlurb, ds.DevSectionSequenceNum
        from DevSection ds
        where ds.DevSectionId = @DevSectionId
            or ds.DevSectionCode = @DevSectionCode
            or @All = 1
        order by ds.DevSectionSequenceNum
    return @Return
end

exec DevSubsctionGet @All = 1