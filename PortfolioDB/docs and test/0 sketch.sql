/*
Profile
    pk
    FirstName varchar35
    LastName varchar35
    EmailAddress varchar 100
    PhoneNumber varchar 14
    GithubAccount varchar 100
    ProfileDesc varchar 1000
    hasResume bit

DevTool
    pk
    DevToolName varchar 25
    Sequence int

DevSection
    pk
    DevSectionCode unique varchar 25
    DevSectionName unique varchar 35
    DevSectionOverview varchar 500
    DevSectionDesc varchar 500
    DevSectionBlurb varchar 250
    HasPicture bit
    Sequence int

DevSectionTool
    pk
    DevSectionId fk
    DevToolId fk

DevSubsection
    pk
    DevSectionId
    DevSubsectionCode varchar 25
    DevSubsectionName varchar 35
    DevSubsectionDesc varchar 500
    GitHubRepoName varchar 25

DevSubsectionElement
    pk
    DevSubsectionId fk
    DevSubsectionElementCode varchar 25
    ButtonText varchar 25
    HtmlTag 
    FileExtension char 4 

DevSubsectionTool
    pk
    DevSubsectionId fk
    DevToolId fk


*/