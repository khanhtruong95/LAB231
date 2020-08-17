CREATE DATABASE LAB231_J3LP0011;

USE LAB231_J3LP0011;

CREATE TABLE [Categories] (
	[CategoryID] int IDENTITY(1,1) PRIMARY KEY,
	[CategoryName] nvarchar(MAX)
);

CREATE TABLE [Entries] (
	[EntryID] int IDENTITY(1,1) PRIMARY KEY,
	[CategoryID] int REFERENCES [Categories](CategoryID) NOT NULL,
	[Heading] nvarchar(MAX) NOT NULL,
	[Published] date NOT NULL,
	[ImageName] nvarchar(MAX),
	[Author] nvarchar(MAX),
	[Content] nvarchar(MAX)
);

INSERT INTO [Categories]([CategoryName]) VALUES
(N'Photo'),(N'Quote'),(N'Post');

INSERT INTO [Entries]([CategoryID],[Heading],[Published],[ImageName],[Content]) VALUES
(3,N'Essential skills for a happy life!',GETDATE(),N'i283445314544979646._szw480h1280_.jpg',
N'<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat.</p>
<p>At eam doctus oportere, eam feugait delectus ne. Quo cu vulputate persecuti. Eum ut natum possim comprehensam, habeo dicta scaevola eu nec. Ea adhuc reformidans eam. Pri dolore epicuri eu, ne cum tantas fierent instructior. Pro ridens intellegam ut, sea at graecis scriptorem eloquentiam.</p>
<p>Per an labitur lucilius ullamcorper, esse erat ponderum ad vim. Possim laoreet suscipit ex pri, vix numquam eruditi feugait in. Nec maluisset complectitur te, at sea decore semper. Falli numquam perpetua sea et, tibique repudiandae an pro. Ut his solum persius postulant. Soluta nemore debitis ne eos, cum an scripta pericula partiendo.</p>'
);

INSERT INTO [Entries]([CategoryID],[Heading],[Published],[Author],[Content]) VALUES
(2,N'You''ve gotta dance',GETDATE(),N'William W. Purkey',
N'<p>"“You''ve gotta dance like there''s nobody watching,<br>Love like you''ll never be hurt,<br>Sing like there''s nobody listening,<br>And live like it''s heaven on earth.” "</p>');

INSERT INTO [Entries]([CategoryID],[Heading],[Published],[ImageName]) VALUES
(1,N'Photo',GETDATE(),N'i283445314544979644._szw1280h1280_.jpg');