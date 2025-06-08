
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[order](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[sysNumber] [nvarchar](50) NULL,
	[orderDate] [datetime] NULL,
	[stateType] [nvarchar](20) NULL,
	[createDate] [datetime] NOT NULL,
	[createUser] [nvarchar](200) NULL,
	[removed] [bit] NOT NULL,
 CONSTRAINT [PK_order] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[order] ADD  CONSTRAINT [DF_order_removed]  DEFAULT ((0)) FOR [removed]
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�q���ƪ�Ǹ�' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'order', @level2type=N'COLUMN',@level2name=N'id'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�q��s��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'order', @level2type=N'COLUMN',@level2name=N'sysNumber'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�q����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'order', @level2type=N'COLUMN',@level2name=N'orderDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�q�檬�A(�q��T�{�B�w�X�f�B�w����)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'order', @level2type=N'COLUMN',@level2name=N'stateType'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�إߤ��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'order', @level2type=N'COLUMN',@level2name=N'createDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�إߪ�' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'order', @level2type=N'COLUMN',@level2name=N'createUser'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�@�o���O' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'order', @level2type=N'COLUMN',@level2name=N'removed'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�q���ƪ�' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'order'
GO

