USE [test]
GO

/****** Object:  Table [dbo].[dev_spares_record]    Script Date: 10/06/2018 10:35:22 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[dev_spares_record](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[spares_id] [int] NOT NULL,
	[note] [varchar](255) NULL,
	[r_type] [int] NOT NULL,
	[num] [int] NOT NULL,
	[record_date] [date] NOT NULL,
	[status] [int] NOT NULL,
	[create_time] [datetime] NOT NULL,
	[name] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO


