USE [master]
GO
/****** Object:  Database [WebAppDb]    Script Date: 02-10-2022 11:29:46 ******/
CREATE DATABASE [WebAppDb]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'WebAppDb', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\WebAppDb.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'WebAppDb_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\WebAppDb_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [WebAppDb] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [WebAppDb].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [WebAppDb] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [WebAppDb] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [WebAppDb] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [WebAppDb] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [WebAppDb] SET ARITHABORT OFF 
GO
ALTER DATABASE [WebAppDb] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [WebAppDb] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [WebAppDb] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [WebAppDb] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [WebAppDb] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [WebAppDb] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [WebAppDb] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [WebAppDb] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [WebAppDb] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [WebAppDb] SET  ENABLE_BROKER 
GO
ALTER DATABASE [WebAppDb] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [WebAppDb] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [WebAppDb] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [WebAppDb] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [WebAppDb] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [WebAppDb] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [WebAppDb] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [WebAppDb] SET RECOVERY FULL 
GO
ALTER DATABASE [WebAppDb] SET  MULTI_USER 
GO
ALTER DATABASE [WebAppDb] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [WebAppDb] SET DB_CHAINING OFF 
GO
ALTER DATABASE [WebAppDb] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [WebAppDb] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [WebAppDb] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [WebAppDb] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'WebAppDb', N'ON'
GO
ALTER DATABASE [WebAppDb] SET QUERY_STORE = OFF
GO
USE [WebAppDb]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 02-10-2022 11:29:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetRoleClaims]    Script Date: 02-10-2022 11:29:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoleClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RoleId] [nvarchar](450) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetRoleClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 02-10-2022 11:29:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [nvarchar](450) NOT NULL,
	[Name] [nvarchar](256) NULL,
	[NormalizedName] [nvarchar](256) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 02-10-2022 11:29:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 02-10-2022 11:29:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserLogins](
	[LoginProvider] [nvarchar](450) NOT NULL,
	[ProviderKey] [nvarchar](450) NOT NULL,
	[ProviderDisplayName] [nvarchar](max) NULL,
	[UserId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 02-10-2022 11:29:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [nvarchar](450) NOT NULL,
	[RoleId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 02-10-2022 11:29:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](450) NOT NULL,
	[UserName] [nvarchar](256) NULL,
	[NormalizedUserName] [nvarchar](256) NULL,
	[Email] [nvarchar](256) NULL,
	[NormalizedEmail] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEnd] [datetimeoffset](7) NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
	[Address] [nvarchar](max) NULL,
	[City] [nvarchar](max) NULL,
	[Discriminator] [nvarchar](max) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[PinCode] [nvarchar](max) NULL,
	[State] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserTokens]    Script Date: 02-10-2022 11:29:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserTokens](
	[UserId] [nvarchar](450) NOT NULL,
	[LoginProvider] [nvarchar](450) NOT NULL,
	[Name] [nvarchar](450) NOT NULL,
	[Value] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetUserTokens] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[LoginProvider] ASC,
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Carts]    Script Date: 02-10-2022 11:29:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Carts](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ProductId] [int] NOT NULL,
	[ApplicationUserId] [nvarchar](450) NOT NULL,
	[Count] [int] NOT NULL,
 CONSTRAINT [PK_Carts] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 02-10-2022 11:29:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[DisplayOrder] [int] NOT NULL,
	[CreatedDateTime] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetails]    Script Date: 02-10-2022 11:29:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetails](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[OrderHeaderId] [int] NOT NULL,
	[ProductId] [int] NOT NULL,
	[Price] [float] NOT NULL,
	[Count] [int] NOT NULL,
 CONSTRAINT [PK_OrderDetails] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderHeaders]    Script Date: 02-10-2022 11:29:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderHeaders](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ApplicationUserId] [nvarchar](450) NOT NULL,
	[DateOfOrder] [datetime2](7) NOT NULL,
	[DateOfShipping] [datetime2](7) NOT NULL,
	[OrderTotal] [float] NOT NULL,
	[OrderStatus] [nvarchar](max) NULL,
	[PaymentStatus] [nvarchar](max) NULL,
	[TrackingNumber] [nvarchar](max) NULL,
	[Carrier] [nvarchar](max) NULL,
	[SessionId] [nvarchar](max) NULL,
	[PaymentIntenId] [nvarchar](max) NULL,
	[DateOfPayment] [datetime2](7) NOT NULL,
	[DueDate] [datetime2](7) NOT NULL,
	[Phone] [nvarchar](max) NOT NULL,
	[Address] [nvarchar](max) NOT NULL,
	[City] [nvarchar](max) NOT NULL,
	[State] [nvarchar](max) NOT NULL,
	[PostalCode] [nvarchar](max) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_OrderHeaders] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 02-10-2022 11:29:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[Price] [float] NOT NULL,
	[ImageUrl] [nvarchar](max) NOT NULL,
	[CategoryId] [int] NOT NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20220907095945_addtable', N'6.0.8')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20220908055822_AddProduct', N'6.0.8')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20220910083834_IdentityAddInDatabase', N'6.0.8')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20220910093723_text', N'6.0.8')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20220912053407_addtablecart', N'6.0.8')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20220913111352_AddtablesOrder', N'6.0.8')
