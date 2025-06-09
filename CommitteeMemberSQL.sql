/****** Object:  Table [dbo].[committeeMember]    Script Date: 2025/6/9 上午 11:00:29 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[committeeMember](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[firstName] [nvarchar](20) NULL,
	[lastName] [nvarchar](20) NULL,
	[gender] [nvarchar](20) NULL,
	[createDate] [datetime] NOT NULL,
	[createUser] [nvarchar](50) NOT NULL,
	[removed] [bit] NOT NULL,
 CONSTRAINT [PK_committeeMember] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

ALTER TABLE [dbo].[committeeMember] ADD  CONSTRAINT [DF_committeeMember_removed]  DEFAULT ((0)) FOR [removed]
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'委員資料表序號' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'committeeMember', @level2type=N'COLUMN',@level2name=N'id'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'名字' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'committeeMember', @level2type=N'COLUMN',@level2name=N'firstName'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'姓' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'committeeMember', @level2type=N'COLUMN',@level2name=N'lastName'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'性別:Male、Female 、None' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'committeeMember', @level2type=N'COLUMN',@level2name=N'gender'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'建立日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'committeeMember', @level2type=N'COLUMN',@level2name=N'createDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'建立者' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'committeeMember', @level2type=N'COLUMN',@level2name=N'createUser'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'作廢註記' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'committeeMember', @level2type=N'COLUMN',@level2name=N'removed'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'委員資料表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'committeeMember'
GO

