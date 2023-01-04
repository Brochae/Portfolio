create or alter procedure dbo.DevSubsectionElementGet(
@DevSubsectionElementId int = 0,
@All bit = 0,
@Message varchar(1000) = '' output 
)
as 
begin
    select s.DevSubsectionCode, 
           d.DevSubsectionElementId, 
           d.DevSubsectionId,
           d.DevSubsectionElementCode, 
           d.ButtonText, 
           d.HtmlTag, 
           d.FileExtension,
           ROW_NUMBER()OVER(partition by d.DevSubsectionId order by d.DevSubsectionElementPriority) as DevSubsectionElementSequence
    from DevSubsectionElement d
    join DevSubsection s
    on d.DevSubsectionId = s.DevSubsectionId
    where d.DevSubsectionElementId = ISNULL(@DevSubsectionElementId, 0)
        or ISNULL(@All, 0) = 1
    order by s.DevSubsectionSequenceNum, DevSubsectionElementSequence
end
go

exec DevSubsectionElementGet @all = 1