GO
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'18512a2d-e19e-45d3-91cb-2bc2af339c6f', N'Admin', N'ADMIN', N'918d54b1-2e03-40dd-8014-9a1594d6743c')
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'2016cd58-179e-4629-bdb7-d776ec2e5f9c', N'Employee', N'EMPLOYEE', N'e22244ae-a0b6-4c22-b018-9a8938dc8d4c')
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'f7e1d61a-b583-42fe-952f-1d88ca51c02b', N'Customer', N'CUSTOMER', N'94811123-69ef-4554-8061-7d8d4ea45ea8')
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'1ca19ffe-de57-44ef-b89a-808a29144b4a', N'18512a2d-e19e-45d3-91cb-2bc2af339c6f')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'54995066-5d13-42f5-b696-35873f72c811', N'f7e1d61a-b583-42fe-952f-1d88ca51c02b')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'6a08be48-66de-45d4-b29c-6dc86fe37c49', N'f7e1d61a-b583-42fe-952f-1d88ca51c02b')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'f92da701-97ea-4b1c-a85a-9c4afe37ece1', N'f7e1d61a-b583-42fe-952f-1d88ca51c02b')
GO
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [Address], [City], [Discriminator], [Name], [PinCode], [State]) VALUES (N'1ca19ffe-de57-44ef-b89a-808a29144b4a', N'SuperAdmin@yopmail.com', N'SUPERADMIN@YOPMAIL.COM', N'SuperAdmin@yopmail.com', N'SUPERADMIN@YOPMAIL.COM', 0, N'AQAAAAEAACcQAAAAEJLyWgWv70chCFDXJ0TaYmag5Y+S0dsjQULAJzgMLMITb77PLUqXpMFF3XK/SBL6dA==', N'5BGV72XS6B2Q6GOA7VNHT7HGILFIMMGV', N'8909a61c-d8a9-4e55-9567-df08ab74951f', NULL, 0, 0, NULL, 1, 0, N'xyz', N'Surat', N'ApplicationUser', N'Super Admin', N'394210', N'Gujrat')
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [Address], [City], [Discriminator], [Name], [PinCode], [State]) VALUES (N'54995066-5d13-42f5-b696-35873f72c811', N'deo@yopmail.com', N'DEO@YOPMAIL.COM', N'deo@yopmail.com', N'DEO@YOPMAIL.COM', 0, N'AQAAAAEAACcQAAAAEK9ou4ut8oY6EduQmrOgek6SR8aVH5h5n4rOEKMFMorClivaZiRPkmJEsUDu4X6PeA==', N'4RY6466VIG5N4WOLG3YIABBGL6JLAYAG', N'6cc79897-8336-4240-a97c-60d9fec0d98f', N'4578124578', 0, 0, NULL, 1, 0, N'ayz', N'Surat', N'ApplicationUser', N'Jhon', N'394210', N'Gujrat')
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [Address], [City], [Discriminator], [Name], [PinCode], [State]) VALUES (N'6a08be48-66de-45d4-b29c-6dc86fe37c49', N'Admin@yopmail.com', N'ADMIN@YOPMAIL.COM', N'Admin@yopmail.com', N'ADMIN@YOPMAIL.COM', 0, N'AQAAAAEAACcQAAAAEI5hHHn+Eru6pQBVWutWmWvpZW0GhfMmK1CM50/1Syq+WX7HOHwGUhiJ7c975JaDiQ==', N'U4NR247AXOVEV3SNRZVWG3JJLKO6T2GP', N'2fad7ec7-c226-4690-84f0-6da353aed676', NULL, 0, 0, NULL, 1, 0, N'ayz', N'Surat', N'ApplicationUser', N'Jhon', N'394210', N'Gujrat')
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [Address], [City], [Discriminator], [Name], [PinCode], [State]) VALUES (N'f92da701-97ea-4b1c-a85a-9c4afe37ece1', N'Jhon@yopmail.com', N'JHON@YOPMAIL.COM', N'Jhon@yopmail.com', N'JHON@YOPMAIL.COM', 0, N'AQAAAAEAACcQAAAAEJtXshp/kFS2wEre962qIoSZVA6Q45QqfEWNUy+dbYe5/eIYQLDHpzPcdid3Dzhjsg==', N'JOTYL5L6IN7XUJWWCQM3C4J7YUGGPBEP', N'b45c54f6-74c7-45b3-8e97-d6f504fee98c', N'4578124578', 0, 0, NULL, 1, 0, N'ayz', N'Surat', N'ApplicationUser', N'Jhon', N'394210', N'Gujrat')
GO
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([Id], [Name], [DisplayOrder], [CreatedDateTime]) VALUES (2, N'Technology', 1, CAST(N'2022-09-08T10:52:58.9291251' AS DateTime2))
INSERT [dbo].[Category] ([Id], [Name], [DisplayOrder], [CreatedDateTime]) VALUES (4, N'Decorative', 2, CAST(N'2022-09-08T12:43:57.7225427' AS DateTime2))
INSERT [dbo].[Category] ([Id], [Name], [DisplayOrder], [CreatedDateTime]) VALUES (5, N'Fasion', 3, CAST(N'2022-09-08T12:54:08.7176233' AS DateTime2))
SET IDENTITY_INSERT [dbo].[Category] OFF
GO
SET IDENTITY_INSERT [dbo].[OrderDetails] ON 

