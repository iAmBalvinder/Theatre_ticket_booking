﻿USE [master]
GO
/****** Object:  Database [theatre_ticket]    Script Date: 12-08-2019 12:08:37 AM ******/
CREATE DATABASE [theatre_ticket]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'theatre_ticket', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\theatre_ticket.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'theatre_ticket_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\theatre_ticket_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [theatre_ticket] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [theatre_ticket].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [theatre_ticket] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [theatre_ticket] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [theatre_ticket] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [theatre_ticket] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [theatre_ticket] SET ARITHABORT OFF 
GO
ALTER DATABASE [theatre_ticket] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [theatre_ticket] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [theatre_ticket] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [theatre_ticket] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [theatre_ticket] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [theatre_ticket] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [theatre_ticket] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [theatre_ticket] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [theatre_ticket] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [theatre_ticket] SET  DISABLE_BROKER 
GO
ALTER DATABASE [theatre_ticket] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [theatre_ticket] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [theatre_ticket] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [theatre_ticket] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [theatre_ticket] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [theatre_ticket] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [theatre_ticket] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [theatre_ticket] SET RECOVERY FULL 
GO
ALTER DATABASE [theatre_ticket] SET  MULTI_USER 
GO
ALTER DATABASE [theatre_ticket] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [theatre_ticket] SET DB_CHAINING OFF 
GO
ALTER DATABASE [theatre_ticket] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [theatre_ticket] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [theatre_ticket] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'theatre_ticket', N'ON'
GO
ALTER DATABASE [theatre_ticket] SET QUERY_STORE = OFF
GO
USE [theatre_ticket]
GO
/****** Object:  Table [dbo].[artist]    Script Date: 12-08-2019 12:08:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[artist](
	[artist_id] [int] NOT NULL,
	[artist_name] [varchar](60) NOT NULL,
	[genre_id] [int] NOT NULL,
 CONSTRAINT [artist_pk] PRIMARY KEY CLUSTERED 
(
	[artist_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[customer]    Script Date: 12-08-2019 12:08:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[customer](
	[customer_id] [int] NOT NULL,
	[fullname] [varchar](80) NOT NULL,
	[email] [varchar](80) NOT NULL,
	[username] [varchar](25) NOT NULL,
	[password] [varchar](255) NOT NULL,
 CONSTRAINT [customer_pk] PRIMARY KEY CLUSTERED 
(
	[customer_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [customer_ak_1] UNIQUE NONCLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [customer_ak_2] UNIQUE NONCLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[customer_order]    Script Date: 12-08-2019 12:08:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[customer_order](
	[order_id] [int] NOT NULL,
	[customer_id] [int] NOT NULL,
	[order_time] [timestamp] NOT NULL,
	[delivery_address] [varchar](255) NULL,
	[delivery_email_address] [varchar](80) NOT NULL,
	[total_price] [decimal](10, 2) NOT NULL,
	[discount] [decimal](10, 2) NOT NULL,
	[final_price] [decimal](10, 2) NOT NULL,
	[prefertime_id] [int] NOT NULL,
	[paymenttime_id] [int] NOT NULL,
	[sent_id] [int] NOT NULL,
 CONSTRAINT [customer_order_pk] PRIMARY KEY CLUSTERED 
(
	[order_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[end_date]    Script Date: 12-08-2019 12:08:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[end_date](
	[end_id] [int] NOT NULL,
	[ticket_category_id] [int] NULL,
 CONSTRAINT [end_date_pk] PRIMARY KEY CLUSTERED 
(
	[end_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[genre]    Script Date: 12-08-2019 12:08:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[genre](
	[genre_id] [int] NOT NULL,
	[genre_name] [varchar](30) NOT NULL,
 CONSTRAINT [genre_pk] PRIMARY KEY CLUSTERED 
(
	[genre_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [genre_ak_1] UNIQUE NONCLUSTERED 
(
	[genre_name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[payment_time]    Script Date: 12-08-2019 12:08:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[payment_time](
	[paymenttime_id] [int] NOT NULL,
	[payment_time] [timestamp] NOT NULL,
 CONSTRAINT [payment_time_pk] PRIMARY KEY CLUSTERED 
(
	[paymenttime_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[preferred_delivery_time]    Script Date: 12-08-2019 12:08:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[preferred_delivery_time](
	[prefertime_id] [int] NOT NULL,
	[preferred_delivery_time] [timestamp] NULL,
 CONSTRAINT [preferred_delivery_time_pk] PRIMARY KEY CLUSTERED 
(
	[prefertime_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[role]    Script Date: 12-08-2019 12:08:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[role](
	[role_id] [int] NOT NULL,
	[role_name] [varchar](30) NOT NULL,
 CONSTRAINT [role_pk] PRIMARY KEY CLUSTERED 
(
	[role_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [role_ak_1] UNIQUE NONCLUSTERED 
(
	[role_name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sent_time]    Script Date: 12-08-2019 12:08:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sent_time](
	[sent_id] [int] NOT NULL,
	[sent_time] [timestamp] NULL,
 CONSTRAINT [sent_time_pk] PRIMARY KEY CLUSTERED 
(
	[sent_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[start_date]    Script Date: 12-08-2019 12:08:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[start_date](
	[start_id] [int] NOT NULL,
	[ticket_category_id] [int] NULL,
 CONSTRAINT [start_date_pk] PRIMARY KEY CLUSTERED 
(
	[start_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[theatre]    Script Date: 12-08-2019 12:08:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[theatre](
	[theatre_id] [int] NOT NULL,
	[play_name] [varchar](100) NOT NULL,
	[artist_id] [int] NOT NULL,
	[date] [timestamp] NOT NULL,
	[venue_id] [int] NOT NULL,
	[theatre_group_id] [int] NULL,
 CONSTRAINT [theatre_pk] PRIMARY KEY CLUSTERED 
(
	[theatre_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [theatre_ak_1] UNIQUE NONCLUSTERED 
(
	[play_name] ASC,
	[date] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[theatre_group]    Script Date: 12-08-2019 12:08:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[theatre_group](
	[theatregrp_id] [int] NOT NULL,
	[name] [varchar](20) NOT NULL,
 CONSTRAINT [theatre_group_pk] PRIMARY KEY CLUSTERED 
(
	[theatregrp_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [theatre_group_ak_1] UNIQUE NONCLUSTERED 
(
	[name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[theatre_role]    Script Date: 12-08-2019 12:08:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[theatre_role](
	[theatrerole_id] [int] NOT NULL,
	[artist_id] [int] NOT NULL,
	[role_id] [int] NOT NULL,
 CONSTRAINT [theatre_role_pk] PRIMARY KEY CLUSTERED 
(
	[theatrerole_id] ASC,
	[artist_id] ASC,
	[role_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [theatre_role_ak_1] UNIQUE NONCLUSTERED 
(
	[artist_id] ASC,
	[role_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ticket]    Script Date: 12-08-2019 12:08:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ticket](
	[ticket_id] [int] NOT NULL,
	[serial_number] [varchar](255) NOT NULL,
	[theatre_id] [int] NOT NULL,
	[ticket_category_id] [int] NOT NULL,
	[seat] [varchar](255) NULL,
	[purchase_date] [timestamp] NOT NULL,
 CONSTRAINT [ticket_pk] PRIMARY KEY CLUSTERED 
(
	[ticket_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [ticket_ak_1] UNIQUE NONCLUSTERED 
(
	[serial_number] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ticket_category]    Script Date: 12-08-2019 12:08:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ticket_category](
	[ticket_category_id] [int] NOT NULL,
	[description] [varchar](255) NOT NULL,
	[price] [decimal](10, 2) NOT NULL,
	[area] [varchar](255) NULL,
	[theatre_id] [int] NOT NULL,
	[start_id] [int] NOT NULL,
	[end_id] [int] NOT NULL,
 CONSTRAINT [ticket_category_pk] PRIMARY KEY CLUSTERED 
(
	[ticket_category_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ticket_order]    Script Date: 12-08-2019 12:08:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ticket_order](
	[ticketorder_id] [int] NOT NULL,
	[customer_order_id] [int] NOT NULL,
	[ticket_id] [int] NOT NULL,
 CONSTRAINT [ticket_order_pk] PRIMARY KEY CLUSTERED 
(
	[ticketorder_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [order_ticket_ak_1] UNIQUE NONCLUSTERED 
(
	[customer_order_id] ASC,
	[ticket_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[venue]    Script Date: 12-08-2019 12:08:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[venue](
	[venue_id] [int] NOT NULL,
	[venue_name] [varchar](50) NOT NULL,
	[location] [varchar](50) NOT NULL,
	[type] [varchar](30) NOT NULL,
	[capacity] [int] NOT NULL,
 CONSTRAINT [venue_pk] PRIMARY KEY CLUSTERED 
(
	[venue_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[artist]  WITH CHECK ADD  CONSTRAINT [artist_genre] FOREIGN KEY([genre_id])
REFERENCES [dbo].[genre] ([genre_id])
GO
ALTER TABLE [dbo].[artist] CHECK CONSTRAINT [artist_genre]
GO
ALTER TABLE [dbo].[customer_order]  WITH CHECK ADD  CONSTRAINT [customer_order_customer] FOREIGN KEY([customer_id])
REFERENCES [dbo].[customer] ([customer_id])
GO
ALTER TABLE [dbo].[customer_order] CHECK CONSTRAINT [customer_order_customer]
GO
ALTER TABLE [dbo].[customer_order]  WITH CHECK ADD  CONSTRAINT [customer_order_order_time] FOREIGN KEY([sent_id])
REFERENCES [dbo].[sent_time] ([sent_id])
GO
ALTER TABLE [dbo].[customer_order] CHECK CONSTRAINT [customer_order_order_time]
GO
ALTER TABLE [dbo].[customer_order]  WITH CHECK ADD  CONSTRAINT [customer_order_preferred_delivery_time] FOREIGN KEY([prefertime_id])
REFERENCES [dbo].[preferred_delivery_time] ([prefertime_id])
GO
ALTER TABLE [dbo].[customer_order] CHECK CONSTRAINT [customer_order_preferred_delivery_time]
GO
ALTER TABLE [dbo].[customer_order]  WITH CHECK ADD  CONSTRAINT [payment_time_customer_order] FOREIGN KEY([paymenttime_id])
REFERENCES [dbo].[payment_time] ([paymenttime_id])
GO
ALTER TABLE [dbo].[customer_order] CHECK CONSTRAINT [payment_time_customer_order]
GO
ALTER TABLE [dbo].[theatre]  WITH CHECK ADD  CONSTRAINT [theatre_artist] FOREIGN KEY([artist_id])
REFERENCES [dbo].[artist] ([artist_id])
GO
ALTER TABLE [dbo].[theatre] CHECK CONSTRAINT [theatre_artist]
GO
ALTER TABLE [dbo].[theatre]  WITH CHECK ADD  CONSTRAINT [theatre_theatre_group] FOREIGN KEY([theatre_group_id])
REFERENCES [dbo].[theatre_group] ([theatregrp_id])
GO
ALTER TABLE [dbo].[theatre] CHECK CONSTRAINT [theatre_theatre_group]
GO
ALTER TABLE [dbo].[theatre]  WITH CHECK ADD  CONSTRAINT [theatre_venue] FOREIGN KEY([venue_id])
REFERENCES [dbo].[venue] ([venue_id])
GO
ALTER TABLE [dbo].[theatre] CHECK CONSTRAINT [theatre_venue]
GO
ALTER TABLE [dbo].[theatre_role]  WITH CHECK ADD  CONSTRAINT [theatre_role_artist] FOREIGN KEY([artist_id])
REFERENCES [dbo].[artist] ([artist_id])
GO
ALTER TABLE [dbo].[theatre_role] CHECK CONSTRAINT [theatre_role_artist]
GO
ALTER TABLE [dbo].[theatre_role]  WITH CHECK ADD  CONSTRAINT [theatre_role_theatre] FOREIGN KEY([theatrerole_id])
REFERENCES [dbo].[theatre] ([theatre_id])
GO
ALTER TABLE [dbo].[theatre_role] CHECK CONSTRAINT [theatre_role_theatre]
GO
ALTER TABLE [dbo].[theatre_role]  WITH CHECK ADD  CONSTRAINT [theatre_role_role] FOREIGN KEY([role_id])
REFERENCES [dbo].[role] ([role_id])
GO
ALTER TABLE [dbo].[theatre_role] CHECK CONSTRAINT [theatre_role_role]
GO
ALTER TABLE [dbo].[ticket]  WITH CHECK ADD  CONSTRAINT [ticket_theatre] FOREIGN KEY([theatre_id])
REFERENCES [dbo].[theatre] ([theatre_id])
GO
ALTER TABLE [dbo].[ticket] CHECK CONSTRAINT [ticket_theatre]
GO
ALTER TABLE [dbo].[ticket]  WITH CHECK ADD  CONSTRAINT [ticket_ticket_category] FOREIGN KEY([ticket_category_id])
REFERENCES [dbo].[ticket_category] ([ticket_category_id])
GO
ALTER TABLE [dbo].[ticket] CHECK CONSTRAINT [ticket_ticket_category]
GO
ALTER TABLE [dbo].[ticket_category]  WITH CHECK ADD  CONSTRAINT [end_date_ticket_category] FOREIGN KEY([end_id])
REFERENCES [dbo].[end_date] ([end_id])
GO
ALTER TABLE [dbo].[ticket_category] CHECK CONSTRAINT [end_date_ticket_category]
GO
ALTER TABLE [dbo].[ticket_category]  WITH CHECK ADD  CONSTRAINT [start_date_ticket_category] FOREIGN KEY([start_id])
REFERENCES [dbo].[start_date] ([start_id])
GO
ALTER TABLE [dbo].[ticket_category] CHECK CONSTRAINT [start_date_ticket_category]
GO
ALTER TABLE [dbo].[ticket_category]  WITH CHECK ADD  CONSTRAINT [ticket_category_theatre] FOREIGN KEY([theatre_id])
REFERENCES [dbo].[theatre] ([theatre_id])
GO
ALTER TABLE [dbo].[ticket_category] CHECK CONSTRAINT [ticket_category_theatre]
GO
ALTER TABLE [dbo].[ticket_order]  WITH CHECK ADD  CONSTRAINT [order_ticket_customer_order] FOREIGN KEY([customer_order_id])
REFERENCES [dbo].[customer_order] ([order_id])
GO
ALTER TABLE [dbo].[ticket_order] CHECK CONSTRAINT [order_ticket_customer_order]
GO
ALTER TABLE [dbo].[ticket_order]  WITH CHECK ADD  CONSTRAINT [order_ticket_ticket] FOREIGN KEY([ticket_id])
REFERENCES [dbo].[ticket] ([ticket_id])
GO
ALTER TABLE [dbo].[ticket_order] CHECK CONSTRAINT [order_ticket_ticket]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'list of all artists involved in the play (including the playwright)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'artist'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'hash value of password' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'customer'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Genre of the theatre/play' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'genre'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'contains list of possible artist roles (i.e. main act/supporting act, cameo, choreographer, music director, composer etc.)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'role'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'details of the play (theatre)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'theatre'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'venue of the play/theatre ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'venue'
GO
USE [master]
GO
ALTER DATABASE [theatre_ticket] SET  READ_WRITE 
GO
