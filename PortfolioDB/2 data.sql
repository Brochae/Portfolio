--AS Great job! 100%
use PortfolioDB

delete DevSubSectionTool
delete DevSubsectionElement
delete DevSubSection
delete DevSection
delete DevTool
delete DevToolType
delete Profile
go

insert Profile(FirstName, LastName, EmailAddress, PhoneNumber, GitHubAccount, ProfileDesc)
select 
    'Brocha',
    'Eckstein',
    'brochaeckstein@gmail.com',
    '(347) 932-6394',
    'https://github.com/Brochae',
    'I am a software developer who was trained in CPU Code School to produce top quality software. I am proficient in the full stack of software development, from requirements gathering to implementation of database, middle tier, and front end. This is done through the use of SQL Server, VB.Net, C#, ASP.Net, HTML, Bootstrap, Java Script, JQuery and more. Databases and websites are deployed to the cloud using Microsoft Azure. In fact, this website portfolio uses all the aforementioned technologies as described in each section. Go ahead take a look...'
go
insert DevToolType(DevToolTypeCode, DevToolTypeName, DevToolTypeSequenceNum, ShowOnHomePage)
      select 'skill', 'My Skills', 1,1
union select 'language', 'My Tools and Technologies', 0, 1
go

;with x as (
            select 
             (select t.DevToolTypeId from DevToolType t where t.DevToolTypeCode = 'language') as LanguageId, 
             (select t.DevToolTypeId from DevToolType t where t.DevToolTypeCode = 'skill') as SkillId
)
insert DevTool(HasIcon, DevToolTypeId, DevToolName, DevToolSequenceNum)
      select 1, x.LanguageId, 'SQL', 1 from x
union select 0, x.SkillId, 'SQL - CRUD', 2 from x 
union select 0, x.SkillId, 'SQL - Stored Procedures', 3 from x 
union select 1, x.LanguageId, 'C#', 4 from x 
union select 1, x.LanguageId, 'Dapper', 5 from x 
union select 0, x.SkillId, 'Software Architecture', 6 from x 
union select 0, x.SkillId, 'Desktop Apps', 7 from x 
union select 1, x.LanguageId, 'ASP.Net', 8 from x 
union select 0, x.SkillId, 'MVC', 9 from x 
union select 1, x.LanguageId, 'HTML', 10 from x 
union select 1, x.LanguageId, 'CSS', 11 from x 
union select 1, x.LanguageId, 'Bootstrap', 12 from x 
union select 1, x.LanguageId, 'JavaScript', 13 from x 
union select 1, x.LanguageId, 'JQuery', 14 from x 
union select 1, x.LanguageId, 'React', 15 from x 
union select 0, x.SkillId, 'REST API''s', 16 from x 
union select 1, x.LanguageId, 'Git', 17 from x 
union select 0, x.SkillId, 'Requirements Gathering', 18 from x 
union select 0, x.SkillId, 'Relational Database Schema Design', 19 from x 
union select 0, x.SkillId, 'Unit Testing', 20 from x 
union select 0, x.SkillId, 'Wireframes', 21 from x 
union select 0, x.SkillId, 'Quality Assurance', 22 from x 
union select 0, x.SkillId, 'Rollout', 23 from x 
go


insert DevSection(DevSectionCode, DevSectionName, DevSectionOverview, DevSectionBlurb, HasPicture, DevSectionSequenceNum)
      select 'DB-Schemas','DB Schemas', 'Databases are the foundation of a software system. A strong database with constraints, foreign keys, functions, and stored procedures produces a system that is safe and secure.', 'Each database is handwritten using constraints,foreign keys, functions, and stored procedures to produce a safe and secure system.', 1, 0
union select 'Framework-Business-Objects', 'Framework/Business Objects', 'Creating a framework and Business Objects in a program makes the development easier, smoother and have cleaner code.', 'Creating a framework and Business Objects in a program makes the production easier, smoother and have cleaner code.', 0,1
union select 'Windows-Projects', 'Windows Projects', 'Windows programs are created using VB.Net and C#. They can be downloaded onto any computer.', 'Windows programs are created using object VB.Net and C#.', 0,2
union select 'Web-Projects', 'Web Projects', 'Web programs are created using HTML, ASP.Net, MVC, Java Script and JQuery.', 'Web apps are created using HTML, ASP.Net, MVC, JavaScript and JQuery.', 0, 3
go

insert DevSubsection( DevSectionId, DevSubsectionSequenceNum , DevSubsectionCode, DevSubsectionName, GitHubRepoName, DevSubsectionDesc)
      select (select ds.DevSectionId from DevSection ds where ds.DevSectionCode = 'DB-Schemas'), 1, 'US-Gov-DB', 'US Gov', 'beckstein-US-Gov', 'The US Gov database has all our 45 presidents, 52 states, presidential executive orders, US Departments, US Budget and more.'