INSERT [dbo].[OrderDetails] ([Id], [OrderHeaderId], [ProductId], [Price], [Count]) VALUES (1041, 1036, 7, 2000, 1)
INSERT [dbo].[OrderDetails] ([Id], [OrderHeaderId], [ProductId], [Price], [Count]) VALUES (1042, 1037, 7, 2000, 1)
INSERT [dbo].[OrderDetails] ([Id], [OrderHeaderId], [ProductId], [Price], [Count]) VALUES (1043, 1038, 7, 2000, 1)
INSERT [dbo].[OrderDetails] ([Id], [OrderHeaderId], [ProductId], [Price], [Count]) VALUES (1044, 1039, 7, 2000, 1)
INSERT [dbo].[OrderDetails] ([Id], [OrderHeaderId], [ProductId], [Price], [Count]) VALUES (1045, 1041, 7, 2000, 1)
INSERT [dbo].[OrderDetails] ([Id], [OrderHeaderId], [ProductId], [Price], [Count]) VALUES (1046, 1042, 10, 42000, 1)
INSERT [dbo].[OrderDetails] ([Id], [OrderHeaderId], [ProductId], [Price], [Count]) VALUES (2045, 2040, 7, 2000, 1)
INSERT [dbo].[OrderDetails] ([Id], [OrderHeaderId], [ProductId], [Price], [Count]) VALUES (2046, 2040, 10, 42000, 1)
SET IDENTITY_INSERT [dbo].[OrderDetails] OFF
GO
SET IDENTITY_INSERT [dbo].[OrderHeaders] ON 

