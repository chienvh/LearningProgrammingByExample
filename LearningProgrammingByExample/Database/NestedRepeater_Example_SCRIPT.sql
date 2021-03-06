CREATE TABLE [dbo].[tblProduct](
	[productId] [int] IDENTITY(1,1) NOT NULL,
	[productTypeId] [int] NULL,
	[productName] [nvarchar](50) NULL,
	[productPrice] [float] NULL,
	[quantity] [int] NULL,
 CONSTRAINT [PK_tblProduct] PRIMARY KEY CLUSTERED 
(
	[productId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblProductType] ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblProductType](
	[productTypeId] [int] IDENTITY(1,1) NOT NULL,
	[productTypeName] [nvarchar](50) NULL,
 CONSTRAINT [PK_tblProductType] PRIMARY KEY CLUSTERED 
(
	[productTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[tblProduct] ON 

GO
INSERT [dbo].[tblProduct] ([productId], [productTypeId], [productName], [productPrice], [quantity]) VALUES (1, 1, N'TV Sony 40''', 750, 250)
GO
INSERT [dbo].[tblProduct] ([productId], [productTypeId], [productName], [productPrice], [quantity]) VALUES (2, 1, N'TV Sony 32''', 500, 150)
GO
INSERT [dbo].[tblProduct] ([productId], [productTypeId], [productName], [productPrice], [quantity]) VALUES (3, 1, N'TV Sam Sung 42''', 750, 100)
GO
INSERT [dbo].[tblProduct] ([productId], [productTypeId], [productName], [productPrice], [quantity]) VALUES (4, 1, N'TV Sam Sung 32''', 450, 245)
GO
INSERT [dbo].[tblProduct] ([productId], [productTypeId], [productName], [productPrice], [quantity]) VALUES (5, 2, N'Asus P550L', 800, 30)
GO
INSERT [dbo].[tblProduct] ([productId], [productTypeId], [productName], [productPrice], [quantity]) VALUES (6, 2, N'Dell Vostro 310', 400, 100)
GO
INSERT [dbo].[tblProduct] ([productId], [productTypeId], [productName], [productPrice], [quantity]) VALUES (7, 2, N'Toshiba L310', 350, 400)
GO
INSERT [dbo].[tblProduct] ([productId], [productTypeId], [productName], [productPrice], [quantity]) VALUES (8, 3, N'HonDa Civic', 40000, 20)
GO
INSERT [dbo].[tblProduct] ([productId], [productTypeId], [productName], [productPrice], [quantity]) VALUES (9, 3, N'HonDa CRV', 150000, 30)
GO
INSERT [dbo].[tblProduct] ([productId], [productTypeId], [productName], [productPrice], [quantity]) VALUES (10, 3, N'Kia Morning SLX', 25000, 100)
GO
SET IDENTITY_INSERT [dbo].[tblProduct] OFF
GO
SET IDENTITY_INSERT [dbo].[tblProductType] ON 

GO
INSERT [dbo].[tblProductType] ([productTypeId], [productTypeName]) VALUES (1, N'Television')
GO
INSERT [dbo].[tblProductType] ([productTypeId], [productTypeName]) VALUES (2, N'Computer')
GO
INSERT [dbo].[tblProductType] ([productTypeId], [productTypeName]) VALUES (3, N'Car')
GO
SET IDENTITY_INSERT [dbo].[tblProductType] OFF
GO
ALTER TABLE [dbo].[tblProduct]  WITH CHECK ADD  CONSTRAINT [FK_tblProduct_tblProductType] FOREIGN KEY([productTypeId])
REFERENCES [dbo].[tblProductType] ([productTypeId])
GO
ALTER TABLE [dbo].[tblProduct] CHECK CONSTRAINT [FK_tblProduct_tblProductType]
GO