union select (select ds.DevSectionId from DevSection ds where ds.DevSectionCode = 'DB-Schemas'), 2, 'Book-Store-DB', 'Book Store', 'beckstein-BookstoreDB', 'The Book Store database was designed to handle the organization of books (some of them having multiple genres), into various shelves in different stores.'
union select (select ds.DevSectionId from DevSection ds where ds.DevSectionCode = 'DB-Schemas'), 3, 'Recipes-DB', 'Recipes', 'beckstein-RecipeDB', 'The recipe database has a collection of variouse recipes and was created to support the reorganization of these recipes into multi-course meals and cookbooks via different users.'
union select (select ds.DevSectionId from DevSection ds where ds.DevSectionCode = 'DB-Schemas'), 4, 'Portfolio-DB', 'Portfolio', '', 'The portfolio database was designed to organize all the information on this website.'
union select (select ds.DevSectionId from DevSection ds where ds.DevSectionCode = 'Framework-Business-Objects'), 1, 'Framework', 'Framework', 'beckstein-framework', 'When writing programs, it is essential to create and work with a framework. A framework is a project where common and re-usable code is stored. It is written in a way that it can be used anywhere at anytime. Code such as logins, connection strings and data types are just a few of the many components written up in a framework.'
union select (select ds.DevSectionId from DevSection ds where ds.DevSectionCode = 'Framework-Business-Objects'), 2, 'bizObject', 'bizObject', 'beckstein-bizobject', 'Business objects are written as an inheritance of a bizObject which is written up in the framework. Business Objects are what make the system blend with the data from the database. For every project, a unique library of business objects is formed to work with its specific data.'
union select (select ds.DevSectionId from DevSection ds where ds.DevSectionCode = 'Framework-Business-Objects'), 3, 'sqlUtility', 'sqlUtility', 'beckstein-sqlutility', 'sqlUtility is a class where general utilites are written up so that they can be used for any program. It sets up connection strings, gets a data table from a stored procedure or a sql statement, parses out the error messages from the constraints, and much more.'
union select (select ds.DevSectionId from DevSection ds where ds.DevSectionCode = 'Windows-Projects'), 1, 'tic-tac-toe-Win', 'Tic Tac Toe', 'beckstein-tic-tac-toe', 'The traditional tic-tac-toe game with both 1 and 2 player options.'
union select (select ds.DevSectionId from DevSection ds where ds.DevSectionCode = 'Windows-Projects'), 2, 'calculator-Win', 'Calculator', 'beckstein-calculator', 'This calculator has full functionality of the four basic mathematical functions. It handles negative factors, the division by zero error, and has friendly messages to correct the user when the equation is not complete (and the user tries to calculate it).'
union select (select ds.DevSectionId from DevSection ds where ds.DevSectionCode = 'Windows-Projects'), 3, 'Hangman-Win', 'Hangman', 'beckstein-hangman', 'This is an enhanced version of the traditional Hangman game with hint, comments, and more!'
union select (select ds.DevSectionId from DevSection ds where ds.DevSectionCode = 'Windows-Projects'), 4, 'Recipe-Win', 'Recipe', 'beckstein-RecipeDB', 'The recipe project functions as a windows front-end for the recipe relational database.'
union select (select ds.DevSectionId from DevSection ds where ds.DevSectionCode = 'Web-Projects'), 1, 'US-Gov-Web','US Gov', 'beckstein-US-Gov', 'Designed and published a web front end for the US-Gov database with a large variety of tools and functionality.'
union select (select ds.DevSectionId from DevSection ds where ds.DevSectionCode = 'Web-Projects'), 2, 'Recipe-Web', 'Ravin Recipes', 'beckstein-recipes', 'Designed and published a web front end fot the Recipe database with a large variety of tools and functionality.'
union select (select ds.DevSectionId from DevSection ds where ds.DevSectionCode = 'Web-Projects'), 3, 'Hangman-Web', 'Hangman', 'beckstein-Hangman', 'Designed a web front end with similar funtionality to the Hangman winforms project.'
union select (select ds.DevSectionId from DevSection ds where ds.DevSectionCode = 'Web-Projects'), 4, 'calculator-Web', 'Calculator', 'beckstein-Calculator', 'Designed a web front end with similar funtionality to the Calculator winforms project.'
go

with x as (
      select s.DevSectionCode, d.*
      from DevSubsection d 
      join DevSection s on d.DevSectionId = s.DevSectionId
)
insert DevSubsectionElement( DevSubsectionId, DevSubsectionElementCode, ButtonText, HtmlTag, FileExtension, DevSubsectionElementPriority)
select x.DevSubsectionId, 'dbschema', 'Schema Diagram', 'img', '.png', 1
from x
where x.DevSectionCode = 'DB-Schemas' and x.DevSubsectionCode not in ('Book-Store-DB', 'US-Gov-DB')
union
select x.DevSubsectionId, 'sqlscript', 'SQL Script', 'iframe', '.html', 2
from x 
where x.DevSectionCode = 'DB-Schemas' and x.DevSubsectionCode not in ('Book-Store-DB', 'US-Gov-DB')
union
select x.DevSubsectionId, 'wireframes', 'Wireframe', 'img', '.png', 1
from x 
where x.DevSectionCode = 'Windows-Projects' and x.DevSubsectionCode in ('Hangman-Win', 'tic-tac-toe-Win')
go