INSERT [dbo].[OrderHeaders] ([Id], [ApplicationUserId], [DateOfOrder], [DateOfShipping], [OrderTotal], [OrderStatus], [PaymentStatus], [TrackingNumber], [Carrier], [SessionId], [PaymentIntenId], [DateOfPayment], [DueDate], [Phone], [Address], [City], [State], [PostalCode], [Name]) VALUES (1036, N'f92da701-97ea-4b1c-a85a-9c4afe37ece1', CAST(N'2022-09-16T15:31:13.0390978' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 2000, N'Cancelled', N'Cancelled', NULL, NULL, N'cs_test_a145b9hBYGkzGXLjTum1f2shafp2geNKMOaqsYjbgpnb3KnoH4dKjkwCWd', N'pi_3LibMsSGgr40Osna0uoQ2bmj', CAST(N'2022-09-16T15:32:02.3202730' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'4578124578', N'ayz', N'Surat', N'Gujrat', N'394210', N'Jhon')
INSERT [dbo].[OrderHeaders] ([Id], [ApplicationUserId], [DateOfOrder], [DateOfShipping], [OrderTotal], [OrderStatus], [PaymentStatus], [TrackingNumber], [Carrier], [SessionId], [PaymentIntenId], [DateOfPayment], [DueDate], [Phone], [Address], [City], [State], [PostalCode], [Name]) VALUES (1037, N'f92da701-97ea-4b1c-a85a-9c4afe37ece1', CAST(N'2022-09-16T16:43:42.6297635' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 2000, N'Cancelled', N'Refunded', NULL, NULL, N'cs_test_a1RukLCngPpLGPN3RBPXQiFNUwtsReTyXczicJizfYajzaFOduIT4LOfUz', N'pi_3LiczISGgr40Osna0dmD45N7', CAST(N'2022-09-16T17:15:48.8855478' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'4578124578', N'ayz', N'Surat', N'Gujrat', N'394210', N'Jhon')
INSERT [dbo].[OrderHeaders] ([Id], [ApplicationUserId], [DateOfOrder], [DateOfShipping], [OrderTotal], [OrderStatus], [PaymentStatus], [TrackingNumber], [Carrier], [SessionId], [PaymentIntenId], [DateOfPayment], [DueDate], [Phone], [Address], [City], [State], [PostalCode], [Name]) VALUES (1038, N'f92da701-97ea-4b1c-a85a-9c4afe37ece1', CAST(N'2022-09-16T17:10:34.3755767' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 2000, N'UnderProccessing', N'Approved', N'stjoiudfyhoiph', N'sdgrkjpi9udhfj98dfy', N'cs_test_a1zi6zRjd6LPaibNLAAckKixym5AtmsZgMYbN828Rp9ldFf6QpmqnT6Usw', N'pi_3LkPLzSGgr40Osna00ILU0jS', CAST(N'2022-09-21T15:06:37.5204556' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'4578124578', N'ayz', N'Surat', N'Gujrat', N'394210', N'Jhon')
INSERT [dbo].[OrderHeaders] ([Id], [ApplicationUserId], [DateOfOrder], [DateOfShipping], [OrderTotal], [OrderStatus], [PaymentStatus], [TrackingNumber], [Carrier], [SessionId], [PaymentIntenId], [DateOfPayment], [DueDate], [Phone], [Address], [City], [State], [PostalCode], [Name]) VALUES (1039, N'f92da701-97ea-4b1c-a85a-9c4afe37ece1', CAST(N'2022-09-17T12:53:38.2166469' AS DateTime2), CAST(N'2022-09-21T15:05:05.1946804' AS DateTime2), 2000, N'Shipped', N'Approved', N'12345', N'bluedt', N'cs_test_a1unXDcjz1OmPQK8Z9ASIj3AvWd4ROc8oFoctAQIPJqJRzCI2FlrfMiXpW', N'pi_3LivNkSGgr40Osna0nsg0sBT', CAST(N'2022-09-17T12:54:15.3271170' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'4578124578', N'ayz', N'Surat', N'Gujrat', N'394210', N'Jhon')
INSERT [dbo].[OrderHeaders] ([Id], [ApplicationUserId], [DateOfOrder], [DateOfShipping], [OrderTotal], [OrderStatus], [PaymentStatus], [TrackingNumber], [Carrier], [SessionId], [PaymentIntenId], [DateOfPayment], [DueDate], [Phone], [Address], [City], [State], [PostalCode], [Name]) VALUES (1041, N'54995066-5d13-42f5-b696-35873f72c811', CAST(N'2022-09-21T14:26:25.6817584' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 2000, N'Cancelled', N'Refunded', NULL, NULL, N'cs_test_a1jli3GQAQ3PsRv6VxU5Dzp4PEPh8xABstMIRiOxgrezSL9mT4YlYDtSXw', N'pi_3LkOjtSGgr40Osna090pwGUd', CAST(N'2022-09-21T14:27:24.3298944' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'4578124578', N'ayz', N'Surat', N'Gujrat', N'394210', N'Jhon')
INSERT [dbo].[OrderHeaders] ([Id], [ApplicationUserId], [DateOfOrder], [DateOfShipping], [OrderTotal], [OrderStatus], [PaymentStatus], [TrackingNumber], [Carrier], [SessionId], [PaymentIntenId], [DateOfPayment], [DueDate], [Phone], [Address], [City], [State], [PostalCode], [Name]) VALUES (1042, N'f92da701-97ea-4b1c-a85a-9c4afe37ece1', CAST(N'2022-09-22T19:40:50.2973758' AS DateTime2), CAST(N'2022-09-22T19:42:53.5998872' AS DateTime2), 42000, N'Shipped', N'Approved', N'chfnlkjhno', N'dfyhfugurur', N'cs_test_a1yjw23psBzeskDCY0pPUAYGLd44UOvVSDfIoJBEejqupDH6UZtS1JUexW', N'pi_3Lkq7fSGgr40Osna0nKA3U82', CAST(N'2022-09-22T19:41:34.8188152' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'4578124578', N'ayz', N'Surat', N'Gujrat', N'394210', N'Jhon')
INSERT [dbo].[OrderHeaders] ([Id], [ApplicationUserId], [DateOfOrder], [DateOfShipping], [OrderTotal], [OrderStatus], [PaymentStatus], [TrackingNumber], [Carrier], [SessionId], [PaymentIntenId], [DateOfPayment], [DueDate], [Phone], [Address], [City], [State], [PostalCode], [Name]) VALUES (2040, N'f92da701-97ea-4b1c-a85a-9c4afe37ece1', CAST(N'2022-09-24T12:56:50.7181130' AS DateTime2), CAST(N'2022-09-24T13:01:01.3985451' AS DateTime2), 44000, N'Shipped', N'Approved', N'1457856', N'yduty879', N'cs_test_b1OeSCFnnWBpUApgVEI5ymIB8xYaA4HGnJZC8Rz6sVIULZ5cwOnZcVBeW2', N'pi_3LlSmPSGgr40Osna0QtJ9ziH', CAST(N'2022-09-24T12:58:14.0786402' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'4578124578', N'ayz', N'Surat', N'Gujrat', N'394210', N'Jhon')
SET IDENTITY_INSERT [dbo].[OrderHeaders] OFF
GO
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([Id], [Name], [Description], [Price], [ImageUrl], [CategoryId]) VALUES (7, N'Red-car', N'<p>Car</p>', 2000, N'\ProductImage\31e2bbfa-1415-4e05-ad9d-fdd7db0aed19-download.jpg', 2)
INSERT [dbo].[Product] ([Id], [Name], [Description], [Price], [ImageUrl], [CategoryId]) VALUES (10, N'honda', N'<h1><em><strong>honda</strong></em></h1>', 42000, N'\ProductImage\126883ab-f654-45a4-8144-dc3dded12240-download (1).jpg', 5)
INSERT [dbo].[Product] ([Id], [Name], [Description], [Price], [ImageUrl], [CategoryId]) VALUES (11, N'Bike', N'<p style="line-height: 1.2;"><span style="font-family: arial, helvetica, sans-serif; font-size: 14pt; color: rgb(35, 111, 161);"><strong><em>Bike</em></strong></span></p>', 38000, N'\ProductImage\d869fb3a-e4aa-472a-adc1-12a5473d9788-download (2).jpg', 5)
INSERT [dbo].[Product] ([Id], [Name], [Description], [Price], [ImageUrl], [CategoryId]) VALUES (12, N'Hero', N'<p style="text-align: center;"><em><strong>Hero Bike</strong></em></p>', 25000, N'\ProductImage\40a50b0a-2b83-4dcd-aa52-8baa7cbd0e0c-download (3).jpg', 5)
INSERT [dbo].[Product] ([Id], [Name], [Description], [Price], [ImageUrl], [CategoryId]) VALUES (13, N'Hero Honda', N'<p><span style="background-color: rgb(194, 224, 244);"><em><strong>Hero Honda</strong></em></span></p>', 78000, N'\ProductImage\ecf25159-7416-451f-8450-316d5902e735-images.jpg', 5)
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetRoleClaims_RoleId]    Script Date: 02-10-2022 11:29:47 ******/
CREATE NONCLUSTERED INDEX [IX_AspNetRoleClaims_RoleId] ON [dbo].[AspNetRoleClaims]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [RoleNameIndex]    Script Date: 02-10-2022 11:29:47 ******/
CREATE UNIQUE NONCLUSTERED INDEX [RoleNameIndex] ON [dbo].[AspNetRoles]
(
	[NormalizedName] ASC
)
WHERE ([NormalizedName] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserClaims_UserId]    Script Date: 02-10-2022 11:29:47 ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserClaims_UserId] ON [dbo].[AspNetUserClaims]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserLogins_UserId]    Script Date: 02-10-2022 11:29:47 ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserLogins_UserId] ON [dbo].[AspNetUserLogins]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserRoles_RoleId]    Script Date: 02-10-2022 11:29:47 ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserRoles_RoleId] ON [dbo].[AspNetUserRoles]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [EmailIndex]    Script Date: 02-10-2022 11:29:47 ******/
CREATE NONCLUSTERED INDEX [EmailIndex] ON [dbo].[AspNetUsers]
(
	[NormalizedEmail] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UserNameIndex]    Script Date: 02-10-2022 11:29:47 ******/
CREATE UNIQUE NONCLUSTERED INDEX [UserNameIndex] ON [dbo].[AspNetUsers]
(
	[NormalizedUserName] ASC
)
WHERE ([NormalizedUserName] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Carts_ApplicationUserId]    Script Date: 02-10-2022 11:29:47 ******/
CREATE NONCLUSTERED INDEX [IX_Carts_ApplicationUserId] ON [dbo].[Carts]
(
	[ApplicationUserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Carts_ProductId]    Script Date: 02-10-2022 11:29:47 ******/
CREATE NONCLUSTERED INDEX [IX_Carts_ProductId] ON [dbo].[Carts]
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_OrderDetails_OrderHeaderId]    Script Date: 02-10-2022 11:29:47 ******/
CREATE NONCLUSTERED INDEX [IX_OrderDetails_OrderHeaderId] ON [dbo].[OrderDetails]
(
	[OrderHeaderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_OrderDetails_ProductId]    Script Date: 02-10-2022 11:29:47 ******/
CREATE NONCLUSTERED INDEX [IX_OrderDetails_ProductId] ON [dbo].[OrderDetails]
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_OrderHeaders_ApplicationUserId]    Script Date: 02-10-2022 11:29:47 ******/
CREATE NONCLUSTERED INDEX [IX_OrderHeaders_ApplicationUserId] ON [dbo].[OrderHeaders]
(
	[ApplicationUserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Product_CategoryId]    Script Date: 02-10-2022 11:29:47 ******/
CREATE NONCLUSTERED INDEX [IX_Product_CategoryId] ON [dbo].[Product]
(
	[CategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AspNetUsers] ADD  DEFAULT (N'') FOR [Discriminator]
GO
ALTER TABLE [dbo].[AspNetRoleClaims]  WITH CHECK ADD  CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetRoleClaims] CHECK CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserTokens]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserTokens] CHECK CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[Carts]  WITH CHECK ADD  CONSTRAINT [FK_Carts_AspNetUsers_ApplicationUserId] FOREIGN KEY([ApplicationUserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Carts] CHECK CONSTRAINT [FK_Carts_AspNetUsers_ApplicationUserId]
GO
ALTER TABLE [dbo].[Carts]  WITH CHECK ADD  CONSTRAINT [FK_Carts_Product_ProductId] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Product] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Carts] CHECK CONSTRAINT [FK_Carts_Product_ProductId]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_OrderHeaders_OrderHeaderId] FOREIGN KEY([OrderHeaderId])
REFERENCES [dbo].[OrderHeaders] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OrderDetails_OrderHeaders_OrderHeaderId]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_Product_ProductId] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Product] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OrderDetails_Product_ProductId]
GO
ALTER TABLE [dbo].[OrderHeaders]  WITH CHECK ADD  CONSTRAINT [FK_OrderHeaders_AspNetUsers_ApplicationUserId] FOREIGN KEY([ApplicationUserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[OrderHeaders] CHECK CONSTRAINT [FK_OrderHeaders_AspNetUsers_ApplicationUserId]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Category_CategoryId] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Category] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Category_CategoryId]
GO
USE [master]
GO
ALTER DATABASE [WebAppDb] SET  READ_WRITE 
GO
