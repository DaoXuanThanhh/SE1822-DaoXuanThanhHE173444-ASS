USE [master]
GO
/****** Object:  Database [ToysStore]    Script Date: 3/6/2024 10:01:53 PM ******/
CREATE DATABASE [ToysStore]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ToysStore', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\ToysStore.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ToysStore_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\ToysStore_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [ToysStore] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ToysStore].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ToysStore] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ToysStore] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ToysStore] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ToysStore] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ToysStore] SET ARITHABORT OFF 
GO
ALTER DATABASE [ToysStore] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ToysStore] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ToysStore] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ToysStore] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ToysStore] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ToysStore] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ToysStore] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ToysStore] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ToysStore] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ToysStore] SET  ENABLE_BROKER 
GO
ALTER DATABASE [ToysStore] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ToysStore] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ToysStore] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ToysStore] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ToysStore] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ToysStore] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ToysStore] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ToysStore] SET RECOVERY FULL 
GO
ALTER DATABASE [ToysStore] SET  MULTI_USER 
GO
ALTER DATABASE [ToysStore] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ToysStore] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ToysStore] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ToysStore] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ToysStore] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ToysStore] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'ToysStore', N'ON'
GO
ALTER DATABASE [ToysStore] SET QUERY_STORE = OFF
GO
USE [ToysStore]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 3/6/2024 10:01:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[category_id] [int] IDENTITY(1,1) NOT NULL,
	[category_name] [nvarchar](50) NULL,
	[image] [text] NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[category_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 3/6/2024 10:01:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[order_id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NULL,
	[order_date] [date] NULL,
	[total] [float] NULL,
	[notes] [nvarchar](200) NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[order_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetail]    Script Date: 3/6/2024 10:01:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetail](
	[detail_id] [int] IDENTITY(1,1) NOT NULL,
	[order_id] [int] NULL,
	[product_id] [int] NULL,
	[price] [float] NULL,
	[quantity] [int] NULL,
 CONSTRAINT [PK_OrderDetail] PRIMARY KEY CLUSTERED 
(
	[detail_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 3/6/2024 10:01:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[product_id] [int] IDENTITY(1,1) NOT NULL,
	[product_name] [nvarchar](50) NULL,
	[price] [float] NULL,
	[stock] [int] NULL,
	[category_id] [int] NULL,
	[img] [ntext] NULL,
	[description] [nvarchar](1000) NULL,
	[create_date] [date] NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[product_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 3/6/2024 10:01:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[user_id] [int] IDENTITY(1,1) NOT NULL,
	[username] [nvarchar](50) NULL,
	[email] [nvarchar](50) NOT NULL,
	[password] [nvarchar](50) NOT NULL,
	[address] [nvarchar](50) NULL,
	[gender] [bit] NULL,
	[phone] [nchar](11) NULL,
	[role_id] [varchar](50) NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([category_id], [category_name], [image]) VALUES (1, N'Teddy Bear', N'https://i.pinimg.com/564x/11/43/28/114328e7d748c466b97bea12e36ae689.jpg')
INSERT [dbo].[Category] ([category_id], [category_name], [image]) VALUES (2, N'Lego', N'https://i.pinimg.com/564x/2a/d2/e0/2ad2e0775fe81e8fe6a4ccefc6636ee2.jpg')
INSERT [dbo].[Category] ([category_id], [category_name], [image]) VALUES (3, N'Car', N'https://i.pinimg.com/564x/e5/0f/a5/e50fa5e74fcdfd3eed11c0ddf9f20521.jpg')
INSERT [dbo].[Category] ([category_id], [category_name], [image]) VALUES (4, N'Baby Doll', N'https://i.pinimg.com/564x/45/b3/1f/45b31f4774a923fdda41f25610b5b073.jpg')
INSERT [dbo].[Category] ([category_id], [category_name], [image]) VALUES (5, N'Scotter', N'https://i.pinimg.com/564x/0e/c7/d6/0ec7d66e91f8752d0a8d2fd2ca2f6d55.jpg')
SET IDENTITY_INSERT [dbo].[Category] OFF
GO
SET IDENTITY_INSERT [dbo].[Order] ON 

INSERT [dbo].[Order] ([order_id], [user_id], [order_date], [total], [notes]) VALUES (1, 9, CAST(N'2023-08-15' AS Date), 134, N'please carefully')
INSERT [dbo].[Order] ([order_id], [user_id], [order_date], [total], [notes]) VALUES (2, 9, CAST(N'2023-10-23' AS Date), 54, N'please carefully')
INSERT [dbo].[Order] ([order_id], [user_id], [order_date], [total], [notes]) VALUES (3, 2, CAST(N'2023-11-05' AS Date), 60, N'')
SET IDENTITY_INSERT [dbo].[Order] OFF
GO
SET IDENTITY_INSERT [dbo].[OrderDetail] ON 

INSERT [dbo].[OrderDetail] ([detail_id], [order_id], [product_id], [price], [quantity]) VALUES (1, 1, 2, 80, 1)
INSERT [dbo].[OrderDetail] ([detail_id], [order_id], [product_id], [price], [quantity]) VALUES (2, 1, 5, 18, 3)
INSERT [dbo].[OrderDetail] ([detail_id], [order_id], [product_id], [price], [quantity]) VALUES (3, 2, 3, 18, 3)
INSERT [dbo].[OrderDetail] ([detail_id], [order_id], [product_id], [price], [quantity]) VALUES (4, 3, 6, 20, 3)
SET IDENTITY_INSERT [dbo].[OrderDetail] OFF
GO
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([product_id], [product_name], [price], [stock], [category_id], [img], [description], [create_date]) VALUES (1, N'Brown Teddy Bear', 100, 80, 1, N'https://i.pinimg.com/564x/c3/7e/7f/c37e7f8173ea8327c2008851e7038f37.jpg', N'Nulla eget sem vitae eros pharetra viverra. Nam vitae luctus ligula. Mauris consequat ornare feugiat.', CAST(N'2023-03-08' AS Date))
INSERT [dbo].[Product] ([product_id], [product_name], [price], [stock], [category_id], [img], [description], [create_date]) VALUES (2, N'Car Lego', 80, 99, 2, N'https://i.pinimg.com/564x/89/16/9d/89169d38158c86ccd473859989d9cd53.jpg', N'Nulla eget sem vitae eros pharetra viverra. Nam vitae luctus ligula. Mauris consequat ornare feugiat.', CAST(N'2023-03-08' AS Date))
INSERT [dbo].[Product] ([product_id], [product_name], [price], [stock], [category_id], [img], [description], [create_date]) VALUES (3, N'Elektro Scooter', 18, 86, 5, N'https://i.pinimg.com/564x/ef/38/92/ef38923cbf0448a33b87ceff22f77d02.jpg', N'Nulla eget sem vitae eros pharetra viverra. Nam vitae luctus ligula. Mauris consequat ornare feugiat.', CAST(N'2023-03-08' AS Date))
INSERT [dbo].[Product] ([product_id], [product_name], [price], [stock], [category_id], [img], [description], [create_date]) VALUES (4, N'Elephant', 67, 50, 1, N'https://i.pinimg.com/564x/f5/ba/8f/f5ba8f283bf569aa889bd4add026aa96.jpg', N'Nulla eget sem vitae eros pharetra viverra. Nam vitae luctus ligula. Mauris consequat ornare feugiat.', CAST(N'2023-03-08' AS Date))
INSERT [dbo].[Product] ([product_id], [product_name], [price], [stock], [category_id], [img], [description], [create_date]) VALUES (5, N'Electric Car Sport', 18, 77, 3, N'https://i.pinimg.com/736x/ff/21/41/ff2141a6cfd9583164deafae1b1a96c1.jpg', N'Nulla eget sem vitae eros pharetra viverra. Nam vitae luctus ligula. Mauris consequat ornare feugiat.', CAST(N'2023-03-08' AS Date))
INSERT [dbo].[Product] ([product_id], [product_name], [price], [stock], [category_id], [img], [description], [create_date]) VALUES (6, N'G63', 20, 67, 3, N'https://i.pinimg.com/564x/0c/ed/5d/0ced5d029ef5527dda14612bf1806e58.jpg', N'Nulla eget sem vitae eros pharetra viverra. Nam vitae luctus ligula. Mauris consequat ornare feugiat.', CAST(N'2023-03-08' AS Date))
INSERT [dbo].[Product] ([product_id], [product_name], [price], [stock], [category_id], [img], [description], [create_date]) VALUES (7, N'Cute Pink doll', 29, 90, 4, N'https://i.pinimg.com/564x/45/b3/1f/45b31f4774a923fdda41f25610b5b073.jpg', N'Nulla eget sem vitae eros pharetra viverra. Nam vitae luctus ligula. Mauris consequat ornare feugiat.', CAST(N'2023-03-08' AS Date))
INSERT [dbo].[Product] ([product_id], [product_name], [price], [stock], [category_id], [img], [description], [create_date]) VALUES (8, N'Lego Jordans Shoes', 79, 90, 2, N'https://i.pinimg.com/736x/ac/72/65/ac72651012687959789419eb48663965.jpg', N'Nulla eget sem vitae eros pharetra viverra. Nam vitae luctus ligula. Mauris consequat ornare feugiat.', CAST(N'2023-03-08' AS Date))
INSERT [dbo].[Product] ([product_id], [product_name], [price], [stock], [category_id], [img], [description], [create_date]) VALUES (9, N'Vinchricci Lexus', 30, 80, 1, N'https://i.pinimg.com/736x/e3/87/27/e387270c3f307ad2646edd3966d4d345.jpg', N'Nulla eget sem vitae eros pharetra viverra. Nam vitae luctus ligula. Mauris consequat ornare feugiat.', CAST(N'2023-03-08' AS Date))
INSERT [dbo].[Product] ([product_id], [product_name], [price], [stock], [category_id], [img], [description], [create_date]) VALUES (10, N'Estética Scooter', 20, 100, 5, N'https://i.pinimg.com/564x/96/f5/06/96f506c5b74c34b50e62439d1b2439d6.jpg', N'Nulla eget sem vitae eros pharetra viverra. Nam vitae luctus ligula. Mauris consequat ornare feugiat.', CAST(N'2023-03-08' AS Date))
INSERT [dbo].[Product] ([product_id], [product_name], [price], [stock], [category_id], [img], [description], [create_date]) VALUES (11, N'Adjustable Handlebar', 19, 200, 5, N'https://i.pinimg.com/564x/ed/57/27/ed5727bcca2acd078a6c0daba4c7a6ed.jpg', N'Nulla eget sem vitae eros pharetra viverra. Nam vitae luctus ligula. Mauris consequat ornare feugiat.', CAST(N'2023-03-08' AS Date))
INSERT [dbo].[Product] ([product_id], [product_name], [price], [stock], [category_id], [img], [description], [create_date]) VALUES (12, N'Submarine MOCS', 20, 200, 2, N'https://i.pinimg.com/564x/66/9b/13/669b13d56e4310cfc5a540349423e4d3.jpg', N'Nulla eget sem vitae eros pharetra viverra. Nam vitae luctus ligula. Mauris consequat ornare feugiat.', CAST(N'2023-03-08' AS Date))
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([user_id], [username], [email], [password], [address], [gender], [phone], [role_id]) VALUES (1, N'abc', N'abc@gmail.com', N'123', N'Ho Chi Minh', 1, N'0987654321 ', N'US')
INSERT [dbo].[Users] ([user_id], [username], [email], [password], [address], [gender], [phone], [role_id]) VALUES (2, N'admin', N'admin@gmail.com', N'123', N'Ha Noi', 1, N'0123456789 ', N'AD')
INSERT [dbo].[Users] ([user_id], [username], [email], [password], [address], [gender], [phone], [role_id]) VALUES (5, N'student1', N'abc@gmail.com', N'123', N'Ha Noi', 1, N'0123456789 ', N'US')
INSERT [dbo].[Users] ([user_id], [username], [email], [password], [address], [gender], [phone], [role_id]) VALUES (6, N'student1', N'abc@gmail.com', N'123', N'Ha Noi', 1, N'0123456789 ', N'US')
INSERT [dbo].[Users] ([user_id], [username], [email], [password], [address], [gender], [phone], [role_id]) VALUES (7, N'student1', N'abc@gmail.com', N'123', N'Ha Noi', 1, N'0123456789 ', N'US')
INSERT [dbo].[Users] ([user_id], [username], [email], [password], [address], [gender], [phone], [role_id]) VALUES (8, N'student1', N'abc@gmail.com', N'123', N'Ha Noi', 1, N'0123456789 ', N'US')
INSERT [dbo].[Users] ([user_id], [username], [email], [password], [address], [gender], [phone], [role_id]) VALUES (9, N'caa', N'abc@gmail.com', N'123', N'Ha Noi', 1, N'0123456789 ', N'US')
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetail_Order] FOREIGN KEY([order_id])
REFERENCES [dbo].[Order] ([order_id])
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK_OrderDetail_Order]
GO
USE [master]
GO
ALTER DATABASE [ToysStore] SET  READ_WRITE 
GO
