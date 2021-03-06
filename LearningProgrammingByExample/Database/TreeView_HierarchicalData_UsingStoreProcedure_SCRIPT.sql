USE [MyDB]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblCategory](
	[id] [varchar](50) NOT NULL,
	[name] [nvarchar](50) NULL,
	[parentId] [varchar](50) NULL,
 CONSTRAINT [PK_tblCategory] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[tblCategory] ([id], [name], [parentId]) VALUES (N'CA1', N'Computer', N'0')
GO
INSERT [dbo].[tblCategory] ([id], [name], [parentId]) VALUES (N'CA10', N'Dell Vostro', N'CA4')
GO
INSERT [dbo].[tblCategory] ([id], [name], [parentId]) VALUES (N'CA11', N'Desktop Dell Vostro', N'CA7')
GO
INSERT [dbo].[tblCategory] ([id], [name], [parentId]) VALUES (N'CA2', N'Laptop', N'CA1')
GO
INSERT [dbo].[tblCategory] ([id], [name], [parentId]) VALUES (N'CA3', N'Desktop', N'CA1')
GO
INSERT [dbo].[tblCategory] ([id], [name], [parentId]) VALUES (N'CA4', N'Laptop Dell', N'CA2')
GO
INSERT [dbo].[tblCategory] ([id], [name], [parentId]) VALUES (N'CA5', N'Laptop Toshiba', N'CA2')
GO
INSERT [dbo].[tblCategory] ([id], [name], [parentId]) VALUES (N'CA6', N'Laptop Asus', N'CA2')
GO
INSERT [dbo].[tblCategory] ([id], [name], [parentId]) VALUES (N'CA7', N'Desktop Dell', N'CA3')
GO
INSERT [dbo].[tblCategory] ([id], [name], [parentId]) VALUES (N'CA8', N'Desktop Asus', N'CA3')
GO
INSERT [dbo].[tblCategory] ([id], [name], [parentId]) VALUES (N'CA9', N'Desktop Toshiba', N'CA3')
GO
/****** Object:  StoredProcedure [dbo].[spGetCategoriesList]    ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Proc [dbo].[spGetCategoriesList]
AS
WITH #CTE_CategoriesList
AS
(
	SELECT 
		id, 
		name,
		parentId,	
		0 AS HLevel,
		CAST(RIGHT(REPLICATE('_',5) +  CONVERT(VARCHAR(20),id),20) AS VARCHAR(MAX)) AS OrderByField
	FROM tblCategory
	WHERE parentId = '0'
	    
	UNION ALL
	    
	SELECT 
		f.id, 
		f.name, 
		f.parentId,
		(cte.HLevel + 1) AS HLevel,
		cte.OrderByField + CAST(RIGHT(REPLICATE('_',5) +  CONVERT(VARCHAR(20),f.id),20) AS VARCHAR(MAX)) AS OrderByField
	FROM tblCategory f
	INNER JOIN #CTE_CategoriesList cte ON CTE.id = f.parentId
	WHERE f.parentId IS NOT NULL
)

--Select * from #CTE_CategoriesList ORDER BY OrderByField

-- Final query
SELECT 
	id,
	isnull(parentId,0) as parentId,
	HLevel,
	Replace((CONVERT(VARCHAR(250),HLevel + 1) + '. '+ name),'.0','') as name
FROM #CTE_CategoriesList
ORDER BY OrderByField;


GO
