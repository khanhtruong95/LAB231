CREATE DATABASE LAB231_J3LP0001;

USE LAB231_J3LP0001;

CREATE TABLE [Users] (
	[UserID] int IDENTITY(1,1) PRIMARY KEY,
	[Username] nvarchar(MAX) NOT NULL,
	[Password] nvarchar(MAX) NOT NULL,
	[RoleID] int NOT NULL,
	[Email] nvarchar(MAX) NOT NULL
);

CREATE TABLE [Roles] (
	[RoleID] int IDENTITY(1,1) PRIMARY KEY,
	[RoleName] nvarchar(MAX) NOT NULL
);

CREATE TABLE [User_Role] (
	[UserID] int REFERENCES [Users](UserID) NOT NULL,
	[RoleID] int REFERENCES [Roles](RoleID) NOT NULL
);

CREATE TABLE [Quizzes] (
	[QuizID] int IDENTITY(1,1) PRIMARY KEY,
	[Question] nvarchar(MAX) NOT NULL,
	[Option1] nvarchar(MAX) NOT NULL,
	[Option2] nvarchar(MAX) NOT NULL,
	[Option3] nvarchar(MAX) NOT NULL,
	[Option4] nvarchar(MAX) NOT NULL,
	[Answer] nvarchar(MAX) NOT NULL,
	[UserID] int REFERENCES [Users](UserID) NOT NULL,
	[Created] date NOT NULL
);

INSERT INTO [Roles]([RoleName]) VALUES
('Teacher'),('Student');

INSERT INTO [Users]([Username],[Password],[RoleID],[Email]) VALUES
('sa1','sa',1,'HangNTT@fe.edu.vn'),
('sa2','sa',2,'sa@fpt.edu.vn');

INSERT INTO [User_Role]([UserID],[RoleID]) VALUES
(1,1),(2,2);

INSERT INTO [Quizzes]([Question],[Option1],[Option2],[Option3],[Option4],[Answer],[UserID],[Created]) VALUES
(N'1',N'1',N'2',N'3',N'4','1',1,GETDATE()),
(N'2',N'1',N'2',N'3',N'4','2',1,GETDATE()),
(N'3',N'1',N'2',N'3',N'4','3',1,GETDATE()),
(N'4',N'1',N'2',N'3',N'4','4',1,GETDATE());