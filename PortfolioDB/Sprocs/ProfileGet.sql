create or alter procedure dbo.ProfileGet(
    @ProfileId int = 0,
    @All bit = 0,
    @Message varchar(1000) = '' output
)
as
begin
    declare @Return int = 0

        select @ProfileId = ISNULL(@ProfileId, 0)

        select p.ProfileId, p.FirstName, p.LastName, p.EmailAddress, p.PhoneNumber, p.GitHubAccount, p.ProfileDesc, p.HasResume
        from Profile p
        where p.ProfileId = @ProfileId
            or ISNULL(@All, 0) = 1
    return @Return
end

