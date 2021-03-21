USE [TOP10OWASP]
GO
/****** Object:  Table [dbo].[CATEGORY]    Script Date: 3/21/2021 10:38:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CATEGORY](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[NAME] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CATEGORYOWASP]    Script Date: 3/21/2021 10:38:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CATEGORYOWASP](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[URL] [varchar](100) NULL,
	[NAME] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MESSAGE]    Script Date: 3/21/2021 10:38:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MESSAGE](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[MESSAGE] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PRODUCT]    Script Date: 3/21/2021 10:38:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PRODUCT](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[NAME] [nvarchar](50) NULL,
	[PRICE] [float] NULL,
	[CATEGORY_ID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PRODUCTOWASP]    Script Date: 3/21/2021 10:38:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PRODUCTOWASP](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[URL] [varchar](100) NULL,
	[NAME] [nvarchar](50) NULL,
	[PRICE] [float] NULL,
	[CATEGORY_ID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[USERACCOUNT]    Script Date: 3/21/2021 10:38:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[USERACCOUNT](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[USERNAME] [nvarchar](50) NULL,
	[PASSWORD] [nvarchar](50) NULL,
	[NAME] [nvarchar](50) NULL,
	[ROLE] [varchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[USERACCOUNTOWASP]    Script Date: 3/21/2021 10:38:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[USERACCOUNTOWASP](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[USERNAME] [nvarchar](50) NULL,
	[PASSWORD] [varbinary](16) NULL,
	[NAME] [nvarchar](50) NULL,
	[ROLE] [varchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[CATEGORY] ON 

INSERT [dbo].[CATEGORY] ([ID], [NAME]) VALUES (1, N'COFFEE')
INSERT [dbo].[CATEGORY] ([ID], [NAME]) VALUES (2, N'TEA')
INSERT [dbo].[CATEGORY] ([ID], [NAME]) VALUES (3, N'CHOCOLATE')
SET IDENTITY_INSERT [dbo].[CATEGORY] OFF
GO
SET IDENTITY_INSERT [dbo].[CATEGORYOWASP] ON 

INSERT [dbo].[CATEGORYOWASP] ([ID], [URL], [NAME]) VALUES (1, N'san-pham-coffee', N'COFFEE')
INSERT [dbo].[CATEGORYOWASP] ([ID], [URL], [NAME]) VALUES (2, N'san-pham-tea', N'TEA')
INSERT [dbo].[CATEGORYOWASP] ([ID], [URL], [NAME]) VALUES (3, N'san-pham-cho-co-late', N'CHOCOLATE')
SET IDENTITY_INSERT [dbo].[CATEGORYOWASP] OFF
GO
SET IDENTITY_INSERT [dbo].[MESSAGE] ON 

INSERT [dbo].[MESSAGE] ([ID], [MESSAGE]) VALUES (39, N'                <script>alert(''hacked!!'');</script>                        ')
INSERT [dbo].[MESSAGE] ([ID], [MESSAGE]) VALUES (40, N'hahaha')
INSERT [dbo].[MESSAGE] ([ID], [MESSAGE]) VALUES (41, N'hahahahahah')
INSERT [dbo].[MESSAGE] ([ID], [MESSAGE]) VALUES (42, NULL)
INSERT [dbo].[MESSAGE] ([ID], [MESSAGE]) VALUES (43, NULL)
INSERT [dbo].[MESSAGE] ([ID], [MESSAGE]) VALUES (44, NULL)
INSERT [dbo].[MESSAGE] ([ID], [MESSAGE]) VALUES (45, NULL)
INSERT [dbo].[MESSAGE] ([ID], [MESSAGE]) VALUES (46, N'Nhắn cho dui')
INSERT [dbo].[MESSAGE] ([ID], [MESSAGE]) VALUES (47, N'Nhắn cho dui')
INSERT [dbo].[MESSAGE] ([ID], [MESSAGE]) VALUES (48, N'Nhắn cho dui')
INSERT [dbo].[MESSAGE] ([ID], [MESSAGE]) VALUES (49, N'hahahahahahahaha')
INSERT [dbo].[MESSAGE] ([ID], [MESSAGE]) VALUES (50, NULL)
INSERT [dbo].[MESSAGE] ([ID], [MESSAGE]) VALUES (51, NULL)
INSERT [dbo].[MESSAGE] ([ID], [MESSAGE]) VALUES (52, NULL)
INSERT [dbo].[MESSAGE] ([ID], [MESSAGE]) VALUES (53, NULL)
INSERT [dbo].[MESSAGE] ([ID], [MESSAGE]) VALUES (54, NULL)
INSERT [dbo].[MESSAGE] ([ID], [MESSAGE]) VALUES (55, NULL)
INSERT [dbo].[MESSAGE] ([ID], [MESSAGE]) VALUES (56, N'ahah')
INSERT [dbo].[MESSAGE] ([ID], [MESSAGE]) VALUES (57, N'haha')
INSERT [dbo].[MESSAGE] ([ID], [MESSAGE]) VALUES (58, N'hahaha')
INSERT [dbo].[MESSAGE] ([ID], [MESSAGE]) VALUES (59, N'kakaka')
INSERT [dbo].[MESSAGE] ([ID], [MESSAGE]) VALUES (60, N'ahahah')
INSERT [dbo].[MESSAGE] ([ID], [MESSAGE]) VALUES (61, N'ai biet gi dau')
INSERT [dbo].[MESSAGE] ([ID], [MESSAGE]) VALUES (62, N'                <script>alert(''hacked!!'');</script>                        ')
INSERT [dbo].[MESSAGE] ([ID], [MESSAGE]) VALUES (63, N'                <script>alert(''hacked!!'');</script>                        ')
INSERT [dbo].[MESSAGE] ([ID], [MESSAGE]) VALUES (64, N'                <script>alert(''hacked!!'');</script>                        ')
INSERT [dbo].[MESSAGE] ([ID], [MESSAGE]) VALUES (65, N'                <script>alert(''hacked!!'');</script>                        ')
INSERT [dbo].[MESSAGE] ([ID], [MESSAGE]) VALUES (66, N'                <script>alert(''hacked!!'');</script>                        ')
INSERT [dbo].[MESSAGE] ([ID], [MESSAGE]) VALUES (67, N'                <script>alert(document.cookie);</script>                        ')
INSERT [dbo].[MESSAGE] ([ID], [MESSAGE]) VALUES (68, N'                <script>alert(document.cookie);</script>                        ')
INSERT [dbo].[MESSAGE] ([ID], [MESSAGE]) VALUES (69, N'                <script>alert(''hacked!!'');</script>                        ')
INSERT [dbo].[MESSAGE] ([ID], [MESSAGE]) VALUES (70, N'                <script>alert(''dataType = '' document.cookie);</script>                        ')
INSERT [dbo].[MESSAGE] ([ID], [MESSAGE]) VALUES (71, N'                <script>alert(''hacked!!'');</script>                        ')
INSERT [dbo].[MESSAGE] ([ID], [MESSAGE]) VALUES (72, N'                <script>alert(''dataType = '' + document.cookie);</script>                        ')
INSERT [dbo].[MESSAGE] ([ID], [MESSAGE]) VALUES (73, N'                <script>alert(document.cookie);</script>                        ')
INSERT [dbo].[MESSAGE] ([ID], [MESSAGE]) VALUES (74, N'                <script>alert(document.cookie);</script>                        ')
INSERT [dbo].[MESSAGE] ([ID], [MESSAGE]) VALUES (75, N'                <script>alert(document.cookie);</script>                        ')
INSERT [dbo].[MESSAGE] ([ID], [MESSAGE]) VALUES (76, N'                <script>alert(document.cookie);</script>                        ')
INSERT [dbo].[MESSAGE] ([ID], [MESSAGE]) VALUES (77, N'                <script>alert(document.cookie);</script>                        ')
INSERT [dbo].[MESSAGE] ([ID], [MESSAGE]) VALUES (78, N'                <script>alert(document.cookie);</script>                        ')
INSERT [dbo].[MESSAGE] ([ID], [MESSAGE]) VALUES (79, N'                <script>alert(document.cookie);</script>                        ')
INSERT [dbo].[MESSAGE] ([ID], [MESSAGE]) VALUES (80, N'                <script>alert(document.cookie);</script>                        ')
INSERT [dbo].[MESSAGE] ([ID], [MESSAGE]) VALUES (81, N'                <script>alert(document.cookie);</script>                        ')
INSERT [dbo].[MESSAGE] ([ID], [MESSAGE]) VALUES (82, N'                <script>alert(document.cookie);</script>                        ')
INSERT [dbo].[MESSAGE] ([ID], [MESSAGE]) VALUES (83, N'                <script>alert(document.cookie);</script>                        ')
SET IDENTITY_INSERT [dbo].[MESSAGE] OFF
GO
SET IDENTITY_INSERT [dbo].[PRODUCT] ON 

INSERT [dbo].[PRODUCT] ([ID], [NAME], [PRICE], [CATEGORY_ID]) VALUES (1, N'COFFEE1', 100, 1)
INSERT [dbo].[PRODUCT] ([ID], [NAME], [PRICE], [CATEGORY_ID]) VALUES (2, N'COFFEE2', 101, 1)
INSERT [dbo].[PRODUCT] ([ID], [NAME], [PRICE], [CATEGORY_ID]) VALUES (3, N'COFFEE3', 102, 1)
INSERT [dbo].[PRODUCT] ([ID], [NAME], [PRICE], [CATEGORY_ID]) VALUES (4, N'COFFEE4', 103, 1)
INSERT [dbo].[PRODUCT] ([ID], [NAME], [PRICE], [CATEGORY_ID]) VALUES (5, N'TEA1', 200, 2)
INSERT [dbo].[PRODUCT] ([ID], [NAME], [PRICE], [CATEGORY_ID]) VALUES (6, N'TEA2', 201, 2)
INSERT [dbo].[PRODUCT] ([ID], [NAME], [PRICE], [CATEGORY_ID]) VALUES (7, N'TEA3', 202, 2)
INSERT [dbo].[PRODUCT] ([ID], [NAME], [PRICE], [CATEGORY_ID]) VALUES (8, N'TEA4', 203, 2)
INSERT [dbo].[PRODUCT] ([ID], [NAME], [PRICE], [CATEGORY_ID]) VALUES (9, N'CHOCOLATE1', 300, 3)
INSERT [dbo].[PRODUCT] ([ID], [NAME], [PRICE], [CATEGORY_ID]) VALUES (10, N'CHOCOLATE2', 301, 3)
INSERT [dbo].[PRODUCT] ([ID], [NAME], [PRICE], [CATEGORY_ID]) VALUES (11, N'CHOCOLATE3', 302, 3)
INSERT [dbo].[PRODUCT] ([ID], [NAME], [PRICE], [CATEGORY_ID]) VALUES (12, N'CHOCOLATE4', 303, 3)
SET IDENTITY_INSERT [dbo].[PRODUCT] OFF
GO
SET IDENTITY_INSERT [dbo].[PRODUCTOWASP] ON 

INSERT [dbo].[PRODUCTOWASP] ([ID], [URL], [NAME], [PRICE], [CATEGORY_ID]) VALUES (25, N'coffee-1', N'COFFEE1', 100, 1)
INSERT [dbo].[PRODUCTOWASP] ([ID], [URL], [NAME], [PRICE], [CATEGORY_ID]) VALUES (26, N'coffee-2', N'COFFEE2', 101, 1)
INSERT [dbo].[PRODUCTOWASP] ([ID], [URL], [NAME], [PRICE], [CATEGORY_ID]) VALUES (27, N'coffee-3', N'COFFEE3', 102, 1)
INSERT [dbo].[PRODUCTOWASP] ([ID], [URL], [NAME], [PRICE], [CATEGORY_ID]) VALUES (28, N'coffee-4', N'COFFEE4', 103, 1)
INSERT [dbo].[PRODUCTOWASP] ([ID], [URL], [NAME], [PRICE], [CATEGORY_ID]) VALUES (29, N'tea-1', N'TEA1', 200, 2)
INSERT [dbo].[PRODUCTOWASP] ([ID], [URL], [NAME], [PRICE], [CATEGORY_ID]) VALUES (30, N'tea-2', N'TEA2', 201, 2)
INSERT [dbo].[PRODUCTOWASP] ([ID], [URL], [NAME], [PRICE], [CATEGORY_ID]) VALUES (31, N'tea-3', N'TEA3', 202, 2)
INSERT [dbo].[PRODUCTOWASP] ([ID], [URL], [NAME], [PRICE], [CATEGORY_ID]) VALUES (32, N'tea-4', N'TEA4', 203, 2)
INSERT [dbo].[PRODUCTOWASP] ([ID], [URL], [NAME], [PRICE], [CATEGORY_ID]) VALUES (33, N'cho-co-late-1', N'CHOCOLATE1', 300, 3)
INSERT [dbo].[PRODUCTOWASP] ([ID], [URL], [NAME], [PRICE], [CATEGORY_ID]) VALUES (34, N'cho-co-late-2', N'CHOCOLATE2', 301, 3)
INSERT [dbo].[PRODUCTOWASP] ([ID], [URL], [NAME], [PRICE], [CATEGORY_ID]) VALUES (35, N'cho-co-late-3', N'CHOCOLATE3', 302, 3)
INSERT [dbo].[PRODUCTOWASP] ([ID], [URL], [NAME], [PRICE], [CATEGORY_ID]) VALUES (36, N'cho-co-late-4', N'CHOCOLATE4', 303, 3)
SET IDENTITY_INSERT [dbo].[PRODUCTOWASP] OFF
GO
SET IDENTITY_INSERT [dbo].[USERACCOUNT] ON 

INSERT [dbo].[USERACCOUNT] ([ID], [USERNAME], [PASSWORD], [NAME], [ROLE]) VALUES (1, N'admin', N'admin', N'admin', N'admin')
INSERT [dbo].[USERACCOUNT] ([ID], [USERNAME], [PASSWORD], [NAME], [ROLE]) VALUES (2, N'user1', N'user1', N'user1', N'user')
INSERT [dbo].[USERACCOUNT] ([ID], [USERNAME], [PASSWORD], [NAME], [ROLE]) VALUES (3, N'user2', N'user2', N'user2', N'user')
SET IDENTITY_INSERT [dbo].[USERACCOUNT] OFF
GO
SET IDENTITY_INSERT [dbo].[USERACCOUNTOWASP] ON 

INSERT [dbo].[USERACCOUNTOWASP] ([ID], [USERNAME], [PASSWORD], [NAME], [ROLE]) VALUES (1, N'admin', 0x21232F297A57A5A743894A0E4A801FC3, N'admin', N'admin')
INSERT [dbo].[USERACCOUNTOWASP] ([ID], [USERNAME], [PASSWORD], [NAME], [ROLE]) VALUES (2, N'user1', 0x24C9E15E52AFC47C225B757E7BEE1F9D, N'user1', N'user')
INSERT [dbo].[USERACCOUNTOWASP] ([ID], [USERNAME], [PASSWORD], [NAME], [ROLE]) VALUES (3, N'user2', 0x7E58D63B60197CEB55A1C487989A3720, N'user2', N'user')
SET IDENTITY_INSERT [dbo].[USERACCOUNTOWASP] OFF
GO
ALTER TABLE [dbo].[PRODUCT]  WITH CHECK ADD FOREIGN KEY([CATEGORY_ID])
REFERENCES [dbo].[CATEGORY] ([ID])
GO
ALTER TABLE [dbo].[PRODUCTOWASP]  WITH CHECK ADD FOREIGN KEY([CATEGORY_ID])
REFERENCES [dbo].[CATEGORY] ([ID])
GO
