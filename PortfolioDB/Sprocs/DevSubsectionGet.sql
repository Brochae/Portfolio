create or alter procedure dbo.DevSubsectionGet(
    @DevSubsectionId int = 0,
    @All bit = 0,
    @Message varchar(1000) = '' output
)
as
begin
    select ds.DevSectionCode,
           dss.DevSubsectionId,
           dss.DevSectionId,
           dss.DevSubsectionCode,
           dss.DevSubsectionName,
           dss.DevSubsectionDesc,
           GitHubRepoName = 
            case 
                when ISNULL(dss.GitHubRepoName, '') <> '' then CONCAT((select top 1 p.GitHubAccount from Profile p ), '/', dss.GitHubRepoName) 
                else ''
            end,
           dss.DevSubsectionSequenceNum
    from DevSubsection dss
    join DevSection ds on dss.DevSectionId = ds.DevSectionId
    where ISNULL(@All, 0) = 1
        or ISNULL(@DevSubsectionId, 0) = dss.DevSubsectionId
    order by dss.DevSubsectionSequenceNum
end
go

exec DevSubsectionGet @All = 1

select * from Profile