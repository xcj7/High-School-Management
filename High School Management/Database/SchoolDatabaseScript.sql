USE [school]
GO
/****** Object:  Table [dbo].[attendance]    Script Date: 5/15/2020 2:10:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[attendance](
	[att_Id] [int] IDENTITY(1,1) NOT NULL,
	[fk_st_Id] [int] NOT NULL,
	[fk_sub_Id] [int] NOT NULL,
	[date] [date] NOT NULL,
	[status] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[att_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[class]    Script Date: 5/15/2020 2:10:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[class](
	[class_id] [int] NOT NULL,
	[class_name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_class] PRIMARY KEY CLUSTERED 
(
	[class_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[employee]    Script Date: 5/15/2020 2:10:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[employee](
	[e_Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Designation] [nchar](20) NOT NULL,
	[Address] [nvarchar](max) NOT NULL,
	[Contact] [nchar](11) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[e_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[exam]    Script Date: 5/15/2020 2:10:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[exam](
	[exam_id] [int] IDENTITY(1,1) NOT NULL,
	[exam_name] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[exam_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[result]    Script Date: 5/15/2020 2:10:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[result](
	[result_id] [int] IDENTITY(1,1) NOT NULL,
	[fk_st_id] [int] NOT NULL,
	[fk_class_id] [int] NOT NULL,
	[fk_subject_id] [int] NOT NULL,
	[fk_exam_id] [int] NOT NULL,
	[mark_total] [int] NOT NULL,
	[mark_obtained] [int] NOT NULL,
	[comment] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[result_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[students]    Script Date: 5/15/2020 2:10:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[students](
	[st_Id] [int] IDENTITY(1,1) NOT NULL,
	[Roll] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[fk_class_id] [int] NOT NULL,
	[father] [nvarchar](50) NOT NULL,
	[mother] [nvarchar](50) NOT NULL,
	[contact] [nchar](11) NOT NULL,
	[address] [nvarchar](max) NULL,
	[dob] [date] NOT NULL,
	[admissionDate] [date] NOT NULL,
	[gender] [nvarchar](50) NOT NULL,
	[photo] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[st_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Subject]    Script Date: 5/15/2020 2:10:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Subject](
	[subject_id] [int] NOT NULL,
	[subject_name] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[subject_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[subject_enrolment]    Script Date: 5/15/2020 2:10:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[subject_enrolment](
	[fk_class_id] [int] NOT NULL,
	[fk_subject_id] [int] NOT NULL,
 CONSTRAINT [compk_Sub_enroll] PRIMARY KEY CLUSTERED 
(
	[fk_class_id] ASC,
	[fk_subject_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[teacher]    Script Date: 5/15/2020 2:10:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[teacher](
	[t_id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Gender] [varchar](10) NOT NULL,
	[Contact] [nchar](11) NOT NULL,
	[Email] [varchar](50) NOT NULL,
	[Address] [varchar](max) NOT NULL,
	[dob] [date] NOT NULL,
	[join_date] [date] NOT NULL,
	[photo] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[t_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[teacher_subject]    Script Date: 5/15/2020 2:10:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[teacher_subject](
	[Id] [int] NOT NULL,
	[fk_class_id] [int] NOT NULL,
	[fk_subject_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC,
	[fk_class_id] ASC,
	[fk_subject_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[users]    Script Date: 5/15/2020 2:10:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[users](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[username] [nvarchar](50) NOT NULL,
	[password] [nvarchar](50) NOT NULL,
	[type] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[viewAllResult]    Script Date: 5/15/2020 2:10:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[viewAllResult] as

select [class_name] as [Class Name],[Roll],[Name],[exam_name] as [Exam Name],[subject_name] as [Subject Name],[mark_total] as [Total Mark],[mark_obtained] as [Obtained Mark]
from result as rs

join students as st
on  st.st_Id = rs.fk_st_id 

join class as cl
on cl.class_id = rs.fk_class_id

join subject as sb
on sb.subject_id = rs.fk_subject_id

join exam as ex
on ex.exam_id = rs.fk_exam_id
GO
/****** Object:  View [dbo].[viewAllResultTrans]    Script Date: 5/15/2020 2:10:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[viewAllResultTrans] as

select * from viewAllResult
pivot(
	max([Obtained Mark]) for [Subject Name] in([Bangla 1st],[Bangla 2nd],[English 1st],[English 2nd],[Agriculture Studies],[Mathemetics],
											[Islam & Moral Education],
										[Biology],[Economics],[Accounting])
)as pvt1
GO
/****** Object:  View [dbo].[se]    Script Date: 5/15/2020 2:10:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[se] as
select Roll,Name,subject_name,mark_obtained
from 
 students as st
join class as cl
on st.fk_class_id = cl.class_id
join subject_enrolment as se 
on cl.class_id = se.fk_class_id
join subject as s
on se.fk_subject_id = s.subject_id
join result as r
on st.st_Id = r.fk_st_id
GO
/****** Object:  View [dbo].[viewAllClass]    Script Date: 5/15/2020 2:10:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[viewAllClass] as
select class_id as [Class ID],class_name as [Class Name],subject_name as [Assigned Subject]
from Subject as sb
full outer join subject_enrolment as se
on se.fk_subject_id = sb.subject_id
right outer join class as cl
on se.fk_class_id = cl.class_id
GO
/****** Object:  View [dbo].[viewAllStudent]    Script Date: 5/15/2020 2:10:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[viewAllStudent] as
select st_id as ID,Name as Name,class_name as Class,Roll as Roll,gender as Gender,father as "Father Name",mother as "Mother Name",contact as Contact,dob as "Date of Birth",admissionDate as "Admission date",address as Address
from students as st
join class as cl
on cl.class_id = st.fk_class_id
GO
/****** Object:  View [dbo].[viewAllSubject]    Script Date: 5/15/2020 2:10:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[viewAllSubject] as
select subject_id as [Subject ID],subject_name as [Subject Name],class_name as [Assigned Class]
from Subject as sb
full outer join subject_enrolment as se
on se.fk_subject_id = sb.subject_id
left outer join class as cl
on se.fk_class_id = cl.class_id
GO
/****** Object:  View [dbo].[viewAllTeacher]    Script Date: 5/15/2020 2:10:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[viewAllTeacher] as
select name as Name,gender as Gender,contact as Contact,email as Email,address as Address,dob as DOB,join_date as [Join Date],class_name as [Class Name],subject_name as Subject
from teacher as t
left outer join teacher_subject as ts
on ts.Id = t.t_id
left outer join class as cl
on cl.class_id = ts.fk_class_id
left outer join subject as s 
on s.subject_id = ts.fk_subject_id
GO
/****** Object:  View [dbo].[viewAllUser]    Script Date: 5/15/2020 2:10:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[viewAllUser] as
select id as ID,name as Name,username as Username,password as Password,type as Type
from Users
GO
/****** Object:  View [dbo].[viewAssignedTeacher]    Script Date: 5/15/2020 2:10:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[viewAssignedTeacher] as
select name as Name,class_name as [Class Name], subject_name as [Subject Name]
from teacher_subject as ts
join teacher as t
on t.t_id = ts.Id
join class as cl
on cl.class_id = ts.fk_class_id
join subject as s
on s.subject_id = ts.fk_subject_id
GO
SET IDENTITY_INSERT [dbo].[attendance] ON 

INSERT [dbo].[attendance] ([att_Id], [fk_st_Id], [fk_sub_Id], [date], [status]) VALUES (3, 60, 101, CAST(N'2020-04-25' AS Date), 1)
INSERT [dbo].[attendance] ([att_Id], [fk_st_Id], [fk_sub_Id], [date], [status]) VALUES (4, 62, 102, CAST(N'2020-04-22' AS Date), 0)
SET IDENTITY_INSERT [dbo].[attendance] OFF
INSERT [dbo].[class] ([class_id], [class_name]) VALUES (6, N'Six')
INSERT [dbo].[class] ([class_id], [class_name]) VALUES (7, N'Seven')
INSERT [dbo].[class] ([class_id], [class_name]) VALUES (8, N'Eight')
INSERT [dbo].[class] ([class_id], [class_name]) VALUES (9, N'Nine')
INSERT [dbo].[class] ([class_id], [class_name]) VALUES (10, N'Ten')
SET IDENTITY_INSERT [dbo].[employee] ON 

INSERT [dbo].[employee] ([e_Id], [Name], [Designation], [Address], [Contact]) VALUES (1, N'Shuvo', N'Accountant          ', N'Mymensingh', N'1241661161 ')
INSERT [dbo].[employee] ([e_Id], [Name], [Designation], [Address], [Contact]) VALUES (4, N'Noyon Sarker', N'Cleaner             ', N'Mymensingh', N'1241661145 ')
INSERT [dbo].[employee] ([e_Id], [Name], [Designation], [Address], [Contact]) VALUES (7, N'Apon Khondokar', N'Watch Man           ', N'Mymensingh', N'1345465225 ')
SET IDENTITY_INSERT [dbo].[employee] OFF
SET IDENTITY_INSERT [dbo].[exam] ON 

INSERT [dbo].[exam] ([exam_id], [exam_name]) VALUES (1, N'Mid Term')
INSERT [dbo].[exam] ([exam_id], [exam_name]) VALUES (2, N'Final Term')
SET IDENTITY_INSERT [dbo].[exam] OFF
SET IDENTITY_INSERT [dbo].[result] ON 

INSERT [dbo].[result] ([result_id], [fk_st_id], [fk_class_id], [fk_subject_id], [fk_exam_id], [mark_total], [mark_obtained], [comment]) VALUES (15, 62, 6, 134, 1, 100, 95, NULL)
INSERT [dbo].[result] ([result_id], [fk_st_id], [fk_class_id], [fk_subject_id], [fk_exam_id], [mark_total], [mark_obtained], [comment]) VALUES (17, 62, 6, 102, 1, 100, 92, NULL)
INSERT [dbo].[result] ([result_id], [fk_st_id], [fk_class_id], [fk_subject_id], [fk_exam_id], [mark_total], [mark_obtained], [comment]) VALUES (18, 64, 7, 134, 2, 100, 65, NULL)
INSERT [dbo].[result] ([result_id], [fk_st_id], [fk_class_id], [fk_subject_id], [fk_exam_id], [mark_total], [mark_obtained], [comment]) VALUES (19, 60, 10, 101, 1, 100, 98, NULL)
INSERT [dbo].[result] ([result_id], [fk_st_id], [fk_class_id], [fk_subject_id], [fk_exam_id], [mark_total], [mark_obtained], [comment]) VALUES (20, 68, 10, 101, 1, 100, 97, NULL)
INSERT [dbo].[result] ([result_id], [fk_st_id], [fk_class_id], [fk_subject_id], [fk_exam_id], [mark_total], [mark_obtained], [comment]) VALUES (21, 67, 9, 107, 1, 100, 92, NULL)
INSERT [dbo].[result] ([result_id], [fk_st_id], [fk_class_id], [fk_subject_id], [fk_exam_id], [mark_total], [mark_obtained], [comment]) VALUES (22, 65, 8, 108, 1, 100, 93, NULL)
INSERT [dbo].[result] ([result_id], [fk_st_id], [fk_class_id], [fk_subject_id], [fk_exam_id], [mark_total], [mark_obtained], [comment]) VALUES (23, 65, 8, 101, 1, 100, 85, NULL)
INSERT [dbo].[result] ([result_id], [fk_st_id], [fk_class_id], [fk_subject_id], [fk_exam_id], [mark_total], [mark_obtained], [comment]) VALUES (24, 65, 8, 102, 1, 100, 87, NULL)
INSERT [dbo].[result] ([result_id], [fk_st_id], [fk_class_id], [fk_subject_id], [fk_exam_id], [mark_total], [mark_obtained], [comment]) VALUES (25, 65, 8, 107, 1, 100, 97, NULL)
INSERT [dbo].[result] ([result_id], [fk_st_id], [fk_class_id], [fk_subject_id], [fk_exam_id], [mark_total], [mark_obtained], [comment]) VALUES (27, 65, 8, 134, 1, 100, 83, NULL)
INSERT [dbo].[result] ([result_id], [fk_st_id], [fk_class_id], [fk_subject_id], [fk_exam_id], [mark_total], [mark_obtained], [comment]) VALUES (28, 65, 8, 101, 2, 100, 90, NULL)
INSERT [dbo].[result] ([result_id], [fk_st_id], [fk_class_id], [fk_subject_id], [fk_exam_id], [mark_total], [mark_obtained], [comment]) VALUES (29, 65, 8, 102, 2, 100, 60, NULL)
INSERT [dbo].[result] ([result_id], [fk_st_id], [fk_class_id], [fk_subject_id], [fk_exam_id], [mark_total], [mark_obtained], [comment]) VALUES (30, 65, 8, 107, 2, 100, 70, NULL)
SET IDENTITY_INSERT [dbo].[result] OFF
SET IDENTITY_INSERT [dbo].[students] ON 

INSERT [dbo].[students] ([st_Id], [Roll], [Name], [fk_class_id], [father], [mother], [contact], [address], [dob], [admissionDate], [gender], [photo]) VALUES (60, 1, N'FAHIM FAISAL', 10, N'RAFIQUL ISLAM', N'FAHIMA KHATUN', N'1960664645 ', N'Haluaghat', CAST(N'2000-01-01' AS Date), CAST(N'2020-05-12' AS Date), N'Male', N'img_FAHIM_FAISAL_Ten_1.jpg')
INSERT [dbo].[students] ([st_Id], [Roll], [Name], [fk_class_id], [father], [mother], [contact], [address], [dob], [admissionDate], [gender], [photo]) VALUES (62, 1, N'MUSFIQ', 6, N'HAFIZUL', N'ROKEYA', N'1524545556 ', N'Haluaghat', CAST(N'2000-01-01' AS Date), CAST(N'2020-05-12' AS Date), N'Male', N'img_MUSFIQ_Six_1.jpg')
INSERT [dbo].[students] ([st_Id], [Roll], [Name], [fk_class_id], [father], [mother], [contact], [address], [dob], [admissionDate], [gender], [photo]) VALUES (64, 1, N'ARIFUL', 7, N'NOYON', N'ROKEYA', N'1524545554 ', N'Mymensingh', CAST(N'2000-01-01' AS Date), CAST(N'2020-05-12' AS Date), N'Male', N'img_ARIFUL_Seven_1.jpg')
INSERT [dbo].[students] ([st_Id], [Roll], [Name], [fk_class_id], [father], [mother], [contact], [address], [dob], [admissionDate], [gender], [photo]) VALUES (65, 1, N'JHALAK', 8, N'NOYON', N'KONIKA', N'1345545464 ', N'Mymensingh', CAST(N'2000-01-01' AS Date), CAST(N'2020-05-12' AS Date), N'Male', N'img_JHALAK_Eight_1.jpg')
INSERT [dbo].[students] ([st_Id], [Roll], [Name], [fk_class_id], [father], [mother], [contact], [address], [dob], [admissionDate], [gender], [photo]) VALUES (66, 1, N'ARPON', 9, N'NOYON', N'RITTIKA', N'4154545412 ', N'Mymensingh', CAST(N'2000-01-01' AS Date), CAST(N'2020-05-12' AS Date), N'Male', N'img_ARPON_Nine_1.jpg')
INSERT [dbo].[students] ([st_Id], [Roll], [Name], [fk_class_id], [father], [mother], [contact], [address], [dob], [admissionDate], [gender], [photo]) VALUES (67, 2, N'JESMIN', 9, N'HABIBUR', N'RITTIKA', N'1574545566 ', N'Mymensingh', CAST(N'2000-01-01' AS Date), CAST(N'2020-05-12' AS Date), N'Female', N'img_JESMIN_Nine_2.jpg')
INSERT [dbo].[students] ([st_Id], [Roll], [Name], [fk_class_id], [father], [mother], [contact], [address], [dob], [admissionDate], [gender], [photo]) VALUES (68, 2, N'NUSRAT', 10, N'HABIBUR', N'RITTIKA', N'5245456415 ', N'Mymensingh', CAST(N'2000-01-01' AS Date), CAST(N'2020-05-12' AS Date), N'Female', N'img_JESMIN_Nine_2.jpg')
SET IDENTITY_INSERT [dbo].[students] OFF
INSERT [dbo].[Subject] ([subject_id], [subject_name]) VALUES (101, N'Bangla 1st')
INSERT [dbo].[Subject] ([subject_id], [subject_name]) VALUES (102, N'Bangla 2nd')
INSERT [dbo].[Subject] ([subject_id], [subject_name]) VALUES (107, N'English 1st')
INSERT [dbo].[Subject] ([subject_id], [subject_name]) VALUES (108, N'English 2nd')
INSERT [dbo].[Subject] ([subject_id], [subject_name]) VALUES (109, N'Mathemetics')
INSERT [dbo].[Subject] ([subject_id], [subject_name]) VALUES (111, N'Islam & Moral Education')
INSERT [dbo].[Subject] ([subject_id], [subject_name]) VALUES (112, N'Hindu & Moral Education')
INSERT [dbo].[Subject] ([subject_id], [subject_name]) VALUES (126, N'Higher Mathemetics')
INSERT [dbo].[Subject] ([subject_id], [subject_name]) VALUES (127, N'Science')
INSERT [dbo].[Subject] ([subject_id], [subject_name]) VALUES (134, N'Agriculture Studies')
INSERT [dbo].[Subject] ([subject_id], [subject_name]) VALUES (136, N'Physics')
INSERT [dbo].[Subject] ([subject_id], [subject_name]) VALUES (137, N'Chemistry')
INSERT [dbo].[Subject] ([subject_id], [subject_name]) VALUES (138, N'Biology')
INSERT [dbo].[Subject] ([subject_id], [subject_name]) VALUES (141, N'Economics')
INSERT [dbo].[Subject] ([subject_id], [subject_name]) VALUES (146, N'Accounting')
INSERT [dbo].[Subject] ([subject_id], [subject_name]) VALUES (154, N'Informatione & Communication Technolgy')
INSERT [dbo].[subject_enrolment] ([fk_class_id], [fk_subject_id]) VALUES (6, 101)
INSERT [dbo].[subject_enrolment] ([fk_class_id], [fk_subject_id]) VALUES (6, 102)
INSERT [dbo].[subject_enrolment] ([fk_class_id], [fk_subject_id]) VALUES (6, 107)
INSERT [dbo].[subject_enrolment] ([fk_class_id], [fk_subject_id]) VALUES (6, 111)
INSERT [dbo].[subject_enrolment] ([fk_class_id], [fk_subject_id]) VALUES (6, 127)
INSERT [dbo].[subject_enrolment] ([fk_class_id], [fk_subject_id]) VALUES (7, 101)
INSERT [dbo].[subject_enrolment] ([fk_class_id], [fk_subject_id]) VALUES (7, 102)
INSERT [dbo].[subject_enrolment] ([fk_class_id], [fk_subject_id]) VALUES (7, 107)
INSERT [dbo].[subject_enrolment] ([fk_class_id], [fk_subject_id]) VALUES (7, 109)
INSERT [dbo].[subject_enrolment] ([fk_class_id], [fk_subject_id]) VALUES (7, 127)
INSERT [dbo].[subject_enrolment] ([fk_class_id], [fk_subject_id]) VALUES (8, 101)
INSERT [dbo].[subject_enrolment] ([fk_class_id], [fk_subject_id]) VALUES (8, 102)
INSERT [dbo].[subject_enrolment] ([fk_class_id], [fk_subject_id]) VALUES (8, 107)
INSERT [dbo].[subject_enrolment] ([fk_class_id], [fk_subject_id]) VALUES (8, 109)
INSERT [dbo].[subject_enrolment] ([fk_class_id], [fk_subject_id]) VALUES (8, 111)
INSERT [dbo].[subject_enrolment] ([fk_class_id], [fk_subject_id]) VALUES (9, 101)
INSERT [dbo].[subject_enrolment] ([fk_class_id], [fk_subject_id]) VALUES (9, 102)
INSERT [dbo].[subject_enrolment] ([fk_class_id], [fk_subject_id]) VALUES (9, 107)
INSERT [dbo].[subject_enrolment] ([fk_class_id], [fk_subject_id]) VALUES (9, 108)
INSERT [dbo].[subject_enrolment] ([fk_class_id], [fk_subject_id]) VALUES (9, 112)
INSERT [dbo].[subject_enrolment] ([fk_class_id], [fk_subject_id]) VALUES (9, 126)
INSERT [dbo].[subject_enrolment] ([fk_class_id], [fk_subject_id]) VALUES (9, 134)
INSERT [dbo].[subject_enrolment] ([fk_class_id], [fk_subject_id]) VALUES (9, 136)
INSERT [dbo].[subject_enrolment] ([fk_class_id], [fk_subject_id]) VALUES (9, 137)
INSERT [dbo].[subject_enrolment] ([fk_class_id], [fk_subject_id]) VALUES (10, 101)
INSERT [dbo].[subject_enrolment] ([fk_class_id], [fk_subject_id]) VALUES (10, 102)
SET IDENTITY_INSERT [dbo].[teacher] ON 

INSERT [dbo].[teacher] ([t_id], [Name], [Gender], [Contact], [Email], [Address], [dob], [join_date], [photo]) VALUES (9, N'FAHIM FAISAL', N'Male', N'1960839343 ', N'fahim@gmail.com', N'Haluaghat', CAST(N'2000-01-01' AS Date), CAST(N'2020-04-21' AS Date), N'default.jpg')
INSERT [dbo].[teacher] ([t_id], [Name], [Gender], [Contact], [Email], [Address], [dob], [join_date], [photo]) VALUES (11, N'FAHIMA', N'Female', N'1960839344 ', N'fahimhh@gmail.com', N'Haluaghat', CAST(N'2000-01-01' AS Date), CAST(N'2020-04-22' AS Date), N'default.jpg')
INSERT [dbo].[teacher] ([t_id], [Name], [Gender], [Contact], [Email], [Address], [dob], [join_date], [photo]) VALUES (12, N'SHUVO', N'Male', N'1960839349 ', N'fahihh@gmail.com', N'Haluaghat', CAST(N'2000-01-01' AS Date), CAST(N'2020-04-22' AS Date), N'default.jpg')
SET IDENTITY_INSERT [dbo].[teacher] OFF
INSERT [dbo].[teacher_subject] ([Id], [fk_class_id], [fk_subject_id]) VALUES (9, 6, 101)
INSERT [dbo].[teacher_subject] ([Id], [fk_class_id], [fk_subject_id]) VALUES (9, 6, 102)
INSERT [dbo].[teacher_subject] ([Id], [fk_class_id], [fk_subject_id]) VALUES (9, 7, 101)
INSERT [dbo].[teacher_subject] ([Id], [fk_class_id], [fk_subject_id]) VALUES (9, 7, 146)
INSERT [dbo].[teacher_subject] ([Id], [fk_class_id], [fk_subject_id]) VALUES (11, 7, 126)
INSERT [dbo].[teacher_subject] ([Id], [fk_class_id], [fk_subject_id]) VALUES (12, 7, 137)
SET IDENTITY_INSERT [dbo].[users] ON 

INSERT [dbo].[users] ([Id], [name], [username], [password], [type]) VALUES (1, N'Fahim Faisal', N'fahim', N'12345', N'admin')
INSERT [dbo].[users] ([Id], [name], [username], [password], [type]) VALUES (2, N'Atif Islam', N'atif', N'12345', N'student')
INSERT [dbo].[users] ([Id], [name], [username], [password], [type]) VALUES (3, N'Nazrul Islam', N'nazrul', N'12345', N'teacher')
INSERT [dbo].[users] ([Id], [name], [username], [password], [type]) VALUES (5, N'Arpon', N'arpon', N'12345', N'student')
INSERT [dbo].[users] ([Id], [name], [username], [password], [type]) VALUES (6, N'Noyon Sorkar', N'noyon', N'12345', N'teacher')
INSERT [dbo].[users] ([Id], [name], [username], [password], [type]) VALUES (9, N'Shuvo', N'shuvo', N'12345', N'teacher')
INSERT [dbo].[users] ([Id], [name], [username], [password], [type]) VALUES (10, N'Jhalak Sarker', N'jhalak', N'12345', N'teacher')
SET IDENTITY_INSERT [dbo].[users] OFF
/****** Object:  Index [CFK_attend]    Script Date: 5/15/2020 2:10:20 PM ******/
ALTER TABLE [dbo].[attendance] ADD  CONSTRAINT [CFK_attend] UNIQUE NONCLUSTERED 
(
	[fk_st_Id] ASC,
	[date] ASC,
	[fk_sub_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [unique_phn]    Script Date: 5/15/2020 2:10:20 PM ******/
ALTER TABLE [dbo].[employee] ADD  CONSTRAINT [unique_phn] UNIQUE NONCLUSTERED 
(
	[Contact] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [unique_id_sub_exam]    Script Date: 5/15/2020 2:10:20 PM ******/
ALTER TABLE [dbo].[result] ADD  CONSTRAINT [unique_id_sub_exam] UNIQUE NONCLUSTERED 
(
	[fk_st_id] ASC,
	[fk_subject_id] ASC,
	[fk_exam_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [class_roll_cmpk]    Script Date: 5/15/2020 2:10:20 PM ******/
ALTER TABLE [dbo].[students] ADD  CONSTRAINT [class_roll_cmpk] UNIQUE NONCLUSTERED 
(
	[fk_class_id] ASC,
	[Roll] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [unique_phn_std]    Script Date: 5/15/2020 2:10:20 PM ******/
ALTER TABLE [dbo].[students] ADD  CONSTRAINT [unique_phn_std] UNIQUE NONCLUSTERED 
(
	[contact] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [UQ__Subject__AC1BA3A983F502AF]    Script Date: 5/15/2020 2:10:20 PM ******/
ALTER TABLE [dbo].[Subject] ADD UNIQUE NONCLUSTERED 
(
	[subject_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__teacher__A9D10534BD865CAE]    Script Date: 5/15/2020 2:10:20 PM ******/
ALTER TABLE [dbo].[teacher] ADD UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__teacher__F7C0466576B47204]    Script Date: 5/15/2020 2:10:20 PM ******/
ALTER TABLE [dbo].[teacher] ADD UNIQUE NONCLUSTERED 
(
	[Contact] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [username_unique]    Script Date: 5/15/2020 2:10:20 PM ******/
ALTER TABLE [dbo].[users] ADD  CONSTRAINT [username_unique] UNIQUE NONCLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[attendance] ADD  DEFAULT ((0)) FOR [status]
GO
ALTER TABLE [dbo].[attendance]  WITH CHECK ADD  CONSTRAINT [FK_attendance_To_Student] FOREIGN KEY([fk_st_Id])
REFERENCES [dbo].[students] ([st_Id])
GO
ALTER TABLE [dbo].[attendance] CHECK CONSTRAINT [FK_attendance_To_Student]
GO
ALTER TABLE [dbo].[attendance]  WITH CHECK ADD  CONSTRAINT [FK_attendance_To_Subject] FOREIGN KEY([fk_sub_Id])
REFERENCES [dbo].[Subject] ([subject_id])
GO
ALTER TABLE [dbo].[attendance] CHECK CONSTRAINT [FK_attendance_To_Subject]
GO
ALTER TABLE [dbo].[result]  WITH CHECK ADD  CONSTRAINT [FK_result_class] FOREIGN KEY([fk_class_id])
REFERENCES [dbo].[class] ([class_id])
GO
ALTER TABLE [dbo].[result] CHECK CONSTRAINT [FK_result_class]
GO
ALTER TABLE [dbo].[result]  WITH CHECK ADD  CONSTRAINT [FK_result_exam] FOREIGN KEY([fk_exam_id])
REFERENCES [dbo].[exam] ([exam_id])
GO
ALTER TABLE [dbo].[result] CHECK CONSTRAINT [FK_result_exam]
GO
ALTER TABLE [dbo].[result]  WITH CHECK ADD  CONSTRAINT [FK_result_student] FOREIGN KEY([fk_st_id])
REFERENCES [dbo].[students] ([st_Id])
GO
ALTER TABLE [dbo].[result] CHECK CONSTRAINT [FK_result_student]
GO
ALTER TABLE [dbo].[result]  WITH CHECK ADD  CONSTRAINT [FK_result_subject] FOREIGN KEY([fk_subject_id])
REFERENCES [dbo].[Subject] ([subject_id])
GO
ALTER TABLE [dbo].[result] CHECK CONSTRAINT [FK_result_subject]
GO
ALTER TABLE [dbo].[students]  WITH CHECK ADD  CONSTRAINT [FK_students_class] FOREIGN KEY([fk_class_id])
REFERENCES [dbo].[class] ([class_id])
GO
ALTER TABLE [dbo].[students] CHECK CONSTRAINT [FK_students_class]
GO
ALTER TABLE [dbo].[subject_enrolment]  WITH CHECK ADD FOREIGN KEY([fk_class_id])
REFERENCES [dbo].[class] ([class_id])
GO
ALTER TABLE [dbo].[subject_enrolment]  WITH CHECK ADD FOREIGN KEY([fk_subject_id])
REFERENCES [dbo].[Subject] ([subject_id])
GO
ALTER TABLE [dbo].[result]  WITH CHECK ADD  CONSTRAINT [CK_result_obtain] CHECK  (([mark_obtained]<[mark_total]))
GO
ALTER TABLE [dbo].[result] CHECK CONSTRAINT [CK_result_obtain]
GO