insert DevSubsectionTool(DevSubsectionId, DevToolId)
select dss.DevSubsectionId, dt.DevToolId
from DevSubsection dss
cross join DevTool dt
where dss.DevSubsectionCode = 'US-Gov-DB' and dt.DevToolName in ('SQL - CRUD', 'SQL - Stored Procedures', 'Relational Database Schema Design', 'Quality Assurance', 'Rollout' )

union select dss.DevSubsectionId, dt.DevToolId
from DevSubsection dss
cross join DevTool dt
where dss.DevSubsectionCode = 'Book-Store-DB' and dt.DevToolName in ('SQL - CRUD', 'Requirements Gathering', 'Relational Database Schema Design', 'Quality Assurance', 'Rollout' )

union select dss.DevSubsectionId, dt.DevToolId
from DevSubsection dss
cross join DevTool dt
where dss.DevSubsectionCode = 'Recipes-DB' and dt.DevToolName in ('SQL - CRUD', 'SQL - Stored Procedures', 'Requirements Gathering', 'Relational Database Schema Design', 'Quality Assurance', 'Rollout' )

union select dss.DevSubsectionId, dt.DevToolId
from DevSubsection dss
cross join DevTool dt
where dss.DevSubsectionCode = 'Framework' and dt.DevToolName in ('SQL - Stored Procedures', 'C#', 'Dapper', 'Software Architecture')

union select dss.DevSubsectionId, dt.DevToolId
from DevSubsection dss
cross join DevTool dt
where dss.DevSubsectionCode = 'bizObject' and dt.DevToolName in ('C#', 'Software Architecture')

union select dss.DevSubsectionId, dt.DevToolId
from DevSubsection dss
cross join DevTool dt
where dss.DevSubsectionCode = 'sqlUtility' and dt.DevToolName in ('SQL', 'SQL - Stored Procedures', 'C#', 'Dapper', 'Software Architecture')

union select dss.DevSubsectionId, dt.DevToolId
from DevSubsection dss
cross join DevTool dt
where dss.DevSubsectionCode = 'tic-tac-toe-Win' and dt.DevToolName in ('C#', 'Desktop Apps', 'Quality Assurance', 'Wireframes')

union select dss.DevSubsectionId, dt.DevToolId
from DevSubsection dss
cross join DevTool dt
where dss.DevSubsectionCode = 'calculator-Win' and dt.DevToolName in ('C#', 'Desktop Apps', 'Quality Assurance')

union select dss.DevSubsectionId, dt.DevToolId
from DevSubsection dss
cross join DevTool dt
where dss.DevSubsectionCode = 'Hangman-Win' and dt.DevToolName in ('C#', 'Desktop Apps', 'Unit Testing', 'Wireframes', 'Quality Assurance', 'Rollout')

union select dss.DevSubsectionId, dt.DevToolId
from DevSubsection dss
cross join DevTool dt
where dss.DevSubsectionCode = 'Recipe-Win' and dt.DevToolName in ('SQL', 'SQL - Stored Procedures', 'C#', 'Dapper', 'Software Architecture', 'Desktop Apps', 'Unit Testing', 'Quality Assurance', 'Rollout')

union select dss.DevSubsectionId, dt.DevToolId
from DevSubsection dss
cross join DevTool dt
where dss.DevSubsectionCode = 'US-Gov-Web' and dt.DevToolName in ('Software Architecture', 'ASP.Net', 'MVC', 'HTML', 'CSS', 'Bootstrap', 'JavaScript', 'JQuery', 'React', 'REST API''s', 'Quality Assurance', 'Rollout')

union select dss.DevSubsectionId, dt.DevToolId
from DevSubsection dss
cross join DevTool dt
where dss.DevSubsectionCode = 'Recipe-Web' and dt.DevToolName in ('Software Architecture', 'ASP.Net', 'MVC', 'HTML', 'CSS', 'Bootstrap', 'JavaScript', 'JQuery', 'React', 'REST API''s', 'Quality Assurance', 'Rollout')

union select dss.DevSubsectionId, dt.DevToolId
from DevSubsection dss
cross join DevTool dt
where dss.DevSubsectionCode = 'Hangman-Web' and dt.DevToolName in ('HTML', 'CSS', 'Bootstrap', 'JavaScript', 'Quality Assurance')

union select dss.DevSubsectionId, dt.DevToolId
from DevSubsection dss
cross join DevTool dt
where dss.DevSubsectionCode = 'calculator-Web' and dt.DevToolName in ('HTML', 'CSS', 'Bootstrap', 'JavaScript', 'JQuery', 'Quality Assurance')