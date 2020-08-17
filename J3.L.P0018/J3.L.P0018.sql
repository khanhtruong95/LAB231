CREATE DATABASE LAB231_J3LP0018;

USE LAB231_J3LP0018;

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
	[ImageCaption] nvarchar(MAX),
	[Author] nvarchar(MAX),
	[Content] nvarchar(MAX)
);

CREATE TABLE [Comments] (
	[CommentID] int IDENTITY(1,1) PRIMARY KEY,
	[Name] nvarchar(MAX) NOT NULL,
	[Email] nvarchar(MAX) NOT NULL,
	[Message] nvarchar(MAX) NOT NULL
);

INSERT INTO [Categories]([CategoryName]) VALUES
(N'Photo'),(N'Post');

INSERT INTO [Entries]([CategoryID],[Heading],[Published],[ImageName],[ImageCaption]) VALUES
(1,N'In New York',GETDATE(),N'i284852689410723512._szw1280h1280_.jpg',N'Claritas est etiam processus dynamicus, qui sequitur');

INSERT INTO [Entries]([CategoryID],[Heading],[Published],[ImageName],[Content]) VALUES
(2,N'In New York',GETDATE(),N'i284852689410723418._szw480h1280_.jpg',N'<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi. Nam liber tempor cum soluta nobis eleifend option congue nihil imperdiet doming id quod mazim placerat facer possim assum. Typi non habent claritatem insitam; est usus legentis in iis qui facit eorum claritatem. Investigationes demonstraverunt lectores legere me lius quod ii legunt saepius.</p>');

INSERT INTO [Entries]([CategoryID],[Heading],[Published],[ImageName],[ImageCaption]) VALUES
(1,N'Awesome Gucci',GETDATE(),N'i284852689410723250._szw1280h1280_.jpg',N'Claritas est etiam processus dynamicus, qui sequitur');

INSERT INTO [Entries]([CategoryID],[Heading],[Published],[ImageName],[ImageCaption]) VALUES
(1,N'Special Offer',GETDATE(),N'i284852689410723270._szw1280h1280_.jpg',N'Claritas est etiam processus dynamicus, qui sequitur');